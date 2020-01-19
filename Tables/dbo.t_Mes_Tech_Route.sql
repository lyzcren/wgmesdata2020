CREATE TABLE [dbo].[t_Mes_Tech_Route]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FNumber] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FIsActive] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Route_FIsActive] DEFAULT ((0)),
[FStatus] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Route_FStatus] DEFAULT ((0)),
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FEditorID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Route_FEditorID] DEFAULT ((0)),
[FEditDate] [datetime] NULL,
[FCheckerID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Route_FCheckerID] DEFAULT ((0)),
[FCheckDate] [datetime] NULL,
[FComments] [nvarchar] (150) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Tech_Route] ADD CONSTRAINT [PK_t_Mes_Basic_Route] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-工艺路线。
存储工艺路线基本信息。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'审核日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'审核人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'状态（对应 t_Mes_Sys_KeyValue 的 RouteStatus）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Route', 'COLUMN', N'FStatus'
GO
