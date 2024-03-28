-- Script to launch directly in DBeaver

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