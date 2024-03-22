import logging
from psycopg2 import DatabaseError

from sql_connect import create_connection


def create_table(connection, sql_expression: str):
    """ create a table from the create_table_sql statement
    :param sql_expression:
    :param connection: Connection object
    :return:
    """
    cur = connection.cursor()
    try:
        cur.execute(sql_expression)
        connection.commit()
    except DatabaseError as e:
        logging.error(e)
        connection.rollback()
    finally:
        cur.close()


if __name__ == '__main__':
    sql_create_users_table = """
    CREATE TABLE IF NOT EXISTS users (
     id SERIAL PRIMARY KEY,
     name VARCHAR(120),
     email VARCHAR(120),
     password VARCHAR(120),
     age smallint CHECK(age > 18 AND age < 75)
    );
    """

    try:
        with create_connection() as conn:
            if conn:
                create_table(conn, sql_create_users_table)
            else:
                print("Error! cannot create the database connection.")
    except RuntimeError as err:
        logging.error(err)
