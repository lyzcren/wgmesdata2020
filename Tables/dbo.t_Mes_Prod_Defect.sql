CREATE TABLE [dbo].[t_Mes_Prod_Defect]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FDeptID] [int] NOT NULL,
[FDefectID] [int] NOT NULL,
[FMissionID] [int] NOT NULL,
[FQty] [decimal] (18, 4) NOT NULL,
[FRepairQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Defect_FRepairQty] DEFAULT ((0)),
[FScrapQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Defect_FScrapQty] DEFAULT ((0)),
[FDivertQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Defect_FDivertQty] DEFAULT ((0)),
[FInvCheckDeltaQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Defect_FInvCheckDeltaQty] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_Defect] ADD CONSTRAINT [PK_t_Mes_Prod_Defect_1] PRIMARY KEY CLUSTERED  ([FDeptID], [FDefectID], [FMissionID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良品库存', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Defect', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良id（对应 t_Mes_Tech_Defect 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Defect', 'COLUMN', N'FDefectID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id（对应 t_Mes_Basic_Dept 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Defect', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'转移数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Defect', 'COLUMN', N'FDivertQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Defect', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'盘点盈亏数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Defect', 'COLUMN', N'FInvCheckDeltaQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Defect', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Defect', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'返修数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Defect', 'COLUMN', N'FRepairQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'报废数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Defect', 'COLUMN', N'FScrapQty'
GO
