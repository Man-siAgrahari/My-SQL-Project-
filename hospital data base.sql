create database HMS;
USE HMS;

create table patient ( Patient_email varchar(50) PRIMARY KEY,
password varchar(30) NOT NULL,
name varchar(50) NOT NULL,
address varchar(60) NOT NULL,
gender VARCHAR(20) NOT NULL
); 
select * from patient;
describe patient;
insert into patient (Patient_email, password, name, address, gender) values ('mansiagrahari921@gmail.com', 123, 'Mansi', 'Varanasi', 'Female'); 
insert into patient (Patient_email, password, name, address, gender) values('ayush123@gmail.com', 234, 'Ayush', 'Ahemdabad', 'Male'), ('pc1priyanka2gmail.com', '466', 'Priyanka', 'Bhopal', 'F'),
('ana_mika234@gmail.com', 687, 'Anamika', 'Delhi', 'F'), ('vasubahal@gmail.com', 789, 'Gurgaon', 'Vasu', 'M'), ('riyaraj772@gmail.com', 253, 'Riya', 'Bihar', 'F');

create table Medical_History ( id int primary KEY NOT NULL, date DATE NOT NULL, patient_condition varchar (100) NOT NULL, surgeries Varchar (100) NOT NULL,
medications Varchar (100) not null); 
select * from Medical_History ;

INSERT INTO Medical_History(id, date, patient_condition,surgeries,medications)
VALUES (1,'19-01-14','Pain in abdomen','Heart Surgery','Crocin'),
(2,'19-01-14','Frequent Indigestion','none','none'),
(3,'19-01-14','Body Pain','none','Iodex'), 
(4, ' 20-01-14', ' Pain in back', 'none', 'Paracetamol'),
 (5, '20-01-14', ' Cold and Fever', 'none', 'Dolo'), 
 ( 6,'21-01-14', 'breast cancer', 'Surgery', 'Asjhu');



create table Doctor_detail (email varchar (50) not null Primary key, gender Varchar (10) not null, password int not null, 
name varchar (20) not null); 


insert into Doctor_detail (email, gender, password, name) values ('hathalye7@gmail.com', 'male', '123', 'Hrishikesh Athalye'),
('rishuv23@gmail.com', 'male', '345', 'Rishu Verma'), ('amritasingh34@gmail.com', 'female', '3456', 'Amrita Singh'),
('sunita123@gnail.com', 'female', '222234', 'Sunita Gupta'),
('mansi921@gmail.com', 'female', '2802', 'Mansi Agrahari');

select * from Doctor_detail;

select * from Doctor_detail where password = 123;


CREATE TABLE Appointment(
id int PRIMARY KEY,
date DATE NOT NULL,
starttime TIME NOT NULL,
endtime TIME NOT NULL,
status varchar(15) NOT NULL
);

INSERT INTO Appointment(id,date,starttime,endtime,status)
VALUES
(1, '19-01-15', '09:00', '10:00', 'Done'),
(2, '19-01-16', '10:00', '11:00', 'Done'),
(3, '19-01-18', '14:00', '15:00', 'Done')
;

insert into Appointment (id,date,starttime,endtime,status)
values (4, '0-02-18', '15:00', '17:30', 'Done');

select * from Appointment;

CREATE TABLE PatientsAttendAppointments(
patient varchar(50) NOT NULL,
appt int NOT NULL,
concerns varchar(40) NOT NULL,
symptoms varchar(40) NOT NULL,
PRIMARY KEY (patient, appt)
);

INSERT INTO PatientsAttendAppointments(patient,appt,concerns,symptoms)
VALUES
('ramesh@gmail.com',1, 'none', 'itchy throat'),
('suresh@gmail.com',2, 'infection', 'fever'),
('rakesh@gmail.com',3, 'nausea', 'fever')
;

select * from PatientsAttendAppointments;


CREATE TABLE Schedule(
id int NOT NULL,
starttime TIME NOT NULL,
endtime TIME NOT NULL,
breaktime TIME NOT NULL,
day varchar(20) NOT NULL,
PRIMARY KEY (id, starttime, endtime, breaktime, day)
);

INSERT INTO Schedule(id,starttime,endtime,breaktime,day)
VALUES
(001,'09:00','17:00','12:00','Tuesday'),
(001,'09:00','17:00','12:00','Friday'),
(001,'09:00','17:00','12:00','Saturday'),
(001,'09:00','17:00','12:00','Sunday'),
(002,'09:00','17:00','12:00','Wednesday'),
(002,'09:00','17:00','12:00','Friday')
;
select * from Schedule;
describe Schedule;


create table Patients_Fill_History (patient varchar (20) not null, 
history int not null,
 FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
PRIMARY KEY (history));

CREATE TABLE Diagnose(
appt int NOT NULL,
doctor varchar(50) NOT NULL,
diagnosis varchar(40) NOT NULL,
prescription varchar(50) NOT NULL,
FOREIGN KEY (appt) REFERENCES Appointment (id) ON DELETE CASCADE,
FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
PRIMARY KEY (appt, doctor)
);

INSERT INTO Diagnose(appt,doctor,diagnosis,prescription)
VALUES
(1,'hathalye7@gmail.com', 'Bloating', 'Ibuprofen as needed'),
(2,'hathalye8@gmail.com', 'Muscle soreness', 'Stretch morning/night'),
(3,'hathalye8@gmail.com', 'Vitamin Deficiency', 'Good Diet')
;

CREATE TABLE DocsHave_Schedules(
sched int NOT NULL,
doctor varchar(50) NOT NULL,
PRIMARY KEY (sched, doctor));

INSERT INTO DocsHave_Schedules(sched,doctor)
VALUES
(001,'hathalye7@gmail.com'),
(002,'hathalye8@gmail.com')
;



CREATE TABLE DoctorViews_History(
history int NOT NULL,
doctor varchar(50) NOT NULL,
PRIMARY KEY (history, doctor));

INSERT INTO DoctorViews_History(history,doctor)
VALUES
(1,'hathalye7@gmail.com'),
(2,'hathalye8@gmail.com'),
(3,'hathalye8@gmail.com')
;

