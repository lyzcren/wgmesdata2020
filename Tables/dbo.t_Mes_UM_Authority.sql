CREATE TABLE [dbo].[t_Mes_UM_Authority]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FDevNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FIsActive] [bit] NULL,
[FOrder] [int] NULL,
[FParentID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_UM_Authority] ADD CONSTRAINT [PK_t_Authority] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'用户管理-模块权限。
该表由系统启动时读取配置文件后插入，一般不需要手动修改。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Authority', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'开发编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Authority', 'COLUMN', N'FDevNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Authority', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Authority', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'模块（菜单）名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Authority', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Authority', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'排序', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Authority', 'COLUMN', N'FOrder'
GO
EXEC sp_addextendedproperty N'MS_Description', N'上级id（关联本表 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_UM_Authority', 'COLUMN', N'FParentID'
GO
