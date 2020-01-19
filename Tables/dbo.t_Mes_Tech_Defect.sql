CREATE TABLE [dbo].[t_Mes_Tech_Defect]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FNumber] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FIsActive] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Defect_FIsActive] DEFAULT ((1)),
[FDeptID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Tech_Defect_FDeptID] DEFAULT ((0)),
[FTypeID] [int] NOT NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FEditorID] [int] NULL,
[FEditDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Tech_Defect] ADD CONSTRAINT [PK_t_Mes_Basic_Defect] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-不良类型基础信息。
该表存储不良基础信息，供系统其它模块进行调用。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Defect', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Defect', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Defect', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id（对应 t_Mes_Basic_Dept 的 FItemID）（已作废，改为对应多岗位）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Defect', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Defect', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Defect', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Defect', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良类型id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Defect', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Defect', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Defect', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'类型id（对应 t_Mes_Sys_KeyValue 的 DefectType）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_Defect', 'COLUMN', N'FTypeID'
GO
