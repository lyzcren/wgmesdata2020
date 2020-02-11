CREATE TABLE [dbo].[t_Mes_Sys_BusinessConfig]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Sys_BusinessConfig_Guid] DEFAULT (newid()),
[FType] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FNumber] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FValue] [varchar] (max) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Sys_BusinessConfig] ADD CONSTRAINT [PK_t_Mes_Sys_BusinessConfig] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BusinessConfig', 'COLUMN', N'Guid'
GO
