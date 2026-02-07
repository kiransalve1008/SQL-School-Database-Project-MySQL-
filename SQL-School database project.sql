create database school;
use school;
CREATE TABLE student (
    student_id VARCHAR(40) PRIMARY KEY,
    student_name VARCHAR(40),
    student_email VARCHAR(40),
    city VARCHAR(40)
); 
CREATE TABLE course (
    course_id VARCHAR(40) PRIMARY KEY,
    course_title VARCHAR(40),
    category VARCHAR(40),
    price DECIMAL
);

CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id VARCHAR(40),
    course_id VARCHAR(40),
    enroll_date DATE,
    FOREIGN KEY (student_id)
        REFERENCES student (student_id),
    FOREIGN KEY (course_id)
        REFERENCES course (course_id)
); 


CREATE TABLE progress (
    progress_id INT PRIMARY KEY,
    enrollment_id INT,
    completion_percent DECIMAL,
    last_accessed_date DATE,
    FOREIGN KEY (enrollment_id)
        REFERENCES enrollment (enrollment_id)
);
 
 INSERT INTO Student (student_id, student_name, student_email, city) VALUES 
(1, 'Alice Johnson', 'alice@example.com', 'Mumbai'), 
(2, 'Bob Smith', 'bob@example.com', 'Pune'), 
(3, 'Charlie Brown', 'charlie@example.com', 'Delhi'), 
(4, 'Diana Prince', 'diana@example.com', 'Bangalore'), 
(5, 'Ethan Lee', 'ethan@example.com', 'Hyderabad');
        
INSERT INTO Course (course_id, course_title, category, price) VALUES 
(101, 'Python for Beginners', 'Programming', 1999.00), 
(102, 'Advanced Excel', 'Data Analysis', 1499.00), 
(103, 'Web Development Bootcamp', 'Web Development', 2499.00), 
(104, 'Machine Learning Basics', 'AI/ML', 2999.00), 
(105, 'Digital Marketing 101', 'Marketing', 1799.00);      
	
    
INSERT INTO Enrollment (enrollment_id, student_id, course_id, 
enroll_date) VALUES (1001, 1, 101, '2025-07-01'), 
(1002, 1, 103, '2025-07-10'), 
(1003, 2, 102, '2025-07-05'), 
(1004, 3, 104, '2025-07-08'), 
(1005, 4, 105, '2025-07-15'), 
(1006, 5, 101, '2025-07-20'), 
(1007, 5, 104, '2025-07-25');    
     
     
  INSERT INTO Progress (progress_id, enrollment_id, completion_percent, 
last_accessed_date) VALUES 
(2001, 1001, 100.00, '2025-08-01'), 
(2002, 1002, 60.00, '2025-08-05'), 
(2003, 1003, 80.00, '2025-08-03'), 
(2004, 1004, 45.00, '2025-08-04'), 
(2005, 1005, 100.00, '2025-08-02'), 
(2006, 1006, 20.00, '2025-08-06'), 
(2007, 1007, 35.00, '2025-08-06');     
     
     
     
 -- Q1: List all students with the course titles they are enrolled in. 
    
    SELECT 
    s.student_name,
    s.student_email,
    c.course_title,
    e.enroll_date
FROM Enrollment e
JOIN Student s 
    ON e.student_id = s.student_id
JOIN Course c 
    ON e.course_id = c.course_id;

-- Q2: Show the names of students from the city 'Mumbai' who are enrolled in any course. 

  SELECT DISTINCT s.student_name
FROM Student s
JOIN Enrollment e 
    ON s.student_id = e.student_id
WHERE s.city = 'Mumbai';
  
  
 -- Q3: Count how many students are enrolled in each course. 
 
 SELECT 
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM course c
LEFT JOIN enrollment e 
    ON c.course_id = e.course_id
GROUP BY c.course_title;

-- Q4: Find all courses with more than 1 student enrolled.
SELECT 
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM course c
JOIN enrollment e 
    ON c.course_id = e.course_id
GROUP BY c.course_title
HAVING COUNT(e.student_id) > 1;

-- Q5: Find the average completion percentage for each student.

SELECT 
    s.student_id,
    s.student_name,
    AVG(p.completion_percent) AS avg_completion
FROM student s
JOIN enrollment e 
    ON s.student_id = e.student_id
JOIN progress p 
    ON e.enrollment_id = p.enrollment_id
GROUP BY s.student_id, s.student_name;

-- Q6: List students who accessed their course progress after '2025-08-04'.
SELECT 
    s.student_id,
    s.student_name,
    p.last_accessed_date
FROM student s
JOIN enrollment e 
    ON s.student_id = e.student_id
JOIN progress p 
    ON e.enrollment_id = p.enrollment_id
WHERE p.last_accessed_date > '2025-08-04';

 -- Q7: Find the total price of all courses each student is enrolled 
 SELECT 
    s.student_id,
    s.student_name,
    SUM(c.price) AS total_course_price
FROM student s
JOIN enrollment e 
    ON s.student_id = e.student_id
JOIN course c 
    ON e.course_id = c.course_id
GROUP BY s.student_id, s.student_name;

 
 
 
 
 
 
 
 
 
  
  