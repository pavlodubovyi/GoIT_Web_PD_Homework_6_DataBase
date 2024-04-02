-- Знайти список курсів, які відвідує студент
-- 1) Run the following script in SQL console for test database OR
-- 2) Copy-Paste the following script in "select.py" after "sql_expression_from_query = """

SELECT
    students.id,
    students.fullname,
    subjects.name
FROM grades
JOIN students ON grades.student_id = students.id
JOIN subjects ON grades.subject_id = subjects.id
WHERE students.id = 1 -- enter desired student id
GROUP BY
    subjects.name,
    students.fullname,
    students.id;
