from django.contrib import admin
from django.urls import path
from django.http import HttpResponse
from django.shortcuts import render
from django.apps import apps
from django.db import models
from django.db import connection
from django.template.response import TemplateResponse
import glob
import os


class TechSpireAdminSite(admin.AdminSite):
    site_header = "Hot Breads Admin"
    site_title = "Hot Breads Admin"
    index_title = "Welcome to Hot Breads Admin"

    #Potentially put the new custom admin views into a views file
    def reports(self, request):
        context = {"tables": [["Test1"],["Test2"]], "titles": ["Col1","Col2"]}
        return render(request, 'admin/display_report.html', context)

    def dict1(self, request):
        context = {"titles": ["Table Name", "Row Name", "Row Desc", "Default", "Max Length", "Type", "PK", "FK",
                              "Required", "Allow NULL", "C Delete", "C Update"], "tables": []}
        field_type_dict = {"CharField": "varchar", "DateField": "date", "BooleanField": "bit", "BigAutoField": "int",
                           "EmailField": "varchar", "TextField": "text", "ForeignKey": "int"}
        blank_row = []
        for col in context["titles"]:
            blank_row.append(" ")
        model_list = apps.get_app_config('Bakery').get_models()
        for model in model_list:
            model_object = model()
            model_name = model.__name__
            model_fields = model_object._meta.get_fields(include_parents=False)
            visible_fields = []
            for current_field in model_fields:
                if not isinstance(current_field, models.fields.reverse_related.ManyToOneRel):
                    visible_fields.append(current_field)

            for count, current_field in enumerate(visible_fields):
                field_name = current_field.name
                field_type = type(current_field).__name__
                if current_field.primary_key:
                    help_text = model.pk_desc
                else:
                    help_text = current_field.help_text

                c_delete = False
                c_update = False
                fk = False

                if field_type == "ForeignKey":
                    fk = True
                    field_name += "_id"

                try:
                    field_type = field_type_dict[field_type]
                except KeyError:
                    pass
                default = "NA" if current_field.default == models.fields.NOT_PROVIDED else current_field.default
                max_length = "NA" if current_field.max_length is None else current_field.max_length
                pk = current_field.primary_key
                null = current_field.null
                blank = True if current_field.primary_key else not current_field.blank

                output_row = [field_name, help_text, default, max_length, field_type, pk, fk, blank, null, c_delete, c_update]
                if count == 0:
                    output_row.insert(0, model_name)

                else:
                    output_row.insert(0, " ")

                context["tables"].append(output_row)

            context["tables"].append(blank_row)
        return render(request, 'admin/display_report.html', context)

    def dict2(self, request):
        context = {"titles": ["Table Name", "Table Desc", "Owner"], "tables": []}
        model_list = apps.get_app_config('Bakery').get_models()
        for model in model_list:
            model_object = model()
            model_name = model.__name__
            model_desc = model_object.description
            context["tables"].append([model_name, model_desc, model.owner.name])

        return render(request, 'admin/display_report.html', context)

    def get_reports(self, path):
        return glob.glob(os.path.join(path, "Scripts/*/Report*"))

    def get_report_names(self, path):
        reports = self.get_reports(path)
        out_names = []
        for report in reports:
            out_names.append(os.path.basename(report)[:-4])

        return out_names

    def dict3(self, request):

        return render(request, 'admin/display_report.html', context)

    def report(self, request, index):
        module_dir = os.path.dirname(__file__)  # get current directory
        reports = self.get_reports(module_dir)
        file_path = os.path.join(module_dir, reports[index])
        context = {"titles": [], "tables": []}
        report_object = open(file_path, "r")
        report_text = report_object.read()
        first_line = report_text.split("\n")[0]
        first_line = first_line[2:]
        context["titles"] = first_line.split(",")


        with connection.cursor() as cursor:
            cursor.execute(report_text)
            context["tables"] = cursor.fetchall()

        return render(request, 'admin/display_report.html', context)


    def index(self, request, extra_context=None):
        """
        Display the main admin index page, which lists all of the installed
        apps that have been registered in this site.
        """
        app_list = self.get_app_list(request)
        module_dir = os.path.dirname(__file__)  # get current directory
        reports = self.get_report_names(module_dir)


        context = {
            **self.each_context(request),
            'title': self.index_title,
            'subtitle': None,
            'app_list': app_list,
            'report_list':  reports,
            **(extra_context or {}),
        }

        request.current_app = self.name

        return TemplateResponse(request, self.index_template or 'admin/index.html', context)






    def get_urls(self):
        urls = super().get_urls()
        my_urls = [

            path('report/<int:index>/', self.admin_view(self.report), name="report"),
            path('dict1/', self.admin_view(self.dict1), name="dict1"),
            path('dict2/', self.admin_view(self.dict2), name="dict2"),
            path('report1/', self.admin_view(self.report), name="report"),
        ]
        return my_urls + urls
