CREATE TABLE [dbo].[t_Mes_Prod_Report]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FBillNo] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FStatus] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Report_FStatus] DEFAULT ((0)),
[FGroupBy] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Report_FGroupBy] DEFAULT ((0)),
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FCheckerID] [int] NULL,
[FCheckDate] [datetime] NULL,
[FComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_Report] ADD CONSTRAINT [PK_t_Mes_Prod_FlowReport] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-汇报记录主表。
流程单汇报时，该报记录一次汇报情况。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Report', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'汇报单单号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Report', 'COLUMN', N'FBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'审核日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Report', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'审核人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Report', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Report', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Report', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Report', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分组id（对应 t_Mes_Sys_KeyValue 的 ReportGroupBy）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Report', 'COLUMN', N'FGroupBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'汇报单id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Report', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'状态（对应 t_Mes_Sys_KeyValue 的 ReportStatus）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Report', 'COLUMN', N'FStatus'
GO
