-- Application-scoped login and database user.
-- The login lives at the server level; the user lives in the database.
-- Grants are deliberately narrow — SELECT and INSERT only. No UPDATE, no DELETE,
-- and no DDL. An application that needs to read records and add new ones
-- doesn't need anything more than that.

-- NOTE: 'Secret55!' is the lab password from the brief. In production this
-- would be a generated value stored in a secrets manager and rotated.

CREATE LOGIN oakomolafe6433 WITH PASSWORD = 'Secret55!';
GO

USE [oakomolafe6433-LoanDB];
GO

CREATE USER oakomolafe6433 FOR LOGIN oakomolafe6433;
GO

GRANT SELECT, INSERT ON [oakomolafe6433-DeviceLoans] TO oakomolafe6433;
GO
