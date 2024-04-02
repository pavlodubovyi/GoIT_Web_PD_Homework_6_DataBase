-- Знайти середній бал, який ставить певний викладач зі своїх предметів
-- 1) Run the following script in SQL console for test database OR
-- 2) Copy-Paste the following script in "select.py" after "sql_expression_from_query = """

SELECT
    teachers.id,
    teachers.fullname,
    subjects.name,
    ROUND(AVG(grades.grade), 2)
FROM grades
JOIN subjects ON grades.subject_id = subjects.id
JOIN teachers ON subjects.teacher_id = teachers.id
WHERE teachers.id = 1
GROUP BY teachers.id, teachers.fullname, subjects.name;