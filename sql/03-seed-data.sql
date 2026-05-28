-- Five seed records — two device types (Laptop and Tablet) and two loan
-- durations (7 and 14 days) so I can exercise WHERE and ORDER BY against
-- real-looking data.

INSERT INTO [oakomolafe6433-DeviceLoans] (LoanID, StudentName, DeviceType, DeviceTag, LoanDurationDays)
VALUES
    (1, 'Alice Johnson', 'Laptop', 'LT-1001',  7),
    (2, 'Brian Smith',   'Laptop', 'LT-1002', 14),
    (3, 'Carol White',   'Tablet', 'TB-2001',  7),
    (4, 'David Brown',   'Tablet', 'TB-2002', 14),
    (5, 'Eva Martinez',  'Laptop', 'LT-1003',  7);
GO
