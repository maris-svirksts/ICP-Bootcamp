
# SQL JOIN Types with Examples

To illustrate the various SQL JOIN types with examples, let's define a scenario using three tables: `Students`, `Classes`, and `Enrollment`. We'll create a simplified schema for each table and then show how different JOIN types can be used to query data across these tables.

## Tables Schema

- **Students**
  - `student_id` (Primary Key)
  - `student_name`

- **Classes**
  - `class_id` (Primary Key)
  - `class_name`

- **Enrollment**
  - `enrollment_id` (Primary Key)
  - `student_id` (Foreign Key to Students)
  - `class_id` (Foreign Key to Classes)

```sql
-- Create the database
CREATE DATABASE IF NOT EXISTS SchoolDB;
USE SchoolDB;

-- Create Students table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

-- Create Classes table
CREATE TABLE IF NOT EXISTS Classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL
);

-- Create Enrollment table
CREATE TABLE IF NOT EXISTS Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    class_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);
```

## Sample Data

**Students**

| student_id | student_name |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |

```sql
INSERT INTO Students (student_name) VALUES ('Alice'), ('Bob'), ('Charlie');
```

**Classes**

| class_id | class_name   |
|----------|--------------|
| 1        | Math         |
| 2        | Science      |
| 3        | Literature   |

```sql
INSERT INTO Classes (class_name) VALUES ('Math'), ('Science'), ('Literature');
```

**Enrollment**

| enrollment_id | student_id | class_id |
|---------------|------------|----------|
| 1             | 1          | 1        |
| 2             | 1          | 2        |
| 3             | 2          | 1        |

```sql
INSERT INTO Enrollment (student_id, class_id) VALUES
(1, 1), -- Alice is enrolled in Math
(1, 2), -- Alice is also enrolled in Science
(2, 1); -- Bob is enrolled in Math
```

## INNER JOIN Example

Returns students who are enrolled in at least one class.

```sql
SELECT Students.student_name, Classes.class_name
FROM Enrollment
INNER JOIN Students ON Enrollment.student_id = Students.student_id
INNER JOIN Classes ON Enrollment.class_id = Classes.class_id;
```

**Result:**

| student_name | class_name |
|--------------|------------|
| Alice        | Math       |
| Alice        | Science    |
| Bob          | Math       |

## LEFT JOIN Example

Returns all students and the classes they are enrolled in (if any).

```sql
SELECT Students.student_name, Classes.class_name
FROM Students
LEFT JOIN Enrollment ON Students.student_id = Enrollment.student_id
LEFT JOIN Classes ON Enrollment.class_id = Classes.class_id;
```

**Result:**

| student_name | class_name |
|--------------|------------|
| Alice        | Math       |
| Alice        | Science    |
| Bob          | Math       |
| Charlie      | NULL       |

## RIGHT JOIN Example

Assuming we want to list all classes and any students enrolled in them (not applicable here as our focus is on students, but for illustration).

```sql
SELECT Students.student_name, Classes.class_name
FROM Classes
RIGHT JOIN Enrollment ON Classes.class_id = Enrollment.class_id
RIGHT JOIN Students ON Enrollment.student_id = Students.student_id;
```

This would effectively yield the same result as the INNER JOIN example because all classes have at least one student enrolled.

## FULL JOIN Example

Lists all students and all classes, showing who is enrolled where. Note that MySQL does not support FULL JOIN, but for understanding:

```sql
-- This is a conceptual example; FULL JOIN is not supported in MySQL.
SELECT Students.student_name, Classes.class_name
FROM Students
FULL JOIN Enrollment ON Students.student_id = Enrollment.student_id
FULL JOIN Classes ON Enrollment.class_id = Classes.class_id;
```

**Result (conceptual):**

| student_name | class_name |
|--------------|------------|
| Alice        | Math       |
| Alice        | Science    |
| Bob          | Math       |
| Charlie      | NULL       |
| NULL         | Literature |

## CROSS JOIN Example

Generates a Cartesian product of students and classes, not considering enrollments.

```sql
SELECT Students.student_name, Classes.class_name
FROM Students
CROSS JOIN Classes;
```

**Result (partial):**

| student_name | class_name |
|--------------|------------|
| Alice        | Math       |
| Alice        | Science    |
| Alice        | Literature |
| Bob          | Math       |
| ...          | ...        |

## Cartesian Product Description

A Cartesian product is a mathematical operation that returns a set from the cross-product of two sets. In the context of SQL, a CROSS JOIN generates a Cartesian product by combining each row of one table with each row of another table. This type of join does not require a join condition and can produce a very large number of rows if both tables have many entries.
