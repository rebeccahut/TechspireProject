ALTER TABLE EmployeeEmployeeCategory ADD
    employee_id int NOT NULL FOREIGN KEY REFERENCES Employee(id),
    employee_category_id int NOT NULL FOREIGN KEY REFERENCES EmployeeCategory(id);
