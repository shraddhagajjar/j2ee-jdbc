# j2ee-jdbc
It contain j2ee and jdbc program

Create a Student Table with these fields: ID, firstName, and lastName. Populate the table with some
data of 3-4 students.
• Create a Course Table with these fields: courseId, subjectId, courseNumber, and numberOfCredits.
Populate the table with some data of 3-4 courses.
• Create an Enrollment Table with these fields: ID, courseId, and grade. Populate the table with some
data consisting of some students, some courses, and some grades (about 10-15 records enough to
test some queries)
• Configure the tables with the Domain constraint, Primary Key constraint, and Foreign Key constraints
as shown in the lecture slides
• Modify the FindGrade application so that it would work with this database and run some test to make
sure that program works with your setup
• Modify the FindGradeUsingPreparedStatement application so that it would work with this database
and run some test to make sure that program works with your setup
• Turn in screen captures of the inputs and outputs from your tests with your homework 

 Convert the FindGradeUsingPreparedStatement program into a JSP called FindGrade.
• Create a form in HTML so that the user can enter the student’s ID and course ID through the Web
browser
• There should be a Submit and a Reset buttons
• The Submit button would send a request to the server and invoke the FindGrade JSP
• The FindGrade JSP would return the student’s first name, last name, subject ID, course number, and
course grade to the user
• When the user submits both the student’s ID and course ID, then there is just 1 result that matches
both (i.e., 1 student, 1 course, and 1 grade)
• When the user submits just the student’s ID and left the course ID blank, then the result should list
ALL courses taken by that student and the grades he/she received
• When the user submits just the course ID and left the student’s ID blank, then the result should list
ALL the students who take the specified course and the grades they received
• Turn in screen captures of the inputs and outputs from your tests with your homework 
