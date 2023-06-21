--SQL PRACTICE: INTERVIEW CASES/QUESTIONS


-- Case 1: 

SELECT *
FROM test

--BY USING WINDOW-- 

SELECT subject_name,
		id,
		marks,
		MAX(marks) over (partition by subject_name) AS max_mark,
		COUNT(subject_name) over (partition by subject_name) AS participants
FROM test


-- OR BY USING JOIN (Inner or Left)--

SELECT a.subject_name,
		a.id,
		a.marks,
		b.max_mark,
		b.participants
FROM test a LEFT JOIN
	(SELECT
		subject_name,
		MAX(marks) AS max_mark,
		COUNT(name) AS participants
		FROM test
		GROUP BY subject_name) b 
	ON a.subject_name = b.subject_name
ORDER BY subject_name


-- OR BY USING CTE--

WITH CTE AS 
(
SELECT subject_name,
		MAX(marks) AS max_mark,
		COUNT(name) AS participants
FROM test
GROUP BY subject_name
	)
	SELECT 
		a.subject_name, 
		a.id, 
		a.marks, 
		b.max_mark, 
		b.participants
	FROM test a INNER JOIN CTE b ON (a.subject_name = b.subject_name)
ORDER BY subject_name



