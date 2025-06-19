--Add Three Employees
INSERT INTO Employee(name, surname, jobTitle, basis) VALUES
     ('Joe', 'Mifsud', 'Educator', 'PT'),
     ('Lucy', 'Marconi', 'Admissions Team', 'FT'),
     ('Fred', 'Wake', 'Academic Team', 'FT');

--Check the employees are actually there!
SELECT * FROM Employee;

INSERT INTO Department(name) VALUES
     ('Academic'), ('Admissions'), ('Marketing');

INSERT INTO Salary(employeeid, fromDate, toDate, amount) VALUES
     (1, '2023-01-01', null, 35000),
     (2, '2019-11-01', '2021-10-31', 30000),
     (2, '2021-11-01', null, 37800),
     (3, '2022-05-01', null, 40000);


