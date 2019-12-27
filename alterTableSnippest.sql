ALTER TABLE FullyQualifiedTableName add [UserAuthorizationKey] [int] not null DEFAULT(-99)
ALTER TABLE FullyQualifiedTableName add [DateAdded] [datetime2](7)   not null DEFAULT(sysdatetime())
ALTER TABLE FullyQualifiedTableName add [DateOfLastUpdate] [datetime2](7)   not null DEFAULT(sysdatetime())

select concat(t.TABLE_SCHEMA,'.',t.TABLE_NAME) as FullyQualifiedTableName
     , t.TABLE_TYPE FROM INFORMATION_SCHEMA.TABLES as t
where t.TABLE_SCHEMA in ('CH01-01-Dimension','CH01-01-Fact') and t.TABLE_TYPE = 'BASE TABLE'





----Sample before and after of the execution

------ Before Adding the three columns

----CREATE TABLE [dbo].[Digits](
---- [digit] [INT] NOT NULL
----) ON [PRIMARY]
----GO

------ Add the three columns

----ALTER TABLE dbo.Digits add [UserAuthorizationKey] [int] not null DEFAULT(-99)
----ALTER TABLE dbo.Digits add [DateAdded] [datetime2](7) not null DEFAULT(sysdatetime())
----ALTER TABLE dbo.Digits add [DateOfLastUpdate] [datetime2](7) not null DEFAULT(sysdatetime())

------ After Adding the three columns

----CREATE TABLE [dbo].[Digits](
---- [digit] [INT] NOT NULL,
---- [UserAuthorizationKey] [INT] NOT NULL,
---- [DateAdded] [DATETIME2](7) NOT NULL,
---- [DateOfLastUpdate] [DATETIME2](7) NOT NULL
----) ON [PRIMARY]
----GO

----ALTER TABLE [dbo].[Digits] ADD  DEFAULT ((-99)) FOR [UserAuthorizationKey]
----GO

----ALTER TABLE [dbo].[Digits] ADD  DEFAULT (SYSDATETIME()) FOR [DateAdded]
----GO

----ALTER TABLE [dbo].[Digits] ADD  DEFAULT (SYSDATETIME()) FOR [DateOfLastUpdate]
----GO​
