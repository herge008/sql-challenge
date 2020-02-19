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
FROM 'departments.csv'
DELIMITER ',' CSV HEADER;