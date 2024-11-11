# hrms/forms.py
from django import forms
from django.contrib.auth.models import User, Group, Permission
from .models import Employee
from django.forms.widgets import DateInput

class EmployeeForm(forms.ModelForm):
    username = forms.CharField(label="Username", required=False)
    password = forms.CharField(label="Password", widget=forms.PasswordInput, required=False)
    
    start_date = forms.DateField(
        widget=DateInput(attrs={'type': 'date'}),
        input_formats=['%d/%m/%Y', '%Y-%m-%d', '%m/%d/%Y'],  # Thêm định dạng ngày bạn muốn
        label="Start Date"
    )

    is_active = forms.BooleanField(label="Active", required=False)
    is_staff = forms.BooleanField(label="Staff status", required=True, initial=True)  # Đặt mặc định là True
    groups = forms.ModelMultipleChoiceField(
        queryset=Group.objects.all(),
        required=False,
        widget=forms.CheckboxSelectMultiple,
        label="Groups"
    )
    user_permissions = forms.ModelMultipleChoiceField(
        queryset=Permission.objects.all(),
        required=False,
        widget=forms.CheckboxSelectMultiple,
        label="User permissions"
    )

    class Meta:
        model = Employee
        fields = [
            'username', 'password', 'department', 'position',
            'specialty', 'certification', 'start_date', 'status', 
            'base_salary', 'allowance', 'bonus', 'penalty', 'avatar'
        ]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance and hasattr(self.instance, 'user') and self.instance.user:
            self.fields['username'].initial = self.instance.user.username
            self.fields['is_active'].initial = self.instance.user.is_active
            self.fields['is_staff'].initial = self.instance.user.is_staff  # Gán giá trị `is_staff` từ user hiện tại
            self.fields['groups'].initial = self.instance.user.groups.all()
            self.fields['user_permissions'].initial = self.instance.user.user_permissions.all()
        else:
            # Đặt `is_staff` mặc định là `True` cho người dùng mới
            self.fields['is_staff'].initial = True

    def clean(self):
        cleaned_data = super().clean()
        groups = cleaned_data.get('groups')

        if groups:
            # Lấy tất cả các quyền từ các nhóm đã chọn
            permissions = Permission.objects.filter(group__in=groups).distinct()
            cleaned_data['user_permissions'] = permissions

        return cleaned_data

    def save(self, commit=True):
        # Lấy hoặc tạo một user mới nếu `self.instance` chưa có user
        user = self.instance.user if hasattr(self.instance, 'user') and self.instance.user else User()
        
        user.username = self.cleaned_data['username']
        if self.cleaned_data['password']:
            user.set_password(self.cleaned_data['password'])
        
        user.is_active = self.cleaned_data['is_active']
        user.is_staff = self.cleaned_data['is_staff']  # Đảm bảo `is_staff` được lưu chính xác
        user.save()
        
        user.groups.set(self.cleaned_data['groups'])
        user.user_permissions.set(self.cleaned_data['user_permissions'])
        self.instance.user = user
        return super().save(commit)
