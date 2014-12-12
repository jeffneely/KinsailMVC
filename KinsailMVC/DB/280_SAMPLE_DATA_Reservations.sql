--------------------------------------------------------------------------------
-- SAMPLE DATA Reservations script
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


-- Site Reservations (Dec 2014 / Jan 2015)
EXEC dbo.ReserveSite 'Tent-01', '12-01-2014 0:00', '12-01-2014 0:00'
EXEC dbo.ReserveSite 'Tent-01', '12-13-2014 0:00', '12-16-2014 0:00'
EXEC dbo.ReserveSite 'Tent-01', '12-29-2014 0:00', '01-04-2015 0:00'
EXEC dbo.ReserveSite 'Tent-01', '01-15-2015 0:00', '01-18-2015 0:00'
EXEC dbo.ReserveSite 'Tent-01', '01-26-2015 0:00', '01-28-2015 0:00'

EXEC dbo.ReserveSite 'Tent-02', '12-06-2014 0:00', '12-07-2014 0:00'
EXEC dbo.ReserveSite 'Tent-02', '01-05-2015 0:00', '01-07-2015 0:00'
EXEC dbo.ReserveSite 'Tent-02', '01-19-2015 0:00', '01-20-2015 0:00'

EXEC dbo.ReserveSite 'Tent-03', '12-15-2014 0:00', '12-21-2014 0:00'
EXEC dbo.ReserveSite 'Tent-03', '01-02-2015 0:00', '01-07-2015 0:00'
EXEC dbo.ReserveSite 'Tent-03', '01-17-2015 0:00', '01-22-2015 0:00'

EXEC dbo.ReserveSite 'Tent-04', '12-03-2014 0:00', '12-03-2014 0:00'
EXEC dbo.ReserveSite 'Tent-04', '12-09-2014 0:00', '12-09-2014 0:00'
EXEC dbo.ReserveSite 'Tent-04', '12-18-2014 0:00', '12-18-2014 0:00'
EXEC dbo.ReserveSite 'Tent-04', '12-23-2014 0:00', '12-23-2014 0:00'
EXEC dbo.ReserveSite 'Tent-04', '12-25-2014 0:00', '12-25-2014 0:00'
EXEC dbo.ReserveSite 'Tent-04', '01-01-2015 0:00', '01-01-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '01-07-2015 0:00', '01-08-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '01-15-2015 0:00', '01-15-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '01-23-2015 0:00', '01-24-2015 0:00'

EXEC dbo.ReserveSite 'Tent-15', '12-06-2014 0:00', '12-07-2014 0:00'
EXEC dbo.ReserveSite 'Tent-15', '12-13-2014 0:00', '12-14-2014 0:00'
EXEC dbo.ReserveSite 'Tent-15', '12-25-2014 0:00', '12-28-2014 0:00'
EXEC dbo.ReserveSite 'Tent-15', '01-09-2015 0:00', '01-11-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '01-17-2015 0:00', '01-18-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '01-26-2015 0:00', '01-27-2015 0:00'

EXEC dbo.ReserveSite 'Tent-16', '12-01-2014 0:00', '12-14-2014 0:00'
EXEC dbo.ReserveSite 'Tent-16', '12-22-2014 0:00', '01-04-2015 0:00'
EXEC dbo.ReserveSite 'Tent-16', '01-12-2015 0:00', '01-25-2015 0:00'

EXEC dbo.ReserveSite 'RV-01', '12-29-2014 0:00', '01-04-2015 0:00'

EXEC dbo.ReserveSite 'RV-02', '12-29-2014 0:00', '01-11-2015 0:00'

EXEC dbo.ReserveSite 'RV-04', '12-15-2014 0:00', '12-21-2014 0:00'
EXEC dbo.ReserveSite 'RV-04', '01-17-2015 0:00', '01-18-2015 0:00'

EXEC dbo.ReserveSite 'RV-06', '12-22-2014 0:00', '01-11-2015 0:00'

EXEC dbo.ReserveSite 'RV-11', '12-08-2014 0:00', '12-10-2014 0:00'
EXEC dbo.ReserveSite 'RV-11', '12-15-2014 0:00', '12-17-2014 0:00'
EXEC dbo.ReserveSite 'RV-11', '12-29-2014 0:00', '12-31-2014 0:00'
EXEC dbo.ReserveSite 'RV-11', '01-12-2015 0:00', '01-14-2015 0:00'
EXEC dbo.ReserveSite 'RV-11', '01-19-2015 0:00', '01-21-2015 0:00'

