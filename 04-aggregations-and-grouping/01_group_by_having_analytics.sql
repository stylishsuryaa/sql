USE company_db;

-- Department summary with minimum employee threshold
SELECT 
    dept_id,
    COUNT(emp_id) AS total_employees,
    AVG(salary) AS average_salary,
    SUM(salary) AS total_payroll
FROM employees
GROUP BY dept_id
HAVING COUNT(emp_id) >= 1;
