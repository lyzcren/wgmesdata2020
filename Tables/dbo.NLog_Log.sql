CREATE TABLE [dbo].[NLog_Log]
(
[LogId] [int] NOT NULL IDENTITY(1, 1),
[CreateOn] [datetime] NOT NULL,
[Origin] [nvarchar] (max) COLLATE Chinese_PRC_CI_AS NULL,
[LogLevel] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[Message] [nvarchar] (max) COLLATE Chinese_PRC_CI_AS NULL,
[Exception] [nvarchar] (max) COLLATE Chinese_PRC_CI_AS NULL,
[StackTrace] [nvarchar] (max) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'系统日志', 'SCHEMA', N'dbo', 'TABLE', N'NLog_Log', NULL, NULL
GO