EXEC dbo.ReserveSite 'Picnic-01', '12-06-2014 0:00', '12-07-2014 0:00'
EXEC dbo.ReserveSite 'Picnic-01', '12-20-2014 0:00', '12-21-2014 0:00'
EXEC dbo.ReserveSite 'Picnic-01', '01-03-2015 0:00', '01-04-2015 0:00'
EXEC dbo.ReserveSite 'Picnic-01', '01-12-2015 0:00', '01-18-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-08', '12-03-2014 0:00', '12-05-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '12-12-2014 0:00', '12-13-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '12-22-2014 0:00', '12-22-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '12-26-2014 0:00', '01-01-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '01-09-2015 0:00', '01-10-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '01-16-2015 0:00', '01-18-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '01-22-2015 0:00', '01-22-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '01-27-2015 0:00', '01-31-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-11', '12-05-2014 0:00', '12-09-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-11', '12-26-2014 0:00', '12-29-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-11', '01-16-2015 0:00', '01-20-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-14', '12-10-2014 0:00', '12-11-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-14', '12-24-2014 0:00', '12-27-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-14', '01-19-2015 0:00', '01-21-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-16', '12-02-2014 0:00', '12-02-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-04-2014 0:00', '12-04-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-06-2014 0:00', '12-06-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-08-2014 0:00', '12-08-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-10-2014 0:00', '12-10-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-12-2014 0:00', '12-12-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-14-2014 0:00', '12-14-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-16-2014 0:00', '12-16-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-18-2014 0:00', '12-18-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-20-2014 0:00', '12-20-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-22-2014 0:00', '12-22-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-24-2014 0:00', '12-24-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-26-2014 0:00', '12-26-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-28-2014 0:00', '12-28-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '12-30-2014 0:00', '12-30-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-01-2015 0:00', '01-01-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-03-2015 0:00', '01-03-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-05-2015 0:00', '01-05-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-07-2015 0:00', '01-07-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-09-2015 0:00', '01-09-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-11-2015 0:00', '01-11-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-13-2015 0:00', '01-13-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-15-2015 0:00', '01-15-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-17-2015 0:00', '01-17-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-19-2015 0:00', '01-19-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-21-2015 0:00', '01-21-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-23-2015 0:00', '01-23-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-25-2015 0:00', '01-25-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-27-2015 0:00', '01-27-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-29-2015 0:00', '01-29-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '01-31-2015 0:00', '01-31-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-19', '12-01-2014 0:00', '12-07-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '12-10-2014 0:00', '12-21-2014 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '12-24-2014 0:00', '01-04-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '01-07-2015 0:00', '01-18-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '01-21-2015 0:00', '01-31-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P1-03', '12-20-2014 0:00', '12-21-2014 0:00'
EXEC dbo.ReserveSite 'Dock-P1-03', '01-05-2015 0:00', '01-06-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P1-03', '01-08-2015 0:00', '01-08-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P1-03', '01-11-2015 0:00', '01-11-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P1-05', '12-25-2014 0:00', '12-27-2014 0:00'

EXEC dbo.ReserveSite 'Dock-P2-02', '12-08-2014 0:00', '12-08-2014 0:00'
EXEC dbo.ReserveSite 'Dock-P2-02', '12-31-2014 0:00', '12-31-2014 0:00'
EXEC dbo.ReserveSite 'Dock-P2-02', '01-19-2015 0:00', '01-19-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-02', '01-23-2015 0:00', '01-23-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P2-04', '12-13-2014 0:00', '12-14-2014 0:00'
EXEC dbo.ReserveSite 'Dock-P2-04', '01-06-2015 0:00', '01-07-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-04', '01-22-2015 0:00', '01-26-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P3-01', '12-03-2014 0:00', '12-03-2014 0:00'
EXEC dbo.ReserveSite 'Dock-P3-01', '12-22-2014 0:00', '12-22-2014 0:00'
EXEC dbo.ReserveSite 'Dock-P3-01', '01-10-2015 0:00', '01-10-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P3-01', '01-26-2015 0:00', '01-26-2015 0:00'

