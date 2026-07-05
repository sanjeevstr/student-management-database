/* ============================================================================
   STUDENT MANAGEMENT SYSTEM - COMPLETE QUERY REFERENCE
   ============================================================================
   Database: Student Management System (12 tables)
   Tables  : Students, Teachers, Departments, Courses, Classes, Enrollments,
             Attendance, Exams, Results, Fees, Parents, Timetable

   This file is organized into sections. Each section covers one type of
   SQL query with multiple real examples based on this schema. Use Ctrl+F
   to jump to a section number.

   INDEX
   -----
   SECTION 1  : Basic SELECT queries
   SECTION 2  : WHERE clause / filtering
   SECTION 3  : ORDER BY and LIMIT
   SECTION 4  : Aggregate functions (COUNT, SUM, AVG, MAX, MIN)
   SECTION 5  : GROUP BY and HAVING
   SECTION 6  : INNER JOIN queries
   SECTION 7  : LEFT JOIN / RIGHT JOIN queries
   SECTION 8  : Multi-table JOIN queries (3+ tables)
   SECTION 9  : Subqueries (nested queries)
   SECTION 10 : Correlated subqueries
   SECTION 11 : EXISTS / NOT EXISTS
   SECTION 12 : String functions
   SECTION 13 : Date & time functions
   SECTION 14 : CASE WHEN (conditional logic)
   SECTION 15 : UNION / UNION ALL
   SECTION 16 : Window functions (RANK, ROW_NUMBER, DENSE_RANK)
   SECTION 17 : Views
   SECTION 18 : INSERT queries
   SECTION 19 : UPDATE queries
   SECTION 20 : DELETE queries
   SECTION 21 : ALTER TABLE queries
   SECTION 22 : Indexes
   SECTION 23 : Business/report style queries (real use-cases)
   ============================================================================
*/


/* ============================================================================
   SECTION 1: BASIC SELECT QUERIES
   ============================================================================ */

-- 1.1 Get all students
SELECT * FROM Student;

-- 1.2 Get all teachers
SELECT * FROM Teachers;

-- 1.3 Get all departments
SELECT * FROM Departments;

-- 1.4 Get all courses
SELECT * FROM Courses;

-- 1.5 Get all classes
SELECT * FROM Classes;

-- 1.6 Get only selected columns of students
SELECT first_name, last_name, email, phone FROM Student;

-- 1.7 Get student full name concept (first + last separately)
SELECT student_id, first_name, last_name FROM Student;

-- 1.8 Get teacher name and subject specialization
SELECT teacher_id, first_name, last_name, subject_specialization FROM Teachers;

-- 1.9 Get course name and credits only
SELECT course_name, credits FROM Courses;

-- 1.10 Get distinct genders present in Students table
SELECT DISTINCT gender FROM Student;

-- 1.11 Get distinct subject specializations of teachers
SELECT DISTINCT subject_specialization FROM Teachers;

-- 1.12 Get distinct academic years used in Classes
SELECT DISTINCT academic_year FROM Classes;

-- 1.13 Get distinct status values used in Fees
SELECT DISTINCT status FROM Fees;

-- 1.14 Get distinct status values used in Attendance
SELECT DISTINCT status FROM Attendance;

-- 1.15 Count total number of columns is not directly possible via SELECT *,
--      but here is how to view column names using INFORMATION_SCHEMA
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Students';


/* ============================================================================
   SECTION 2: WHERE CLAUSE / FILTERING
   ============================================================================ */

-- 2.1 Get all male students
SELECT * FROM Student WHERE gender = 'Male';

-- 2.2 Get all female students
SELECT * FROM Student WHERE gender = 'Female';

-- 2.3 Get students born after year 2006
SELECT * FROM Student WHERE dob > '2006-01-01';

-- 2.4 Get students admitted in a specific month (July 2024)
SELECT * FROM Student
WHERE admission_date BETWEEN '2024-07-01' AND '2024-07-31';

-- 2.5 Get students whose address contains 'Bihar'
SELECT * FROM Student WHERE address LIKE '%Bihar%';

-- 2.6 Get students whose first name starts with 'A'
SELECT * FROM Student WHERE first_name LIKE 'A%';

-- 2.7 Get students whose email ends with '@example.com'
SELECT * FROM Student WHERE email LIKE '%@example.com';

-- 2.8 Get teachers hired before 2020
SELECT * FROM Teachers WHERE hire_date < '2020-01-01';

-- 2.9 Get teachers who specialize in 'Programming' or 'DBMS'
SELECT * FROM Teachers
WHERE subject_specialization IN ('Programming', 'DBMS');

-- 2.10 Get courses with credits greater than 3
SELECT * FROM Courses WHERE credits > 3;

-- 2.11 Get courses with credits between 3 and 4
SELECT * FROM Courses WHERE credits BETWEEN 3 AND 4;

-- 2.12 Get fees that are still unpaid
SELECT * FROM Fees WHERE status = 'Unpaid';

-- 2.13 Get fees that are partially paid
SELECT * FROM Fees WHERE status = 'Partial';

-- 2.14 Get attendance records marked as Absent
SELECT * FROM Attendance WHERE status = 'Absent';

-- 2.15 Get attendance for a specific date
SELECT * FROM Attendance WHERE date = '2024-07-11';

-- 2.16 Get results where marks obtained are less than 40 (failed students)
SELECT * FROM Results WHERE marks_obtained < 40;

-- 2.17 Get results where marks obtained are 90 or above
SELECT * FROM Results WHERE marks_obtained >= 90;

-- 2.18 Get students whose phone number is not null
SELECT * FROM Student WHERE phone IS NOT NULL;

-- 2.19 Get parents whose relation is 'Father'
SELECT * FROM Parents WHERE relation = 'Father';

-- 2.20 Get timetable entries for Monday only
SELECT * FROM Timetable WHERE day_of_week = 'Monday';

-- 2.21 Combine multiple conditions using AND
SELECT * FROM Student
WHERE gender = 'Female' AND admission_date >= '2024-07-01';

-- 2.22 Combine multiple conditions using OR
SELECT * FROM Fees
WHERE status = 'Unpaid' OR status = 'Partial';

-- 2.23 Use NOT to exclude a condition
SELECT * FROM Attendance WHERE status NOT IN ('Present');


