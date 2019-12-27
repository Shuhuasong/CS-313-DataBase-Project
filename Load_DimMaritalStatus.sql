SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		YourName
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [Project2].[Load_DimMaritalStatus]
@groupMemberUserAuthorizationKey int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime DATETIME2, @Rows INT;
	SET @StartTime = SYSDATETIME();
insert into [CH01-01-Dimension].[DimMaritalStatus]
            (MaritalStatus, MaritalStatusDescription)
select  distinct Old.MaritalStatus, MaritalStatusDescription=
( case 
  when MaritalStatus ='S' then'Single'
  else   'Married' 
  end
)
from FileUpload.OriginallyLoadedData as Old
SET @Rows = @@ROWCOUNT

EXEC [Process].[usp_TrackWorkFlow] @StartTime, "Load Marital Status information", @Rows, @GroupMemberUserAuthorizationKey
END


GO
