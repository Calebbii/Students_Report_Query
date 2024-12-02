-- Create Students Table
CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    grade_level TEXT NOT NULL,
    enrollment_date DATE
);
-- Create Courses Table
CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    mentor_name TEXT
);
-- Create Enrollments Table
CREATE TABLE Enrollments (
    student_id INTEGER,
    course_id INTEGER,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
-- Create Grades Table
CREATE TABLE Grades (
    student_id INTEGER,
    course_id INTEGER,
    grade REAL,
    module INTEGER,
    PRIMARY KEY (student_id, course_id, module),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
-- Insert Sample Data into Students
INSERT INTO Students (student_id, first_name, last_name, grade_level, enrollment_date) VALUES
(1, 'Caleb', 'Bii', 'Phase 3', '2022-01-15'),
(2, 'Bob', 'Nicolai', 'Phase 4', '2021-09-10'),
(3, 'Joy', 'Njoroge', 'Phase 5', '2023-03-05');

-- Insert Sample Data into Courses
INSERT INTO Courses (course_id, course_name, mentor_name) VALUES
(101, 'Math', 'Mr. Caleb'),
(102, 'Science', 'Dr. Albert'),
(103, 'History', 'Mr. Sam');

-- Insert Sample Data into Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 101, '2022-01-20'),
(1, 102, '2022-01-25'),
(2, 103, '2021-09-15'),
(3, 101, '2023-03-10'),
(3, 102, '2023-03-15');
-- Insert Sample Data into Grades
INSERT INTO Grades (student_id, course_id, grade, module) VALUES
(1, 101, 85.5, 1),
(1, 102, 90.0, 1),
(2, 103, 75.0, 2),
(3, 101, 88.0, 3),
(3, 102, 92.0, 3);



--  Running the Code
-- Run the following commands in your terminal to set up and execute the database:

-- Step 1: Create and Populate the Database
-- bash
-- Copy code
-- sqlite3 query.db < setup.sql
-- Step 2: Execute the Query
-- bash
-- Copy code
-- sqlite3 query.db < query.sql