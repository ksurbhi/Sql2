# Write your MySQL query statement below

# Using Union
-- SELECT id, 'Root' AS Type From Tree WHERE p_id is NULL
-- UNION
-- SELECT id, 'Leaf' AS Type FROM Tree WHERE id NOT IN (
--     SELECT p_id FROM Tree WHERE p_id IS NOT NULL
-- ) AND p_id IS NOT NULL
-- UNION 
-- SELECT id, 'Inner' AS Type FROM Tree WHERE id IN(
--     SELECT p_id FROM Tree WHERE p_id IS NOT NULL
-- ) AND p_id IS NOT NULL;

# Using Flow Control Statement 
SELECT id, (
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (
            SELECT DISTINCT p_id FROM Tree WHERE 
            p_id IS NOT NULL
        ) THEN 'Leaf'
        ELSE 'Inner'
    END
)AS 'Type' FROM Tree;