EXEC dbo.ReserveSite 'Trailer-02', '12-01-2014 0:00', '12-07-2014 0:00'
EXEC dbo.ReserveSite 'Trailer-02', '12-22-2014 0:00', '12-28-2014 0:00'
EXEC dbo.ReserveSite 'Trailer-02', '01-19-2015 0:00', '01-21-2015 0:00'

EXEC dbo.ReserveSite 'Group-03', '12-13-2014 0:00', '12-16-2014 0:00'
EXEC dbo.ReserveSite 'Group-03', '01-03-2015 0:00', '01-05-2015 0:00'
EXEC dbo.ReserveSite 'Group-03', '01-19-2015 0:00', '01-25-2015 0:00'


-- Site Reservations (Feb/Mar 2015)
EXEC dbo.ReserveSite 'Tent-01', '02-02-2015 0:00', '02-02-2015 0:00'
EXEC dbo.ReserveSite 'Tent-01', '02-14-2015 0:00', '02-17-2015 0:00'
EXEC dbo.ReserveSite 'Tent-01', '03-02-2015 0:00', '03-08-2015 0:00'
EXEC dbo.ReserveSite 'Tent-01', '03-19-2015 0:00', '03-22-2015 0:00'
EXEC dbo.ReserveSite 'Tent-01', '03-30-2015 0:00', '03-31-2015 0:00'

EXEC dbo.ReserveSite 'Tent-02', '02-07-2015 0:00', '02-08-2015 0:00'
EXEC dbo.ReserveSite 'Tent-02', '03-09-2015 0:00', '03-11-2015 0:00'
EXEC dbo.ReserveSite 'Tent-02', '03-23-2015 0:00', '03-24-2015 0:00'

EXEC dbo.ReserveSite 'Tent-03', '02-16-2015 0:00', '02-22-2015 0:00'
EXEC dbo.ReserveSite 'Tent-03', '03-06-2015 0:00', '03-11-2015 0:00'
EXEC dbo.ReserveSite 'Tent-03', '03-21-2015 0:00', '03-26-2015 0:00'

EXEC dbo.ReserveSite 'Tent-04', '02-04-2015 0:00', '02-04-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '02-10-2015 0:00', '02-10-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '02-19-2015 0:00', '02-19-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '02-24-2015 0:00', '02-24-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '02-26-2015 0:00', '02-26-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '03-05-2015 0:00', '03-05-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '03-11-2015 0:00', '03-12-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '03-19-2015 0:00', '03-19-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '03-27-2015 0:00', '03-28-2015 0:00'

EXEC dbo.ReserveSite 'Tent-15', '02-07-2015 0:00', '02-08-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '02-14-2015 0:00', '02-15-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '02-26-2015 0:00', '03-01-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '03-13-2015 0:00', '03-15-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '03-21-2015 0:00', '03-22-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '03-30-2015 0:00', '03-31-2015 0:00'

EXEC dbo.ReserveSite 'Tent-16', '02-02-2015 0:00', '02-15-2015 0:00'
EXEC dbo.ReserveSite 'Tent-16', '02-23-2015 0:00', '03-08-2015 0:00'
EXEC dbo.ReserveSite 'Tent-16', '03-16-2015 0:00', '03-29-2015 0:00'

EXEC dbo.ReserveSite 'RV-01', '03-02-2015 0:00', '03-08-2015 0:00'

EXEC dbo.ReserveSite 'RV-02', '03-02-2015 0:00', '03-15-2015 0:00'

EXEC dbo.ReserveSite 'RV-04', '02-16-2015 0:00', '02-22-2015 0:00'
EXEC dbo.ReserveSite 'RV-04', '03-21-2015 0:00', '03-22-2015 0:00'

EXEC dbo.ReserveSite 'RV-06', '02-23-2015 0:00', '03-15-2015 0:00'

EXEC dbo.ReserveSite 'RV-11', '02-09-2015 0:00', '02-11-2015 0:00'
EXEC dbo.ReserveSite 'RV-11', '02-16-2015 0:00', '02-18-2015 0:00'
EXEC dbo.ReserveSite 'RV-11', '03-02-2015 0:00', '03-04-2015 0:00'
EXEC dbo.ReserveSite 'RV-11', '03-16-2015 0:00', '03-18-2015 0:00'
EXEC dbo.ReserveSite 'RV-11', '03-23-2015 0:00', '03-25-2015 0:00'

