--------------------------------------------------------------------------------
-- REF DATA script
-- Misc
--------------------------------------------------------------------------------

----------
-- Init --
--------------------------------------------------------------------------------

-- Change this to the proper DB as appropriate
USE [Kinsail_JNeely]
--USE [Kinsail]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Quickly insert integers 1 - 100,000 (100,000 total rows)
INSERT INTO Integers(Value)
SELECT TOP 100000 ROW_NUMBER() OVER(ORDER BY t1.number) AS Value
  FROM master..spt_values t1 
 CROSS JOIN master..spt_values t2
GO

-- Quickly insert dates for days between 2010 - 2029 (7,305 total rows)
INSERT INTO Dates([Date])
SELECT DATEADD(DAY, [Value], -1) AS [Date]
  FROM Integers
 WHERE [Value] BETWEEN ((2010 - 1900) * 365 + 28) -- Year >= 2010
                   AND ((2030 - 1900) * 365 + 32) -- Year <= 2029
GO
