SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:Zhiheng Tan
-- Create date: 11/09/19
-- Description:	Insert data from OLD table into DimProductCategory
-- =============================================
ALTER PROCEDURE [Project2].[Load_DimProductCategory]
	@GroupMemberUserAuthorizationKey INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime DATETIME2, @Rows INT;
	SET @StartTime = SYSDATETIME();

    ALTER SEQUENCE [CH01-01-Dimension].[SequenceID] RESTART WITH 1

	INSERT INTO [CH01-01-Dimension].DimProductCategory (ProductCategoryKey, ProductCategory)
    SELECT NEXT VALUE for [CH01-01-Dimension].[SequenceID] AS ProductCategoryKey, DPC.ProductCategory
	FROM (SELECT DISTINCT ProductCategory FROM FileUpload.OriginallyLoadedData) AS DPC
	SET @Rows = @@ROWCOUNT

EXEC [Process].[usp_TrackWorkFlow] @StartTime, "Insert data from OLD table into DimProductCategory", @Rows, @GroupMemberUserAuthorizationKey

END




GO
