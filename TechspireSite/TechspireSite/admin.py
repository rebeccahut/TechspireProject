from django.contrib import admin
from django.urls import path
from django.template.response import TemplateResponse
from . import views
import os


class AdminTableRow:
    path = ""
    name = ""

    def __init__(self, in_path, in_name):
        self.path = in_path
        self.name = in_name


class TechSpireAdminSite(admin.AdminSite):
    site_header = "Hot Breads Admin"
    site_title = "Hot Breads Admin"
    index_title = "Welcome to Hot Breads Admin"

    #Could be improved by creating a library of reports on server start instead of everytime a link is clicked
    def index(self, request, extra_context=None):
        """
        Display the main admin index page, which lists all of the installed
        apps that have been registered in this site.
        """
        app_list = self.get_app_list(request)
        module_dir = os.path.dirname(__file__)  # get current directory
        reports = views.get_report_names(module_dir)
        AdminTableRow("dict1", "Row Dictionary")
        db_links = [["dict1", "Row Dictionary"], ["dict2", "Table Dictionary"], ["dict3", "Excel Dictionary"],
                    ["erd1", "Abstract ERD"], ["drop", "Generate Drop"], ["bulk", "Generate Bulk Insert"],
                    ["delete", "Generate Bulk Delete"], ["datastatus", "View Data Status"],
                    ["finalreport", "Final Report"], ["reportstatus", "Report Status"]]
        db_info = [AdminTableRow(x[0], x[1]) for x in db_links]

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

    #path('report/<int:index>/', self.admin_view(views.html_report), name="report")
    def get_urls(self):
        urls = super().get_urls()
        my_urls = [
            path('dict1/', self.admin_view(views.dict1), name="dict1"),
            path('dict2/', self.admin_view(views.dict2), name="dict2"),
            path('dict3/', self.admin_view(views.dict3), name="dict3"),
            path('erd1/', self.admin_view(views.erd1), name="erd1"),
            path('drop/', self.admin_view(views.generate_drop), name="drop"),
            path('bulk/', self.admin_view(views.generate_bulk), name="bulk"),
            path('delete/', self.admin_view(views.generate_delete), name="delete"),
            path('datastatus/', self.admin_view(views.data_status), name="datastatus"),
            path('finalreport/', self.admin_view(views.generate_final_report), name="finalreport"),
            path('reportstatus/', self.admin_view(views.report_status), name="reportstatus"),
            path('loademps', self.admin_view(views.load_employees), name='loademps'),
            path('loadproducts', self.admin_view(views.load_products), name='loadproducts'),
            path('loadproductprice', self.admin_view(views.load_product_price), name='loadproductprice'),
        ]
        return my_urls + urls
