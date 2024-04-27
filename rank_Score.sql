# Write your MySQL query statement below

-- SELECT score,
-- DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
-- FROM Scores;

# Using COUNT()
SELECT s1.score,(
    SELECT COUNT(DISTINCT s2.score) 
    FROM Scores s2
    WHERE s2.score >= s1.score
) AS 'rank'
FROM Scores s1
ORDER BY s1.score DESC;

# Using Join
-- SELECT s.score, count(DISTINCT t.score) AS 'rank'
-- FROM Scores s
-- JOIN Scores t WHERE t.score >= s.score 
-- GROUP BY s.id, s.score
-- ORDER BY s.score DESC;
