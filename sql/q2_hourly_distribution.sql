SELECT
  EXTRACT(HOUR FROM Start_Time) AS hour,
  COUNT(*) AS total_accidents,
  ROUND(AVG(Severity), 2) AS avg_severity
FROM `accidents_2022.accidents_2022`
WHERE Start_Time IS NOT NULL
GROUP BY hour
ORDER BY hour;