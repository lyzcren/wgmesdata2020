CREATE TABLE [dbo].[t_Mes_Basic_Emp]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FNumber] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL,
[FIsActive] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Baisc_Emp_FIsActive] DEFAULT ((1)),
[FIsOperator] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Baisc_Emp_FIsOprator] DEFAULT ((0)),
[FIsDebugger] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Baisc_Emp_FIsDebugger] DEFAULT ((0)),
[FCreatorID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Emp_FCreatorID] DEFAULT ((0)),
[FCreateDate] [datetime] NOT NULL,
[FEditorID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Emp_FEditorID] DEFAULT ((0)),
[FEditDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_Emp] ADD CONSTRAINT [PK_t_Mes_Baisc_Emp] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'职员基础信息表', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Emp', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Emp', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Emp', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Emp', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Emp', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用（0未启用，1已启用）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Emp', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否调机员', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Emp', 'COLUMN', N'FIsDebugger'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否操作员', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Emp', 'COLUMN', N'FIsOperator'
GO
EXEC sp_addextendedproperty N'MS_Description', N'职员id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Emp', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Emp', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Emp', 'COLUMN', N'FNumber'
GO
