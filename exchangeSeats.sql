# Write your MySQL query statement below
# SELECT COUNT (*) FROM Seat; gives total number of rows
# SELECT MOD(id,2) AS 'mod' From Seat ---> Gives us the reminder

# Flow Control Statement tells id is even or odd
-- SELECT id, (
--     CASE
--         WHEN mod(id,2) != 0 THEN 'odd'
--         ELSE 'even'
--     END
-- ) AS 'type of id'
-- FROM Seat
# Solution Using Mod() Function
-- SELECT (
--     CASE 
--         WHEN MOD(id, 2) != 0 And id != cnts THEN id+1
--         WHEN MOD(id, 2) != 0 And id = cnts THEN id 
--         ELSE id-1
--     END       
-- ) AS 'id', student
-- FROM Seat, (
--     SELECT COUNT(*) AS cnts FROM Seat
--     ) AS seat_count
-- ORDER BY id;
# Solution using Left Join because we wnt all the ids 

SELECT s1.id, COALESCE(s2.student, s1.student) AS 'student'
FROM Seat s1
LEFT JOIN Seat s2
ON (s1.id + 1)^1-1 = s2.id;Exchange
