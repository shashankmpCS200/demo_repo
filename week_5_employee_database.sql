CREATE DATABASE employee_database_shashank;
USE employee_database_shashank;

CREATE TABLE project(
	p_no INT,
    p_name VARCHAR(20),
    p_loc VARCHAR(20),
    PRIMARY KEY(p_no)
	);

CREATE TABLE dept(
	dept_no INT,
	d_name VARCHAR(20),
    d_loc VARCHAR(20),
    PRIMARY KEY(dept_no)
	);

CREATE TABLE employee(
	emp_no INT,
    e_name VARCHAR(20),
    mgr_no INT,
    hire_date DATE,
    sal INT,
    dept_no INT,
    PRIMARY KEY(emp_no),
    FOREIGN KEY(dept_no) REFERENCES dept(dept_no) ON DELETE CASCADE
	);

CREATE TABLE incentives(
	emp_no INT,
    incentive_date DATE,
    incentive_amount INT,
    PRIMARY KEY(emp_no,incentive_date),
    FOREIGN KEY(emp_no) REFERENCES employee(emp_no) ON DELETE CASCADE
    );

CREATE TABLE assigned_to(
	emp_no INT,
    p_no INT,
    job_role VARCHAR(20),
    PRIMARY KEY(emp_no,p_no),
    FOREIGN KEY(emp_no) REFERENCES employee(emp_no) ON DELETE CASCADE,
    FOREIGN KEY(p_no) REFERENCES project(p_no) ON DELETE CASCADE
    );

INSERT INTO dept VALUES
("1","SURVEY","BENGALURU"),
("2","ARCHITECTURE","HYDERABAD"),
("3","TEST_TEAM","MYSURU"),
("4","FINANCE","DELHI"),
("5","ENGINEERING","BOMBAY"),
("6","R_AND_D","DHARWAD");

INSERT INTO project VALUES
("1","ROYAL_BRIDGE","BENGALURU"),
("2","HOTEL_TRAVEL_INN","JAMMU"),
("3","RAILWAY_STATION","CHENNAI"),
("4","SUNSHINE_APARTMENT","BOMBAY"),
("5","HOTEL_PRESIDENT","MANGALORE"),
("6","CENTRAL_AIRPORT","GOA"),
("7","THEME_PARK","MYSURU"),
("8","IT_FIRM","HYDERABAD");


INSERT INTO employee VALUES
("10","DEV","101",'2016-11-21',"50000","2"),
("11","ARJUN","102",'2015-1-12',"20000","3"),
("12","RAHUL","103",'2016-10-20',"35000","6"),
("13","SARANG","141",'2020-12-21',"60000","5"),
("14","PUSHKAR","151",'2019-9-15',"15000","1"),
("15","VIRAT","601",'2012-5-13',"50000","4"),
("16","PHILIP","007",'2021-7-1',"20000","1"),
("17","ARUN","1007",'2016-4-13',"40000","2");

INSERT INTO incentives VALUES
("13",'2021-11-5',"5000"),
("11",'2019-1-21',"2000"),
("14",'2020-10-15',"8000"),
("15",'2015-11-15',"10000"),
("15",'2021-11-5',"9000");

INSERT INTO assigned_to VALUES
("10","2","LEAD"),
("17","2","SITE_ARCHITECT"),
("11","3","TESTING_LEAD"),
("13","1","SITE_ENG"),
("13","3","SITE_ENG"),
("14","3","SURVEY_LEAD"),
("15","6","FINANCE_MANAGER"),
("10","4","SITE_ARCHITECT"),
("15","5","FINANCE_MANAGER"),
("14","1","SURVEY_LEAD"),
("11","7","TESTING_LEAD"),
("10","8","LEAD");


SELECT DISTINCT e.emp_no,e.e_name
FROM employee e,assigned_to a,project p
WHERE e.emp_no=a.emp_no AND a.p_no=p.p_no AND p.p_loc IN("BENGALURU","HYDERABAD","MYSURU");

SELECT DISTINCT e.emp_no
FROM employee e,incentives i
WHERE e.emp_no NOT IN(SELECT i.emp_no FROM incentives i);

SELECT DISTINCT e.e_name,e.emp_no,e.dept_no,a.job_role,d.d_loc,p.p_loc
FROM employee e,dept d,assigned_to a,project p
WHERE d.dept_no=e.dept_no AND e.emp_no=a.emp_no AND a.p_no=p.p_no AND p.p_loc=d.d_loc;









    

    