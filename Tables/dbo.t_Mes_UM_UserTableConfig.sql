CREATE TABLE [dbo].[t_Mes_UM_UserTableConfig]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FUserID] [int] NOT NULL,
[FKey] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FSize] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FTableLayout] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_UM_UserTableConfig] ADD CONSTRAINT [PK_t_Mes_UM_UserTableConfig] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户表配置', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_UserTableConfig', NULL, NULL
GO
