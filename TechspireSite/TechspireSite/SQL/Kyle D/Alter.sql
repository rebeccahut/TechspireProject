ALTER TABLE EmployeeEmployeeCategory ADD
	employee_id int FOREIGN KEY REFERENCES Employee(id),
    category_id int FOREIGN KEY REFERENCES EmployeeCategory(id),
	assign_date date NOT NULL DEFAULT GETDATE();


