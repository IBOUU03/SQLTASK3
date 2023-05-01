CREATE DATABASE Sch0ol



USE Sch0ol



CREATE TABLE Students(
Id INT PRIMARY KEY IDENTITY,
FullName NVARCHAR(30) NOT NULL,
Point INT CHECK(POINT>0 AND POINT < 100),
GroupId INT FOREIGN KEY REFERENCES Groups(ID)
)


CREATE TABLE Groups(
Id INT PRIMARY KEY IDENTITY,
No NVARCHAR(5) NOT NULL UNIQUE
)


CREATE TABLE Exams(
Id INT PRIMARY KEY IDENTITY,
SubjectName NVARCHAR(30) NOT NULL,
StartDate DATETIME NOT NULL,
EndDate DATETIME NOT NULL
)


CREATE TABLE StudentsExams
(
StudentId INT FOREIGN KEY REFERENCES Students(Id) ,
ExamId INT FOREIGN KEY REFERENCES Exams(Id),
ResultPoint INT NOT NULL
)

SELECT *FROM Exams

INSERT INTO Groups VALUES
('P101'),
('P102'),
('P103'),
('P104'),
('E107'),
('D105'),
('D106')

INSERT INTO Students VALUES
('IBRAHIM 1 QASIMZADA',80,1),
('IBRAHIM 2 QASIMZADA',90,2),
('IBRAHIM 3 QASIMZADA',50,3),
('IBRAHIM 4 QASIMZADA',20,2),
('IBRAHIM 5 QASIMZADA',35,4),
('IBRAHIM 6 QASIMZADA',42,5),
('IBRAHIM 7 QASIMZADA',37,4)

INSERT INTO Exams VALUES
('Riyaziyyat','2023-05-02','2023-05-03'),
('Fiziki','2023-05-06','2023-05-07'),
('Kimya','2023-05-09','2023-05-10'),
('Azerbaycan dili','2023-05-13','2023-05-14')

INSERT INTO Exams VALUES
('COGRAFIYA','2023-04-30','2023-05-01')

INSERT INTO Exams VALUES
('INGILIS','2023-04-29','2023-04-30')


INSERT INTO StudentsExams VALUES
(1,5,100),
(3,7,100),
(5,6,100),
(2,8,100)

SELECT S.*, G.No FROM Students AS S
JOIN Groups AS G ON S.GroupId = G.Id;

SELECT S.*, COUNT(SE.StudentId) AS ExamNum FROM Students AS S
JOIN StudentsExams AS SE ON S.Id = SE.StudentId
GROUP BY S.Id, S.FullName, S.Point, S.GroupId;


SELECT Students.* FROM Students
LEFT JOIN StudentsExams ON Students.Id = StudentsExams.StudentId
WHERE StudentsExams.StudentId IS NULL;


SELECT SE.*, S.FullName, G.No AS GroupNo
FROM StudentsExams AS SE
JOIN Students AS S ON SE.StudentId = S.Id
JOIN Groups AS G ON S.GroupId = G.Id;


