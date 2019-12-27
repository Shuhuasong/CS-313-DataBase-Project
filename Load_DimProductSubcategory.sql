SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:Zhiheng Tan
-- Create date: 11/11/19
-- Description:	Insert data from OLD table into DimProductSubcategory
-- =============================================
ALTER PROCEDURE [Project2].[Load_DimProductSubcategory]
	@GroupMemberUserAuthorizationKey INT
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime DATETIME2, @Rows INT;
	SET @StartTime = SYSDATETIME();

	ALTER SEQUENCE [CH01-01-Dimension].[SequenceID] RESTART WITH 1

	INSERT INTO [CH01-01-Dimension].DimProductSubcategory (ProductSubcategoryKey, ProductCategoryKey, ProductSubcategory)
    SELECT NEXT VALUE for [CH01-01-Dimension].[SequenceID] AS ProductSubcategoryKey, PC.ProductCategoryKey, PC.ProductSubcategory
    FROM 
    (SELECT DISTINCT ProductCategoryKey, ProductSubcategory
	FROM [CH01-01-Dimension].[DimProductCategory] AS DPC
		INNER JOIN [FileUpload].[OriginallyLoadedData] AS OLD
			ON DPC.ProductCategory = OLD.ProductCategory) AS PC
	SET @Rows = @@ROWCOUNT

EXEC [Process].[usp_TrackWorkFlow] @StartTime, "Insert data from OLD table into DimProductSubcategory", @Rows, @GroupMemberUserAuthorizationKey
END;





GO
