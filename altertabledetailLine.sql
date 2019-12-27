ALTER TABLE [dbo].[MSreplication_options] add [UserAuthorizationKey] [int] not null DEFAULT(-99)
ALTER TABLE [dbo].[MSreplication_options] add [DateAdded] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[MSreplication_options] add [DateOfLastUpdate] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[Orders] add [UserAuthorizationKey] [int] not null DEFAULT(-99)
ALTER TABLE [dbo].[Orders] add [DateAdded] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[Orders] add [DateOfLastUpdate] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[spt_fallback_db] add [UserAuthorizationKey] [int] not null DEFAULT(-99)
ALTER TABLE [dbo].[spt_fallback_db] add [DateAdded] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[spt_fallback_db] add [DateOfLastUpdate] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[spt_fallback_dev] add [UserAuthorizationKey] [int] not null DEFAULT(-99)
ALTER TABLE [dbo].[spt_fallback_dev] add [DateAdded] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[spt_fallback_dev] add [DateOfLastUpdate] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[spt_fallback_usg] add [UserAuthorizationKey] [int] not null DEFAULT(-99)
ALTER TABLE [dbo].[spt_fallback_usg] add [DateAdded] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[spt_fallback_usg] add [DateOfLastUpdate] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[spt_monitor] add [UserAuthorizationKey] [int] not null DEFAULT(-99)
ALTER TABLE [dbo].[spt_monitor] add [DateAdded] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[spt_monitor] add [DateOfLastUpdate] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[T1] add [UserAuthorizationKey] [int] not null DEFAULT(-99)
ALTER TABLE [dbo].[T1] add [DateAdded] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [dbo].[T1] add [DateOfLastUpdate] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [DbSecurity].[UserAuthorization] add [UserAuthorizationKey] [int] not null DEFAULT(-99)
ALTER TABLE [DbSecurity].[UserAuthorization] add [DateAdded] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [DbSecurity].[UserAuthorization] add [DateOfLastUpdate] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [Process].[WorkflowSteps] add [UserAuthorizationKey] [int] not null DEFAULT(-99)
ALTER TABLE [Process].[WorkflowSteps] add [DateAdded] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [Process].[WorkflowSteps] add [DateOfLastUpdate] [datetime2](7) not null DEFAULT(sysdatetime())


ALTER TABLE [CH01-01-Dimension].[DimProductCategory] add [UserAuthorizationKey] [int] not null DEFAULT(-99)
ALTER TABLE [CH01-01-Dimension].[DimProductCategory] add [DateAdded] [datetime2](7) not null DEFAULT(sysdatetime())
ALTER TABLE [CH01-01-Dimension].[DimProductCategory] add [DateOfLastUpdate] [datetime2](7) not null DEFAULT(sysdatetime())