/* ============================================================================
   SECTION 3: ORDER BY AND LIMIT
   ============================================================================ */

-- 3.1 List students alphabetically by first name
SELECT * FROM Student ORDER BY first_name ASC;

-- 3.2 List students by admission date, most recent first
SELECT * FROM Student ORDER BY admission_date DESC;

-- 3.3 List teachers by hire date, oldest first
SELECT * FROM Teachers ORDER BY hire_date ASC;

-- 3.4 List courses by credits, highest first
SELECT * FROM Courses ORDER BY credits DESC;

-- 3.5 Get top 5 highest scoring results
SELECT * FROM Results ORDER BY marks_obtained DESC LIMIT 5;

-- 3.6 Get bottom 5 lowest scoring results
SELECT * FROM Results ORDER BY marks_obtained ASC LIMIT 5;

-- 3.7 Get the 10 most recently admitted students
SELECT * FROM Student ORDER BY admission_date DESC LIMIT 10;

-- 3.8 Get the 3 most recent fee payments
SELECT * FROM Fees
WHERE payment_date IS NOT NULL
ORDER BY payment_date DESC LIMIT 3;

-- 3.9 List classes alphabetically by class name
SELECT * FROM Classes ORDER BY class_name ASC;

-- 3.10 Order students by multiple columns (gender, then first_name)
SELECT * FROM Student ORDER BY gender ASC, first_name ASC;


/* ============================================================================
   SECTION 4: AGGREGATE FUNCTIONS (COUNT, SUM, AVG, MAX, MIN)
   ============================================================================ */

-- 4.1 Count total number of students
SELECT COUNT(*) AS total_students FROM Student;

-- 4.2 Count total number of teachers
SELECT COUNT(*) AS total_teachers FROM Teachers;

-- 4.3 Count total number of courses
SELECT COUNT(*) AS total_courses FROM Courses;

-- 4.4 Count total number of classes
SELECT COUNT(*) AS total_classes FROM Classes;

-- 4.5 Count how many students are Male
SELECT COUNT(*) AS male_count FROM Student WHERE gender = 'Male';

-- 4.6 Count how many students are Female
SELECT COUNT(*) AS female_count FROM Student WHERE gender = 'Female';

-- 4.7 Total fee amount collected across all students
SELECT SUM(amount) AS total_fee_amount FROM Fees;

-- 4.8 Total fee amount still unpaid
SELECT SUM(amount) AS total_unpaid FROM Fees WHERE status = 'Unpaid';

-- 4.9 Average marks obtained across all results
SELECT AVG(marks_obtained) AS average_marks FROM Results;

-- 4.10 Highest marks obtained in any exam
SELECT MAX(marks_obtained) AS highest_marks FROM Results;

-- 4.11 Lowest marks obtained in any exam
SELECT MIN(marks_obtained) AS lowest_marks FROM Results;

-- 4.12 Average fee amount per student
SELECT AVG(amount) AS average_fee FROM Fees;

-- 4.13 Total credits offered across all courses
SELECT SUM(credits) AS total_credits FROM Courses;

-- 4.14 Count how many attendance records are marked Present
SELECT COUNT(*) AS present_count FROM Attendance WHERE status = 'Present';

-- 4.15 Count how many attendance records are marked Absent
SELECT COUNT(*) AS absent_count FROM Attendance WHERE status = 'Absent';

-- 4.16 Count distinct students who have at least one enrollment
SELECT COUNT(DISTINCT student_id) AS enrolled_students FROM Enrollments;

-- 4.17 Count distinct courses that have at least one exam
SELECT COUNT(DISTINCT course_id) AS courses_with_exams FROM Exams;

-- 4.18 Total number of exams conducted
SELECT COUNT(*) AS total_exams FROM Exams;

-- 4.19 Average total_marks set across all exams
SELECT AVG(total_marks) AS average_total_marks FROM Exams;

-- 4.20 Count number of parent records marked as 'Mother'
SELECT COUNT(*) AS mother_count FROM Parents WHERE relation = 'Mother';


/* ============================================================================
   SECTION 5: GROUP BY AND HAVING
   ============================================================================ */

-- 5.1 Count students grouped by gender
SELECT gender, COUNT(*) AS total
FROM Student
GROUP BY gender;

-- 5.2 Count fee records grouped by status
SELECT status, COUNT(*) AS total_records
FROM Fees
GROUP BY status;

-- 5.3 Total fee amount grouped by status
SELECT status, SUM(amount) AS total_amount
FROM Fees
GROUP BY status;

-- 5.4 Count attendance records grouped by status
SELECT status, COUNT(*) AS total
FROM Attendance
GROUP BY status;

-- 5.5 Count how many students are enrolled per class
SELECT class_id, COUNT(*) AS student_count
FROM Enrollments
GROUP BY class_id;

-- 5.6 Count how many students are enrolled per course
SELECT course_id, COUNT(*) AS student_count
FROM Enrollments
GROUP BY course_id;

-- 5.7 Average marks grouped by exam
SELECT exam_id, AVG(marks_obtained) AS average_marks
FROM Results
GROUP BY exam_id;

-- 5.8 Count number of teachers grouped by subject specialization
SELECT subject_specialization, COUNT(*) AS teacher_count
FROM Teachers
GROUP BY subject_specialization;

-- 5.9 Count courses grouped by department
SELECT department_id, COUNT(*) AS course_count
FROM Courses
GROUP BY department_id;

-- 5.10 Count timetable entries grouped by day of week
SELECT day_of_week, COUNT(*) AS total_periods
FROM Timetable
GROUP BY day_of_week;

-- 5.11 Classes that have more than 5 enrolled students (HAVING)
SELECT class_id, COUNT(*) AS student_count
FROM Enrollments
GROUP BY class_id
HAVING COUNT(*) > 5;

-- 5.12 Courses that have an average result of less than 50 marks (HAVING)
SELECT exam_id, AVG(marks_obtained) AS average_marks
FROM Results
GROUP BY exam_id
HAVING AVG(marks_obtained) < 50;

-- 5.13 Departments offering more than 2 courses (HAVING)
SELECT department_id, COUNT(*) AS course_count
FROM Courses
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 5.14 Students who have more than 2 fee records (HAVING)
SELECT student_id, COUNT(*) AS fee_records
FROM Fees
GROUP BY student_id
HAVING COUNT(*) > 2;

