from django.db import models
from django.contrib.auth.models import User

class Department(models.Model):
    name = models.CharField(max_length=100, unique=True, verbose_name="Department Name")
    description = models.TextField(blank=True, null=True, verbose_name="Description")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Department"
        verbose_name_plural = "Departments"

class Position(models.Model):
    name = models.CharField(max_length=100, unique=True, verbose_name="Position Name")
    description = models.TextField(blank=True, null=True, verbose_name="Description")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Position"
        verbose_name_plural = "Positions"

class EducationLevel(models.Model):
    name = models.CharField(max_length=100, unique=True, verbose_name="Education Level")
    description = models.TextField(blank=True, null=True, verbose_name="Description")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Education Level"
        verbose_name_plural = "Education Levels"

class Specialty(models.Model):
    name = models.CharField(max_length=100, unique=True, verbose_name="Specialty Name")
    description = models.TextField(blank=True, null=True, verbose_name="Description")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Specialty"
        verbose_name_plural = "Specialties"

class Certification(models.Model):
    name = models.CharField(max_length=100, unique=True, verbose_name="Certification")
    description = models.TextField(blank=True, null=True, verbose_name="Description")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Certification"
        verbose_name_plural = "Certifications"

class EmployeeType(models.Model):
    name = models.CharField(max_length=100, unique=True, verbose_name="Employee Type")
    description = models.TextField(blank=True, null=True, verbose_name="Description")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Employee Type"
        verbose_name_plural = "Employee Types"

class Employee(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    employee_id = models.CharField(max_length=10, unique=True, verbose_name="Employee ID")
    displayname = models.CharField(max_length=100, verbose_name="Full Name", default="Unnamed")
    department = models.ForeignKey(Department, on_delete=models.SET_NULL, null=True, verbose_name="Department")
    position = models.ForeignKey(Position, on_delete=models.SET_NULL, null=True, verbose_name="Position")
    education_level = models.ForeignKey(EducationLevel, on_delete=models.SET_NULL, null=True, verbose_name="Education Level")
    specialty = models.ForeignKey(Specialty, on_delete=models.SET_NULL, null=True, verbose_name="Specialty")
    certification = models.ForeignKey(Certification, on_delete=models.SET_NULL, null=True, verbose_name="Certification")
    employee_type = models.ForeignKey(EmployeeType, on_delete=models.SET_NULL, null=True, verbose_name="Employee Type")
    start_date = models.DateField(verbose_name="Start Date")
    status = models.BooleanField(default=True, verbose_name="Active Status")
    base_salary = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Base Salary")
    allowance = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name="Allowance")
    bonus = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name="Bonus")
    penalty = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name="Penalty")
    avatar = models.ImageField(upload_to='avatars/', blank=True, null=True, verbose_name="Avatar")

    def __str__(self):
        return self.displayname

    class Meta:
        verbose_name = "Employee"
        verbose_name_plural = "Employees"

class Payroll(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE, verbose_name="Employee")
    month = models.CharField(max_length=7, verbose_name="Month")  # Format: 'MM-YYYY'
    working_days = models.IntegerField(verbose_name="Working Days")
    net_salary = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Net Salary")

    def __str__(self):
        return f"Payroll for {self.month} - {self.employee.user.get_full_name()}"

    class Meta:
        verbose_name = "Payroll"
        verbose_name_plural = "Payrolls"

class EmployeeGroup(models.Model):
    name = models.CharField(max_length=100, unique=True, verbose_name="Group Name")
    description = models.TextField(blank=True, null=True, verbose_name="Description")
    employees = models.ManyToManyField(Employee, related_name='employee_groups', verbose_name="Employees")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Employee Group"
        verbose_name_plural = "Employee Groups"

class Collaborate(models.Model):
    employees = models.ManyToManyField(Employee, verbose_name="Employees")  # Đổi từ ForeignKey thành ManyToManyField
    location = models.CharField(max_length=255, verbose_name="Location")
    start_date = models.DateField(verbose_name="Start Date")
    end_date = models.DateField(verbose_name="End Date")
    description = models.TextField(blank=True, null=True, verbose_name="Description")

    def __str__(self):
        return f"{self.location} ({self.start_date} - {self.end_date})"




    class Meta:
        verbose_name = "Collaborate"
        verbose_name_plural = "Collaborates"

class RewardPenalty(models.Model):
    TYPE_CHOICES = (
        ('Reward', 'Reward'),
        ('Penalty', 'Penalty'),
    )
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE, verbose_name="Employee")
    type = models.CharField(max_length=20, choices=TYPE_CHOICES, verbose_name="Type")
    description = models.TextField(verbose_name="Description")
    amount = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name="Amount")
    date = models.DateField(verbose_name="Date")

    def __str__(self):
        return f"{self.type} - {self.employee.user.get_full_name()} - {self.date}"

    class Meta:
        verbose_name = "Reward or Penalty"
        verbose_name_plural = "Rewards and Penalties"