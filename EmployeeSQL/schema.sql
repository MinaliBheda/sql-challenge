--Employee SQL

CREATE TABLE "Departments" (
    "ID" VARCHAR(5)   NOT NULL,
    "name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Titles" (
    "ID" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Employees" (
    "ID" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Saleries" (
    "emp_id" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL
);

CREATE TABLE "DepartmentManager" (
    "dept_id" VARCHAR(5)   NOT NULL,
    "emp_id" INTEGER   NOT NULL
);

CREATE TABLE "DepartmentEmployee" (
    "emp_id" INTEGER   NOT NULL,
    "dept_id" VARCHAR(5)   NOT NULL
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("ID");

ALTER TABLE "Saleries" ADD CONSTRAINT "fk_Saleries_emp_id" FOREIGN KEY("emp_id")
REFERENCES "Employees" ("ID");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_dept_id" FOREIGN KEY("dept_id")
REFERENCES "Departments" ("ID");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_emp_id" FOREIGN KEY("emp_id")
REFERENCES "Employees" ("ID");

ALTER TABLE "DepartmentEmployee" ADD CONSTRAINT "fk_DepartmentEmployee_emp_id" FOREIGN KEY("emp_id")
REFERENCES "Employees" ("ID");

ALTER TABLE "DepartmentEmployee" ADD CONSTRAINT "fk_DepartmentEmployee_dept_id" FOREIGN KEY("dept_id")
REFERENCES "Departments" ("ID");