-- 5.15 Total fee amount per student, only where total exceeds 15000 (HAVING)
SELECT student_id, SUM(amount) AS total_paid
FROM Fees
GROUP BY student_id
HAVING SUM(amount) > 15000;


/* ============================================================================
   SECTION 6: INNER JOIN QUERIES
   ============================================================================ */

-- 6.1 Get student names along with the courses they are enrolled in
SELECT s.first_name, s.last_name, c.course_name
FROM Student s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

-- 6.2 Get student names along with their class name
SELECT s.first_name, s.last_name, cl.class_name
FROM Student s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Classes cl ON e.class_id = cl.class_id;

-- 6.3 Get course name along with department name
SELECT c.course_name, d.department_name
FROM Courses c
INNER JOIN Departments d ON c.department_id = d.department_id;

-- 6.4 Get department name along with head teacher's name
SELECT d.department_name, t.first_name, t.last_name
FROM Departments d
INNER JOIN Teachers t ON d.head_teacher_id = t.teacher_id;

-- 6.5 Get class name along with class teacher's name
SELECT cl.class_name, t.first_name, t.last_name
FROM Classes cl
INNER JOIN Teachers t ON cl.class_teacher_id = t.teacher_id;

-- 6.6 Get student attendance along with student name
SELECT s.first_name, s.last_name, a.date, a.status
FROM Student s
INNER JOIN Attendance a ON s.student_id = a.student_id;

-- 6.7 Get exam name along with course name
SELECT e.exam_name, c.course_name
FROM Exams e
INNER JOIN Courses c ON e.course_id = c.course_id;

-- 6.8 Get student results along with exam name
SELECT s.first_name, s.last_name, ex.exam_name, r.marks_obtained, r.grade
FROM Student s
INNER JOIN Results r ON s.student_id = r.student_id
INNER JOIN Exams ex ON r.exam_id = ex.exam_id;

-- 6.9 Get student fee details along with student name
SELECT s.first_name, s.last_name, f.amount, f.status
FROM Student s
INNER JOIN Fees f ON s.student_id = f.student_id;

-- 6.10 Get parent details along with student name
SELECT s.first_name, s.last_name, p.name AS parent_name, p.relation
FROM Student s
INNER JOIN Parents p ON s.student_id = p.student_id;

-- 6.11 Get timetable with course name and teacher name
SELECT t.day_of_week, t.start_time, t.end_time, c.course_name, tc.first_name, tc.last_name
FROM Timetable t
INNER JOIN Courses c ON t.course_id = c.course_id
INNER JOIN Teachers tc ON t.teacher_id = tc.teacher_id;

-- 6.12 Get timetable with class name
SELECT cl.class_name, t.day_of_week, t.start_time, t.end_time
FROM Timetable t
INNER JOIN Classes cl ON t.class_id = cl.class_id;


/* ============================================================================
   SECTION 7: LEFT JOIN / RIGHT JOIN QUERIES
   ============================================================================ */

-- 7.1 Get all students, including those with no enrollment (LEFT JOIN)
SELECT s.student_id, s.first_name, s.last_name, e.course_id
FROM Student s
LEFT JOIN Enrollments e ON s.student_id = e.student_id;

-- 7.2 Get all students, including those with no fee records
SELECT s.student_id, s.first_name, s.last_name, f.amount, f.status
FROM Student s
LEFT JOIN Fees f ON s.student_id = f.student_id;

-- 7.3 Get all students, including those with no parent record
SELECT s.student_id, s.first_name, s.last_name, p.name AS parent_name
FROM Student s
LEFT JOIN Parents p ON s.student_id = p.student_id;

-- 7.4 Get all students who have NO enrollment at all (using LEFT JOIN + IS NULL)
SELECT s.student_id, s.first_name, s.last_name
FROM Student s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- 7.5 Get all students who have NOT paid any fees yet
SELECT s.student_id, s.first_name, s.last_name
FROM Student s
LEFT JOIN Fees f ON s.student_id = f.student_id
WHERE f.fee_id IS NULL;

-- 7.6 Get all courses, including those with no exams scheduled
SELECT c.course_id, c.course_name, e.exam_name
FROM Courses c
LEFT JOIN Exams e ON c.course_id = e.course_id;

-- 7.7 Get all teachers, including those not assigned as class teacher
SELECT t.teacher_id, t.first_name, t.last_name, cl.class_name
FROM Teachers t
LEFT JOIN Classes cl ON t.teacher_id = cl.class_teacher_id;

-- 7.8 Get all classes, including those with no students enrolled
SELECT cl.class_id, cl.class_name, en.student_id
FROM Classes cl
LEFT JOIN Enrollments en ON cl.class_id = en.class_id;

-- 7.9 Get all departments, including those with no courses
SELECT d.department_id, d.department_name, c.course_name
FROM Departments d
LEFT JOIN Courses c ON d.department_id = c.department_id;

-- 7.10 RIGHT JOIN example: all enrollments with matching students (or NULL if none)
SELECT e.enrollment_id, s.first_name, s.last_name
FROM Enrollments e
RIGHT JOIN Students s ON e.student_id = s.student_id;

-- 7.11 RIGHT JOIN example: all courses shown even if no department assigned
SELECT c.course_name, d.department_name
FROM Departments d
RIGHT JOIN Courses c ON d.department_id = c.department_id;


/* ============================================================================
   SECTION 8: MULTI-TABLE JOIN QUERIES (3+ TABLES)
   ============================================================================ */

-- 8.1 Get student name, course name, class name, and enrollment date together
SELECT s.first_name, s.last_name, c.course_name, cl.class_name, e.enrollment_date
FROM Student s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Classes cl ON e.class_id = cl.class_id;

-- 8.2 Get student name, course name, department name together
SELECT s.first_name, s.last_name, c.course_name, d.department_name
FROM Student s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Departments d ON c.department_id = d.department_id;

-- 8.3 Get student name, exam name, course name, and marks obtained
SELECT s.first_name, s.last_name, ex.exam_name, c.course_name, r.marks_obtained, r.grade
FROM Student s
JOIN Results r ON s.student_id = r.student_id
JOIN Exams ex ON r.exam_id = ex.exam_id
JOIN Courses c ON ex.course_id = c.course_id;

