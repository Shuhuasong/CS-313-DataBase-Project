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
    drop sequence if exists  [CH01-01-Dimension].[CustomerSequenceID] 
    create sequence [CH01-01-Dimension].[CustomerSequenceID] as int
    start with 1
    increment by 1
    cycle

    insert into [CH01-01-Dimension].[DimCustomer]
    (CustomerKey 
    ,CustomerName
  --  ,UserAuthorizationKey
  --,DateAdded
  --,DateOfLastUpdate
    )  
    select next value for [CH01-01-Dimension].[CustomerID] as CustomerKey,
         dc.CustomerName
    from 
    (
        select distinct CustomerName from FileUpload.OriginallyLoadedData
    ) as dc
    
       --UserAuthorizationKey = @groupMemberUserAuthorizationKey,
      -- DateAdded = @startDate,
     --  DateOfLastUpdate = @endDate
END
GO

select *
from FileUpload.OriginallyLoadedData

select *
from [CH01-01-Dimension].[DimCustomer]

truncate table [CH01-01-Dimension].[DimCustomer]

exec [Project2].[Load_DimCustomer] 1


-- select next value for dbo.a
-- alter sequence dbo.a

