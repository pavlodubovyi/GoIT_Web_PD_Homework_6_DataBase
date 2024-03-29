-- Знайти середній бал на потоці (по всій таблиці оцінок)
-- 1) Run the following script in SQL console for test database OR
-- 2) Copy-Paste the following script in "select.py" after "sql_expression_from_query = """

SELECT
    ROUND(AVG(grades.grade), 2) AS average_grade
FROM grades;