-- 8.4 Get full timetable with class name, course name, and teacher name together
SELECT cl.class_name, c.course_name, t.first_name, t.last_name,
       tt.day_of_week, tt.start_time, tt.end_time
FROM Timetable tt
JOIN Classes cl ON tt.class_id = cl.class_id
JOIN Courses c ON tt.course_id = c.course_id
JOIN Teachers t ON tt.teacher_id = t.teacher_id;

-- 8.5 Get student name, class name, and their attendance status together
SELECT s.first_name, s.last_name, cl.class_name, a.date, a.status
FROM Student s
JOIN Attendance a ON s.student_id = a.student_id
JOIN Classes cl ON a.class_id = cl.class_id;

-- 8.6 Get student name, parent name, relation, and fee status together
SELECT s.first_name, s.last_name, p.name AS parent_name, p.relation, f.status AS fee_status
FROM Student s
JOIN Parents p ON s.student_id = p.student_id
JOIN Fees f ON s.student_id = f.student_id;

-- 8.7 Get department, course, and head teacher together
SELECT d.department_name, c.course_name, t.first_name AS head_teacher_first,
       t.last_name AS head_teacher_last
FROM Departments d
JOIN Courses c ON d.department_id = c.department_id
JOIN Teachers t ON d.head_teacher_id = t.teacher_id;

-- 8.8 Get class name, class teacher name, and all students enrolled in that class
SELECT cl.class_name, t.first_name AS teacher_first, t.last_name AS teacher_last,
       s.first_name AS student_first, s.last_name AS student_last
FROM Classes cl
JOIN Teachers t ON cl.class_teacher_id = t.teacher_id
JOIN Enrollments en ON cl.class_id = en.class_id
JOIN Student s ON en.student_id = s.student_id;

-- 8.9 Complete academic snapshot: student, course, exam, and result together
SELECT s.first_name, s.last_name, c.course_name, ex.exam_name,
       ex.exam_date, r.marks_obtained, r.grade
FROM Student s
JOIN Enrollments en ON s.student_id = en.student_id
JOIN Courses c ON en.course_id = c.course_id
JOIN Exams ex ON c.course_id = ex.course_id
JOIN Results r ON (r.student_id = s.student_id AND r.exam_id = ex.exam_id);


/* ============================================================================
   SECTION 9: SUBQUERIES (NESTED QUERIES)
   ============================================================================ */

-- 9.1 Get students who are enrolled in at least one course (using subquery)
SELECT * FROM Student
WHERE student_id IN (SELECT student_id FROM Enrollments);

-- 9.2 Get students who are NOT enrolled in any course
SELECT * FROM Student
WHERE student_id NOT IN (SELECT student_id FROM Enrollments);

-- 9.3 Get courses that belong to the 'Computer Applications' department
SELECT * FROM Courses
WHERE department_id = (
    SELECT department_id FROM Departments WHERE department_name = 'Computer Applications'
);

-- 9.4 Get students who scored above the overall average marks
SELECT s.first_name, s.last_name, r.marks_obtained
FROM Student s
JOIN Results r ON s.student_id = r.student_id
WHERE r.marks_obtained > (SELECT AVG(marks_obtained) FROM Results);

-- 9.5 Get the student(s) with the highest marks obtained
SELECT s.first_name, s.last_name, r.marks_obtained
FROM Student s
JOIN Results r ON s.student_id = r.student_id
WHERE r.marks_obtained = (SELECT MAX(marks_obtained) FROM Results);

-- 9.6 Get the student(s) with the lowest marks obtained
SELECT s.first_name, s.last_name, r.marks_obtained
FROM Student s
JOIN Results r ON s.student_id = r.student_id
WHERE r.marks_obtained = (SELECT MIN(marks_obtained) FROM Results);

-- 9.7 Get teachers who are heads of at least one department
SELECT * FROM Teachers
WHERE teacher_id IN (SELECT head_teacher_id FROM Departments WHERE head_teacher_id IS NOT NULL);

-- 9.8 Get students who have unpaid fees (using subquery instead of join)
SELECT * FROM Student
WHERE student_id IN (SELECT student_id FROM Fees WHERE status = 'Unpaid');

-- 9.9 Get courses that have never had an exam scheduled
SELECT * FROM Courses
WHERE course_id NOT IN (SELECT course_id FROM Exams WHERE course_id IS NOT NULL);

-- 9.10 Get the class(es) with the maximum number of enrolled students
SELECT class_id, COUNT(*) AS total
FROM Enrollments
GROUP BY class_id
HAVING COUNT(*) = (
    SELECT MAX(cnt) FROM (
        SELECT COUNT(*) AS cnt FROM Enrollments GROUP BY class_id
    ) AS class_counts
);

-- 9.11 Get students whose fee amount is above the average fee amount
SELECT DISTINCT s.first_name, s.last_name, f.amount
FROM Student s
JOIN Fees f ON s.student_id = f.student_id
WHERE f.amount > (SELECT AVG(amount) FROM Fees);


/* ============================================================================
   SECTION 10: CORRELATED SUBQUERIES
   ============================================================================ */

-- 10.1 Get students whose marks are above the average marks of their own exam
SELECT s.first_name, s.last_name, r.exam_id, r.marks_obtained
FROM Student s
JOIN Results r ON s.student_id = r.student_id
WHERE r.marks_obtained > (
    SELECT AVG(r2.marks_obtained)
    FROM Results r2
    WHERE r2.exam_id = r.exam_id
);

-- 10.2 Get the highest fee amount paid by each student (correlated with outer row)
SELECT f.student_id, f.amount
FROM Fees f
WHERE f.amount = (
    SELECT MAX(f2.amount) FROM Fees f2 WHERE f2.student_id = f.student_id
);

-- 10.3 Get students who have more than one attendance record marked 'Absent'
SELECT DISTINCT s.first_name, s.last_name
FROM Student s
WHERE (
    SELECT COUNT(*) FROM Attendance a
    WHERE a.student_id = s.student_id AND a.status = 'Absent'
) > 1;

-- 10.4 Get courses where the number of enrollments is above average enrollment per course
SELECT c.course_name
FROM Courses c
WHERE (
    SELECT COUNT(*) FROM Enrollments e WHERE e.course_id = c.course_id
) > (
    SELECT AVG(cnt) FROM (
        SELECT COUNT(*) AS cnt FROM Enrollments GROUP BY course_id
    ) AS avg_table
);


