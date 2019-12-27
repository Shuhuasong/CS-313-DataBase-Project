SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:Zhiheng Tan
-- Create date:11/09/19
-- Description:Insert data from OLD table into DimProduct
-- =============================================
ALTER PROCEDURE [Project2].[Load_DimProduct]
	@GroupMemberUserAuthorizationKey INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @StartTime DATETIME2, @Rows INT;
	SET @StartTime = SYSDATETIME();

	SET NOCOUNT ON;
	ALTER SEQUENCE [CH01-01-Dimension].[SequenceID] RESTART WITH 1

    INSERT INTO [CH01-01-Dimension].[DimProduct](ProductKey, ProductCategory, ProductSubcategory, ProductCode, ProductName, Color, ModelName)
	SELECT NEXT VALUE for [CH01-01-Dimension].[SequenceID] AS ProductKey, DOLD.ProductCategory, DOLD.ProductSubcategory, DOLD.ProductCode, DOLD.ProductName, DOLD.Color, DOLD.ModelName
	FROM (SELECT DISTINCT OLD.ProductCategory, OLD.ProductSubcategory, OLD.ProductCode, OLD.ProductName, OLD.Color, OLD.ModelName FROM FileUpload.OriginallyLoadedData AS OLD) AS DOLD
	SET @Rows = @@ROWCOUNT

	INSERT INTO [CH01-01-Dimension].[DimProduct](ProductSubcategoryKey)
	SELECT ProductSubcategoryKey
	FROM [CH01-01-Dimension].[DimProductSubcategory]
	
	EXEC [Process].[usp_TrackWorkFlow] @StartTime, "Insert data from OLD table into DimProduct", @Rows, @GroupMemberUserAuthorizationKey
END


GO
