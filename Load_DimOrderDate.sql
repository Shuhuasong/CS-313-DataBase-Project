SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:Zhiheng Tan
-- Create date: 11/11/19
-- Description:	Insert data from OLD table into DimOrderDate
-- =============================================
ALTER PROCEDURE [Project2].[Load_DimOrderDate]
	@GroupMemberUserAuthorizationKey INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @StartTime DATETIME2, @Rows INT;
	SET @StartTime = SYSDATETIME();
	SET NOCOUNT ON;
	INSERT INTO [CH01-01-Dimension].[DimOrderDate] (OrderDate, MonthName, MonthNumber, Year)
	SELECT OLD.OrderDate, OLD.MonthName, OLD.MonthNumber, OLD.Year
	FROM FileUpload.OriginallyLoadedData AS OLD

	EXEC [Process].[usp_TrackWorkFlow] @StartTime, "Insert data from OLD table into DimOrderDate", @Rows, @GroupMemberUserAuthorizationKey

END



GO
