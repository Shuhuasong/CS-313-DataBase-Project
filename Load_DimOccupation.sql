SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Shuhua Song
-- Create date: 11/14/2019
-- Description:	Upload the Occupation information from Original table 
-- =============================================
ALTER PROCEDURE [Project2].[Load_DimOccupation]
@groupMemberUserAuthorizationKey int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @StartTime DATETIME2, @Rows INT;
	SET @StartTime = SYSDATETIME();
alter sequence [CH01-01-Dimension].[SequenceID] restart
insert into [CH01-01-Dimension].[DimOccupation]
            (OccupationKey, Occupation)

--select next value for [CH01-01-Dimension].[SequenceID]


select next value for [CH01-01-Dimension].[SequenceID] as OccupationKey, 
        dc.Occupation
from(
    select distinct Occupation
    from FileUpload.OriginallyLoadedData
   ) as dc
   SET @Rows = @@ROWCOUNT

EXEC [Process].[usp_TrackWorkFlow] @StartTime, "Load Marital Status information", @Rows, @GroupMemberUserAuthorizationKey
END

GO
