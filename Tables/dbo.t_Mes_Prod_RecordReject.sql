CREATE TABLE [dbo].[t_Mes_Prod_RecordReject]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[FRecordID] [int] NOT NULL,
[FReason] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FRejectDeptID] [int] NOT NULL,
[FOperatorID] [int] NOT NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_RecordReject] ADD CONSTRAINT [PK_t_Mes_Prod_RecordReject] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-拒收记录。
流程单被某个岗位拒收，即是转出岗位的生产记录被拒收，拒收时该表插入一条记录。并且对指定生产记录的状态等字段进行修改，拒收同时也会修改流程单状态。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordReject', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordReject', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordReject', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'操作员id（对应 t_Mes_Basic_Emp 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordReject', 'COLUMN', N'FOperatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'拒收原因', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordReject', 'COLUMN', N'FReason'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordReject', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'拒收岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordReject', 'COLUMN', N'FRejectDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'拒收记录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordReject', 'COLUMN', N'ID'
GO