EXEC dbo.ReserveSite 'Picnic-01', '02-07-2015 0:00', '02-08-2015 0:00'
EXEC dbo.ReserveSite 'Picnic-01', '02-21-2015 0:00', '02-22-2015 0:00'
EXEC dbo.ReserveSite 'Picnic-01', '03-07-2015 0:00', '03-08-2015 0:00'
EXEC dbo.ReserveSite 'Picnic-01', '03-16-2015 0:00', '03-22-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-08', '02-04-2015 0:00', '02-06-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '02-13-2015 0:00', '02-14-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '02-23-2015 0:00', '02-23-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '02-27-2015 0:00', '03-05-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '03-13-2015 0:00', '03-14-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '03-20-2015 0:00', '03-22-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '03-26-2015 0:00', '03-26-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '03-31-2015 0:00', '03-31-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-11', '02-06-2015 0:00', '02-10-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-11', '02-27-2015 0:00', '03-02-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-11', '03-20-2015 0:00', '03-24-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-14', '02-11-2015 0:00', '02-12-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-14', '02-25-2015 0:00', '02-28-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-14', '03-23-2015 0:00', '03-25-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-16', '02-03-2015 0:00', '02-03-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-05-2015 0:00', '02-05-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-07-2015 0:00', '02-07-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-09-2015 0:00', '02-09-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-11-2015 0:00', '02-11-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-13-2015 0:00', '02-13-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-15-2015 0:00', '02-15-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-17-2015 0:00', '02-17-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-19-2015 0:00', '02-19-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-21-2015 0:00', '02-21-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-23-2015 0:00', '02-23-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-25-2015 0:00', '02-25-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '02-27-2015 0:00', '02-27-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-01-2015 0:00', '03-01-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-03-2015 0:00', '03-03-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-05-2015 0:00', '03-05-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-07-2015 0:00', '03-07-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-09-2015 0:00', '03-09-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-11-2015 0:00', '03-11-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-13-2015 0:00', '03-13-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-15-2015 0:00', '03-15-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-17-2015 0:00', '03-17-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-19-2015 0:00', '03-19-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-21-2015 0:00', '03-21-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-23-2015 0:00', '03-23-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-25-2015 0:00', '03-25-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-27-2015 0:00', '03-27-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-29-2015 0:00', '03-29-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '03-31-2015 0:00', '03-31-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-19', '02-02-2015 0:00', '02-08-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '02-11-2015 0:00', '02-22-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '02-25-2015 0:00', '03-08-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '03-11-2015 0:00', '03-22-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '03-25-2015 0:00', '03-31-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P1-03', '02-21-2015 0:00', '02-22-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P1-03', '03-09-2015 0:00', '03-10-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P1-03', '03-12-2015 0:00', '03-12-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P1-03', '03-15-2015 0:00', '03-15-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P1-05', '02-26-2015 0:00', '02-28-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P2-02', '02-09-2015 0:00', '02-09-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-02', '03-04-2015 0:00', '03-04-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-02', '03-23-2015 0:00', '03-23-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-02', '03-27-2015 0:00', '03-27-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P2-04', '02-14-2015 0:00', '02-15-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-04', '03-10-2015 0:00', '03-11-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-04', '03-26-2015 0:00', '03-30-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P3-01', '02-04-2015 0:00', '02-04-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P3-01', '02-23-2015 0:00', '02-23-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P3-01', '03-14-2015 0:00', '03-14-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P3-01', '03-30-2015 0:00', '03-30-2015 0:00'

EXEC dbo.ReserveSite 'Trailer-02', '02-02-2015 0:00', '02-08-2015 0:00'
EXEC dbo.ReserveSite 'Trailer-02', '02-23-2015 0:00', '03-01-2015 0:00'
EXEC dbo.ReserveSite 'Trailer-02', '03-23-2015 0:00', '03-25-2015 0:00'

