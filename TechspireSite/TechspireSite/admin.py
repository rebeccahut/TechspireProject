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
import xlsxwriter

class admin_table_row():
    path = ""
    name = ""

    def __init__(self, in_path, in_name):
        self.path = in_path
        self.name = in_name


class TechSpireAdminSite(admin.AdminSite):
    site_header = "Hot Breads Admin"
    site_title = "Hot Breads Admin"
    index_title = "Welcome to Hot Breads Admin"

    #Extracts the field props for a single field
    def extract_field_props(self, current_field, model, field_type_dict):
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
        return [field_name, help_text, default, max_length, field_type, pk, fk, blank, null, c_delete,
                c_update]

    #Given a model extracts a row of field properties for each field
    def extract_all_field_props(self, model):
        field_type_dict = {"CharField": "varchar", "DateField": "date", "BooleanField": "bit", "BigAutoField": "int",
                           "EmailField": "varchar", "TextField": "text", "ForeignKey": "int"}
        model_object = model()
        model_fields = model_object._meta.get_fields(include_parents=False)
        visible_fields = []
        output_list = []
        visible_fields = [field for field in model_fields if not isinstance(field, models.fields.reverse_related.ManyToOneRel)]
        for current_field in visible_fields:
            output_row = self.extract_field_props(current_field, model, field_type_dict)
            output_list.append(output_row)
        return output_list

    #displays a page with all the props for each field of each model as a table
    def dict1(self, request):
        context = {"titles": ["Table Name", "Row Name", "Row Desc", "Default", "Max Length", "Type", "PK", "FK",
                              "Required", "Allow NULL", "C Delete", "C Update"], "tables": []}
        blank_row = []
        for index in enumerate(context["titles"]):
            blank_row.append(" ")
        model_list = apps.get_app_config('Bakery').get_models()
        for model in model_list:
            model_name = model.__name__
            field_props = self.extract_all_field_props(model)
            for count, row in enumerate(field_props):
                if count == 0:
                    row.insert(0, model_name)
                else:
                    row.insert(0, " ")
            context["tables"] = context["tables"] + field_props
            context["tables"].append(blank_row)
        return render(request, 'admin/display_report.html', context)

    #displays a page with the name and description of each model
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
        return glob.glob(os.path.join(path, "SQL/*/Report*"))

    def get_report_names(self, path):
        reports = self.get_reports(path)
        out_names = []
        for report in reports:
            out_names.append(os.path.basename(report)[:-4])

        return out_names

    def dict3(self, request):
        title_row = ["Table Name", "Table Desc", "Row Name", "Row Desc", "Default", "Max Length", "Type", "PK", "FK",
                              "Required", "Allow NULL", "C Delete", "C Update"]
        module_dir = os.path.dirname(__file__)
        file_path = os.path.join(module_dir, "GeneratedFiles", "DataDict.xlsx")
        workbook = xlsxwriter.Workbook(file_path)
        worksheet = workbook.add_worksheet()
        bold = workbook.add_format({'bold': True})
        model_list = apps.get_app_config('Bakery').get_models()
        max_lengths = []

        for col_index, title in enumerate(title_row):
            worksheet.write(0, col_index, title, bold)
            col_length = len(str(title))
            max_lengths.append(col_length)

        row_count = 1
        for row, model in enumerate(model_list):
            model_object = model()
            model_name = model.__name__
            model_desc = model_object.description
            field_props = self.extract_all_field_props(model)
            for count, props in enumerate(field_props):
                if count == 0:
                    props.insert(0, model_desc)
                    props.insert(0, model_name)
                else:
                    props.insert(0, " ")
                    props.insert(0, " ")

            for field_index, field in enumerate(field_props):
                for col_index, col in enumerate(field):
                    worksheet.write(row_count, col_index, col)
                    col_length = len(str(col))
                    if col_length > max_lengths[col_index]:
                        max_lengths[col_index] = col_length

                row_count += 1
            row_count += 1

        for index, length in enumerate(max_lengths):
            worksheet.set_column(index, index, length* 1.25)


        header_dicts = []
        for row in title_row:
            header_dicts.append({"header": row})
        worksheet.add_table(0, 0, row_count, len(title_row)-1, {"columns": header_dicts})
        workbook.close()
        final_sheet = open(file_path, "rb")
        response = HttpResponse(final_sheet, content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
        return response

    #Could be improved by creating a library of reports on server start instead of everytime a link is clicked
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

    #Could be improved by creating a library of reports on server start instead of everytime a link is clicked
    def index(self, request, extra_context=None):
        """
        Display the main admin index page, which lists all of the installed
        apps that have been registered in this site.
        """
        app_list = self.get_app_list(request)
        module_dir = os.path.dirname(__file__)  # get current directory
        reports = self.get_report_names(module_dir)
        admin_table_row("dict1", "Row Dictionary")
        db_info = [admin_table_row("dict1", "Row Dictionary"), admin_table_row("dict2", "Table Dictionary"),
                   admin_table_row("dict3", "Excel Dictionary")]

        context = {
            **self.each_context(request),
            'title': self.index_title,
            'subtitle': None,
            'app_list': app_list,
            'report_list':  reports,
            'database_list': db_info,
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
            path('dict3/', self.admin_view(self.dict3), name="dict3"),
            path('report1/', self.admin_view(self.report), name="report"),
        ]
        return my_urls + urls
