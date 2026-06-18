SELECT 
  'Traffic Signal' AS infrastructure_element,
  ROUND(100 * COUNTIF(Traffic_Signal = true) / COUNT(*), 2) AS impact_percentage
FROM `accidents_2022.accidents`

UNION ALL

SELECT 
  'Crossing',
  ROUND(100 * COUNTIF(Crossing = true) / COUNT(*), 2)
FROM `accidents_2022.accidents_2022`

UNION ALL

SELECT 
  'Junction',
  ROUND(100 * COUNTIF(Junction = true) / COUNT(*), 2)
FROM `accidents_2022.accidents_2022`

UNION ALL

SELECT 
  'Stop',
  ROUND(100 * COUNTIF(Stop = true) / COUNT(*), 2)
FROM `accidents_2022.accidents_2022`

UNION ALL

SELECT 
  'Station',
  ROUND(100 * COUNTIF(Station = true) / COUNT(*), 2)
FROM `accidents_2022.accidents_2022`;