-- Active: 1782628847135@@127.0.0.1@3306@student
DROP DATABASE IF EXISTS Student;

CREATE DATABASE Student;

USE student;

CREATE TABLE student(
    student_id INT PRIMARY KEY AUTO_INCREMENT ,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    gender VARCHAR (10),
    dob DATE,
    email VARCHAR (100) UNIQUE,
    phone BIGINT,
    Address VARCHAR (100),
    admisson_date DATE
);

create TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR (50),
    email VARCHAR (50) UNIQUE,
    subject_specialization VARCHAR(20),
    hire_date DATE
);

CREATE TABLE Classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) NOT NULL,    
    academic_year VARCHAR(20),            
    class_teacher_id INT,
    FOREIGN KEY (class_teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    head_teacher_id INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20),
    credits INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    class_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES student (student_id),
    FOREIGN KEY (course_id) REFERENCES Courses (course_id),
    FOREIGN KEY (class_id) REFERENCES Classes (class_id)

);
SELECT *from courses;
SELECT *from classes;

SELECT class_id, class_name FROM Classes;
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    class_id INT,
    date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Late') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student (student_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

CREATE TABLE Exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    exam_name VARCHAR (20),
    exam_date DATE NOT NULL,
    total_marks INT,
    FOREIGN KEY (course_id) REFERENCES Courses (course_id)
);

CREATE TABLE Results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    exam_id INT,
    marks_obtained INT NOT NULL,
    grade VARCHAR (20),
    FOREIGN KEY (student_id) REFERENCES student (student_id),
    FOREIGN KEY (exam_id) REFERENCES Exams (exam_id)
);

CREATE TABLE Fees (
    fee_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount DECIMAL(10,2) NOT NULL,
    due_date DATE,
    payment_date DATE,
    status ENUM('Paid', 'Unpaid', 'Partial') DEFAULT 'Unpaid',
    FOREIGN KEY (student_id) REFERENCES Student (student_id)
);

CREATE TABLE Parents (
    parent_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    name VARCHAR(100) NOT NULL,
    relation ENUM('Father', 'Mother', 'Guardian') NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES Student (student_id)
);

CREATE TABLE Timetable (
    timetable_id INT PRIMARY KEY AUTO_INCREMENT,
    class_id INT,
    course_id INT,
    teacher_id INT,
    day_of_week ENUM('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);



