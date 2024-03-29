import logging

from psycopg2 import DatabaseError
from connect_to_sql import create_connection

if __name__ == '__main__':
    sql_expression_from_query = """
        SELECT 
            s.id, 
            s.fullname, 
            ROUND(AVG(g.grade), 2) AS average_grade
        FROM students s
        JOIN grades g ON s.id = g.student_id
        GROUP BY s.id
        ORDER BY average_grade DESC
        LIMIT 5;
        """
    try:
        with create_connection() as conn:
            if conn:
                cur = conn.cursor()
                try:
                    cur.execute(sql_expression_from_query)
                    print(cur.fetchall())
                except DatabaseError as e:
                    logging.error(e)
                finally:
                    cur.close()
            else:
                print("Error! cannot create the database connection.")
    except RuntimeError as err:
        logging.error(err)
