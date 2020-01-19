CREATE TABLE [dbo].[t_Mes_Prod_DefectRepairEntry]
(
[FInterID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FDefectInvID] [int] NOT NULL,
[FDeptID] [int] NOT NULL,
[FDefectID] [int] NOT NULL,
[FQty] [decimal] (18, 4) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_DefectRepairEntry] ADD CONSTRAINT [PK_t_Mes_Prod_DefectRepairEntry] PRIMARY KEY CLUSTERED  ([FInterID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良返修明细表', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepairEntry', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良id（对应 t_Mes_Tech_Defect 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FDefectID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良库存id（对应 t_Mes_Prod_Defect 的 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FDefectInvID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id（对应 t_Mes_Basic_Dept 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id（对应主表id）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FQty'
GO
