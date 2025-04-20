CREATE TABLE Office(
   Onumber SERIAL PRIMARY KEY,
   Oname char(40) NOT NULL,
   Country char(50)
);

CREATE TABLE Employee(
	SSN SERIAL PRIMARY KEY,
	Ename char(40) NOT NULL,
	Gender char(1) check(Gender IN ('M', 'F')),
	Bdate date,
	address char(50),
	salary decimal default 0.00,
	Ono int,
	yrs_of_exp int,
	FOREIGN KEY (Ono) REFERENCES Office(Onumber)
);

CREATE TABLE Project(
	Pnumber SERIAL PRIMARY KEY,
	Pname char(40) NOT NULL UNIQUE,
	Plocation char(50),
	Onumber int,
	FOREIGN KEY (Onumber) REFERENCES Office(Onumber)
);

CREATE TABLE Works_on(
	ESSN int,
	Pno int,
	FOREIGN KEY (ESSN) REFERENCES Employee(SSN) on delete cascade on update cascade,
	FOREIGN KEY (Pno) REFERENCES Project(Pnumber) on delete cascade on update cascade
);

CREATE TABLE Dependents(
	Did SERIAL PRIMARY KEY,
	Dname char(40) NOT NULL,
	Dage int check(Dage<40),
	SSN int,
	FOREIGN KEY (SSN) REFERENCES Employee(SSN) on delete SET NULL ON UPDATE SET NULL 
);

-- Q2
INSERT INTO Office(Country, Oname) VALUES('Nepal', 'Worldlink');

INSERT INTO Office(Oname, Country)
VALUES
('NTC', 'Nepal'),
('TATA', 'India');

INSERT INTO Employee(Ename, Gender, Bdate, address, Ono, yrs_of_exp)
VALUES
('Sita', 'F', '2001-12-12', 'KTM', '1', '1'),
('Amulya', 'M', '2000-12-01', 'BHT', '2', '4'),
('Sujan', 'M', '1996-01-20', 'DHD', '3', '2'),
('Sarita', 'F', '2002-10-12', 'KTM', '4', '1'),
('Girish', 'M', '1999-05-10', 'LTP', '5', '3');

-- Q3
ALTER TABLE Dependents ADD COLUMN rel_w_emp varchar;

-- Q4
ALTER TABLE Dependents ALTER COLUMN rel_w_emp TYPE char(50);

-- Lab1 Q5
UPDATE Office SET oname='NTC' WHERE oname='Ncell'

-- Lab1 Q6
DELETE FROM Employee WHERE SSN='1'

-- Q7
ALTER TABLE Project RENAME COLUMN Plocation to Proj_location;

-- Lab1 Q8
DROP TABLE IF EXISTS Works_on;

-- Lab2 Q2
CREATE TABLE PF(
	PFID SERIAL PRIMARY KEY,
	SSN int,
	PFCategoryName char(40) NOT NULL,
	amt float,
	Start_Date date,
	remarks char(50),
	FOREIGN KEY (SSN) REFERENCES Employee(SSN) on delete SET NULL ON UPDATE SET NULL 
);

-- Lab2 Q3
ALTER TABLE Employee ADD COLUMN status varchar;
INSERT INTO Employee(Ename, Gender, Bdate, address, Ono, yrs_of_exp, status)
VALUES
('Sita', 'F', '2001-12-12', 'KTM', '1', '1', 'Single'),
('Amulya', 'M', '2000-12-01', 'BHT', '2', '4', 'Married'),
('Sujan', 'M', '1996-01-20', 'DHD', '3', '2', 'Married'),
('Sarita', 'F', '2002-10-12', 'KTM', '4', '1', 'Married'),
('Girish', 'M', '1999-05-10', 'LTP', '5', '3', 'Divorced');

-- Lab2 Q4
INSERT INTO PF(PFID, SSN, PFCategoryName, amt, Start_Date, remarks)
VALUES
('1', '2', 'abc', '55000.23', '2018-01-04', ''),
('2', '3', 'def', '27000.00', '2014-10-03', ''),
('3', '4', 'ghi', '52000.23', '2016-11-14', ''),
('4', '5', 'jkl', '55000.43', '2017-08-12', ''),
('5', '6', 'mno', '55000.25', '2012-07-15', ''),
('6', '7', 'pqr', '67000.00', '2020-05-11', ''),
('7', '8', 'sss', '44000.00', '2022-10-10', ''),
('8', '9', 'tuv', '30000.23', '2021-10-22', ''),
('9', '10', 'www', '55000.00', '2021-09-12', ''),
('10', '11', 'xyz', '44000.23', '2021-09-12', '');

-- Lab2 Q5
SELECT *
FROM employee
WHERE salary > 30000
ORDER BY Ename DESC;

-- Lab2 Q6
SELECT *
FROM project
ORDER BY Pname ASC;

-- Lab Q7
SELECT *
FROM Employee
WHERE Salary > 30000 AND yrs_of_exp < 3;

-- Lab Q8
SELECT Ename as name, address, salary
FROM Employee
WHERE Salary > 30000 OR yrs_of_exp < 3;

-- Lab Q9
SELECT dname as name, dage
FROM Dependents
WHERE dage BETWEEN 10 AND 15;

-- Lab3 Q1
SELECT Ename as employee_name,
       (SELECT string_agg(Dname, ', ') 
        FROM Dependents
        WHERE SSN = Employee.SSN) as dependents
FROM Employee;

-- Lab3 Q2
SELECT Employee.Ename as employee_name, 
       Dependents.Dname as dependent_name
FROM Employee, Dependents
WHERE Employee.SSN = Dependents.SSN
ORDER BY dependent_name;

-- Lab3 Q9
select pname, proj_location from Project where onumber in
(select onumber from Office where country='Nepal' or country='India');

-- Lab3 Q10
select ename, gender from (select * from Employee where salary>20000) as temp_emp;