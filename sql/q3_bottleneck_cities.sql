SELECT
  City,
  State,
  COUNT(*) AS total_accidents,
  ROUND(AVG(Distance_mi_), 2) AS avg_queue_length_mi
FROM `accidents_2022.accidents_2022`
GROUP BY City, State
HAVING total_accidents >= 1000
ORDER BY avg_queue_length_mi DESC
LIMIT 20;