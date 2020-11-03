# 1 ʹ��SQL��佨��������
CREATE TABLE IF NOT EXISTS `Course` (
  `id` INT NOT NULL PRIMARY KEY COMMENT '�γ̺�',
  `title` CHAR(20) NOT NULL COMMENT '�γ���',
  `dept_name` CHAR(20) DEFAULT NULL COMMENT 'Ժϵ��',
  `credit` INT COMMENT 'ѧ��'
);
CREATE TABLE IF NOT EXISTS Student (
  id INT NOT NULL PRIMARY KEY COMMENT 'ѧ��',
  name CHAR(20) NOT NULL COMMENT 'ѧ������',
  dept_name CHAR(20) COMMENT 'Ժϵ��',
  major_name CHAR(20) COMMENT 'רҵ��'
);
CREATE TABLE IF NOT EXISTS SC (
  student_id INT NOT NULL COMMENT 'ѧ��',
  course_id INT NOT NULL COMMENT '�γ̺�',
  year INT COMMENT 'ѡ�����',
  grade INT COMMENT '�ɼ�',
  PRIMARY KEY(student_id,course_id)
);
CREATE TABLE IF NOT EXISTS Teacher (
  id INT NOT NULL PRIMARY KEY COMMENT '��ʦ���',
  name CHAR(20) NOT NULL COMMENT '��ʦ����',
  dept_name CHAR(20) COMMENT 'Ժϵ��',
  salary INT COMMENT '����'
);
# 2 ʹ��SQL����޸Ļ�����
ALTER TABLE Student
ADD COLUMN age SMALLINT;
ALTER TABLE Student
CHANGE COLUMN age age INT;

# 3 ʹ��SQL����������
INSERT INTO Student
VALUES
(0,'�׿�̩','���','���',20),
(1,'�����','�˹�����','�˹�����',20),
(2,'·��','���','���',20),
(3,'����','����','��ѧ',20),
(4,'���','CS','�������',20),
(5,'��֦','�˹�����','�˹�����',20),
(6,'����','��Ժ','����ѧ',20),
(7,'������','���̹���','��ҵ����',20),
(8,'�뼧','����','��ѧ',20),
(9,'������','CS','�����Ӧ��',20),
(10,'����֦','��Ժ','����ѧ',20),
(11,'����Ⱥ','�˹�����','�˹�����',20),
(12,'�Ǻ�','��Ժ','����ѧ',20),
(13,'��������','���','���',20),
(14,'����','���̹���','��ҵ����',20),
(15,'����','����','��ѧ',20),
(16,'ׯ��','��Ժ','����ѧ',20),
(17,'��ɯ','��Ժ','����ѧ',20),
(18,'������','CS','�������',20),
(19,'����','���̹���','��ҵ����',20),
(20,'��ɯ','���','���',20),
(21,'��Т��','CS','�������',20),
(22,'��ԣ','���','���',20),
(23,'���һ�','��Ժ','����ѧ',20),
(24,'�ɹ�','����','����',20),
(25,'�Ӳ�','CS','�������',20),
(26,'Ҧ����','���̹���','���ڹ���',20),
(27,'���','����','����',20),
(28,'������','��Ժ','����ѧ',20),
(29,'����','����','����',20);

INSERT INTO Course
VALUES
(0,'���ݿ�','���̹���',4),
(1,'���ݿ�','CS',2),
(2,'���ݿ�','�˹�����',2),
(3,'����ϵͳ','���̹���',3),
(4,'����ϵͳ','CS',4),
(5,'����ϵͳ','�˹�����',3),
(6,'���ֵ�·','���̹���',4),
(7,'���ֵ�·','CS',2),
(8,'���ֵ�·','�˹�����',3),
(9,'�ߴ�','���̹���',5),
(10,'�ߴ�','CS',5),
(11,'�ߴ�','�˹�����',2),
(12,'΢����','���̹���',1),
(13,'΢����','CS',5),
(14,'΢����','�˹�����',4);

