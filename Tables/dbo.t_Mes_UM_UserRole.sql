CREATE TABLE [dbo].[t_Mes_UM_UserRole]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_UM_UserRole_Guid] DEFAULT (newid()),
[FUserID] [int] NOT NULL,
[FRoleID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_UM_UserRole] ADD CONSTRAINT [PK_t_Mes_UM_UserRole] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户管理-用户授权角色信息。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_UserRole', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'角色id（关联 t_Mes_UM_Role 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_UserRole', 'COLUMN', N'FRoleID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户id（关联 t_Mes_UM_User 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_UserRole', 'COLUMN', N'FUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_UserRole', 'COLUMN', N'Guid'
GO
