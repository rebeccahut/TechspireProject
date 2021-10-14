ALTER TABLE EmployeeEmployeeCategory ADD
    employee_id int FOREIGN KEY REFERENCES Employee(id),
    employee_category_id int FOREIGN KEY REFERENCES EmployeeCategory(id);
