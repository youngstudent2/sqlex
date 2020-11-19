# 1.1 ����
CREATE TABLE IF NOT EXISTS Project (
  `id` INT NOT NULL PRIMARY KEY,
  `name` CHAR(20) NOT NULL,
  `dept_id` INT NOT NULL
);
CREATE TABLE IF NOT EXISTS Worker (
  id INT NOT NULL PRIMARY KEY,
  name CHAR(20) NOT NULL,
  age INT,
  salary INT,
  dept_id INT
);
CREATE TABLE IF NOT EXISTS WP (
  Worker_id INT NOT NULL,
  project_id INT NOT NULL,
  time INT,
  PRIMARY KEY(student_id,course_id)
);
CREATE TABLE IF NOT EXISTS Department (
  id INT NOT NULL PRIMARY KEY,
  name CHAR(20) NOT NULL,
  chairmen_id INT NOT NULL,
);

# 1.2 ��������
INSERT INTO Department
VALUES
(0,'����',181860000),
(1,'����',181860001),
(2,'��Ӫ',181860002),
(3,'��Ʒ',181860003);

INSERT INTO Worker
VALUES
(181860000,'����ϼ',34,918368,0),
(181860001,'�ｭ',30,911016,1),
(181860002,'��÷',35,391053,2),
(181860003,'����',29,862730,3),
(181860004,'ʷ��',29,406307,3),
(181860005,'��',26,712941,2),
(181860006,'�Ϲ���',31,767097,0),
(181860007,'�ɶ���',31,147451,0),
(181860008,'ʷ��',39,959588,3),
(181860009,'����',36,452839,3);

INSERT INTO Project
VALUES
(0,'Office',2),
(1,'SQL',2),
(2,'VSCode',1),
(3,'Visual Studio',2),
(4,'Edge',0);

INSERT INTO Department
VALUES
(181860000,0,8),
(181860000,1,10),
(181860000,3,7),
(181860001,0,3),
(181860002,2,10),
(181860003,2,1),
(181860004,0,3),
(181860004,1,7),
(181860004,2,9),
(181860004,3,5),
(181860005,3,9),
(181860005,4,3),
(181860006,0,3),
(181860006,1,9),
(181860006,2,1),
(181860006,3,4),
(181860006,4,5),
(181860007,1,5),
(181860007,2,9),
(181860008,0,7),
(181860008,1,8),
(181860008,4,7),
(181860009,0,7),
(181860009,4,10);

# 2 ����Լ��



# 3 ִ��Υ��Լ���Ĳ���

# 4 ����������

# 5 �������û�����Ȩ

# ɾ����( for test )
/*
DROP TABLE Worker;
DROP TABLE Project;
DROP TABLE WP;
DROP TABLE Department;
*/