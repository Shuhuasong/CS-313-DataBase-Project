SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Shuhua Song
-- Create date: 11/13/2019
-- Description:	Load the SalesManager information from Original table
-- =============================================
ALTER PROCEDURE [Project2].[Load_SalesManagers] 
@groupMemberUserAuthorizationKey int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime DATETIME2, @Rows INT;
	SET @StartTime = SYSDATETIME();

alter sequence [CH01-01-Dimension].[SequenceID] restart

	INSERT INTO [CH01-01-Dimension].SalesManagers
	(
		SalesManagerKey,
		Category,
		SalesManager,
		Office
	)

 select next value for [CH01-01-Dimension].[SequenceID] as 
     SalesManagerKey,
     ProductCategory,
     SalesManager,
     Office
     from (SELECT DISTINCT
		ProductCategory,
		SalesManager,
		Office = CASE
					 WHEN SalesManager LIKE 'Marco%' THEN
						 'Redmond'
					 WHEN SalesManager LIKE 'Alberto%' THEN
						 'Seattle'
					 WHEN SalesManager LIKE 'Maurizio%' THEN
						 'Redmond'
					 ELSE
						 'Seattle'
				 END
	FROM FileUpload.OriginallyLoadedData ) as dc
	SET @Rows = @@ROWCOUNT

EXEC [Process].[usp_TrackWorkFlow] @StartTime, "Load the SalesManager information from Original table", @Rows, @GroupMemberUserAuthorizationKey
	--ORDER BY SalesManagerKey 
	
END


GO
