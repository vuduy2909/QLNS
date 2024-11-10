from django.contrib import admin
from .models import (
    Department, Position, EducationLevel, Specialty, Certification, EmployeeType,
    Employee, Payroll, EmployeeGroup, Assignment, RewardPenalty
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

# @admin.register(Employee)
# class EmployeeAdmin(admin.ModelAdmin):
#     list_display = ('employee_id', 'user', 'department', 'position', 'start_date', 'status')
#     search_fields = ('employee_id', 'user__username', 'user__first_name', 'user__last_name')
#     list_filter = ('department', 'position', 'status')
   
@admin.register(Employee)
class EmployeeAdmin(admin.ModelAdmin):
    form = EmployeeForm
    list_display = ('employee_id', 'user', 'avatar_image', 'department', 'position', 'start_date', 'status')
    search_fields = ('employee_id', 'user__username', 'user__first_name', 'user__last_name')
    list_filter = ('department', 'position', 'status')
    
    # Tùy chọn các trường hiển thị trong form Admin
    fields = ('employee_id','username', 'password', 'department', 'position', 'specialty', 'certification', 
              'start_date', 'status', 'base_salary', 'allowance', 'bonus', 'penalty', 'avatar')
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
                obj.employee_id = f"EMP{last_employee.id + 1:04d}"
            else:
                obj.employee_id = "EMP0001"

        # Lưu Employee
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

@admin.register(Assignment)
class AssignmentAdmin(admin.ModelAdmin):
    list_display = ('employee', 'location', 'start_date', 'end_date')
    search_fields = ('employee__user__username', 'location')
    list_filter = ('start_date', 'end_date')

@admin.register(RewardPenalty)
class RewardPenaltyAdmin(admin.ModelAdmin):
    list_display = ('employee', 'type', 'description', 'amount', 'date')
    search_fields = ('employee__user__username', 'type')
    list_filter = ('type', 'date')
