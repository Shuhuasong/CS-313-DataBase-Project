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
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
--PRINT 'Hi'
    insert into [CH01-01-Dimension].[DimCustomer](CustomerName)
    select Ori.CustomerName
    from FileUpload.OriginallyLoadedData as Ori
         inner join
         [CH01-01-Dimension].DimCustomer DC
         on DC.CustomerName = Ori.CustomerName

END

GO
