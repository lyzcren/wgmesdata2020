CREATE TABLE [dbo].[t_Mes_Basic_Dept]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FParentID] [int] NOT NULL,
[FNumber] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FName] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FShortNumber] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL,
[FFullName] [nvarchar] (255) COLLATE Chinese_PRC_CI_AS NULL,
[FEnName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL,
[FIsActive] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Dept_FIsActive] DEFAULT ((0)),
[FCreatorID] [int] NULL,
[FCreateDate] [datetime] NULL,
[FEditorID] [int] NULL,
[FEditDate] [datetime] NULL,
[FTypeID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Dept_FType] DEFAULT ((0)),
[FWorkShop] [int] NULL CONSTRAINT [DF_t_Mes_Basic_Dept_WorkShop] DEFAULT ((0)),
[FIsFromErp] [bit] NULL CONSTRAINT [DF_t_Mes_Basic_Dept_FIsFromErp] DEFAULT ((0)),
[FErpID] [int] NULL,
[FPrefix] [varchar] (25) COLLATE Chinese_PRC_CI_AS NULL,
[FSuffix] [varchar] (25) COLLATE Chinese_PRC_CI_AS NULL,
[FRepairPrefix] [varchar] (25) COLLATE Chinese_PRC_CI_AS NULL,
[FRepairSuffix] [varchar] (25) COLLATE Chinese_PRC_CI_AS NULL,
[FSplitInheritBatchNo] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Dept_FSplitInheritBatchNo] DEFAULT ((0)),
[FSplitPrefix] [varchar] (25) COLLATE Chinese_PRC_CI_AS NULL,
[FSplitSuffix] [varchar] (25) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_Dept] ADD CONSTRAINT [PK_t_Mes_Basic_Dept] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门基础信息表', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'英文名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FEnName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'若是从ERP导入的，则记录ERP对应的部门id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FErpID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'全称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用（0未启用，1已启用）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否来自ERP导入', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FIsFromErp'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'上级部门id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FParentID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'流程单前缀', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FPrefix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'返修单前缀', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FRepairPrefix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'返修单后缀', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FRepairSuffix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'短码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分批是否继承批号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FSplitInheritBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分批单前缀', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FSplitPrefix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分批单后缀', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FSplitSuffix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'流程单后缀', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FSuffix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门类别id（参照 t_Mes_Sys_KeyValue 的 DeptType）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FTypeID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'所属车间（已作废）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Dept', 'COLUMN', N'FWorkShop'
GO
