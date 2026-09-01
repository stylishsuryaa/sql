USE company_db;

-- 1. View: Mask sensitive salary data
CREATE VIEW view_employee_public AS
SELECT emp_id, emp_name, dept_id 
FROM employees;

-- Query the view
SELECT * FROM view_employee_public;

-- 2. Trigger: Simple salary change audit log
CREATE TABLE salary_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_logs (emp_id, old_salary, new_salary)
        VALUES (OLD.emp_id, OLD.salary, NEW.salary);
    END IF;
END //

DELIMITER ;
