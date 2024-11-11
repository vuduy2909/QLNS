from django.contrib import admin
from .models import (
    Department, Position, EducationLevel, Specialty, Certification, EmployeeType,
    Employee, Payroll, EmployeeGroup, Collaborate, RewardPenalty
)
from .models import Employee
from .forms import EmployeeForm
from django.utils.html import format_html


from django.contrib.auth.models import User


@admin.register(Department)
class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    search_fields = ('name',)

@admin.register(Position)
class PositionAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    search_fields = ('name',)

@admin.register(EducationLevel)
class EducationLevelAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    search_fields = ('name',)

@admin.register(Specialty)
class SpecialtyAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    search_fields = ('name',)

@admin.register(Certification)
class CertificationAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    search_fields = ('name',)

@admin.register(EmployeeType)
class EmployeeTypeAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    search_fields = ('name',)



@admin.register(Employee)
class EmployeeAdmin(admin.ModelAdmin):
    form = EmployeeForm
    list_display = ('employee_id','displayname', 'avatar_image', 'department', 'position', 'start_date', 'specialty', 'certification', 'status')
    search_fields = ('employee_id', 'user__username')
    list_filter = ('department', 'position', 'status')
    
    # Các trường hiển thị trong form Admin, bỏ user_permissions để chỉ hiển thị phần chọn Group
    fields = ('employee_id', 'displayname','username', 'password', 'department', 'position', 'specialty', 'certification', 
              'start_date', 'status', 'is_staff', 'groups', 'base_salary', 'allowance', 'bonus', 'penalty', 'avatar')
    readonly_fields = ('employee_id',)

    def avatar_image(self, obj):
        if obj.avatar:
            return format_html('<img src="{}" width="50" height="50" style="border-radius:50%;" />', obj.avatar.url)
        return "-"

    avatar_image.short_description = 'Avatar'

    def save_model(self, request, obj, form, change):
        # Tự động tạo Employee ID nếu chưa có
        if not obj.employee_id:
            last_employee = Employee.objects.order_by('-id').first()
            if last_employee:
                new_id = int(last_employee.id) + 1
                obj.employee_id = f"EMP{new_id:04d}"
            else:
                obj.employee_id = "EMP0001"
        
        # Gọi phương thức lưu của model cha
        super().save_model(request, obj, form, change)
    

@admin.register(Payroll)
class PayrollAdmin(admin.ModelAdmin):
    list_display = ('employee', 'month', 'working_days', 'net_salary')
    search_fields = ('employee__user__username', 'month')
    list_filter = ('month',)

@admin.register(EmployeeGroup)
class EmployeeGroupAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    search_fields = ('name',)

# @admin.register(Collaborate)
# class CollaborateAdmin(admin.ModelAdmin):
#     list_display = ('employee', 'location', 'start_date', 'end_date')
#     search_fields = ('employee__user__username', 'location')
#     list_filter = ('start_date', 'end_date')
@admin.register(Collaborate)
class CollaborateAdmin(admin.ModelAdmin):
    list_display = ('location', 'start_date', 'end_date', 'description')
    search_fields = ('location',)
    list_filter = ('start_date', 'end_date')
    filter_horizontal = ('employees',)  # Thêm filter_horizontal để hỗ trợ chọn nhiều nhân viên dễ dàng hơn

@admin.register(RewardPenalty)
class RewardPenaltyAdmin(admin.ModelAdmin):
    list_display = ('employee', 'type', 'description', 'amount', 'date')
    search_fields = ('employee__user__username', 'type')
    list_filter = ('type', 'date')