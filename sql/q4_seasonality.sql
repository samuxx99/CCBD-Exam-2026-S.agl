SELECT
  EXTRACT(MONTH FROM Start_Time) AS month,
  COUNT(*) AS total_accidents,
  ROUND(AVG(Visibility_mi_), 2) AS avg_visibility_mi
FROM `accidents_2022.accidents_2022`
GROUP BY month
ORDER BY month;
SELECT
  EXTRACT(MONTH FROM Start_Time) AS month,
  COUNT(*) AS total_accidents,
  ROUND(AVG(Visibility_mi_), 2) AS avg_visibility_mi
FROM `accidents_2022.accidents_2022`
WHERE Start_Time IS NOT NULL
  AND Visibility_mi_ IS NOT NULL
GROUP BY month
ORDER BY month;
