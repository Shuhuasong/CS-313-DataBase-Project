SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:Zhiheng Tan
-- Create date: 11/10/19
-- Description:	Insert data from OLD table into DimTerritory
-- =============================================
ALTER PROCEDURE [Project2].[Load_DimTerritory]
	@GroupMemberUserAuthorizationKey INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime DATETIME2, @Rows INT;
	SET @StartTime = SYSDATETIME();

	--ALTER SEQUENCE [CH01-01-Dimension].[SequenceID] RESTART WITH 1

	--INSERT INTO [CH01-01-Dimension].[DimTerritory](TerritoryKey)
	--SELECT NEXT VALUE for [CH01-01-Dimension].[SequenceID] AS TerritoryKey

	ALTER SEQUENCE [CH01-01-Dimension].[SequenceID] RESTART WITH 1

    INSERT INTO [CH01-01-Dimension].[DimTerritory] (TerritoryKey, TerritoryGroup, TerritoryCountry, TerritoryRegion)
	SELECT NEXT VALUE for [CH01-01-Dimension].[SequenceID] AS TerritoryKey, OLD.TerritoryGroup, OLD.TerritoryCountry, OLD.TerritoryRegion
	FROM FileUpload.OriginallyLoadedData AS OLD
	SET @Rows = @@ROWCOUNT

EXEC [Process].[usp_TrackWorkFlow] @StartTime, "Insert data from OLD table into DimTerritory", @Rows, @GroupMemberUserAuthorizationKey
	
END

GO
