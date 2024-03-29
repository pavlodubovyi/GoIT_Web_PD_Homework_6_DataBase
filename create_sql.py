import logging
from psycopg2 import DatabaseError

from connect_to_sql import create_connection


def create_table(connection, sql_expression: str):
    """ create a table from the sql_create_table statement
    :param sql_expression:
    :param connection: Connection object
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
    sql_create_table = """
    -- Groups table
    drop table if exists groups CASCADE;
    CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT null
    );

    -- Students table
    drop table if exists students CASCADE;
    CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(150) NOT NULL,
    group_id INTEGER REFERENCES groups(id)
    );

    -- Teachers table
    drop table if exists teachers CASCADE;
    CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(150) NOT NULL
    );

    -- Subjects table
    drop table if exists subjects CASCADE;
    CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(175) NOT NULL,
    teacher_id INTEGER  REFERENCES teachers(id)
    );

    -- Grades table
    drop table if exists grades CASCADE;
    CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_id INTEGER  REFERENCES students(id)
    on delete cascade,
    subject_id INTEGER  REFERENCES subjects(id)
    on delete cascade,
    grade INTEGER CHECK (grade >= 0 AND grade <= 100),
     grade_date DATE NOT NULL
    );
    """

    try:
        with create_connection() as conn:
            if conn:
                create_table(conn, sql_create_table)
            else:
                print("Error! cannot create the database connection.")
    except RuntimeError as err:
        logging.error(err)
