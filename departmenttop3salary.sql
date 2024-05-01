# Write your MySQL query statement below
# Inside CTE We can either have 

-- SELECT e1.departmentId,e1.name, e1.salary,(
--     SELECT COUNT(DISTINCT e2.salary) FROM Employee e2
--     WHERE e1.departmentId =e2.departmentId AND e1.salary <= e2.salary
-- )AS 'rank' FROM Employee e1
-- ORDER BY e1.departmentId, e1.salary DESC;


# Or we can have this 
-- SELECT e1.name, e1.salary,
-- DENSE_RANK() OVER
-- (PARTITION BY e1.departmentId ORDER BY e1.salary DESC) AS 'rank'
-- FROM Employee e1

# With Dense_rank()

WITH CTE AS( SELECT e.departmentId, e.name,e.salary,
DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS 'rank'
FROM Employee e)
SELECT d.name AS 'Department', 
CTE.name AS'Employee',
CTE.salary AS'Salary'
FROM CTE
LEFT JOIN Department d
ON CTE.departmentId = d.id WHERE CTE.rank <= 3; 

# Without dense_rank

WITH CTE AS(
    SELECT e1.name, e1.salary, e1.departmentId,
    (
        SELECT COUNT(DISTINCT e2.salary) FROM Employee e2
        WHERE e1.departmentId = e2.departmentId
        AND e1.salary <= e2.salary
    ) AS 'rank' FROM Employee e1
    ORDER BY  e1.salary DESC
)
SELECT d.name AS 'Department',
CTE.name AS 'Employee',
CTE.salary AS 'Salary'
FROM CTE
LEFT JOIN Department d
ON d.id = CTE.departmentId WHERE CTE.rank <= 3;
