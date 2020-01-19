CREATE TABLE [dbo].[t_Mes_Prod_InvCheckDetail]
(
[FInterID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FMissionID] [int] NULL,
[FRecordID] [int] NOT NULL,
[FInvQty] [decimal] (18, 8) NOT NULL,
[FQty] [decimal] (18, 8) NOT NULL,
[FIsNew] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_InvCheckDetail_FIsNew] DEFAULT ((0)),
[FRowComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_InvCheckDetail] ADD CONSTRAINT [PK_t_Mes_Prod_InvCheckDetail] PRIMARY KEY CLUSTERED  ([FInterID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-在制品盘点明细表。
与主表通过FInterID关联', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_InvCheckDetail', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_InvCheckDetail', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_InvCheckDetail', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'库存数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_InvCheckDetail', 'COLUMN', N'FInvQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否新记录（即不存在库存信息的新批次）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_InvCheckDetail', 'COLUMN', N'FIsNew'
GO
EXEC sp_addextendedproperty N'MS_Description', N'任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_InvCheckDetail', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'盘点数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_InvCheckDetail', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_InvCheckDetail', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'行备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_InvCheckDetail', 'COLUMN', N'FRowComments'
GO
