# 1.1 建表
CREATE TABLE IF NOT EXISTS Project (
  `id` INT,
  `name` CHAR(20),
  `dept_id` INT
);
CREATE TABLE IF NOT EXISTS Worker (
  id INT,
  name CHAR(20),
  age INT,
  salary INT,
  dept_id INT
);
CREATE TABLE IF NOT EXISTS WP (
  worker_id INT,
  project_id INT,
  time INT
);
CREATE TABLE IF NOT EXISTS Department (
  id INT,
  name CHAR(20),
  chairman_id INT
);

# 1.2 插入数据
INSERT INTO Department
VALUES
(0,'公关',181860000),
(1,'开发',181860001),
(2,'运营',181860002),
(3,'产品',181860003);

INSERT INTO Worker
VALUES
(181860000,'尚忠霞',34,918368,0),
(181860001,'孙江',30,911016,1),
(181860002,'殷梅',35,391053,2),
(181860003,'骆月',29,862730,3),
(181860004,'史瑶',29,406307,3),
(181860005,'殷芳',26,712941,2),
(181860006,'南宫毅',31,767097,0),
(181860007,'郎都艺',31,147451,0),
(181860008,'史新',39,959588,3),
(181860009,'满雅',36,452839,3);

INSERT INTO Project
VALUES
(0,'Office',2),
(1,'SQL',2),
(2,'VSCode',1),
(3,'Visual Studio',2),
(4,'Edge',0);

INSERT INTO WP
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

# 2 添加约束

## 2.1 添加主键约束
ALTER TABLE Project ADD PRIMARY KEY(id);
ALTER TABLE Worker ADD PRIMARY KEY (id);
ALTER TABLE Department ADD PRIMARY KEY(id);
ALTER TABLE WP ADD PRIMARY KEY (worker_id,project_id);

## 2.2 添加非空约束
ALTER TABLE Project CHANGE COLUMN id id INT NOT NULL;
ALTER TABLE Project CHANGE COLUMN dept_id dept_id INT NOT NULL;
ALTER TABLE Project CHANGE COLUMN name name CHAR(20) NOT NULL;

ALTER TABLE worker CHANGE COLUMN id id INT NOT NULL;
# ALTER TABLE worker CHANGE COLUMN dept_id dept_id INT NOT NULL;
ALTER TABLE worker CHANGE COLUMN name name CHAR(20) NOT NULL;
ALTER TABLE worker CHANGE COLUMN age age INT NOT NULL;
ALTER TABLE worker CHANGE COLUMN salary salary INT NOT NULL;

ALTER TABLE Department CHANGE COLUMN id id INT NOT NULL;
ALTER TABLE Department CHANGE COLUMN chairman_id chairman_id INT NOT NULL;
ALTER TABLE Department CHANGE COLUMN name name CHAR(20) NOT NULL;

ALTER TABLE WP CHANGE COLUMN worker_id worker_id INT NOT NULL;
ALTER TABLE WP CHANGE COLUMN project_id project_id INT NOT NULL;
# ALTER TABLE WP CHANGE COLUMN time time INT NOT NULL;

## 2.3 添加外键约束
ALTER TABLE WP
ADD CONSTRAINT fk_worker_id
FOREIGN KEY (worker_id)
REFERENCES Worker(id)
ON UPDATE CASCADE;

ALTER TABLE WP
ADD CONSTRAINT fk_project_id
FOREIGN KEY (project_id)
REFERENCES Project(id)
ON UPDATE CASCADE;;

ALTER TABLE Worker
ADD CONSTRAINT fk_dept_id_in_worker
FOREIGN KEY (dept_id)
REFERENCES Department(id)
ON UPDATE CASCADE;

ALTER TABLE Project
ADD CONSTRAINT fk_dept_id_in_project
FOREIGN KEY (dept_id)
REFERENCES Department(id)
ON UPDATE CASCADE;

## 2.4 update和delete验证外键约束

### update验证 : 修改表Project中的id，期望WP中的project_id同步修改
SELECT * FROM WP 
WHERE project_id = 0 OR project_id = 100;

UPDATE Project
SET id = 100
WHERE id = 0; 

SELECT * FROM WP 
WHERE project_id = 0 OR project_id = 100;

### delete验证 : 删除Project中的一条记录(已被WP使用)，期望被阻止
DELETE FROM Project
WHERE id = 100 ;

# 3 执行违反约束的操作

## 3.1 违反主键约束
INSERT INTO Worker
VALUES 
(181860001,"孙大海",30,999999,1);

INSERT INTO WP
VALUES
(181860000,2,12);

## 3.2 违反非空约束
INSERT INTO Project
VALUES
(20,NULL,NULL);

## 3.3 违反外键约束
INSERT INTO Project
VALUES
(20,"Github Desktop",100);

DELETE FROM Worker
WHERE id in (
  SELECT DISTINCT worker_id FROM WP 
);


# 4 触发器

## 4.1 创建触发器
DELIMITER $
CREATE TRIGGER work_time_inspector 
BEFORE INSERT ON WP
FOR EACH ROW
BEGIN 
  if NEW.time > 24 then
    SET NEW.time = 24;
  end if;
END$
DELIMITER ;


DELIMITER $
CREATE TRIGGER worker_salary_increaser
AFTER INSERT ON WP
FOR EACH ROW
BEGIN 
  declare is_chairman boolean;
  set is_chairman = (EXISTS (SELECT chairman_id FROM Department d WHERE NEW.worker_id = d.chairman_id));
  if is_chairman = true then
    UPDATE Worker
    SET salary = salary * 1.05 * 1.03
    WHERE NEW.worker_id = id;   
  else 
    UPDATE Worker
    SET salary = salary * 1.05
    WHERE NEW.worker_id = id;
  end if;
END$ 
DELIMITER ;

## 4.2 验证触发器

INSERT INTO Project
VALUES
(5,'new project',1);

SELECT id,salary FROM Worker
WHERE id = 181860000 OR id = 181860007;

INSERT INTO WP 
VALUES
(181860000,5,25),
(181860007,5,30);

### expected: 1、salary of 181860000 should be s * 1.05 * 1.03
###              (181860000,5,25) should be modified to (181860055,5,24)
###           2、salary of 181860007 should be s * 1.05
###              (181860007,5,30) should be modified to (181860007,5,24)

SELECT id,salary FROM Worker
WHERE id = 181860000 OR id = 181860007;

SELECT * FROM WP
WHERE project_id = 5;


# 5 用户权限

## 5.1 创建用户并授权
CREATE USER IF NOT EXISTS 'worker1'@'localhost'
IDENTIFIED BY '123123';

GRANT SELECT ON ex2.Worker TO 'worker1'@'localhost';
GRANT UPDATE(age) ON ex2.Worker TO 'worker1'@'localhost';

## 5.2 用户登录并修改
/*
use ex2

UPDATE Worker
SET age = age + 20;

UPDATE Worker
SET salary = salary + 20000;
*/

## 5.3 删除用户
DROP USER 'worker1'@'localhost';


# 删除表( for test )
/*
DROP TABLE WP;
DROP TABLE Worker;
DROP TABLE Project;
DROP TABLE Department;
*/