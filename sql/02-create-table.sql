-- Schema for the device-loans table.
-- LoanID is the primary key. Names and tag are NVARCHAR so non-ASCII names
-- (accents, ş, ñ, etc.) survive without re-encoding. LoanDurationDays is INT
-- because a loan length is always whole days in this programme.

USE [oakomolafe6433-LoanDB];
GO

CREATE TABLE [oakomolafe6433-DeviceLoans] (
    LoanID            INT             PRIMARY KEY,
    StudentName       NVARCHAR(50),
    DeviceType        NVARCHAR(30),
    DeviceTag         NVARCHAR(20),
    LoanDurationDays  INT
);
GO
