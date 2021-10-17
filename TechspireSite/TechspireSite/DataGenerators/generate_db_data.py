from faker import Faker
import csv
import names
import random
import datetime
import pandas
import os
from decimal import Decimal


def generate_phones(count):
    country = "+1"
    area_codes = pandas.read_csv("Area.tsv", sep="\t", header=None, index_col=0)
    area_codes = area_codes.sample(count, replace=True)
    codes = area_codes[1].tolist()
    numbers = []
    for code in codes:
        last_digits = ""
        for index in range(0, 7):
            digit = random.randrange(0, 10)
            last_digits += str(digit)
        numbers.append(country + str(code) + last_digits)
    return numbers


def date_in_range(start_date, end_date):
    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = random.randrange(days_between_dates)
    random_date = start_date + datetime.timedelta(days=random_number_of_days)
    return random_date


def generate_customers():
    fake = Faker()
    with open('customers.tsv', 'w', newline='', ) as customer_tsv:
        writer = tsv.writer(customer_tsv)
        print(fake.date())
        for row in range(0, 200):
            first_name = names.get_first_name()
            last_name = names.get_last_name()
            email = first_name + last_name + "@gmail.com"
            confirmed = bool(random.getrandbits(1))
            writer.writerow([first_name, last_name, fake.date(), email, confirmed, fake.phone_number()])


def job_start_date(start_date, add_days):
    return start_date + datetime.timedelta(days=add_days)


def generate_employees():
    fake = Faker()
    module_dir = os.path.dirname(__file__)
    base_path = os.path.join(os.path.dirname(module_dir), "SQL", "Data")
    emp_job_path = os.path.join(base_path,"EmployeeJobList.tsv")
    employee_jobs = open(emp_job_path, 'w', newline='', )
    employee_job_writer = csv.writer(employee_jobs, delimiter='\t')
    emp_path = os.path.join(base_path, "EmployeeList.tsv")
    with open(emp_path, 'w', newline='', ) as customer_tsv:
        employee_writer = csv.writer(customer_tsv, delimiter='\t')
        phone_numbers = generate_phones(100)
        for row in range(0, 100):
            first_name = names.get_first_name()
            last_name = names.get_last_name()
            email = first_name + last_name + "@gmail.com"
            start_date = date_in_range(datetime.date(2010, 1, 1), datetime.date(2018, 1, 1))
            birth_date = date_in_range(datetime.date(1960, 1, 1), datetime.date(2000, 1, 1))
            emp_type = random.randrange(1, 3)
            status = random.randrange(1, 6)
            end_date = ""
            if status > 1:
                max_date = min(start_date + datetime.timedelta(days=1000), datetime.date(2020, 1, 1))
                end_date = date_in_range(start_date, max_date)

            employee_writer.writerow([row+1, first_name, last_name, email, phone_numbers[row], "", birth_date,
                                      start_date, end_date, row+1, status, emp_type])
            for x in range(1, 3):
                select = random.randrange(0, 11)
                if select < 6:
                    job_type = random.randrange(1, 3)
                    employee_job_writer.writerow(["", job_start_date(start_date, 200), row+1, job_type, x])
                    continue

                if select == 10:
                    employee_job_writer.writerow(["", job_start_date(start_date, 200), row+1, 1, x])
                    employee_job_writer.writerow(["", job_start_date(start_date, 200), row+1, 2, x])
                    continue
    employee_jobs.close()


#qty, ind_price, total_price, product, order
def generate_order_lines(num_orders):
    product_list = pandas.read_csv("RawProductList.tsv", delimiter="\t", converters={'Price': lambda a: Decimal(a)})
    order_list = []
    for ord_index in range(num_orders):
        num = random.randrange(1, 6)
        selected_products = product_list.sample(num)
        selected_products.reset_index(inplace=True)
        for index in range(num):
            line_id = selected_products.at[index, "ID"]
            amount = Decimal(random.randrange(1, 6))
            ind_price = Decimal(selected_products.at[index, 'Price'])
            total_price = Decimal(amount * ind_price)
            row = [amount, ind_price, total_price, line_id, ord_index+1]
            order_list.append(row)
    order_lines = pandas.DataFrame(order_list)
    module_dir = os.path.dirname(__file__)
    path_name = os.path.join(os.path.dirname(module_dir), "SQL", "Data", "OrderLineList.tsv")
    order_lines.index += 1
    order_lines.to_csv(path_name, header=False, index=True, sep="\t")


# ID, Quantity, ind_price, total_price, product, order
def generate_orders():
    pandas.read_csv("ProductType.tsv")




if __name__ == '__main__':
    #generate_customers()
    generate_employees()
    #generate_orders()
    #generate_order_lines(200)


# See PyCharm help at https://www.jetbrains.com/help/pycharm/
