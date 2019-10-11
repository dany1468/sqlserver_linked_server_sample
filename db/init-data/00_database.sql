CREATE DATABASE main
GO

USE [main]

CREATE TABLE dbo.Orders(
  Id int IDENTITY(1, 1) NOT NULL PRIMARY KEY CLUSTERED,
  OrderDate datetime NOT NULL,
  CustomerId int NOT NULL
)
GO

-- Setup LinkedServer

USE [master]
GO

EXEC master.dbo.sp_addlinkedserver
  @server = N'linked-db',
  @srvproduct=N'SQL Server' ;
GO
