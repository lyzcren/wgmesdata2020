CREATE TABLE [dbo].[t_Mes_Sys_Field]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FField] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FIsShow] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Sys_Field_FIsShow] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Sys_Field] ADD CONSTRAINT [PK_t_Mes_Sys_Field] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'自定义字段配置', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_Field', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'字段名', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_Field', 'COLUMN', N'FField'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否显示', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_Field', 'COLUMN', N'FIsShow'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_Field', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'字段标题', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_Field', 'COLUMN', N'FName'
GO
