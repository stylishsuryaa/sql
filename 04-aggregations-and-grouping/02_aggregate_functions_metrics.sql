USE company_db;

-- Global Aggregation Metrics
SELECT 
    COUNT(*) AS total_employees,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary,
    ROUND(AVG(salary), 2) AS average_salary,
    SUM(salary) AS total_company_payroll
FROM employees;
