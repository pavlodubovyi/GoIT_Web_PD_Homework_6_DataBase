-- Знайти оцінки студентів у окремій групі з певного предмета
-- 1) Run the following script in SQL console for test database OR
-- 2) Copy-Paste the following script in "select.py" after "sql_expression_from_query = """

SELECT
    groups.id,
    students.fullname,
    subjects.name,
    grades.grade
FROM grades
JOIN students ON students.id = grades.student_id
JOIN subjects ON subjects.id = grades.subject_id
JOIN groups ON students.group_id = groups.id
WHERE
    groups.id = 1 -- enter id of group you need
    AND subjects.id = 3; -- enter id of subject you need

