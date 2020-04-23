CREATE TABLE [dbo].[t_Mes_Defect_Report]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FDeptID] [int] NOT NULL,
[FBillNo] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FReportQty] [decimal] (18, 4) NOT NULL,
[FDate] [date] NOT NULL,
[FStatus] [int] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Report_FStatus] DEFAULT ((0)),
[FComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FEditorID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Report_FEditorID] DEFAULT ((0)),
[FEditDate] [datetime] NULL,
[FCheckerID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Report_FCheckerID] DEFAULT ((0)),
[FCheckDate] [datetime] NULL,
[FCancellation] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Report_FCancellation] DEFAULT ((0)),
[FCancellationUserID] [int] NULL,
[FCancellationDate] [datetime] NULL,
[FMoRptInterID] [int] NULL,
[FMoRptBillNo] [nvarchar] (256) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Defect_Report] ADD CONSTRAINT [PK_t_Mes_Defect_Report] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'批号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'汇报单单号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FMoRptBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'汇报单id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FMoRptInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'总投入数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Report', 'COLUMN', N'FReportQty'
GO
