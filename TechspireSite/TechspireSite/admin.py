from django.contrib import admin


class TechSpireAdminSite(admin.AdminSite):
    site_header = "Test Admin"
    site_title = "Test Admin Portal"
    index_title = "Welcome to Test Portal"