INSERT INTO SC
VALUES
(0,6,2020,87),
(0,7,2019,94),
(0,8,2018,90),
(1,7,2020,91),
(1,10,2020,81),
(1,14,2018,90),
(2,8,2020,99),
(2,10,2018,92),
(3,2,2019,79),
(3,6,2017,80),
(3,7,2018,99),
(3,9,2017,74),
(4,9,2018,79),
(5,8,2019,80),
(6,4,2017,82),
(6,6,2019,71),
(6,8,2018,83),
(6,9,2017,84),
(7,10,2018,95),
(7,12,2018,94),
(7,13,2017,90),
(8,10,2017,90),
(9,1,2020,89),
(9,9,2018,75),
(10,4,2020,93),
(10,6,2017,95),
(11,13,2019,86),
(12,0,2019,76),
(12,3,2018,73),
(13,1,2018,88),
(13,2,2019,86),
(13,3,2019,80),
(13,11,2017,72),
(14,2,2019,98),
(14,4,2018,73),
(14,8,2019,88),
(14,11,2020,79),
(16,9,2017,73),
(16,11,2019,90),
(17,3,2018,84),
(17,6,2018,96),
(17,11,2019,91),
(18,1,2019,82),
(18,5,2019,70),
(19,0,2017,86),
(20,0,2018,100),
(20,9,2018,81),
(21,1,2017,70),
(22,1,2019,91),
(22,2,2017,96),
(22,9,2019,100),
(24,1,2018,98),
(24,5,2020,97),
(24,11,2019,74),
(25,6,2018,100),
(27,8,2020,87),
(27,11,2019,93),
(28,4,2017,87),
(28,5,2019,98),
(29,2,2018,96),
(29,14,2018,70);

INSERT INTO Teacher
VALUES
(0,'��ΰ','CS',261522),
(1,'��ΰ��','�˹�����',849588),
(2,'��ʤ��','CS',675038),
(3,'���䷼','�˹�����',894765),
(4,'����','���̹���',146217),
(5,'��˧','���̹���',525091);

# 4 ��ѯ
SELECT DISTINCT Student.name 
FROM Student,SC,Course
WHERE Student.id = SC.student_id AND SC.course_id = Course.id AND Course.dept_name = 'CS';

SELECT name,dept_name
FROM Teacher
WHERE Teacher.name LIKE '��%';

SELECT DISTINCT id,name
FROM Student
WHERE id NOT IN (
  SELECT student_id FROM SC
  WHERE year < 2018
);

SELECT dept_name,max(salary) FROM Teacher
GROUP BY dept_name;

SELECT * FROM Course
WHERE id in (
  SELECT course_id FROM SC
  GROUP BY course_id
  HAVING COUNT(*) = (SELECT COUNT(*) FROM Course)
);

# 5 �޸�����

# ����޸�ǰ������
SELECT * FROM SC 
WHERE course_id IN (
  SELECT id FROM Course
  WHERE title = "���ݿ�"
);
# �޸�
UPDATE SC
SET grade = grade + 2
WHERE course_id IN (
  SELECT id FROM Course
  WHERE title = "���ݿ�"
);
# ����޸ĺ������
SELECT * FROM SC 
WHERE course_id IN (
  SELECT id FROM Course
  WHERE title = "���ݿ�"
);

# 6 ɾ������

# ���ɾ��ǰ������
SELECT * FROM SC 
GROUP BY student_id
HAVING AVG(grade) < 80;
# ɾ��
DELETE FROM SC
WHERE student_id IN (
  SELECT tmp.student_id FROM (
    SELECT student_id FROM SC 
    GROUP BY student_id
    HAVING AVG(grade) < 80
  ) AS tmp 
);
# ���ɾ���������
SELECT * FROM SC 
GROUP BY student_id
HAVING AVG(grade) < 80;

# 7 ��ͼ����
CREATE VIEW myview(id,name,course_id,credit)
AS SELECT SC.student_id,Student.name,SC.course_id,Course.credit
FROM SC,Course,Student
WHERE SC.course_id = Course.id AND Student.id = SC.student_id;
CREATE VIEW TotalCredit(id,name,total_credit)
AS SELECT id,name,SUM(credit)
FROM myview
GROUP BY id;
# �����ͼ
SELECT * FROM TotalCredit;

# 8 ɾ��������
DROP TABLE SC;
DROP TABLE Course;
DROP TABLE Teacher;
DROP TABLE Student;
DROP VIEW myview;
DROP VIEW TotalCredit;

