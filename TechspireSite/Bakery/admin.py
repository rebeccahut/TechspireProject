from django.contrib import admin
from django.apps import apps
# Register your models here.
from import_export.admin import ImportExportModelAdmin

from .models import Employee, Customer, Order, Product, Reward, Store, ProductType, \
    ProductStatus, CustomerStatus, StoreProduct, OrderLine, Location, StoreStatus, EmployeeStatus, RewardStatus, CustomerReward
from django.contrib.auth.models import User, Group
from django.db.models import Model
from django.db import connection, ProgrammingError, DataError
from phonenumber_field.formfields import PhoneNumberField
import os
from django.forms import ModelForm
from django import forms
from django.forms import formset_factory
from decimal import Decimal

from django import forms


class GenericForm(forms.ModelForm):
    your_name = forms.CharField(label='Your name', max_length=100, disabled=True)


class LocationForm(admin.TabularInline):
    model = Location
    min_num = 1
    max_num = 1
    #fields = ["product", "quantity"]
    #verbose_name = "Test"


class OrderLineForm(admin.TabularInline):
    model = OrderLine
    min_num = 0
    extra = 1
    fields = ["product", "ind_price", "quantity", "total_price"]
    readonly_fields = ["ind_price", "total_price"]
    verbose_name = "Test"


class RewardLineForm(admin.TabularInline):
    model = CustomerReward
    min_num = 1
    max_num = 1
    extra = 0
    can_delete = False
    fields = ["reward", "point_cost", "discount_amount", "free_product"]
    readonly_fields = ["point_cost", "discount_amount", "free_product"]


class PhoneForm(forms.Form):
    phone = PhoneNumberField()


class TwentyPageAdmin(admin.ModelAdmin):
    list_per_page = 20


class MenuAdmin(TwentyPageAdmin):
    model = StoreProduct
    list_display = ["product", "store"]


class RewardAdmin(TwentyPageAdmin):
    model = Reward
    list_display = ["reward_name", "point_cost", "discount_amount", "reward_status"]


class EmployeeAdmin(TwentyPageAdmin):
    model = Employee
    widgets = {
        'phone_number': PhoneForm
    }
    #inlines = [LocationForm, ]
    list_display = ["first_name", "last_name", "email_address", "phone_number"]


class CustomerAdmin(admin.ModelAdmin):
    model = Customer
    list_per_page = 20
    widgets = {
        'phone_number': PhoneForm
    }
    list_filter = ["customer_status"]
    search_fields = ["email_address", "phone_number"]
    #inlines = [LocationForm, ]
    list_display = ["first_name", "last_name", "email_address", "phone_number"]


class OrderAdmin(admin.ModelAdmin):
    model = Order
    list_per_page = 20
    list_display = ["customer", "store", "employee", "order_date", "display_original_total"]
    readonly_fields = ["original_total", "discount_amount", "final_total"]
    inlines = [OrderLineForm, RewardLineForm]
    change_form_template = 'admin/order_change_form.html'
    #autocomplete_fields = ["customer", ]
    raw_id_fields = ("customer",)
    #form = GenericForm

    @admin.display(description='Total', ordering="original_total")
    def display_original_total(self, obj):
        return "$" + str(round(obj.original_total, 2))

    class Media:
        js = (
            '//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js',
            '//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js',
            'Bakery/js/OrderChange.js',
        )

    def save_model(self, request, obj, form, change):
        order = form.save(commit=False)
        order.original_total = 500
        #order.save()
        super(OrderAdmin, self).save_model(request, obj, form, change)

        #module_dir = os.path.dirname(os.path.dirname(__file__))
        #path = os.path.join(module_dir, "TechspireSite", "SQL", "Admin", "UpdateOrderTotal.sql")
        #sql = open(path, "r")
        #with connection.cursor() as cursor:
            #cursor.execute(sql.read(), [obj.id])

    def save_related(self, request, form, formsets, change):
        form.save_m2m()
        output = open("Debug.txt", "w")
        for formset in formsets:
            order_line = formset.save(commit=False)
            self.save_formset(request, form, formset, change=change)
        obj = form.save(commit=False)
        output.write(str(obj.id))
        module_dir = os.path.dirname(os.path.dirname(__file__))
        path = os.path.join(module_dir, "TechspireSite", "SQL", "Admin", "UpdateOrderTotal.sql")
        sql = open(path, "r")
        with connection.cursor() as cursor:
            cursor.execute(sql.read(), [obj.id])



    #def get_readonly_fields(self, request, obj=None):
        #if obj:  # editing an existing object
            # All model fields as read_only
            #return self.readonly_fields + ["order_date", "customer", "store", "payment_type", "employee"]
        #return self.readonly_fields

    #def get_inlines(self, request, obj):
        #if obj:
            #return [OrderLineReadForm]
        #return self.inlines





class ProductAdmin(admin.ModelAdmin):
    model = Product
    list_per_page = 20
    list_display = ["product_name", "product_type", "product_status", "display_product_price"]

    @admin.display(description='Price', ordering="product_price")
    def display_product_price(self, obj):
        return "$" + str(round(obj.product_price, 2))


admin.site.register(Customer, CustomerAdmin)
admin.site.register(Employee, EmployeeAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(Reward, RewardAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Store)
admin.site.register(ProductType)
admin.site.register(ProductStatus)
admin.site.register(CustomerStatus)
admin.site.register(StoreProduct, MenuAdmin)
admin.site.register(EmployeeStatus)
admin.site.register(RewardStatus)
admin.site.register(StoreStatus)


admin.site.unregister(User)
admin.site.unregister(Group)




