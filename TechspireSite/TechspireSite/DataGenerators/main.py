from faker import Faker
import csv
import names
import random
import datetime

def random_phone():
    output = ""
    for element in range(0, 10):
        output += str(random.randrange(0, 9))
    output = "001" + output
    return output


def date_in_range(start_date, end_date):
    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = random.randrange(days_between_dates)
    random_date = start_date + datetime.timedelta(days=random_number_of_days)
    return random_date


def generate_customers():
    fake = Faker()
    with open('customers.csv', 'w',newline='', ) as customer_csv:
        writer = csv.writer(customer_csv)
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
    employee_jobs = open('EmployeeJobList.csv', 'w', newline='', )
    employee_job_writer = csv.writer(employee_jobs, delimiter='~')
    with open('EmployeeList.csv', 'w', newline='', ) as customer_csv:
        employee_writer = csv.writer(customer_csv, delimiter='~')
        for row in range(0, 200):
            first_name = names.get_first_name()
            last_name = names.get_last_name()
            email = first_name + last_name + "@gmail.com"
            start_date = date_in_range(datetime.date(2010, 1, 1), datetime.date(2015, 1, 1))
            birth_date = date_in_range(datetime.date(1960, 1, 1), datetime.date(2000, 1, 1))
            employee_writer.writerow([row, start_date, "", first_name, last_name, email, random_phone(), "", birth_date])
            job_type = random.randrange(0, 4)

            if job_type == 1 or job_type == 2:
                employee_job_writer.writerow(["", job_start_date(start_date, 200), row, job_type])
                continue

            if job_type == 3:
                employee_job_writer.writerow(["", job_start_date(start_date, 200), row, 1])
                employee_job_writer.writerow(["", job_start_date(start_date, 200), row, 2])
                continue
    employee_jobs.close()


def generate_employee_jobs():
    fake = Faker()
    with open('EmployeeJobList.csv', 'w', newline='', ) as customer_csv:
        writer = csv.writer(customer_csv, delimiter='~')
        for row in range(0, 200):
            writer.writerow(["", random.randrange(0, 199), random.randrange(1, 2), ])





if __name__ == '__main__':
    #generate_customers()
    generate_employees()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
