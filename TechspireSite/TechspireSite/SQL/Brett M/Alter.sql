ALTER TABLE EmployeeJob ADD
    employee_id int FOREIGN KEY REFERENCES Employee(id),
    job_id int FOREIGN KEY REFERENCES Job(id),
    store_id int FOREIGN KEY REFERENCES Store(id);

ALTER TABLE Employee ADD
    location_id int FOREIGN KEY REFERENCES Location(id) NOT NULL,
    employee_status_id int FOREIGN KEY REFERENCES EmployeeStatus(id) NOT NULL,
    employee_type_id int FOREIGN KEY REFERENCES EmployeeType(id) NOT NULL;

ALTER TABLE Location ADD
     state_id int FOREIGN KEY REFERENCES StateProvince(id) DEFAULT 1407;
