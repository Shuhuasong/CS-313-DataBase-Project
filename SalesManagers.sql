SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [Project2].[Load_SalesManagers] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	INSERT INTO [CH01-01-Dimension].SalesManagers
	(
		SalesManagerKey,
		Category,
		SalesManager,
		Office
	)
	SELECT DISTINCT
		SM.SalesManagerKey,
		SM.Category,
		SM.SalesManager,
		Office = ( CASE SM.Office
					 WHEN old.SalesManager LIKE N'Marco%' THEN
						 'Redmond'
					 WHEN old.SalesManager LIKE N'Alberto%' THEN
						 'Seattle'
					 WHEN old.SalesManager LIKE N'Maurizio%' THEN
						 'Redmond'
					 ELSE
						 'Seattle'
				 END)
	FROM FileUpload.OriginallyLoadedData AS old
    inner join 
        [CH01-01-Dimension].SalesManagers as SM
        on old.SalesManager = SM.SalesManager
	ORDER BY old.SalesManagerKey;
END

GO