EXEC dbo.ReserveSite 'Group-03', '02-14-2015 0:00', '02-17-2015 0:00'
EXEC dbo.ReserveSite 'Group-03', '03-07-2015 0:00', '03-09-2015 0:00'
EXEC dbo.ReserveSite 'Group-03', '03-23-2015 0:00', '03-29-2015 0:00'


-- Site Reservations (Apr/May 2015)
EXEC dbo.ReserveSite 'Tent-01', '04-01-2015 0:00', '04-01-2015 0:00'
EXEC dbo.ReserveSite 'Tent-01', '04-13-2015 0:00', '04-16-2015 0:00'
EXEC dbo.ReserveSite 'Tent-01', '04-29-2015 0:00', '05-05-2015 0:00'
EXEC dbo.ReserveSite 'Tent-01', '05-16-2015 0:00', '05-19-2015 0:00'
EXEC dbo.ReserveSite 'Tent-01', '05-27-2015 0:00', '05-28-2015 0:00'

EXEC dbo.ReserveSite 'Tent-02', '04-06-2015 0:00', '04-07-2015 0:00'
EXEC dbo.ReserveSite 'Tent-02', '05-06-2015 0:00', '05-08-2015 0:00'
EXEC dbo.ReserveSite 'Tent-02', '05-20-2015 0:00', '05-21-2015 0:00'

EXEC dbo.ReserveSite 'Tent-03', '04-15-2015 0:00', '04-21-2015 0:00'
EXEC dbo.ReserveSite 'Tent-03', '05-03-2015 0:00', '05-08-2015 0:00'
EXEC dbo.ReserveSite 'Tent-03', '05-18-2015 0:00', '05-23-2015 0:00'

EXEC dbo.ReserveSite 'Tent-04', '04-03-2015 0:00', '04-03-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '04-09-2015 0:00', '04-09-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '04-18-2015 0:00', '04-18-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '04-23-2015 0:00', '04-23-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '04-25-2015 0:00', '04-25-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '05-02-2015 0:00', '05-02-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '05-08-2015 0:00', '05-09-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '05-16-2015 0:00', '05-16-2015 0:00'
EXEC dbo.ReserveSite 'Tent-04', '05-24-2015 0:00', '05-25-2015 0:00'

EXEC dbo.ReserveSite 'Tent-15', '04-06-2015 0:00', '04-07-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '04-13-2015 0:00', '04-14-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '04-25-2015 0:00', '04-28-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '05-10-2015 0:00', '05-12-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '05-18-2015 0:00', '05-19-2015 0:00'
EXEC dbo.ReserveSite 'Tent-15', '05-27-2015 0:00', '05-28-2015 0:00'

EXEC dbo.ReserveSite 'Tent-16', '04-01-2015 0:00', '04-14-2015 0:00'
EXEC dbo.ReserveSite 'Tent-16', '04-22-2015 0:00', '05-05-2015 0:00'
EXEC dbo.ReserveSite 'Tent-16', '05-13-2015 0:00', '05-26-2015 0:00'

EXEC dbo.ReserveSite 'RV-01', '04-29-2015 0:00', '05-05-2015 0:00'

EXEC dbo.ReserveSite 'RV-02', '04-29-2015 0:00', '05-12-2015 0:00'

EXEC dbo.ReserveSite 'RV-04', '04-15-2015 0:00', '04-21-2015 0:00'
EXEC dbo.ReserveSite 'RV-04', '05-18-2015 0:00', '05-19-2015 0:00'

EXEC dbo.ReserveSite 'RV-06', '04-22-2015 0:00', '05-12-2015 0:00'

EXEC dbo.ReserveSite 'RV-11', '04-08-2015 0:00', '04-10-2015 0:00'
EXEC dbo.ReserveSite 'RV-11', '04-15-2015 0:00', '04-17-2015 0:00'
EXEC dbo.ReserveSite 'RV-11', '04-29-2015 0:00', '05-01-2015 0:00'
EXEC dbo.ReserveSite 'RV-11', '05-13-2015 0:00', '05-15-2015 0:00'
EXEC dbo.ReserveSite 'RV-11', '05-20-2015 0:00', '05-22-2015 0:00'

