# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.db.models import CheckConstraint
from django.db.models import Q

from .Owners import Owners


class DescriptiveModel(models.Model):
    description = "Blank Description"
    pk_desc = "Standard Auto-Increment PK"
    owner = Owners.TableOwner

    class Meta:
        abstract = True


#Used as an abstract parent for status codes
class StatusCode(DescriptiveModel):
    description = "Used to soft delete rows with a reason name and desc"
    status_name = models.CharField(max_length=40)
    status_desc = models.CharField(max_length=200)
    is_active = models.BooleanField(help_text="Soft Delete Bool", default=True)
    status_assigned = models.DateField()

    class Meta:
        abstract = True


#Used as an abstract parent for labels
class LabelCode(DescriptiveModel):
    description = "Allows for multiple named labels"
    label_name = models.CharField(max_length=40)
    label_desc = models.CharField(max_length=200)

    class Meta:
        abstract = True


class CustomerLabel(LabelCode):
    owner = Owners.Rebecca

    class Meta:
        db_table = "Customer Label"
        verbose_name_plural = "Customer Label"


class EmployeeLabel(LabelCode):
    owner = Owners.Kyle

    class Meta:
        db_table = "Employee Label"
        verbose_name_plural = "Employee Label"


class EmployeeStatus(StatusCode):
    owner = Owners.Alanna

    class Meta:
        db_table = "EmployeeStatus"
        verbose_name_plural = "Employee Status"


class CustomerStatus(StatusCode):
    owner = Owners.Umair
    class Meta:
        db_table = "CustomerStatus"
        verbose_name_plural = "Customer Status"


class ProductStatus(StatusCode):
    owner = Owners.Srijana

    class Meta:
        db_table = "ProductStatus"
        verbose_name_plural = "Product Status"


class StoreStatus(StatusCode):
    owner = Owners.Alanna

    class Meta:
        db_table = "StoreStatus"
        verbose_name_plural = "Store Status"


class RewardStatus(StatusCode):
    owner = Owners.Alanna

    class Meta:
        db_table = "RewardStatus"
        verbose_name_plural = "Reward Status"


class BanType(LabelCode):
    owner = Owners.Alanna

    description = "Describes why a type of product is banned"

    class Meta:
        db_table = "BanType"
        verbose_name_plural = "Ban Type"


class PointReason(LabelCode):
    description = "Describes why points were added or removed"
    owner = Owners.Jade

    class Meta:
        db_table = "PointLogType"
        verbose_name_plural = "Point Log Type"


class Country(DescriptiveModel):
    country_name = models.CharField(max_length=60)
    owner = Owners.Rebecca

    def __str__(self):
        return self.country_name

    class Meta:
        db_table = "Country"
        verbose_name_plural = "Country"


class StateProvince(DescriptiveModel):
    state_name = models.CharField(max_length=60)
    country = models.ForeignKey(Country, on_delete=models.RESTRICT)
    owner = Owners.Rebecca

    def __str__(self):
        return self.state_name

    class Meta:
        db_table = "StateProvince"
        verbose_name_plural = "State/Province"


class Location(DescriptiveModel):
    description = "Represents a complete address for a location"
    zip_code = models.CharField(max_length=5, blank=True, null=True)
    city = models.CharField(max_length=35, blank=True, null=True)
    address = models.CharField(max_length=100, blank=True, null=True)
    state = models.ForeignKey(StateProvince, on_delete=models.RESTRICT)
    owner = Owners.BrettM

    class Meta:
        db_table = "Location"
        verbose_name_plural = "Location/Address"


class Tier(LabelCode):
    owner = Owners.Umair

    class Meta:
        db_table = "Tier"
        verbose_name_plural = "Tier"


#Used as an abstract parent for people
class Person(DescriptiveModel):
    first_name = models.CharField(max_length=40)
    last_name = models.CharField(max_length=40)
    email_address = models.EmailField(max_length=254)
    phone_number = models.CharField(max_length=14)
    comments = models.TextField(blank=True, null=True)
    birthdate = models.DateField()
    created_date = models.DateField()
    location = models.ForeignKey(Location, on_delete=models.RESTRICT)

    class Meta:
        abstract = True


class EmployeeType(LabelCode):
    owner = Owners.Kyle

    class Meta:
        db_table = "EmployeeType"
        verbose_name_plural = "Employee Type"


