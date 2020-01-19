CREATE TABLE [dbo].[t_Mes_UM_Role]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FNumber] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FComments] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FIsActive] [bit] NULL CONSTRAINT [DF_t_Mes_UM_Role_FIsActive] DEFAULT ((0)),
[FEditable] [bit] NULL,
[FCreatorID] [int] NULL,
[FCreateDate] [datetime] NOT NULL CONSTRAINT [DF_t_Mes_UM_Role_FCreateDate] DEFAULT (getdate()),
[FEditorID] [int] NULL,
[FEditDate] [datetime] NULL,
[FIsSuperAdmin] [bit] NULL CONSTRAINT [DF_t_Mes_UM_Role_FIsSuperAdmin] DEFAULT ((0)),
[FIndexPage] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_UM_Role] ADD CONSTRAINT [PK_t_Role] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户管理-角色。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否允许修改', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FEditable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'默认首页', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FIndexPage'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否超级管理员', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FIsSuperAdmin'
GO
EXEC sp_addextendedproperty N'MS_Description', N'角色id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'角色名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'角色编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Role', 'COLUMN', N'FNumber'
GO
