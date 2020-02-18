CREATE TABLE [dbo].[t_Mes_Prod_ReportDetail]
(
[FInterID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FInvID] [int] NOT NULL,
[FReportingQty] [decimal] (18, 4) NOT NULL,
[FRowComments] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_ReportDetail] ADD CONSTRAINT [PK_t_Mes_Prod_ReportDetail] PRIMARY KEY CLUSTERED  ([FInterID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-汇报记录明细表。
流程单汇报时，该表记录具体的流程单及其数量，汇报成功后，再次写入汇报单相关信息。提供已汇报流程单在追溯及反汇报操作时的依据。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ReportDetail', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ReportDetail', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'汇报单id（对应 t_Mes_Prod_Report 的 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ReportDetail', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'流程单id（对应 t_Mes_Prod_Flow 的 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ReportDetail', 'COLUMN', N'FInvID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'行备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ReportDetail', 'COLUMN', N'FRowComments'
GO
