-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів
-- 1) Run the following script in SQL console for test database OR
-- 2) Copy-Paste the following script in "select.py" after "sql_expression_from_query = """

SELECT
    students.id,
    students.fullname,
    ROUND(AVG(grades.grade), 2) AS average_grade
FROM students
JOIN grades ON students.id = grades.student_id
GROUP BY students.id
ORDER BY average_grade DESC
LIMIT 5;