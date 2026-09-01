USE company_db;

DELIMITER //

-- Procedure to fetch employees by department ID
CREATE PROCEDURE GetEmployeesByDept(IN p_dept_id INT)
BEGIN
    SELECT emp_id, emp_name, salary 
    FROM employees 
    WHERE dept_id = p_dept_id;
END //

DELIMITER ;

-- Execute the procedure:
CALL GetEmployeesByDept(1);
