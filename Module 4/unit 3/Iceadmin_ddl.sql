CREATE DATABASE IceAdmin;

USE IceAdmin;

CREATE TABLE Department(
    id      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(20) NOT NULL
);

CREATE TABLE Employee(
    id           INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(30) NOT NULL,
    surname      VARCHAR(50),
    jobTitle     VARCHAR(30),
    basis        ENUM('PT','FT') DEFAULT 'FT'
);

DROP TABLE Employee;

CREATE TABLE Salary(
    id             INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fromDate       DATE NOT NULL,
    toDate         DATE,
    amount         FLOAT NOT NULL,
    employeeId     INT NOT NULL,
    CONSTRAINT c_salary_employee
        FOREIGN KEY(employeeId) REFERENCES Employee(id)
);

CREATE table EmployeeDepartment(
    id              INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employeeId      INT NOT NULL,
    departmentId    INT NOT NULL,
    CONSTRAINT c_employeedepartment_employee
         FOREIGN KEY(employeeId) REFERENCES Employee(id),
    CONSTRAINT c_employeedepartment_department
         FOREIGN KEY(departmentId) REFERENCES Department(id)

);