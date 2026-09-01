USE student_db;

-- Add a new column
ALTER TABLE students ADD COLUMN phone VARCHAR(15);

-- Modify column datatype
ALTER TABLE students MODIFY COLUMN name VARCHAR(100);

-- Drop a column
ALTER TABLE students DROP COLUMN phone;
