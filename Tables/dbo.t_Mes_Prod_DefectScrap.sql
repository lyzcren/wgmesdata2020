CREATE TABLE [dbo].[t_Mes_Prod_DefectScrap]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FDeptID] [int] NOT NULL,
[FDefectID] [int] NOT NULL,
[FMissionID] [int] NOT NULL,
[FQty] [decimal] (18, 4) NOT NULL,
[FStatus] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_DefectScrap_FStatus] DEFAULT ((0)),
[FCreatorID] [int] NULL,
[FCreateDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_DefectScrap] ADD CONSTRAINT [PK_t_Mes_Prod_DefectScrap] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良报废表', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectScrap', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectScrap', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectScrap', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良id（对应 t_Mes_Tech_Defect 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectScrap', 'COLUMN', N'FDefectID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id（对应 t_Mes_Basic_Dept 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectScrap', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectScrap', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectScrap', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectScrap', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'状态（预留字段，对应 t_Mes_Sys_KeyValue 的 DefectSrapStatus ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectScrap', 'COLUMN', N'FStatus'
GO