/* ============================================================================
   SECTION 11: EXISTS / NOT EXISTS
   ============================================================================ */

-- 11.1 Get students who have at least one result recorded (EXISTS)
SELECT s.first_name, s.last_name
FROM Student s
WHERE EXISTS (
    SELECT 1 FROM Results r WHERE r.student_id = s.student_id
);

-- 11.2 Get students who have NOT taken any exam yet (NOT EXISTS)
SELECT s.first_name, s.last_name
FROM Students s
WHERE NOT EXISTS (
    SELECT 1 FROM Results r WHERE r.student_id = s.student_id
);

-- 11.3 Get departments that have at least one course (EXISTS)
SELECT d.department_name
FROM Departments d
WHERE EXISTS (
    SELECT 1 FROM Courses c WHERE c.department_id = d.department_id
);

-- 11.4 Get teachers who are NOT a class teacher of any class (NOT EXISTS)
SELECT t.first_name, t.last_name
FROM Teachers t
WHERE NOT EXISTS (
    SELECT 1 FROM Classes cl WHERE cl.class_teacher_id = t.teacher_id
);

-- 11.5 Get students who have paid at least one fee in full (EXISTS)
SELECT s.first_name, s.last_name
FROM Student s
WHERE EXISTS (
    SELECT 1 FROM Fees f WHERE f.student_id = s.student_id AND f.status = 'Paid'
);


/* ============================================================================
   SECTION 12: STRING FUNCTIONS
   ============================================================================ */

-- 12.1 Combine first and last name into one full name column
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Student;

-- 12.2 Convert student first names to uppercase
SELECT UPPER(first_name) AS name_upper FROM Student;

-- 12.3 Convert teacher last names to lowercase
SELECT LOWER(last_name) AS name_lower FROM Teachers;

-- 12.4 Get the length of each student's email
SELECT first_name, LENGTH(email) AS email_length FROM Student;

-- 12.5 Extract first 3 characters of course_code
SELECT course_name, LEFT(course_code, 3) AS code_prefix FROM Courses;

-- 12.6 Replace 'Bihar' with 'BR' in address (demonstration of REPLACE)
SELECT address, REPLACE(address, 'Bihar', 'BR') AS short_address FROM Student;

-- 12.7 Trim extra spaces from a column (if any exist)
SELECT TRIM(first_name) AS clean_name FROM Student;

-- 12.8 Find students whose last name contains 'ar' anywhere
SELECT * FROM Student WHERE last_name LIKE '%ar%';

-- 12.9 Get initials of student (first letter of first name + first letter of last name)
SELECT CONCAT(LEFT(first_name,1), LEFT(last_name,1)) AS initials FROM Student;

-- 12.10 Search course names containing the word 'Programming'
SELECT * FROM Courses WHERE course_name LIKE '%Programming%';


/* ============================================================================
   SECTION 13: DATE & TIME FUNCTIONS
   ============================================================================ */

-- 13.1 Get student age in years using DOB
SELECT first_name, last_name, dob,
       TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age
FROM Student;

-- 13.2 Get students who are older than 20 years
SELECT first_name, last_name, dob
FROM Student
WHERE TIMESTAMPDIFF(YEAR, dob, CURDATE()) > 20;

-- 13.3 Get year of admission for each student
SELECT first_name, last_name, YEAR(admission_date) AS admission_year FROM Student;

-- 13.4 Get month-wise count of student admissions
SELECT MONTH(admission_date) AS admission_month, COUNT(*) AS total
FROM Student
GROUP BY MONTH(admission_date);

-- 13.5 Get teachers with more than 5 years of service
SELECT first_name, last_name, hire_date,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_of_service
FROM Teachers
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 5;

-- 13.6 Get number of days between fee due date and payment date (delay in payment)
SELECT student_id, due_date, payment_date,
       DATEDIFF(payment_date, due_date) AS days_late
FROM Fees
WHERE payment_date IS NOT NULL;

-- 13.7 Get all fees that are overdue (due date passed but still unpaid)
SELECT * FROM Fees
WHERE status = 'Unpaid' AND due_date < CURDATE();

-- 13.8 Get exams scheduled in the current year
SELECT * FROM Exams WHERE YEAR(exam_date) = YEAR(CURDATE());

-- 13.9 Get exams scheduled in a specific month
SELECT * FROM Exams WHERE MONTH(exam_date) = 7;

-- 13.10 Get attendance records for the current week (last 7 days)
SELECT * FROM Attendance
WHERE date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);

-- 13.11 Get duration (in minutes) of each timetable period
SELECT class_id, course_id,
       TIMESTAMPDIFF(MINUTE, start_time, end_time) AS duration_minutes
FROM Timetable;


/* ============================================================================
   SECTION 14: CASE WHEN (CONDITIONAL LOGIC)
   ============================================================================ */

-- 14.1 Classify students by age group
SELECT first_name, last_name,
       TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age,
       CASE
           WHEN TIMESTAMPDIFF(YEAR, dob, CURDATE()) < 18 THEN 'Minor'
           WHEN TIMESTAMPDIFF(YEAR, dob, CURDATE()) BETWEEN 18 AND 22 THEN 'Young Adult'
           ELSE 'Adult'
       END AS age_group
FROM Student;

-- 14.2 Classify results into pass/fail based on marks
SELECT student_id, exam_id, marks_obtained,
       CASE
           WHEN marks_obtained >= 40 THEN 'Pass'
           ELSE 'Fail'
       END AS result_status
FROM Results;

-- 14.3 Classify fee status into readable labels
SELECT student_id, amount, status,
       CASE status
           WHEN 'Paid' THEN 'Fully Paid'
           WHEN 'Partial' THEN 'Partially Paid'
           WHEN 'Unpaid' THEN 'Payment Pending'
       END AS readable_status
FROM Fees;

-- 14.4 Classify attendance into a simple flag (1/0) for present days
SELECT student_id, date, status,
       CASE WHEN status = 'Present' THEN 1 ELSE 0 END AS is_present
FROM Attendance;

-- 14.5 Grade remark based on letter grade
SELECT student_id, exam_id, grade,
       CASE grade
           WHEN 'A+' THEN 'Outstanding'
           WHEN 'A'  THEN 'Excellent'
           WHEN 'B+' THEN 'Very Good'
           WHEN 'B'  THEN 'Good'
           WHEN 'C'  THEN 'Average'
           WHEN 'D'  THEN 'Below Average'
           ELSE 'Needs Improvement'
       END AS remark
