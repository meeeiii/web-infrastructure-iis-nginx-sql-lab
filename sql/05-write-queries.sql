-- Write patterns. In production these would each be wrapped in a transaction
-- with a peer-reviewed sequence number — included here for the basic shape.

-- Update one row by primary key
UPDATE [oakomolafe6433-DeviceLoans]
SET    LoanDurationDays = 21
WHERE  LoanID = 1;

-- Delete one row by primary key
DELETE FROM [oakomolafe6433-DeviceLoans]
WHERE  LoanID = 5;
