from django.contrib import admin
from django.apps import apps
# Register your models here.
from .models import Employee, EmployeeJob, Job
from django.contrib.auth.models import User, Group
from django.db.models import Model

admin.site.register(Employee)
admin.site.register(EmployeeJob)
admin.site.register(Job)






admin.site.unregister(User)
admin.site.unregister(Group)




app = apps.get_app_config("Bakery")

for model_name, model in app.models.items():
    try:
        model_object = model()
        if model == User or model == Group:
            admin.site.unregister(model)
        else:
            if not model_object._meta.abstract:
                admin.site.register(model)

    except admin.sites.AlreadyRegistered:
        pass