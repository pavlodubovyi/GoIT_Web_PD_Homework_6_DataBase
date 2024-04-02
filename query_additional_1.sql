-- Середній бал, який певний викладач ставить певному студентові
-- 1) Run the following script in SQL console for test database OR
-- 2) Copy-Paste the following script in "select.py" after "sql_expression_from_query = """

SELECT
    students.id,
    students.fullname,
    teachers.fullname,
    ROUND(AVG(grades.grade), 2) AS average_grade
FROM 
    grades
JOIN 
    students ON students.id = grades.student_id
JOIN 
    subjects ON subjects.id = grades.subject_id
JOIN 
    teachers ON subjects.teacher_id = teachers.id
WHERE
    grades.student_id = 1
    AND teachers.id = 1
GROUP BY 
    students.id, students.fullname, teachers.fullname
ORDER BY 
    average_grade DESC;

