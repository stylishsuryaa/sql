USE company_db;

-- 1. Create single index on email
CREATE INDEX idx_emp_email ON employees(email);

-- 2. Create composite index on department & salary
CREATE INDEX idx_dept_salary ON employees(dept_id, salary);

-- 3. Check query execution plan
EXPLAIN SELECT * FROM employees WHERE email = 'suryaa@example.com';

-- 4. List all active indexes
SHOW INDEX FROM employees;
