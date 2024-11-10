from django.contrib import admin
from .models import (
    Department, Position, EducationLevel, Specialty, Certification, EmployeeType,
    Employee, Payroll, EmployeeGroup, Assignment, RewardPenalty
)

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
    list_display = ('employee_id', 'user', 'department', 'position', 'start_date', 'status')
    search_fields = ('employee_id', 'user__username', 'user__first_name', 'user__last_name')
    list_filter = ('department', 'position', 'status')
    readonly_fields = ('user',)

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
