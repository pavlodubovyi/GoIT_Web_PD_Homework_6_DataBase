-- Знайти список студентів у певній групі
-- 1) Run the following script in SQL console for test database OR
-- 2) Copy-Paste the following script in "select.py" after "sql_expression_from_query = """

SELECT
    students.id,
    students.fullname
FROM students
JOIN groups ON students.group_id = groups.id
WHERE groups.id = 1;