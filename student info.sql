Create database Student_Info;
Use Student_Info;

create table student (Student_id int not null primary key, Sfirst_name varchar (15) not null, Slast_name varchar (15) not null, Class int, age int);
describe student;

insert into student values (1, 'Krishna', 'Gee', 10, 18 );
insert into student values(2, 'Stephen', 'Christ', 10, 17 ),
(3, 'Kailash', 'Kumar', 10, 18 ),
(4, 'Ashish', 'Jain', 10, 16 ),
(5, 'Khusbu', 'Jain', 10, 17 ),
(6, 'Madhan', 'Lal', 10, 16 ),
(7, 'Saurab', 'Kothari', 10, 15 ),
(8, 'Vinesh', 'Roy', 10, 14 ),
(9, 'Rishika', 'R', 10, 15 ),
(10, 'Sara', 'Rayan', 10, 16 ),
(11, 'Rosy', 'Kumar', 10, 16 );

select * from student; 


create table marksheet (Score int not null, Year int, Class int not null, Ranking int, Student_id int);

describe marsheet; 

insert into marksheet value 
( 989, 2014, 10, 1, 1), 
( 454, 2014, 10, 10, 1), 
( 880, 2014, 10, 4, 1), 
( 870, 2014, 10, 5, 1), 
( 720, 2014, 10, 7, 1), 
( 670, 2014, 10, 8, 1), 
( 900, 2014, 10, 3, 1), 
( 540, 2014, 10, 9, 1), 
( 801, 2014, 10, 6, 1), 
( 420, 2014, 10, 11, 1), 
( 970, 2014, 10, 2, 1),
( 720, 2014, 10, 12, 1);

select * from marksheet;

select Sfirst_name, Slast_name from student where age >= 16 and Slast_name = 'Kumar'; 

select * from marksheet where Score between 800 and 1000;


select * from marksheet;

select * from marksheet 
order by score desc;

select * from student where Sfirst_name like 'a%'; 

Drop Database student_info;