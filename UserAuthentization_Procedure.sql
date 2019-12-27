create SCHEMA DbSecurity;
GO
drop table if exists DbSecurity.UserAuthorization;
go 
create table DbSecurity.UserAuthorization
(
  UserAuthentizationKey int not null
  constraint PK_UserAuthentizationKey primary key,
  ClassTime char(5) null default ('07:45'),
  IndiviualProject nvarchar (60) null default('Project2 recreate the BIclass database star schema'),
  GroupMemberLastName nvarchar(35) not null,
  GroupMemberFirstName nvarchar(25) not null,
  GroupName nvarchar(20) not null,
  DateAdded DATETIME2 null 
  constraint dft_DateAdded default (sysdatetime()),
);


