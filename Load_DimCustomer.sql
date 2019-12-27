SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shuhua Song
-- Create date: 11/11/2019
-- Description:	Load the Customer information from FileUpload table
-- =============================================

ALTER PROCEDURE [Project2].[Load_DimCustomer]
 @groupMemberUserAuthorizationKey int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
--PRINT 'Hi'
	DECLARE @StartTime DATETIME2, @Rows INT;
	SET @StartTime = SYSDATETIME();

    alter sequence [CH01-01-Dimension].[SequenceID] restart

    insert into [CH01-01-Dimension].[DimCustomer]
    (CustomerKey 
    ,CustomerName
    )  
    select next value for [CH01-01-Dimension].[SequenceID] as CustomerKey,
         dc.CustomerName
    from 
    (
        select distinct CustomerName from FileUpload.OriginallyLoadedData
    ) as dc

	select * from [CH01-01-Dimension].[DimCustomer]
	SET @Rows = @@ROWCOUNT

	EXEC [Process].[usp_TrackWorkFlow] @StartTime, "Load the Customer information from FileUpload table", @Rows, @GroupMemberUserAuthorizationKey

END
GO
