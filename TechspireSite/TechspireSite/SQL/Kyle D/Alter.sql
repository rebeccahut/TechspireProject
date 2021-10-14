ALTER TABLE EmployeeEmployeeCategory ADD
    employee_id int FOREIGN KEY REFERENCES Employee(id),
    category_id int FOREIGN KEY REFERENCES EmployeeCategory(id),
    store_id int FOREIGN KEY REFERENCES Store(id);

ALTER TABLE Employee ADD
    employee_category_id int FOREIGN KEY REFERENCES EmployeeCategory(id),
