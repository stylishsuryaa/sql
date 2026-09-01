USE company_db;

-- 1. Simple Subquery: Employees earning above overall average
SELECT emp_name, salary 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Correlated Subquery: Employees earning above their own department average
SELECT e1.emp_name, e1.salary, e1.dept_id
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary) 
    FROM employees e2 
    WHERE e2.dept_id = e1.dept_id
);
