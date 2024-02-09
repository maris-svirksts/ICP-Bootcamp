### RDBMS (Relational Database Management System)

An RDBMS is a database management system (DBMS) designed for managing data in relational database structures. It allows users to create, read, update, and delete data in a relational database. Examples include MySQL, PostgreSQL, Oracle Database, and Microsoft SQL Server.

### Database

In the context of an RDBMS, a database is a structured set of data held in a computer, including the mechanisms for storing, managing, and retrieving that data. Databases are designed to offer an organized mechanism for storing, managing, and retrieving information.

### Schema

A schema in a database is a collection of logical structures of data, or schema objects. A database schema defines its entities and the relationship among them. It includes tables, views, indexes, etc. A schema represents how the data is organized in the database.

### Table

A table is a collection of related data entries in a database and consists of columns and rows. Tables represent the simplest form of data storage in a relational database; each table is used to store data about a specific object, such as employees, products, or sales.

### SQL (Structured Query Language)

SQL is a standard programming language specifically designed for managing and manipulating relational databases. It is used for querying, updating, and operating on data stored in a relational database.

https://sqliteonline.com/

https://www.metabase.com/learn/sql-questions/sql-best-practices


### Transaction

A transaction in the context of databases is a sequence of one or more SQL operations that are executed as a single unit of work. A transaction has four primary properties, often referred to by the acronym ACID: Atomicity, Consistency, Isolation, and Durability. Transactions ensure data integrity and consistency in case of failure.

### Stored Procedures

Stored procedures are SQL scripts saved in the database that can be reused and executed on demand. They allow users to encapsulate a sequence of operations, including complex business logic, into a single callable routine.

### Common SQL Commands

- **SELECT**: Used to query data from a database. 
  ```sql
  SELECT * FROM table_name;
  ```
  
- **INSERT INTO**: Used to insert data into a table.
  ```sql
  INSERT INTO table_name (column1, column2) VALUES (value1, value2);
  ```
  
- **UPDATE**: Used to modify existing data in a table.
  ```sql
  UPDATE table_name SET column1 = value1 WHERE condition;
  ```
  
- **DELETE**: Used to remove data from a table.
  ```sql
  DELETE FROM table_name WHERE condition;
  ```
  
- **CREATE DATABASE**: Used to create a new database.
  ```sql
  CREATE DATABASE database_name;
  ```
  
- **CREATE TABLE**: Used to create a new table in a database.
  ```sql
  CREATE TABLE table_name (column1 datatype, column2 datatype);
  ```
  
- **ALTER TABLE**: Used to modify an existing table structure, such as adding or dropping a column.
  ```sql
  ALTER TABLE table_name ADD column_name datatype;
  ```
  
- **DROP TABLE**: Used to delete a table and its data.
  ```sql
  DROP TABLE table_name;
  ```
