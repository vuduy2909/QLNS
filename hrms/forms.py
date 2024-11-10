# hrms/forms.py
from django import forms
from django.contrib.auth.models import User
from django.contrib.admin.widgets import AdminDateWidget
from .models import Employee
from django.forms.widgets import DateInput
class EmployeeForm(forms.ModelForm):
    username = forms.CharField(label="Username")
    password = forms.CharField(label="Password", widget=forms.PasswordInput)
    start_date = forms.DateField(widget=AdminDateWidget, label="Start Date")  # Trường chọn ngày

    class Meta:
        model = Employee
        fields = ['username', 'password', 'department', 'position',
                  'specialty', 'certification', 
                  'start_date', 'status', 'base_salary', 'allowance', 'bonus', 
                  'penalty', 'avatar']  # Không bao gồm 'employee_id'

    def save(self, commit=True):
        # Tạo User trước khi lưu Employee
        user = User.objects.create_user(
            username=self.cleaned_data['username'],
            password=self.cleaned_data['password']
        )
        self.instance.user = user  # Liên kết User với Employee
        return super().save(commit)