EXEC dbo.ReserveSite 'Picnic-01', '04-06-2015 0:00', '04-07-2015 0:00'
EXEC dbo.ReserveSite 'Picnic-01', '04-20-2015 0:00', '04-21-2015 0:00'
EXEC dbo.ReserveSite 'Picnic-01', '05-04-2015 0:00', '05-05-2015 0:00'
EXEC dbo.ReserveSite 'Picnic-01', '05-13-2015 0:00', '05-19-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-08', '04-03-2015 0:00', '04-05-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '04-12-2015 0:00', '04-13-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '04-22-2015 0:00', '04-22-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '04-26-2015 0:00', '05-02-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '05-10-2015 0:00', '05-11-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '05-17-2015 0:00', '05-19-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '05-23-2015 0:00', '05-23-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-08', '05-28-2015 0:00', '05-28-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-11', '04-05-2015 0:00', '04-09-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-11', '04-26-2015 0:00', '04-29-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-11', '05-17-2015 0:00', '05-21-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-14', '04-10-2015 0:00', '04-11-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-14', '04-24-2015 0:00', '04-27-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-14', '05-20-2015 0:00', '05-22-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-16', '04-02-2015 0:00', '04-02-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-04-2015 0:00', '04-04-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-06-2015 0:00', '04-06-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-08-2015 0:00', '04-08-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-10-2015 0:00', '04-10-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-12-2015 0:00', '04-12-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-14-2015 0:00', '04-14-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-16-2015 0:00', '04-16-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-18-2015 0:00', '04-18-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-20-2015 0:00', '04-20-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-22-2015 0:00', '04-22-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-24-2015 0:00', '04-24-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-26-2015 0:00', '04-26-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-28-2015 0:00', '04-28-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '04-30-2015 0:00', '04-30-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-02-2015 0:00', '05-02-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-04-2015 0:00', '05-04-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-06-2015 0:00', '05-06-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-08-2015 0:00', '05-08-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-10-2015 0:00', '05-10-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-12-2015 0:00', '05-12-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-14-2015 0:00', '05-14-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-16-2015 0:00', '05-16-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-18-2015 0:00', '05-18-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-20-2015 0:00', '05-20-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-22-2015 0:00', '05-22-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-24-2015 0:00', '05-24-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-26-2015 0:00', '05-26-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-16', '05-28-2015 0:00', '05-28-2015 0:00'

EXEC dbo.ReserveSite 'Cabin-19', '04-01-2015 0:00', '04-07-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '04-10-2015 0:00', '04-21-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '04-24-2015 0:00', '05-05-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '05-08-2015 0:00', '05-19-2015 0:00'
EXEC dbo.ReserveSite 'Cabin-19', '05-22-2015 0:00', '05-28-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P1-03', '04-20-2015 0:00', '04-21-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P1-03', '05-06-2015 0:00', '05-07-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P1-03', '05-09-2015 0:00', '05-09-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P1-03', '05-12-2015 0:00', '05-12-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P1-05', '04-25-2015 0:00', '04-27-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P2-02', '04-08-2015 0:00', '04-08-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-02', '05-01-2015 0:00', '05-01-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-02', '05-20-2015 0:00', '05-20-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-02', '05-24-2015 0:00', '05-24-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P2-04', '04-13-2015 0:00', '04-14-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-04', '05-07-2015 0:00', '05-08-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P2-04', '05-23-2015 0:00', '05-27-2015 0:00'

EXEC dbo.ReserveSite 'Dock-P3-01', '04-03-2015 0:00', '04-03-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P3-01', '04-22-2015 0:00', '04-22-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P3-01', '05-11-2015 0:00', '05-11-2015 0:00'
EXEC dbo.ReserveSite 'Dock-P3-01', '05-27-2015 0:00', '05-27-2015 0:00'

EXEC dbo.ReserveSite 'Trailer-02', '04-01-2015 0:00', '04-07-2015 0:00'
EXEC dbo.ReserveSite 'Trailer-02', '04-22-2015 0:00', '04-28-2015 0:00'
EXEC dbo.ReserveSite 'Trailer-02', '05-20-2015 0:00', '05-22-2015 0:00'

EXEC dbo.ReserveSite 'Group-03', '04-13-2015 0:00', '04-16-2015 0:00'
EXEC dbo.ReserveSite 'Group-03', '05-04-2015 0:00', '05-06-2015 0:00'
EXEC dbo.ReserveSite 'Group-03', '05-20-2015 0:00', '05-26-2015 0:00'
