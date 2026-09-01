USE company_db;

-- 1. Update Query
UPDATE employees 
SET salary = 80000.00 
WHERE emp_name = 'Suryaa';

-- 2. Delete Query
DELETE FROM employees 
WHERE emp_name = 'Priya';

-- 3. Safe Transaction Block
START TRANSACTION;

UPDATE employees SET salary = salary + 3000 WHERE dept_id = 1;

-- Save permanently
COMMIT;

-- Undo changes if needed:
-- ROLLBACK;
