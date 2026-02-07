# SQL-School-Database-Project-MySQL-
This project demonstrates the design and analysis of a School Management Database using MySQL. The database models real-world academic entities such as students, courses, enrollments, and progress tracking. Using SQL joins, aggregation functions, and filtering techniques, meaningful insights are derived from relational data.


SQL School Database Project (MySQL)

Project Description
This project demonstrates the design and analysis of a School Management Database using MySQL.
The database models real-world academic entities such as students, courses, enrolments, and progress tracking.
Using SQL joins, aggregation functions, and filtering techniques, meaningful insights are derived from relational data.
________________________________________
Database Schema
Schema Name: school
Tables Used:
•	student
•	course
•	enrollment
•	progress
Key Relationships:
•	One student → multiple enrollments
•	One course → multiple students
•	Enrollment → linked to progress data
________________________________________
Tools & Technologies
•	Database: MySQL
•	IDE: MySQL Workbench
•	Concepts:
o	Joins (INNER JOIN)
o	Aggregate Functions (SUM, AVG)
o	GROUP BY
o	WHERE & Date Filters
o	Relational Modeling
________________________________________
Steps Followed
1.	Designed relational database schema
2.	Created tables with primary & foreign keys
3.	Inserted sample data
4.	Established relationships between tables
5.	Wrote SQL queries for analysis
6.	Validated results using MySQL Workbench
________________________________________
SQL Queries Performed
•	Total course price per student
•	Average course completion percentage per student
•	Students enrolled in multiple courses
•	Course-wise enrollment analysis
•	Students accessing courses after a specific date
•	Revenue analysis using enrollments
________________________________________
Sample Query
SELECT 
    s.student_id,
    s.student_name,
    SUM(c.price) AS total_course_price
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
GROUP BY s.student_id, s.student_name;
________________________________________
Key Insights
•	Students often enroll in multiple courses, increasing total revenue
•	Average completion percentage helps identify engaged learners
•	Course pricing directly impacts total student spending
•	Enrollment data helps track course popularity
________________________________________
Conclusions
This project showcases strong understanding of:
•	Relational database design
•	SQL joins & aggregations
•	Real-world data analysis using SQL
     
