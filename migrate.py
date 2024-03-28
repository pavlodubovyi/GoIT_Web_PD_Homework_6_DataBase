import logging
from psycopg2 import DatabaseError
from sql_connect import create_connection


def migrate(conn, sql_expression: str):
    c = conn.cursor()
    try:
        c.execute(sql_expression)
        conn.commit()
    except DatabaseError as err:
        logging.error(err)
        conn.rollback()
    finally:
        c.close()


if __name__ == '__main__':
    sql_migration = """
        ALTER TABLE users ADD COLUMN phone VARCHAR(30);
        """

    try:
        with create_connection() as conn:
            if conn is not None:
                migrate(conn, sql_migration)
            else:
                print("Error! cannot create the database connection.")
    except RuntimeError as err:
        logging.error(err)