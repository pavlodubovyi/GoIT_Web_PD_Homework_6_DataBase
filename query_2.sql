-- 1) Run the following script in SQL console for test database OR
-- 2) Copy-Paste the following script in "select.py" after "sql_expression_from_query = """

WITH StudentGrades AS (
    SELECT
        s.id,
        s.fullname,
        ROUND(AVG(g.grade)) as average_grade
    FROM students s
    JOIN grades g ON s.id = g.student_id
    WHERE g.subject_id = 6 -- Предмет, з якого ви хочете знайти середній бал
    GROUP BY s.id
)
SELECT
    id,
	fullname,
    average_grade
FROM StudentGrades
ORDER BY average_grade DESC
LIMIT 1;