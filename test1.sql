USE [Session5]
go
CREATE VIEW [dbo].[Arr]
AS
SELECT        dbo.Tickets.BookingReference, dbo.Schedules.Date, dbo.Schedules.Time, dbo.Schedules.FlightNumber, dbo.Routes.ArrivalAirportID, dbo.Airports.IATACode
FROM            dbo.Routes INNER JOIN
                    dbo.Schedules ON dbo.Routes.ID = dbo.Schedules.RouteID INNER JOIN
                         dbo.Tickets ON dbo.Schedules.ID = dbo.Tickets.ScheduleID INNER JOIN
                         dbo.Airports ON dbo.Routes.ArrivalAirportID = dbo.Airports.ID

GO

CREATE VIEW [dbo].[De]
AS
SELECT        dbo.Tickets.BookingReference, dbo.Routes.DepartureAirportID, dbo.Schedules.Date, dbo.Schedules.Time, dbo.Airports.IATACode, dbo.Schedules.FlightNumber
SELECT *
FROM            dbo.Tickets INNER JOIN
                         dbo.Schedules ON dbo.Tickets.ScheduleID = dbo.Schedules.ID INNER JOIN
                         dbo.Routes ON dbo.Schedules.RouteID = dbo.Routes.ID INNER JOIN
                         dbo.Airports ON dbo.Routes.DepartureAirportID = dbo.Airports.ID

GO

CREATE VIEW [dbo].[V3]
AS
SELECT        dbo.De.BookingReference, dbo.De.FlightNumber, dbo.De.Date, dbo.De.Time, dbo.De.IATACode AS DepartureAirportCode, 
                         dbo.Arr.IATACode AS ArrivalAirportCode
FROM            dbo.De INNER JOIN
                         dbo.Arr ON dbo.De.BookingReference = dbo.Arr.BookingReference AND dbo.De.FlightNumber = dbo.Arr.FlightNumber

GO
select * from dbo.V3 where BookingReference = '12345B'
select * from dbo.[Arr] 
select * from dbo.[De] 
