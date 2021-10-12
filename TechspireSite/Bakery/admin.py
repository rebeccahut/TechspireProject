from django.contrib import admin
from django.apps import apps
# Register your models here.
from import_export.admin import ImportExportModelAdmin

from .models import Country,StateProvince
from django.contrib.auth.models import User, Group
from django.db.models import Model

class CountryAdmin(ImportExportModelAdmin):
    search_fields = ["country_name", "id"]
    list_display = ["id", "country_name"]

class StateAdmin(ImportExportModelAdmin):
    search_fields = ["state_name", "id"]
    list_display = ["id", "state_name", "country"]



admin.site.register(Country, CountryAdmin)
admin.site.register(StateProvince, StateAdmin)

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