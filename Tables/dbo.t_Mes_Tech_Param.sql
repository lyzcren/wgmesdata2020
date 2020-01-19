CREATE TABLE [dbo].[t_Mes_Tech_Param]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FNumber] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FType] [int] NOT NULL CONSTRAINT [DF_t_Mes_Tech_Param_FType] DEFAULT ((0)),
[FIsActive] [bit] NOT NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FEditorID] [int] NULL,
[FEditDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Tech_Param] ADD CONSTRAINT [PK_t_Mes_Tech_Param] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-工艺参数。
存储工艺参数信息。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Param', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Param', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Param', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Param', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Param', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Param', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺参数id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Param', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Param', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Param', 'COLUMN', N'FNumber'
GO
