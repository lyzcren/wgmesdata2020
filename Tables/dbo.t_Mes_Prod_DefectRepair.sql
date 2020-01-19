CREATE TABLE [dbo].[t_Mes_Prod_DefectRepair]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FMissionID] [int] NOT NULL,
[FFlowID] [int] NOT NULL,
[FTotalQty] [decimal] (18, 4) NOT NULL,
[FCreatorID] [int] NULL,
[FCreateDate] [datetime] NULL,
[FCancellation] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_DefectRepair_FCancellation] DEFAULT ((0)),
[FCancellationUserID] [int] NULL,
[FCancellationDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_DefectRepair] ADD CONSTRAINT [PK_t_Mes_Prod_DefectRepair] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良返修主表', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepair', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepair', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepair', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepair', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepair', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepair', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepair', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepair', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepair', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'总返修数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectRepair', 'COLUMN', N'FTotalQty'
GO
