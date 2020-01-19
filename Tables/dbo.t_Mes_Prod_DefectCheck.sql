CREATE TABLE [dbo].[t_Mes_Prod_DefectCheck]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FBillNo] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FDate] [datetime] NOT NULL,
[FTotalDeltaQty] [decimal] (18, 8) NOT NULL,
[FStatus] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_DefectCheck_FStatus] DEFAULT ((0)),
[FDeptID] [int] NOT NULL,
[FCheckerID] [int] NULL,
[FCheckDate] [datetime] NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_DefectCheck] ADD CONSTRAINT [PK_t_Mes_Prod_DefectCheck] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良盘点主表', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'单号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', 'COLUMN', N'FBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'审核日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'审核人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', 'COLUMN', N'FDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id（对应 t_Mes_Basic_Dept 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'状态（对应 t_Mes_Sys_KeyValue 的 DefectCheckStatus ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', N'总盈亏数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_DefectCheck', 'COLUMN', N'FTotalDeltaQty'
GO
