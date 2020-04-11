CREATE TABLE [dbo].[t_Mes_Defect_Repair]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FMissionID] [int] NOT NULL,
[FDeptID] [int] NOT NULL,
[FRouteID] [int] NOT NULL,
[FBillNo] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FRepairQty] [decimal] (18, 4) NOT NULL,
[FStatus] [int] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Repair_FStatus] DEFAULT ((0)),
[FComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FEditorID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Repair_FEditorID] DEFAULT ((0)),
[FEditDate] [datetime] NULL,
[FCheckerID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Repair_FCheckorID] DEFAULT ((0)),
[FCheckDate] [datetime] NULL,
[FCancellation] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Repair_FCancellation] DEFAULT ((0)),
[FCancellationUserID] [int] NULL,
[FCancellationDate] [datetime] NULL,
[FRepairFlowID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Defect_Repair] ADD CONSTRAINT [PK_t_Mes_Defect_Repair] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良返修单', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'批号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'总投入数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FRepairQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线id（对应 t_Mes_Tech_Route 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Repair', 'COLUMN', N'FRouteID'
GO
