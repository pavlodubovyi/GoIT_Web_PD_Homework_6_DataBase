-- Знайти студента із найвищим середнім балом з певного предмета
-- 1) Run the following script in SQL console for test database OR
-- 2) Copy-Paste the following script in "select.py" after "sql_expression_from_query = """

SELECT
    students.id,
    students.fullname,
    ROUND(AVG(grades.grade), 2) AS average_grade
FROM grades
JOIN students ON students.id = grades.student_id
WHERE grades.subject_id = 1 -- it's the number of subject you want to have grades for
GROUP BY students.id
ORDER BY average_grade DESC
LIMIT 1;