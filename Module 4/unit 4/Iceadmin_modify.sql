--Add a vendor table
Create TABLE Vendor(
    id               INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(20) NOT NULL,
    website          VARCHAR(50) NOT NULL,
    country          VARCHAR(30) NOT NULL,
    brandManager     INT NOT NULL,
    CONSTRAINT c_vendor_employee
       FOREIGN KEY(brandManager) REFERENCES Employee(id)
); 

USE IceAdmin;

--Add some vendors
INSERT INTO Vendor(name, website, country, brandManager) VALUES
     ('Microsoft', 'https://microsoft.com', 'USA', 3),
     ('Linux Professional Institute', 'https://lpi.org', 'USA', 3),
     ('Digital Marketing Institute', 'https://digitalmarketinginstitute.com', 'Ireland', 2),
     ('Adobe', 'https://adobe.com', 'USA', 1);

--Modify the vendor table
ALTER TABLE Vendor
    CHANGE COLUMN name 
    name VARCHAR(50) NOT NULL;

SELECT * FROM Vendor;

--Modifying Constraints (4.4.3)
SELECT * FROM Employee;

-- Try to delete the employee
DELETE FROM Employee WHERE id = 2;

--Modify the Salary > Employment Relationship
ALTER TABLE Salary DROP CONSTRAINT c_salary_employee;
ALTER TABLE Salary
    ADD CONSTRAINT c_salary_employee
    FOREIGN KEY(employeeId) REFERENCES Employee(id)
    ON UPDATE CASCADE 
    ON DELETE CASCADE;

--Modify the EmployeeDepartment > Employee Relationship
ALTER TABLE EmployeeDepartment DROP CONSTRAINT c_employeedepartment_employee;
ALTER TABLE EmployeeDepartment
    ADD CONSTRAINT c_employeedepartment_employee
    FOREIGN KEY(employeeId) REFERENCES Employee(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

--Allow brandManager in Vendor to accept NULL values
ALTER TABLE Vendor
   CHANGE COLUMN brandManager
   brandManager INT;

--Modify the Vendor > Employee Relationship
ALTER TABLE Vendor DROP CONSTRAINT c_vendor_employee;
ALTER TABLE Vendor 
    ADD CONSTRAINT c_vendor_employee 
    FOREIGN KEY(brandManager) REFERENCES Employee(id)
    ON UPDATE CASCADE
    ON DELETE SET NULL;
   





