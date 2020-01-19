CREATE TABLE [dbo].[t_Mes_Tech_ParamValue]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Tech_ParamValue_Guid] DEFAULT (newid()),
[FItemID] [int] NOT NULL,
[FValue] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Tech_ParamValue] ADD CONSTRAINT [PK_t_Mes_Tech_ParamValue] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-工艺参数值。
该表存储具体工艺参数可选值。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_ParamValue', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺参数id（对应 t_Mes_Tech_Param 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_ParamValue', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'参数值', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_ParamValue', 'COLUMN', N'FValue'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_ParamValue', 'COLUMN', N'Guid'
GO
