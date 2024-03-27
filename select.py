import logging

from psycopg2 import DatabaseError
from sql_connect import create_connection

if __name__ == '__main__':
    sql_expression_01 = """
        SELECT * FROM users WHERE id = %s;
        """
    sql_expression_02 = """
        SELECT id, name, email, age 
        FROM users 
        WHERE age >= 27 AND age <= 60
        ORDER BY age desc
        LIMIT 15;
        """

    try:
        with create_connection() as conn:
            if conn is not None:
                cur = conn.cursor()
                try:
                    cur.execute(sql_expression_01, (7,))
                    print(cur.fetchone())
                    cur.execute(sql_expression_02)
                    result = cur.fetchall()
                    print(result)
                except DatabaseError as e:
                    logging.error(e)
                finally:
                    cur.close()
            else:
                print("Error! cannot create the database connection.")
    except RuntimeError as err:
        logging.error(err)