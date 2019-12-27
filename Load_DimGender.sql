SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [Project2].[Load_DimGender]
@groupMemberUserAuthorizationKey int
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
	DECLARE @StartTime DATETIME2, @Rows INT;
	SET @StartTime = SYSDATETIME();

--PRINT 'Hi'
insert into [CH01-01-Dimension].[DimGender](Gender, GenderDescription)
select distinct Gender, GenderDescription = (
    case Gender
    when 'M' then 'Male'
    else 'Female'
    end
)
from FileUpload.OriginallyLoadedData 
SET @Rows = @@ROWCOUNT
EXEC [Process].[usp_TrackWorkFlow] @StartTime, "Load the Gender information", @Rows, @GroupMemberUserAuthorizationKey
END;

GO
