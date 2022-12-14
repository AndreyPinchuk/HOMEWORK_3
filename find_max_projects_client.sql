SELECT NAME, COUNT(CLIENT_ID ) PROJECT_COUNT
FROM CLIENT 
JOIN PROJECT ON CLIENT.ID = PROJECT.CLIENT_ID
GROUP BY NAME
HAVING COUNT(CLIENT_ID ) IN (
   SELECT COUNT(CLIENT_ID )
   FROM CLIENT 
   JOIN PROJECT ON CLIENT.ID = PROJECT.CLIENT_ID
   GROUP BY NAME
   ORDER BY COUNT(CLIENT_ID) DESC
   LIMIT 1
);
