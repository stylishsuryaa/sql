USE company_db;

-- 1. INNER JOIN (Matching records only)
SELECT employees.emp_name, departments.dept_name, employees.salary
FROM employees
INNER JOIN departments ON employees.dept_id = departments.dept_id;

-- 2. LEFT JOIN (All employees, even without a department)
SELECT employees.emp_name, departments.dept_name
FROM employees
LEFT JOIN departments ON employees.dept_id = departments.dept_id;

-- 3. RIGHT JOIN (All departments, even with no employees)
SELECT departments.dept_name, employees.emp_name
FROM employees
RIGHT JOIN departments ON employees.dept_id = departments.dept_id;
