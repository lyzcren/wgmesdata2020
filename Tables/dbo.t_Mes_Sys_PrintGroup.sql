CREATE TABLE [dbo].[t_Mes_Sys_PrintGroup]
(
[FNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FName] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FOrder] [int] NOT NULL,
[FDescription] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FDetailAssembly] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FDetailType] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FMasterAssembly] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FMasterType] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Sys_PrintGroup] ADD CONSTRAINT [PK_t_Mes_Sys_PrintGroup] PRIMARY KEY CLUSTERED  ([FNumber]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'系统-打印模板组。
存储打印模板分组，分组一般为系统功能模块，如“生产任务单”、“生产流程单”、“在制品盘点单”等。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintGroup', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'描述', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintGroup', 'COLUMN', N'FDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', N'明细内容的程序集', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintGroup', 'COLUMN', N'FDetailAssembly'
GO
EXEC sp_addextendedproperty N'MS_Description', N'明细对应的类名（.NET CORE 中的 Class）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintGroup', 'COLUMN', N'FDetailType'
GO
EXEC sp_addextendedproperty N'MS_Description', N'主要内容的程序集', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintGroup', 'COLUMN', N'FMasterAssembly'
GO
EXEC sp_addextendedproperty N'MS_Description', N'主要内容类名（.NET CORE 中的 Class）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintGroup', 'COLUMN', N'FMasterType'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintGroup', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintGroup', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'排序', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintGroup', 'COLUMN', N'FOrder'
GO