FROM Results;


/* ============================================================================
   SECTION 15: UNION / UNION ALL
   ============================================================================ */

-- 15.1 Combine list of student names and teacher names into one list (labeled)
SELECT first_name, last_name, 'Student' AS role FROM Student
UNION
SELECT first_name, last_name, 'Teacher' AS role FROM Teachers;

-- 15.2 Combine all unpaid and partially-paid fee records
SELECT * FROM Fees WHERE status = 'Unpaid'
UNION ALL
SELECT * FROM Fees WHERE status = 'Partial';

-- 15.3 Combine all phone numbers from Students and Teachers into one list
SELECT phone, 'Student' AS source FROM Student
UNION
SELECT phone, 'Teacher' AS source FROM Teachers;

-- 15.4 Combine all emails from Students, Teachers, and Parents
SELECT email FROM Student
UNION
SELECT email FROM Teachers
UNION
SELECT email FROM Parents;


/* ============================================================================
   SECTION 16: WINDOW FUNCTIONS (RANK, ROW_NUMBER, DENSE_RANK)
   ============================================================================ */

-- 16.1 Rank students by marks obtained within each exam
SELECT student_id, exam_id, marks_obtained,
       RANK() OVER (PARTITION BY exam_id ORDER BY marks_obtained DESC) AS rank_in_exam
FROM Results;

-- 16.2 Dense rank of students by marks (no gaps in ranking)
SELECT student_id, exam_id, marks_obtained,
       DENSE_RANK() OVER (PARTITION BY exam_id ORDER BY marks_obtained DESC) AS dense_rank_in_exam
FROM Results;

-- 16.3 Row number to fetch top scorer per exam (rank = 1)
SELECT * FROM (
    SELECT student_id, exam_id, marks_obtained,
           ROW_NUMBER() OVER (PARTITION BY exam_id ORDER BY marks_obtained DESC) AS rn
    FROM Results
) ranked
WHERE rn = 1;

-- 16.4 Running total of fee amount paid, ordered by payment date
SELECT student_id, amount, payment_date,
       SUM(amount) OVER (ORDER BY payment_date) AS running_total
FROM Fees
WHERE payment_date IS NOT NULL;

-- 16.5 Rank teachers by hire_date (earliest joiner = rank 1)
SELECT teacher_id, first_name, last_name, hire_date,
       RANK() OVER (ORDER BY hire_date ASC) AS seniority_rank
FROM Teachers;


/* ============================================================================
   SECTION 17: VIEWS
   ============================================================================ */

-- 17.1 Create a view showing student enrollment details
CREATE VIEW StudentEnrollmentView AS
SELECT s.student_id, s.first_name, s.last_name, c.course_name, cl.class_name
FROM Student s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Classes cl ON e.class_id = cl.class_id;

-- Use the view like a normal table:
SELECT * FROM StudentEnrollmentView;

-- 17.2 Create a view showing student fee summary
CREATE VIEW StudentFeeSummary AS
SELECT s.student_id, s.first_name, s.last_name,
       SUM(f.amount) AS total_fee,
       SUM(CASE WHEN f.status = 'Paid' THEN f.amount ELSE 0 END) AS paid_amount,
       SUM(CASE WHEN f.status = 'Unpaid' THEN f.amount ELSE 0 END) AS unpaid_amount
FROM Student s
JOIN Fees f ON s.student_id = f.student_id
GROUP BY s.student_id, s.first_name, s.last_name;

SELECT * FROM StudentFeeSummary;

-- 17.3 Create a view showing teacher workload (number of classes + timetable periods)
CREATE VIEW TeacherWorkload AS
SELECT t.teacher_id, t.first_name, t.last_name,
       COUNT(DISTINCT cl.class_id) AS classes_assigned,
       COUNT(tt.timetable_id) AS periods_per_week
FROM Teachers t
LEFT JOIN Classes cl ON t.teacher_id = cl.class_teacher_id
LEFT JOIN Timetable tt ON t.teacher_id = tt.teacher_id
GROUP BY t.teacher_id, t.first_name, t.last_name;

SELECT * FROM TeacherWorkload;

-- 17.4 Drop a view when no longer needed
DROP VIEW IF EXISTS TeacherWorkload;


/* ============================================================================
   SECTION 18: INSERT QUERIES
   ============================================================================ */

-- 18.1 Insert a single new student
INSERT INTO Student (first_name, last_name, gender, dob, email, phone, address, admission_date)
VALUES ('Rahul', 'Kumar', 'Male', '2005-04-10', 'rahul.kumar99@example.com', '9800011122', 'Chapra, Bihar', '2025-01-10');

-- 18.2 Insert a single new teacher
INSERT INTO Teachers (first_name, last_name, email, phone, subject_specialization, hire_date)
VALUES ('Neha', 'Sinha', 'neha.sinha99@college.com', '9800011123', 'Statistics', '2025-01-05');

-- 18.3 Insert a new course under an existing department
INSERT INTO Courses (course_name, course_code, credits, department_id)
VALUES ('Cloud Computing', 'MCA104', 4, 4);

-- 18.4 Insert a new class
INSERT INTO Classes (class_name, academic_year, class_teacher_id)
VALUES ('MCA - 2nd Year', '2024-2025', 25);

-- 18.5 Insert a new enrollment record
INSERT INTO Enrollments (student_id, course_id, class_id, enrollment_date)
VALUES (5, 16, 23, '2025-01-12');

-- 18.6 Insert a new attendance record
INSERT INTO Attendance (student_id, class_id, date, status)
VALUES (5, 23, '2025-01-13', 'Present');

-- 18.7 Insert a new exam record
INSERT INTO Exams (course_id, exam_name, exam_date, total_marks)
VALUES (16, 'Unit Test 1', '2025-02-01', 50);

-- 18.8 Insert a new result record
INSERT INTO Results (student_id, exam_id, marks_obtained, grade)
VALUES (5, 21, 42, 'C');

-- 18.9 Insert a new fee record
INSERT INTO Fees (student_id, amount, due_date, payment_date, status)
VALUES (5, 10000, '2025-02-15', NULL, 'Unpaid');

