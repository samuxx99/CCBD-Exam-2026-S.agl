SELECT
  State,
  COUNT(*) AS total_accidents,
  COUNTIF(Severity >= 3) AS severe_accidents,
  ROUND(100 * SAFE_DIVIDE(COUNTIF(Severity >= 3), COUNT(*)), 2) AS severe_percentage
FROM `accidents_2022.accidents_2022`
GROUP BY State
HAVING total_accidents >= 5000
ORDER BY severe_percentage DESC;