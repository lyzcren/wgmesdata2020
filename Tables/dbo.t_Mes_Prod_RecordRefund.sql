CREATE TABLE [dbo].[t_Mes_Prod_RecordRefund]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Prod_RecordRefund_Guid] DEFAULT (newid()),
[FRecordID] [int] NOT NULL,
[FRefundRecordID] [int] NOT NULL,
[FReason] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FOperatorID] [int] NOT NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_RecordRefund] ADD CONSTRAINT [PK_t_Mes_Prod_RecordRefund] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-流程单退回主记录表。
流程单退回实际上就是退回时流程单所在岗位生产记录的退回操作，所以该表记录的是生产记录的退回操作，一般是当前生产记录退回到指定的某个已完成的生产记录。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefund', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefund', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefund', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'操作员id（对应 t_Mes_Basic_Emp 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefund', 'COLUMN', N'FOperatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'退回原因', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefund', 'COLUMN', N'FReason'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefund', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'被退回的已完成的生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefund', 'COLUMN', N'FRefundRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefund', 'COLUMN', N'Guid'
GO