-- 18.10 Insert using SELECT (copy fee records of unpaid students into another table,
--       assuming an archive table with the same structure already exists)
-- INSERT INTO Fees_Archive (student_id, amount, due_date, payment_date, status)
-- SELECT student_id, amount, due_date, payment_date, status FROM Fees WHERE status = 'Unpaid';


/* ============================================================================
   SECTION 19: UPDATE QUERIES
   ============================================================================ */

-- 19.1 Update a student's phone number
UPDATE Student SET phone = '9800099999' WHERE student_id = 5;

-- 19.2 Update a student's address
UPDATE Student SET address = 'Siwan, Bihar' WHERE student_id = 5;

-- 19.3 Mark a fee record as Paid and set the payment date
UPDATE Fees
SET status = 'Paid', payment_date = CURDATE()
WHERE student_id = 5 AND status = 'Unpaid';

-- 19.4 Update a teacher's subject specialization
UPDATE Teachers SET subject_specialization = 'Cyber Security' WHERE teacher_id = 22;

-- 19.5 Update marks obtained for a specific result
UPDATE Results SET marks_obtained = 78, grade = 'B+' WHERE result_id = 10;

-- 19.6 Bulk-update all Unpaid fees older than 60 days to a reminder status
--     (example uses a hypothetical extra status value 'Overdue')
-- UPDATE Fees SET status = 'Overdue'
-- WHERE status = 'Unpaid' AND DATEDIFF(CURDATE(), due_date) > 60;

-- 19.7 Update class teacher assignment
UPDATE Classes SET class_teacher_id = 18 WHERE class_id = 16;

-- 19.8 Update a course's credit value
UPDATE Courses SET credits = 4 WHERE course_id = 11;

-- 19.9 Update attendance status for a student on a specific date (correcting a mistake)
UPDATE Attendance
SET status = 'Present'
WHERE student_id = 12 AND date = '2024-07-15';

-- 19.10 Update department head teacher
UPDATE Departments SET head_teacher_id = 20 WHERE department_id = 2;


/* ============================================================================
   SECTION 20: DELETE QUERIES
   ============================================================================ */

-- 20.1 Delete a specific student's attendance record for a wrong entry
DELETE FROM Attendance WHERE attendance_id = 45;

-- 20.2 Delete a specific fee record (e.g. duplicate entry)
DELETE FROM Fees WHERE fee_id = 30;

-- 20.3 Delete a specific enrollment (student dropped a course)
DELETE FROM Enrollments WHERE enrollment_id = 15;

-- 20.4 Delete a specific result record (wrongly entered)
DELETE FROM Results WHERE result_id = 8;

-- 20.5 Delete all attendance records older than a certain date (data cleanup)
DELETE FROM Attendance WHERE date < '2023-01-01';

-- 20.6 Delete a student completely along with all dependent records
--     (must delete from child tables first to avoid FK errors)
DELETE FROM Enrollments WHERE student_id = 100;
DELETE FROM Attendance  WHERE student_id = 100;
DELETE FROM Results     WHERE student_id = 100;
DELETE FROM Fees        WHERE student_id = 100;
DELETE FROM Parents     WHERE student_id = 100;
DELETE FROM Student    WHERE student_id = 100;

-- 20.7 Delete a teacher only if not referenced anywhere (must clear dependents first)
-- DELETE FROM Timetable WHERE teacher_id = 30;
-- UPDATE Classes SET class_teacher_id = NULL WHERE class_teacher_id = 30;
-- UPDATE Departments SET head_teacher_id = NULL WHERE head_teacher_id = 30;
-- DELETE FROM Teachers WHERE teacher_id = 30;


/* ============================================================================
   SECTION 21: ALTER TABLE QUERIES
   ============================================================================ */

-- 21.1 Add a new column to Students (e.g. blood_group)
ALTER TABLE Student ADD blood_group VARCHAR(5);

-- 21.2 Modify a column's data type (increase VARCHAR length)
ALTER TABLE Student MODIFY address VARCHAR(200);

-- 21.3 Rename a column (MySQL 8+ syntax)
ALTER TABLE Teachers RENAME COLUMN subject_specialization TO specialization;

-- 21.4 Drop a column that is no longer needed
ALTER TABLE Student DROP COLUMN blood_group;

-- 21.5 Add a NOT NULL constraint to an existing column
ALTER TABLE Student MODIFY email VARCHAR(100) NOT NULL;

-- 21.6 Add a UNIQUE constraint to prevent duplicate emails
ALTER TABLE Student ADD CONSTRAINT unique_email UNIQUE (email);

-- 21.7 Add a default value to a column
ALTER TABLE Fees ALTER COLUMN status SET DEFAULT 'Unpaid';

-- 21.8 Rename a table
ALTER TABLE Timetable RENAME TO ClassSchedule;
-- (rename back if needed)
ALTER TABLE ClassSchedule RENAME TO Timetable;


/* ============================================================================
   SECTION 22: INDEXES
   ============================================================================ */

-- 22.1 Create an index on student email for faster lookup
CREATE INDEX idx_student_email ON Student(email);

-- 22.2 Create an index on foreign key column student_id in Enrollments
CREATE INDEX idx_enrollments_student ON Enrollments(student_id);

-- 22.3 Create an index on foreign key column course_id in Enrollments
CREATE INDEX idx_enrollments_course ON Enrollments(course_id);

-- 22.4 Create a composite index on Attendance (student_id, date)
CREATE INDEX idx_attendance_student_date ON Attendance(student_id, date);

-- 22.5 Create an index on Fees status column (used often in WHERE clauses)
CREATE INDEX idx_fees_status ON Fees(status);

-- 22.6 View existing indexes on a table
SHOW INDEX FROM Student;

-- 22.7 Drop an index that is no longer needed
DROP INDEX idx_fees_status ON Fees;


/* ============================================================================
   SECTION 23: BUSINESS / REPORT STYLE QUERIES (REAL USE-CASES)
   ============================================================================ */

-- 23.1 Full student report card: student name, course, exam, marks, grade
SELECT s.first_name, s.last_name, c.course_name, ex.exam_name, r.marks_obtained, r.grade
FROM Student s
JOIN Results r ON s.student_id = r.student_id
JOIN Exams ex ON r.exam_id = ex.exam_id
JOIN Courses c ON ex.course_id = c.course_id
ORDER BY s.student_id;

