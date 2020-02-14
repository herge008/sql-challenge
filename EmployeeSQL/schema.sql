--========================================================================================================================
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE "departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

COPY 
	departments (dept_no, dept_name)
FROM 'D:\09-SQL\data\departments.csv'
DELIMITER ',' CSV HEADER;
--========================================================================================================================
DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    "from_date" VARCHAR(10)   NOT NULL,
    "to_date" VARCHAR(10)   NOT NULL
);

COPY 
	dept_emp (emp_no, dept_no, from_date, to_date)
FROM 'D:\09-SQL\data\dept_emp.csv'
DELIMITER ',' CSV HEADER;
--SELECT * FROM dept_emp
--========================================================================================================================
DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "from_date" VARCHAR(10)   NOT NULL,
    "to_date" VARCHAR(10)   NOT NULL
);

COPY 
	dept_manager (dept_no, emp_no, from_date, to_date)
FROM 'D:\09-SQL\data\dept_manager.csv'
DELIMITER ',' CSV HEADER;
--SELECT * FROM dept_manager
--========================================================================================================================
DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE "employees" (
    "emp_no" INTEGER   NOT NULL,
    "birth_date" VARCHAR(10)   NOT NULL,
    "first_name" VARCHAR(14)   NOT NULL,
    "last_name" VARCHAR(16)   NOT NULL,
    "gender" VARCHAR(1)   NOT NULL,
    "hire_date" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

COPY 
	employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
FROM 'D:\09-SQL\data\employees.csv'
DELIMITER ',' CSV HEADER;
--SELECT * FROM employees
--========================================================================================================================
DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE "salaries" (
    "id" SERIAL PRIMARY KEY   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER  NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" VARCHAR(10)   NOT NULL
);

COPY 
	salaries (emp_no, salary, from_date, to_date)
FROM 'D:\09-SQL\data\salaries.csv'
DELIMITER ',' CSV HEADER;
--SELECT * FROM salaries
--========================================================================================================================
DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE "titles" (
    "id" SERIAL PRIMARY KEY   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "title" VARCHAR(18)   NOT NULL,
    "from_date" VARCHAR(10)   NOT NULL,
    "to_date" VARCHAR(10)   NOT NULL
);

COPY 
	titles (emp_no, title, from_date, to_date)
FROM 'D:\09-SQL\data\titles.csv'
DELIMITER ',' CSV HEADER;
--SELECT * FROM titles
--========================================================================================================================

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");