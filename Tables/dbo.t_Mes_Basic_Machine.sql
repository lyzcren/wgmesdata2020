CREATE TABLE [dbo].[t_Mes_Basic_Machine]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FSerialNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FDeptID] [int] NOT NULL,
[FIsActive] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Machine_FIsActive] DEFAULT ((1)),
[FStatus] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Machine_FStatus] DEFAULT ((0)),
[FCreatorID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Machine_FCreatorID] DEFAULT ((0)),
[FCreateDate] [datetime] NOT NULL,
[FEditorID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Machine_FEditorID] DEFAULT ((0)),
[FEditDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_Machine] ADD CONSTRAINT [PK_t_Mes_Basic_Machine] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'机台基础信息', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门id（对应 t_Mes_Basic_Dept 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用（0未启用，1已启用）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'序列号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', 'COLUMN', N'FSerialNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'状态（对应 t_Mes_Sys_KeyValue 的 MachineStatus ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Machine', 'COLUMN', N'FStatus'
GO
