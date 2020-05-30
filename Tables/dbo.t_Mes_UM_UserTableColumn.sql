CREATE TABLE [dbo].[t_Mes_UM_UserTableColumn]
(
[FInterID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FTitle] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FDataIndex] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FIsHidden] [bit] NOT NULL CONSTRAINT [DF_t_Mes_UM_UserTableColumns_FIsHidden] DEFAULT ((0)),
[FisAuthorized] [bit] NOT NULL CONSTRAINT [DF_t_Mes_UM_UserTableColumns_FisAuthorized] DEFAULT ((1)),
[FWidth] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_UM_UserTableColumns_FWidth] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_UM_UserTableColumn] ADD CONSTRAINT [PK_t_Mes_UM_UserTableColumns] PRIMARY KEY CLUSTERED  ([FInterID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户列配置', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_UserTableColumn', NULL, NULL
GO
