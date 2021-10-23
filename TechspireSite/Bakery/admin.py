from django.contrib import admin
from django.apps import apps
# Register your models here.
from import_export.admin import ImportExportModelAdmin

from .models import Employee, Customer, Order, Product, Reward, Store, ProductType, \
    ProductStatus, CustomerStatus, StoreProduct, OrderLine, Location, StoreStatus, EmployeeStatus, RewardStatus
from django.contrib.auth.models import User, Group
from django.db.models import Model
from phonenumber_field.formfields import PhoneNumberField
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
    min_num = 1
    extra = 1
    fields = ["product", "quantity"]
    verbose_name = "Test"


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
    #inlines = [LocationForm, ]
    list_display = ["first_name", "last_name", "email_address", "phone_number"]


class OrderAdmin(admin.ModelAdmin):
    model = Order
    list_per_page = 20
    list_display = ["customer", "store", "employee", "order_date", "display_original_total"]
    #readonly_fields = ["original_total", "discount_amount"]
    inlines = [OrderLineForm, ]

    #form = GenericForm

    @admin.display(description='Total', ordering="original_total")
    def display_original_total(self, obj):
        return "$" + str(round(obj.original_total, 2))

    class Media:
        js = (
            '//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js',
            'Bakery/js/OrderChange.js',
        )

    def save_model(self, request, obj, form, change):
        super(OrderAdmin, self).save_model(request, obj, form, change)
        order_lines = OrderLine.objects.filter(id=obj.id)
        total = Decimal(0)
        for line in order_lines:
            total += line.total_price
        parent_order = Order.objects.get(pk=obj.id)
        parent_order.final_total = total
        parent_order.original_total = total
        parent_order.save()



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




