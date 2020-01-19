CREATE TABLE [dbo].[t_Mes_UM_UserDept]
(
[FUserID] [int] NOT NULL,
[FDeptID] [int] NOT NULL CONSTRAINT [DF_t_Mes_UM_UserDept_FDeptID] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_UM_UserDept] ADD CONSTRAINT [PK_t_Mes_UM_UserDept] PRIMARY KEY CLUSTERED  ([FUserID], [FDeptID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户管理-用户授权岗位信息。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_UserDept', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id（关联 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_UserDept', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户id（关联 t_Mes_UM_User 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_UserDept', 'COLUMN', N'FUserID'
GO
