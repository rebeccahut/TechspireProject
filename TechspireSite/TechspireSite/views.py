from . import data_dict_helper as ddh
from django.http import HttpResponse
from django.shortcuts import render
from django.db import connection
from django.contrib import admin
from operator import itemgetter
from django.apps import apps
import glob
import os


class FieldTypeMap:
    field_type_dict = {"CharField": "nvarchar", "DateField": "date", "BooleanField": "bit", "BigAutoField": "bigint",
                       "EmailField": "nvarchar", "TextField": "nvarchar", "ForeignKey": "int", "IntegerField": "int",
                       "DecimalField": "numeric", "AutoField": "int", "PhoneNumberField": "nvarchar"}


def erd1(request):
    return ddh.generate_erd("GeneratedFiles", "ERD1", "crow", True)


# displays a page with all the props for each field of each model as a table
def dict1(request):
    context = {"titles": ["Table Name", "Row Name", "Row Desc", "Default", "Max Length", "Type", "PK", "FK",
                          "Required", "Allow NULL", "C Delete", "C Update", "Domain"], "tables": []}
    blank_row = []
    for index in enumerate(context["titles"]):
        blank_row.append(" ")
    model_list = apps.get_app_config('Bakery').get_models()
    for model in model_list:
        model_name = model._meta.db_table
        field_props = ddh.extract_all_field_props(model, FieldTypeMap.field_type_dict)
        for count, row in enumerate(field_props):
            if count == 0:
                row.insert(0, model_name)
            else:
                row.insert(0, " ")
        context["tables"] = context["tables"] + field_props
        context["tables"].append(blank_row)
    return render(request, 'admin/display_report.html', context)


# displays a page with the name and description of each model
def dict2(request):
    context = {"titles": ["Table Name", "Table Desc", "Owner", "Load Order"], "tables": []}
    model_list = apps.get_app_config('Bakery').get_models()
    for model in model_list:
        model_object = model()
        model_name = model._meta.db_table
        model_desc = model_object.description
        context["tables"].append([model_name, model_desc, model.owner.name, model.load_order])

    context["tables"] = sorted(context["tables"], key=itemgetter(2))
    app = apps.get_app_config("Bakery")

    models = app.models.values()
    models = [item() for item in models]
    valid_tables = [item for item in models if not item._meta.abstract]
    foreign_count = 0
    for table in valid_tables:
        model_fields = table._meta.get_fields(include_parents=False)
        for field in model_fields:
            name = type(field).__name__
            if name == "ForeignKey":
                foreign_count += 1
            else:
                pass
    foreign_count = "Foreign Keys: " + str(foreign_count)
    table_count = "Table count: " + str(len(valid_tables))

    context["extra_info"] = [table_count, foreign_count]
    return render(request, 'admin/table_report.html', context)


def get_reports(path):
    return glob.glob(os.path.join(path, "SQL/*/Report*"))


def get_report_names(path):
    reports = get_reports(path)
    out_names = []
    for report in reports:
        out_names.append(os.path.basename(report)[:-4])

    return out_names


# Creates a download for a data dictionary excel file
# Title row could be passed as a parameter
# Majority of function could be extracted into a different file
def dict3(request):
    title_row = ["Load Order", "Owner", "Table Name", "Row Name", "Default", "Max Length", "Type", "PK", "FK",
                 "Required", "Allow NULL", "C Delete", "C Update", "Domain", "Row Desc", "Table Desc"]
    module_dir = os.path.dirname(__file__)
    file_path = os.path.join(module_dir, "GeneratedFiles", "DataDict.xlsx")
    ddh.generate_data_dict_excel(file_path, title_row, FieldTypeMap.field_type_dict)
    final_sheet = open(file_path, "rb")
    response = HttpResponse(final_sheet,
                            content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    return response


# Could be improved by creating a library of reports on server start instead of everytime a link is clicked
def html_report(request, index):
    module_dir = os.path.dirname(__file__)  # get current directory
    reports = get_reports(module_dir)
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


def generate_drop(request):
    ddh.generate_ordered_sql("Bakery", True, "DROP TABLE", "Drop.sql")
    return HttpResponse("Success")


def generate_delete(request):
    ddh.generate_ordered_sql("Bakery", True, "DELETE FROM", "Delete.sql")
    return HttpResponse("Success")


def generate_bulk(request):
    solid_tables = ddh.get_solid_models("Bakery")
    solid_tables.sort(key=lambda x: x.load_order)
    module_dir = os.path.dirname(__file__)
    bulk_paths = glob.glob(os.path.join(module_dir, "SQL/*/BulkInsert*"))
    path_dict = {}
    for path in bulk_paths:
        name = os.path.basename(path).replace("BulkInsert", "")[:-4]
        path_dict[name] = path
    path = os.path.join(module_dir, "SQL", "BulkInsert.sql")
    bulk_file = open(path, "w")
    for table in solid_tables:
        bulk_path = path_dict[table._meta.db_table]
        current_bulk_file = open(bulk_path, "r")
        bulk_file.write("--" + table.owner.name + "\n")
        bulk_file.writelines(current_bulk_file.readlines())
        bulk_file.write("\n\n")
    bulk_file.close()
    return HttpResponse("Success")


def data_status(request):
    context = {"titles": ["Table", "Data Status"], "tables": []}

    module_dir = os.path.dirname(__file__)
    bulk_paths = glob.glob(os.path.join(module_dir, "SQL/*/*List.tsv"))
    path_dict = {}
    for path in bulk_paths:
        name = os.path.basename(path).replace("List", "")[:-4]
        path_dict[name] = path

    solid_tables = ddh.get_solid_models("Bakery")
    for table in solid_tables:
        try:
            var = path_dict[table._meta.db_table]
            status = "Available"
        except KeyError:
            status = "Not Available"
        context["tables"].append([table._meta.db_table, status])
    context["tables"].sort(key=itemgetter(1))
    return render(request, 'admin/display_report.html', context)
