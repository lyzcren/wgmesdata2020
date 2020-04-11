CREATE TABLE [dbo].[t_Mes_UM_User]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FDeptID] [int] NULL CONSTRAINT [DF_t_Mes_UM_User_FDeptID] DEFAULT ((0)),
[FName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FPwd] [nvarchar] (64) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FIsAdmin] [bit] NOT NULL CONSTRAINT [DF_t_Mes_UM_User_FIsAdmin] DEFAULT ((0)),
[FType] [smallint] NOT NULL,
[FIsAllowMultiLogin] [bit] NOT NULL CONSTRAINT [DF_t_Mes_UM_User_FIsAllowMultiLogin] DEFAULT ((0)),
[FIsActive] [bit] NOT NULL CONSTRAINT [DF_t_Mes_UM_User_FIsActive] DEFAULT ((1)),
[FCreatorID] [int] NULL,
[FCreateDate] [datetime] NOT NULL,
[FEditorID] [int] NULL,
[FEditDate] [datetime] NULL,
[FSex] [int] NULL CONSTRAINT [DF_t_Mes_UM_User_FSex] DEFAULT ((1)),
[FEmail] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FWeChat] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FPhone] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FContact] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FTel] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FFax] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FQQ] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FAddress] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FLockTime] [datetime] NULL,
[FPwdFailTimes] [int] NULL,
[FComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FSessionID] [nvarchar] (64) COLLATE Chinese_PRC_CI_AS NULL,
[FLockTimeout] [int] NULL,
[FAppSessionID] [varchar] (64) COLLATE Chinese_PRC_CI_AS NULL,
[FBindEmpID] [int] NULL CONSTRAINT [DF_t_Mes_UM_User_FBindEmpID] DEFAULT ((0)),
[FAccessToken] [nvarchar] (2500) COLLATE Chinese_PRC_CI_AS NULL,
[FIdCardNumber] [nvarchar] (2500) COLLATE Chinese_PRC_CI_AS NULL,
[FIndexPage] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_UM_User] ADD CONSTRAINT [PK_t_Mes_UM_User] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户管理-用户信息。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'登录token', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FAccessToken'
GO
EXEC sp_addextendedproperty N'MS_Description', N'绑定职员id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FBindEmpID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门/岗位id（关联 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'邮箱地址', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FEmail'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id卡号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FIdCardNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'默认首页', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FIndexPage'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否管理员', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FIsAdmin'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否允许多终端登录', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FIsAllowMultiLogin'
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'密码（已加密）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FPwd'
GO
EXEC sp_addextendedproperty N'MS_Description', N'性别', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FSex'
GO
EXEC sp_addextendedproperty N'MS_Description', N'0: test user, 1:normal user', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FType'
GO
EXEC sp_addextendedproperty N'MS_Description', N'微信', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_User', 'COLUMN', N'FWeChat'
GO