class Employee(Person):
    end_date = models.DateField(blank=True, null=True)
    employee_status = models.ForeignKey(EmployeeStatus, on_delete=models.RESTRICT)
    employee_type = models.ForeignKey(EmployeeType, on_delete=models.RESTRICT)
    owner = Owners.BrettM

    class Meta:
        db_table = "Employee"
        verbose_name_plural = "Employee"


class Customer(Person):
    create_employee = models.ForeignKey(Employee, on_delete=models.RESTRICT)
    customer_status = models.ForeignKey(CustomerStatus, on_delete=models.RESTRICT)
    tier = models.ForeignKey(Tier, on_delete=models.SET_NULL, blank=True, null=True)
    location = models.ForeignKey(Location, on_delete=models.SET_NULL, blank=True, null=True)
    owner = Owners.Julia

    class Meta:
        db_table = "Customer"
        verbose_name_plural = "Loyalty Customer"


class Job(DescriptiveModel):
    job_name = models.CharField(max_length=40)
    job_desc = models.CharField(max_length=200, blank=True, null=True)
    owner = Owners.BrettM

    class Meta:
        db_table = "Job"
        verbose_name_plural = "Job"





class AssocEmployeeLabel(LabelCode):
    employee = models.ForeignKey(Employee, on_delete=models.RESTRICT)
    employee_label = models.ForeignKey(EmployeeLabel, on_delete=models.RESTRICT)
    owner = Owners.Kyle

    class Meta:
        db_table = "AssocEmployeeLabel"
        verbose_name_plural = "Associative Employee Label"


class AssocCustomerLabel(LabelCode):
    customer = models.ForeignKey(Employee, on_delete=models.RESTRICT)
    customer_label = models.ForeignKey(CustomerLabel, on_delete=models.RESTRICT)
    owner = Owners.Rebecca

    class Meta:
        db_table = "AssocCustomerLabel"
        verbose_name_plural = "Associative Customer Label"


class PaymentType(LabelCode):
    owner = Owners.Umair

    class Meta:
        db_table = "PaymentType"
        verbose_name_plural = "Payment Type"


class Store(DescriptiveModel):
    location = models.ForeignKey(Location, on_delete=models.RESTRICT)
    store_status = models.ForeignKey(StoreStatus, on_delete=models.RESTRICT)
    owner = Owners.Srijana

    class Meta:
        db_table = "Store"
        verbose_name_plural = "Store"


class EmployeeJob(DescriptiveModel):
    assign_date = models.DateField()
    employee = models.ForeignKey(Employee, on_delete=models.RESTRICT)
    store = models.ForeignKey(Store, on_delete=models.RESTRICT)
    job = models.ForeignKey(Job, on_delete=models.RESTRICT)
    owner = Owners.BrettM

    class Meta:
        db_table = "EmployeeJob"
        verbose_name_plural = "Employee Job"


class Order(DescriptiveModel):
    order_date = models.DateField()
    total_price = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    customer = models.ForeignKey(Customer, on_delete=models.RESTRICT)
    payment_type = models.ForeignKey(PaymentType, on_delete=models.RESTRICT)
    store = models.ForeignKey(Store, on_delete=models.RESTRICT)
    owner = Owners.Torrey

    class Meta:
        db_table = "Order"
        verbose_name_plural = "Order/Transaction"


class ProductType(DescriptiveModel):
    product_type_name = models.CharField(max_length=40)
    product_type_desc = models.CharField(max_length=200)
    ban_reason = models.ForeignKey(BanType, on_delete=models.SET_NULL, blank=True, null=True)
    owner = Owners.Srijana

    class Meta:
        db_table = "ProductType"
        verbose_name_plural = "Product Type"


class Product(DescriptiveModel):
    product_name = models.CharField(max_length=40)
    product_desc = models.CharField(max_length=200)
    product_price = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    product_type = models.ForeignKey(ProductType, on_delete=models.RESTRICT)
    product_status = models.ForeignKey(ProductStatus, on_delete=models.RESTRICT)
    owner = Owners.Srijana

    class Meta:
        db_table = "Product"
        verbose_name_plural = "Product"


class OrderLine(DescriptiveModel):
    quantity = models.IntegerField(default=0)
    ind_price = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    total_price = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    product = models.ForeignKey(Product, on_delete=models.RESTRICT)
    order = models.ForeignKey(Order, on_delete=models.RESTRICT)
    owner = Owners.Julia


    class Meta:
        db_table = "OrderLine"
        verbose_name_plural = "Order Line"


