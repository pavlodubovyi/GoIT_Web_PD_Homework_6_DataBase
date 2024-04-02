-- Список курсів, які певному студенту читає певний викладач
-- 1) Run the following script in SQL console for test database OR
-- 2) Copy-Paste the following script in "select.py" after "sql_expression_from_query = """

SELECT DISTINCT
    students.id,
    students.fullname,
    teachers.fullname,
    subjects.name
FROM grades
JOIN students ON students.id = grades.student_id
JOIN subjects ON subjects.id = grades.subject_id
JOIN teachers ON subjects.teacher_id = teachers.id
WHERE
    grades.student_id = 1 -- enter desired student id
    AND teachers.id = 1; -- enter desired teacher id
