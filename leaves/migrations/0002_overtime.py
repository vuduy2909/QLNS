# Generated by Django 4.0.3 on 2022-06-06 21:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('employees', '0005_projectfile_date_alter_projectfile_project'),
        ('leaves', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Overtime',
            fields=[
                ('overtime_id', models.BigAutoField(primary_key=True, serialize=False)),
                ('id', models.CharField(editable=False, max_length=10, unique=True)),
                ('overtime_type', models.CharField(choices=[('C', 'Compulsory'), ('H', 'Holiday'), ('V', 'Voluntary')], max_length=3, verbose_name='type')),
                ('date', models.DateField()),
                ('hours', models.IntegerField()),
                ('reason', models.TextField()),
                ('a_s', models.CharField(choices=[('A', 'Approved'), ('D', 'Denied'), ('N', 'Not Needed'), ('P', 'Pending')], default='P', max_length=1, verbose_name='Approved by Supervisor')),
                ('a_hod', models.CharField(choices=[('A', 'Approved'), ('D', 'Denied'), ('N', 'Not Needed'), ('P', 'Pending')], default='P', max_length=1, verbose_name='Approved by HOD')),
                ('a_hr', models.CharField(choices=[('A', 'Approved'), ('D', 'Denied'), ('N', 'Not Needed'), ('P', 'Pending')], default='P', max_length=1, verbose_name='Approved by HR')),
                ('a_md', models.CharField(choices=[('A', 'Approved'), ('D', 'Denied'), ('N', 'Not Needed'), ('P', 'Pending')], default='P', max_length=1, verbose_name='Approved by MD')),
                ('date_updated', models.DateTimeField(auto_now=True)),
                ('date_requested', models.DateTimeField(auto_now_add=True)),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='created_overtime', to='employees.employee')),
                ('employee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='overtime', to='employees.employee')),
            ],
        ),
    ]
