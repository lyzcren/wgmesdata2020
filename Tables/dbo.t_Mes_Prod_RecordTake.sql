CREATE TABLE [dbo].[t_Mes_Prod_RecordTake]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Prod_RecordTake_Guid] DEFAULT (newid()),
[FRecordID] [int] NOT NULL,
[FQty] [decimal] (18, 8) NOT NULL,
[FReason] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FOperatorID] [int] NOT NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FCancellation] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_RecordTake_FCancellation] DEFAULT ((0)),
[FCancellationUserID] [int] NULL,
[FCancellationDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_RecordTake] ADD CONSTRAINT [PK_t_Mes_Prod_RecordTake] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-取走记录。
流程单在当前岗位被取走时，在此表记录。并且修改生产记录的取走数量、流程单总取走数量等字段；若全部取走（即取走数量等于流程单当前数量），则相应的修改生产记录及流程单状态等字段。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordTake', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordTake', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordTake', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordTake', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordTake', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordTake', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'操作员id（对应 t_Mes_Basic_Emp 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordTake', 'COLUMN', N'FOperatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'取走数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordTake', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'取走原因', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordTake', 'COLUMN', N'FReason'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordTake', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordTake', 'COLUMN', N'Guid'
GO
