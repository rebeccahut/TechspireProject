--Brett M
ALTER TABLE EmployeeJob 
ADD employee_id int FOREIGN KEY REFERENCES Employee(id);

ALTER TABLE EmployeeJob
ADD job_id int FOREIGN KEY REFERENCES Store(id);

ALTER TABLE EmployeeJob 
ADD store_id int FOREIGN KEY REFERENCES Job(id);

ALTER TABLE Employee
ADD location_id int FOREIGN KEY REFERENCES Location(id);

ALTER TABLE Employee
ADD employee_status_id int FOREIGN KEY REFERENCES EmployeeStatus(id);

ALTER TABLE Employee
ADD employee_type_id int FOREIGN KEY REFERENCES EmployeeType(id);

ALTER TABLE Location
ADD state_id int FOREIGN KEY REFERENCES StateProvince(id);


