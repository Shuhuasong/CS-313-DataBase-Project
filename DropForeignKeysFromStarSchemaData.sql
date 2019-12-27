SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Shuhua Song
-- Create date: 11/08/2019
-- Description:	Drop the Foreign Keys From the Star Schema
-- =============================================
ALTER PROCEDURE [Project2].[DropForeignKeysFromStarSchemaData]
AS
BEGIN
    SET NOCOUNT ON;
	--PRINT 'Hi'
    alter table [CH01-01-Fact].[Data] drop constraint [FK_Data_DimCustomer];
    alter table [CH01-01-Fact].[Data] drop constraint [FK_Data_DimGender];
    alter table [CH01-01-Fact].[Data] drop constraint [FK_Data_DimMaritalStatus];
    alter table [CH01-01-Fact].[Data] drop constraint [FK_Data_DimOccupation];
    alter table [CH01-01-Fact].[Data] drop constraint [FK_Data_DimOrderDate];
    alter table [CH01-01-Fact].[Data] drop constraint [FK_Data_DimProduct];
    alter table [CH01-01-Fact].[Data] drop constraint [FK_Data_DimTerritory];
    alter table [CH01-01-Fact].[Data] drop constraint [FK_Data_SalesManagers];
    
END;
GO

exec [Project2].[DropForeignKeysFromStarSchemaData]
