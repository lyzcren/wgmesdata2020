CREATE TABLE [dbo].[t_Mes_Prod_RecordRefundReproduce]
(
[UUID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Prod_RecordRefundReproduce_UUID] DEFAULT (newid()),
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Prod_RecordRefundReproduce_Guid] DEFAULT (newid()),
[FRefundRecordID] [int] NOT NULL,
[FReproduceRecordID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_RecordRefundReproduce] ADD CONSTRAINT [PK_t_Mes_Prod_RecordRefundReproduce] PRIMARY KEY CLUSTERED  ([UUID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-流程单退回重做岗位记录表。
流程单在退回指定岗位时，若当前岗位与即将退回的岗位中间经过多个岗位，则可以指定中间岗位是否重做。该表存储的便是重做岗位的记录。指定重做岗位后，系统不会覆盖原有的生产记录，而是对应岗位会多插入一条新的生产记录，此表同时也会记录岗位重做前的生产记录id与重做的生产记录id。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefundReproduce', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'被退回（需要重做）的生产记录id（对应 t_Mes_Prod_Record 的 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefundReproduce', 'COLUMN', N'FRefundRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'重新生产的新的生产记录id（待重做）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefundReproduce', 'COLUMN', N'FReproduceRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'退回记录id（对应 t_Mes_Prod_RecordRefund 的 Guid）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefundReproduce', 'COLUMN', N'Guid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordRefundReproduce', 'COLUMN', N'UUID'
GO
