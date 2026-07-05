# student-management-database

A comprehensive **Student Management System Database** built using **MySQL**. This project demonstrates the design and implementation of a relational database for managing students, teachers, courses, departments, attendance, examinations, fees, and academic schedules.

The database follows normalization principles and maintains data integrity through **Primary Keys**, **Foreign Keys**, and well-defined relationships.

---

## 📌 Features

- Student Information Management
- Teacher & Faculty Records
- Department Management
- Course Management
- Class & Section Management
- Student Enrollments
- Attendance Tracking
- Examination Management
- Result Management
- Fee Management
- Parent/Guardian Records
- Timetable Scheduling

---

## 📂 Database Structure

The database contains **12 relational tables**.

| Table | Description |
|--------|-------------|
| Students | Stores student personal and admission details |
| Teachers | Stores teacher/faculty information |
| Departments | Academic departments |
| Courses | Courses offered by departments |
| Classes | Class and section information |
| Enrollments | Links students with courses and classes |
| Attendance | Student attendance records |
| Exams | Examination details |
| Results | Student exam results |
| Fees | Fee payment records |
| Parents | Parent/Guardian information |
| Timetable | Weekly class schedule |

---

## 🗂 Database Relationships

The database uses relational mapping with Foreign Keys.

```
Teachers
    │
    ├── Departments
    ├── Classes
    └── Timetable

Departments
    │
    └── Courses

Students
    ├── Enrollments
    ├── Attendance
    ├── Results
    ├── Fees
    └── Parents

Courses
    ├── Enrollments
    ├── Exams
    └── Timetable

Classes
    ├── Enrollments
    ├── Attendance
    └── Timetable

Exams
    └── Results
```

---

## 🛠 Technologies Used

- MySQL
- SQL
- Relational Database Design
- Entity Relationship (ER) Model

---

## 📁 Project Files

```
Student-Management-System/
│
├── student-schema.sql
├── student-data.sql
├── student-queries.sql
├── Student-Management-System-Schema-Documentation.pdf
├── ER-Diagram.png
└── README.md
```

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/student-management-system.git
```

### 2. Open MySQL

Launch your preferred MySQL client such as:

- MySQL Workbench
- phpMyAdmin
- XAMPP
- Command Line

### 3. Create the database

Execute the schema file:

```sql
SOURCE student-schema.sql;
```

### 4. Insert sample data

```sql
SOURCE student-data.sql;
```

### 5. Execute queries

Run:

```sql
SOURCE student-queries.sql;
```

---

## 📚 Database Modules

### 👨‍🎓 Student Module

- Student registration
- Personal information
- Admission details

### 👨‍🏫 Teacher Module

- Faculty information
- Subject specialization
- Department assignment

### 📖 Course Module

- Course details
- Credits
- Department mapping

### 🏫 Class Module

- Academic year
- Class teacher
- Sections

### 📝 Attendance Module

- Daily attendance
- Present
- Absent
- Late

### 📊 Examination Module

- Exam scheduling
- Marks
- Grades
- Results

### 💰 Fee Module

- Fee amount
- Due date
- Payment status

### 👪 Parent Module

- Parent details
- Guardian information
- Contact information

### 📅 Timetable Module

- Weekly schedule
- Teacher allocation
- Course scheduling

---

## 🔑 Database Concepts Demonstrated

- Primary Keys
- Foreign Keys
- One-to-Many Relationships
- Many-to-Many Relationships
- Data Integrity
- Relational Database Design
- SQL Constraints
- Database Normalization

---

## 📈 Future Improvements

- Stored Procedures
- SQL Triggers
- Views
- Indexing
- User Authentication
- Role-Based Access Control
- Backup & Restore Scripts
- Performance Optimization

---

## 📖 Documentation

Detailed schema documentation is included in:

```
Student-Management-System-Schema-Documentation.pdf
```

It contains:

- Table descriptions
- SQL table definitions
- Foreign key relationships
- Relationship diagram
- Table creation order

---

## 👨‍💻 Author

**Sanjeev**

BCA Student

---

## 📄 License

This project is intended for educational and learning purposes.
