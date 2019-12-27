
------------------------------------------------------------------------------
--Author: Shuhua Song
--Procedure: Your stored procedure name
--Create date: The date
--Description: Define the actions of the stored procedure
-----------------------------------------------------------------------------
create SCHEMA Process;
GO
drop table if exists Process.WorkflowSteps;
go 
create table Process.WorkflowSteps
(
  WorkFlowStepKey int not null 
  constraint PK_WorkflowSteps primary key,
  WorkFlowStepDescription nvarchar(100) not null,
  WorkFlowStepTabeRowCount int null default(0),
  StartingDateTime DateTime2(7) null 
  constraint dft_StartingDateTime default (sysdatetime()),
  EndingDateTime DateTime2(7) null
  constraint dft_EndingDateTime default (sysdatetime()),
  ClassTime char(5) null default ('07:45'),
  UserAuthorizationKey int not null
);
