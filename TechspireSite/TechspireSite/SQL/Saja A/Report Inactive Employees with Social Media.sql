--Saja Alyasin
--Inactive Employees with a Social Media
--The client can use this report to determine which employees are currently inactive in order to remove them from being contacted or updated with future business practices.
--Displays the inactive employees with their social media information, it is sorted alphabetically by employee first name.
--Row Number, Employee First Name, Employee Last Name, Social Media Type, User Handle
--,,,,,

SELECT ROW_NUMBER()
OVER(ORDER BY Employee.first_name ASC) AS Row_Num,
Employee.first_name AS "First Name",
Employee.last_name AS "Last Name",
SocialMediaType.social_media_name AS "Social Media Type",
EmployeeSocialMedia.social_media_code AS "User Handle"
FROM EmployeeSocialMedia
INNER JOIN Employee ON EmployeeSocialMedia.employee_id = Employee.id
INNER JOIN SocialMediaType ON SocialMediaType.id = EmployeeSocialMedia.social_media_type_id
INNER JOIN EmployeeStatus ON EmployeeStatus.id = Employee.employee_status_id
WHERE "EmployeeStatus".is_active = 0