class Reward(DescriptiveModel):
    description ='All benefits that are offered by the business for being an active loyalty customer that can be claimed by converting some of their earned points. “Rewards” can be coupons ($5 off) or birthday reward (does not need point conversion, it’s just a redemption code for a freebie)'
    reward_name = models.CharField(max_length=40)
    reward_desc = models.CharField(max_length=200)
    reward_status = models.ForeignKey(RewardStatus, on_delete=models.RESTRICT)
    tier = models.ForeignKey(Tier, on_delete=models.SET_NULL, blank=True, null=True)
    date_added = models.DateField()
    owner = Owners.Umair

    class Meta:
        db_table = "Reward"
        verbose_name_plural = "Reward"


class SocialMediaType(DescriptiveModel):
    social_media_name = models.CharField(max_length=40)
    social_media_desc = models.CharField(max_length=200)
    owner = Owners.Jade

    class Meta:
        db_table = "SocialMediaType"
        verbose_name_plural = "Social Media Type"


class StoreSocialMedia(DescriptiveModel):
    social_media_code = models.CharField(max_length=60)
    store = models.ForeignKey(Store, on_delete=models.RESTRICT)
    social_media_type = models.ForeignKey(SocialMediaType, on_delete=models.RESTRICT)
    date_added = models.DateField()
    owner = Owners.Saja

    class Meta:
        db_table = "StoreSocialMedia"
        verbose_name_plural = "Store Social Media"


class EmployeeSocialMedia(DescriptiveModel):
    social_media_code = models.CharField(max_length=60)
    employee = models.ForeignKey(Employee, on_delete=models.RESTRICT)
    social_media_type = models.ForeignKey(SocialMediaType, on_delete=models.RESTRICT)
    date_added = models.DateField()
    owner = Owners.Saja


    class Meta:
        db_table = "EmployeeSocialMedia"
        verbose_name_plural = "Employee Social Media"


class CustomerSocialMedia(DescriptiveModel):
    social_media_code = models.CharField(max_length=60)
    social_media_type = models.ForeignKey(SocialMediaType, on_delete=models.RESTRICT)
    customer = models.ForeignKey(Customer, on_delete=models.RESTRICT)
    date_added = models.DateField()
    owner = Owners.Jade

    class Meta:
        db_table = "CustomerSocialMedia"
        verbose_name_plural = "Customer Social Media"


class StoreProduct(DescriptiveModel):
    product = models.ForeignKey(Product, on_delete=models.RESTRICT)
    store = models.ForeignKey(Store, on_delete=models.RESTRICT)
    product_assigned = models.DateField()
    owner = Owners.Torrey

    class Meta:
        db_table = "StoreProduct"
        verbose_name_plural = "Store Product"


class StoreReward(DescriptiveModel):
    reward = models.ForeignKey(Reward, on_delete=models.RESTRICT)
    store = models.ForeignKey(Store, on_delete=models.RESTRICT)
    reward_assigned = models.DateField()
    owner = Owners.Saja

    class Meta:
        db_table = "Store Reward"
        verbose_name_plural = "Store Reward"


class CustomerReward(DescriptiveModel):
    date_applied = models.DateField()
    customer = models.ForeignKey(Customer, on_delete=models.RESTRICT)
    reward = models.ForeignKey(Reward, on_delete=models.RESTRICT)
    owner = Owners.Julia

    class Meta:
        db_table = "CustomerReward"
        verbose_name_plural = "Customer Reward"


class PointLog(DescriptiveModel):
    quantity = models.IntegerField(default=0)
    date = models.DateField()
    employee = models.ForeignKey(Employee, on_delete=models.RESTRICT)
    customer = models.ForeignKey(Customer, on_delete=models.RESTRICT)
    reason = models.ForeignKey(PointReason, on_delete=models.RESTRICT)
    order = models.ForeignKey(Order, on_delete=models.SET_NULL, blank=True, null=True)
    customer_reward = models.ForeignKey(CustomerReward, on_delete=models.SET_NULL, blank=True, null=True)
    owner = Owners.Jade

    class Meta:
        db_table = "PointLog"
        verbose_name_plural = "Point Log"