-- 23.2 Attendance percentage per student
SELECT student_id,
       SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) AS present_days,
       COUNT(*) AS total_days,
       ROUND(SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attendance_percent
FROM Attendance
GROUP BY student_id;

-- 23.3 List of students with attendance below 75% (defaulters)
SELECT student_id,
       ROUND(SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attendance_percent
FROM Attendance
GROUP BY student_id
HAVING attendance_percent < 75;

-- 23.4 Fee collection summary: total collected vs total pending
SELECT
    SUM(CASE WHEN status = 'Paid' THEN amount ELSE 0 END) AS total_collected,
    SUM(CASE WHEN status IN ('Unpaid','Partial') THEN amount ELSE 0 END) AS total_pending
FROM Fees;

-- 23.5 List of students who still owe fees, with their contact info
SELECT s.first_name, s.last_name, s.phone, s.email, f.amount, f.due_date
FROM Student s
JOIN Fees f ON s.student_id = f.student_id
WHERE f.status = 'Unpaid';

-- 23.6 Class-wise strength report (number of students per class)
SELECT cl.class_name, COUNT(en.student_id) AS total_students
FROM Classes cl
LEFT JOIN Enrollments en ON cl.class_id = en.class_id
GROUP BY cl.class_name
ORDER BY total_students DESC;

-- 23.7 Department-wise course count and total credit load
SELECT d.department_name, COUNT(c.course_id) AS total_courses, SUM(c.credits) AS total_credits
FROM Departments d
LEFT JOIN Courses c ON d.department_id = c.department_id
GROUP BY d.department_name;

-- 23.8 Teacher timetable load (periods per week per teacher)
SELECT t.first_name, t.last_name, COUNT(tt.timetable_id) AS periods_per_week
FROM Teachers t
LEFT JOIN Timetable tt ON t.teacher_id = tt.teacher_id
GROUP BY t.teacher_id, t.first_name, t.last_name
ORDER BY periods_per_week DESC;

-- 23.9 Top 5 scoring students overall (across all exams, average marks)
SELECT s.first_name, s.last_name, AVG(r.marks_obtained) AS average_marks
FROM Student s
JOIN Results r ON s.student_id = r.student_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY average_marks DESC
LIMIT 5;

-- 23.10 Students who failed in at least one exam (marks_obtained < 40)
SELECT DISTINCT s.first_name, s.last_name
FROM Student s
JOIN Results r ON s.student_id = r.student_id
WHERE r.marks_obtained < 40;

-- 23.11 Full contact directory: student, their parent, and phone numbers
SELECT s.first_name AS student_name, s.phone AS student_phone,
       p.name AS parent_name, p.relation, p.phone AS parent_phone
FROM Student s
JOIN Parents p ON s.student_id = p.student_id
ORDER BY s.first_name;

-- 23.12 Course-wise average result and pass percentage
SELECT c.course_name,
       AVG(r.marks_obtained) AS average_marks,
       ROUND(SUM(CASE WHEN r.marks_obtained >= 40 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pass_percentage
FROM Courses c
JOIN Exams ex ON c.course_id = ex.course_id
JOIN Results r ON ex.exam_id = r.exam_id
GROUP BY c.course_name;

-- 23.13 Siblings report: students who share the same parent contact (same phone number)
SELECT p.phone, GROUP_CONCAT(s.first_name SEPARATOR ', ') AS sibling_names
FROM Parents p
JOIN Student s ON p.student_id = s.student_id
GROUP BY p.phone
HAVING COUNT(DISTINCT p.student_id) > 1;

-- 23.14 Weekly timetable view for a specific class, ordered by day and time
SELECT tt.day_of_week, tt.start_time, tt.end_time, c.course_name, t.first_name, t.last_name
FROM Timetable tt
JOIN Courses c ON tt.course_id = c.course_id
JOIN Teachers t ON tt.teacher_id = t.teacher_id
WHERE tt.class_id = 16
ORDER BY FIELD(tt.day_of_week, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'),
         tt.start_time;

-- 23.15 Students who are enrolled but have never marked attendance
SELECT DISTINCT s.first_name, s.last_name
FROM Student s
JOIN Enrollments en ON s.student_id = en.student_id
LEFT JOIN Attendance a ON s.student_id = a.student_id
WHERE a.attendance_id IS NULL;

-- 23.16 Fee defaulters grouped by class
SELECT cl.class_name, COUNT(f.fee_id) AS unpaid_count, SUM(f.amount) AS unpaid_amount
FROM Fees f
JOIN Enrollments en ON f.student_id = en.student_id
JOIN Classes cl ON en.class_id = cl.class_id
WHERE f.status = 'Unpaid'
GROUP BY cl.class_name;

-- 23.17 Teachers who both head a department and teach in the timetable
SELECT DISTINCT t.first_name, t.last_name
FROM Teachers t
WHERE t.teacher_id IN (SELECT head_teacher_id FROM Departments)
  AND t.teacher_id IN (SELECT teacher_id FROM Timetable);

-- 23.18 Grade distribution report (how many students got each grade)
SELECT grade, COUNT(*) AS total_students
FROM Results
GROUP BY grade
ORDER BY FIELD(grade, 'A+','A','B+','B','C','D','F');

-- 23.19 Students enrolled in more than one course
SELECT student_id, COUNT(*) AS course_count
FROM Enrollments
GROUP BY student_id
HAVING COUNT(*) > 1;

-- 23.20 Complete student profile (personal + parent + fee + attendance% in one query)
SELECT s.student_id, s.first_name, s.last_name, s.phone,
       p.name AS parent_name, p.phone AS parent_phone,
       COALESCE(SUM(CASE WHEN f.status = 'Unpaid' THEN f.amount ELSE 0 END), 0) AS fee_due,
       (SELECT ROUND(SUM(CASE WHEN a.status='Present' THEN 1 ELSE 0 END)*100.0/COUNT(*),2)
        FROM Attendance a WHERE a.student_id = s.student_id) AS attendance_percent
FROM Student s
LEFT JOIN Parents p ON s.student_id = p.student_id
LEFT JOIN Fees f ON s.student_id = f.student_id
GROUP BY s.student_id, s.first_name, s.last_name, s.phone, p.name, p.phone;

