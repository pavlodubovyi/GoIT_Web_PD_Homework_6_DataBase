-- 1) Run the following script in SQL console for test database OR
-- 2) Copy-Paste the following script in "select.py" after "sql_expression_from_query = """

SELECT
    groups.id,
    groups.name,
    ROUND(AVG(grades.grade), 2) AS average_grade
FROM groups
JOIN students ON students.group_id = groups.id
JOIN grades ON students.id = grades.student_id
WHERE grades.subject_id = 1 -- it's the number of subject you want to have grades for
GROUP BY groups.id, groups.name
ORDER BY average_grade DESC;
