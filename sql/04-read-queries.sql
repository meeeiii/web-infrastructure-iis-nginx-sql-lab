-- Read patterns I exercised against the loans table.

-- 1. All records
SELECT * FROM [oakomolafe6433-DeviceLoans];

-- 2. Projection — only the two columns I need
SELECT StudentName, DeviceType
FROM   [oakomolafe6433-DeviceLoans];

-- 3. Filter by device type
SELECT *
FROM   [oakomolafe6433-DeviceLoans]
WHERE  DeviceType = 'Laptop';

-- 4. Sort by student name, A to Z
SELECT *
FROM   [oakomolafe6433-DeviceLoans]
ORDER BY StudentName ASC;
