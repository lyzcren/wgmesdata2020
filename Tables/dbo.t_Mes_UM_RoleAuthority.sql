CREATE TABLE [dbo].[t_Mes_UM_RoleAuthority]
(
[Guid] [uniqueidentifier] NOT NULL ROWGUIDCOL CONSTRAINT [DF_t_Mes_UM_RoleAuthority_Guid] DEFAULT (newid()),
[FRoleID] [int] NOT NULL,
[FAuthorityNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_UM_RoleAuthority] ADD CONSTRAINT [PK_t_Mes_UM_RoleAuthority] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户管理-角色权限。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_RoleAuthority', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'权限编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_RoleAuthority', 'COLUMN', N'FAuthorityNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'角色id（关联 t_Mes_UM_Role 的 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_RoleAuthority', 'COLUMN', N'FRoleID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_RoleAuthority', 'COLUMN', N'Guid'
GO
