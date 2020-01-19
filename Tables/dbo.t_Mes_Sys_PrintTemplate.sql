CREATE TABLE [dbo].[t_Mes_Sys_PrintTemplate]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FNumber] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FFileName] [varchar] (250) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FContent] [nvarchar] (max) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FUploadUserID] [int] NOT NULL,
[FUploadDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Sys_PrintTemplate] ADD CONSTRAINT [PK_t_Mes_Sys_PrintTemplate] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'系统-打印模板。
该表存储打印模板的名称及打印模板内容等信息，系统读取该表信息后再次生产文件供客户端打印插件下载。在上传打印模板时，系统解析打印模板后存储在该表中。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintTemplate', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'内容', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintTemplate', 'COLUMN', N'FContent'
GO
EXEC sp_addextendedproperty N'MS_Description', N'文件名', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintTemplate', 'COLUMN', N'FFileName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintTemplate', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintTemplate', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintTemplate', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'上传日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintTemplate', 'COLUMN', N'FUploadDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'上传人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_PrintTemplate', 'COLUMN', N'FUploadUserID'
GO
