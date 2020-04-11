CREATE TABLE [dbo].[t_Mes_Sys_KeyValue]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Sys_KeyValue_Guid] DEFAULT (newid()),
[FNumber] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FKey] [int] NOT NULL,
[FKeyName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FValue] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FColor] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Sys_KeyValue] ADD CONSTRAINT [PK_t_Mes_Sys_KeyValue_1] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'系统-键值对。
该表存储系统中所有状态、枚举值等特殊字段的键值对，由系统启动时读取配置文件后自动生产，正常情况下不手动修改该表。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_KeyValue', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'颜色', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_KeyValue', 'COLUMN', N'FColor'
GO
EXEC sp_addextendedproperty N'MS_Description', N'键', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_KeyValue', 'COLUMN', N'FKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'键名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_KeyValue', 'COLUMN', N'FKeyName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'键编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_KeyValue', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'键值', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_KeyValue', 'COLUMN', N'FValue'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_KeyValue', 'COLUMN', N'Guid'
GO
