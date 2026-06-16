SELECT
  Severity AS severity,
  COUNT(*) AS total_accidents,
  ROUND(AVG(Distance_mi_), 3) AS avg_queue_length_mi
FROM `accidents_2022.accidents_2022`
GROUP BY severity
ORDER BY severity;