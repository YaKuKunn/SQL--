-- Active: 1776215266878@@127.0.0.1@3306@test2
USE test2;

show DATABASES;

show TABLES;

select * from `部门表`;

select * from `员工表`;

select * from `部门表` left join `员工表` on `部门表`.`ID` = `员工表`.`部门ID`;

-- INNER JOIN和外连接的区别示例

-- 1. INNER JOIN（内连接）- 只返回匹配的记录
SELECT 部门表.部门名称, 员工表.员工姓名
FROM 部门表 
INNER JOIN 员工表 
ON 部门表.ID = 员工表.部门ID;

-- 2. LEFT JOIN（左外连接）- 返回左表所有记录 + 右表匹配记录
SELECT 部门表.部门名称, 员工表.员工姓名
FROM 部门表 
LEFT JOIN 员工表 
ON 部门表.ID = 员工表.部门ID;

-- 3. RIGHT JOIN（右外连接）- 返回右表所有记录 + 左表匹配记录
SELECT 部门表.部门名称, 员工表.员工姓名
FROM 部门表 
RIGHT JOIN 员工表 
ON 部门表.ID = 员工表.部门ID;

-- 4. 使用USING语法的LEFT JOIN示例
SELECT 部门表.部门名称, 员工表.员工姓名
FROM 部门表 
LEFT JOIN 员工表 
USING (部门ID);

-- USING语句示例
-- 假设部门表和员工表都有'部门ID'列
SELECT 部门表.部门名称, 员工表.员工姓名
FROM 部门表 
INNER JOIN 员工表 
USING (部门ID);

-- 多列USING示例
SELECT * FROM 表1 JOIN 表2 USING (列1, 列2);

select * FROM `员工表`
where FIND_IN_SET('2',`ID`) ;

-- ============================================
-- MySQL 常用函数大全（建议收藏）
-- ============================================

-- 1. 聚合函数
SELECT COUNT(*) AS 总人数 FROM `员工表`;
SELECT COUNT(DISTINCT `部门 ID`) AS 部门数量 FROM `员工表`;
SELECT SUM(`工资`) AS 工资总和 FROM `员工表`;
SELECT AVG(`工资`) AS 平均工资 FROM `员工表`;
SELECT MAX(`工资`) AS 最高工资 FROM `员工表`;
SELECT MIN(`工资`) AS 最低工资 FROM `员工表`;

-- 2. 字符串函数
SELECT CONCAT('姓：', `员工姓名`) AS 完整信息 FROM `员工表`;
SELECT LENGTH(`员工姓名`) AS 姓名长度 FROM `员工表`;
SELECT SUBSTRING(`员工姓名`, 1, 2) AS 姓氏 FROM `员工表`;
SELECT UPPER(`员工姓名`) AS 大写姓名 FROM `员工表`;
SELECT REPLACE(`员工姓名`, '张', '王') AS 替换后姓名 FROM `员工表`;

-- 3. 数值函数
SELECT ROUND(`工资`, 2) AS 四舍五入工资 FROM `员工表`;
SELECT FLOOR(`工资`) AS 向下取整 FROM `员工表`;
SELECT CEILING(`工资`) AS 向上取整 FROM `员工表`;
SELECT ABS(-100) AS 绝对值;

-- 4. 日期函数
SELECT NOW() AS 当前时间;
SELECT CURDATE() AS 当前日期;
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS 格式化时间;
SELECT DATE_ADD(NOW(), INTERVAL 1 DAY) AS 明天;
SELECT DATEDIFF('2024-12-31', NOW()) AS 距离年底天数;
SELECT YEAR(NOW()) AS 年份，MONTH(NOW()) AS 月份，DAY(NOW()) AS 日期;

-- 5. 条件函数
SELECT `员工姓名`, `工资`, 
       IF(`工资` > 5000, '高薪', '普通') AS 工资等级 
FROM `员工表`;

SELECT `员工姓名`, `工资`,
       CASE 
         WHEN `工资` > 10000 THEN '高'
         WHEN `工资` > 5000 THEN '中'
         ELSE '低'
       END AS 工资等级
FROM `员工表`;

SELECT IFNULL(`奖金`, 0) AS 实际奖金 FROM `员工表`;














-- 学生表
CREATE TABLE 学生 (
    学号 VARCHAR(20) PRIMARY KEY,
    姓名 VARCHAR(50),
    地址 VARCHAR(100),
    年龄 INT,
    性别 CHAR(2)
);

-- 教师表
CREATE TABLE 教师 (
    职工号 VARCHAR(20) PRIMARY KEY,
    教师姓名 VARCHAR(50),
    职称 VARCHAR(20)
);

-- 课程表
CREATE TABLE 课程 (
    课程号 VARCHAR(20) PRIMARY KEY,
    课程名 VARCHAR(50)
);

-- 选修表（学生 - 课程 多对多关系）
CREATE TABLE 选修 (
    学号 VARCHAR(20),
    课程号 VARCHAR(20),
    成绩 DECIMAL(5,2),
    PRIMARY KEY (学号，课程号),
    FOREIGN KEY (学号) REFERENCES 学生 (学号),
    FOREIGN KEY (课程号) REFERENCES 课程 (课程号)
);

-- 任教表（教师 - 课程 多对多关系）
CREATE TABLE 任教 (
    职工号 VARCHAR(20),
    课程号 VARCHAR(20),
    PRIMARY KEY (职工号，课程号),
    FOREIGN KEY (职工号) REFERENCES 教师 (职工号),
    FOREIGN KEY (课程号) REFERENCES 课程 (课程号)
);

show engines;