ALTER TABLE EmployeeJob 
ADD Employee int FOREIGN KEY REFERENCES Employee(id);


ALTER TABLE EmployeeJob 
ADD Job int FOREIGN KEY REFERENCES Job(id);
 




