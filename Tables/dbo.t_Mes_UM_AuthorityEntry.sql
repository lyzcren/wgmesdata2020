CREATE TABLE [dbo].[t_Mes_UM_AuthorityEntry]
(
[FInterID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FOperation] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL CONSTRAINT [DF_t_Mes_UM_AuthorityEntry_FOperation] DEFAULT (''),
[FShortOP] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL CONSTRAINT [DF_t_Mes_UM_AuthorityEntry_FShortOP] DEFAULT (''),
[FIsActive] [bit] NULL CONSTRAINT [DF_t_Mes_UM_AuthorityEntry_FIsActive] DEFAULT ((1)),
[FOrder] [int] NULL CONSTRAINT [DF_t_Mes_UM_AuthorityEntry_FOrder] DEFAULT ((0))
) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户管理-模块具体权限。
该表由系统启动时读取配置文件后插入，一般不需要手动修改。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_AuthorityEntry', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_AuthorityEntry', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id（关联 t_Mes_UM_Authority 的 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_AuthorityEntry', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_AuthorityEntry', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'权限名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_AuthorityEntry', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_AuthorityEntry', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'操作', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_AuthorityEntry', 'COLUMN', N'FOperation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'排序', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_AuthorityEntry', 'COLUMN', N'FOrder'
GO
EXEC sp_addextendedproperty N'MS_Description', N'操作短码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_AuthorityEntry', 'COLUMN', N'FShortOP'
GO
