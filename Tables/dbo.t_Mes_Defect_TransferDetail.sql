CREATE TABLE [dbo].[t_Mes_Defect_TransferDetail]
(
[FInterID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FDefectInvID] [int] NOT NULL,
[FQty] [decimal] (18, 4) NOT NULL,
[FRowComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Defect_TransferDetail] ADD CONSTRAINT [PK_t_Mes_Defect_TransferDetail] PRIMARY KEY CLUSTERED  ([FInterID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良库存id（对应 t_Mes_Prod_Defect 的 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_TransferDetail', 'COLUMN', N'FDefectInvID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_TransferDetail', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_TransferDetail', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_TransferDetail', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'行备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_TransferDetail', 'COLUMN', N'FRowComments'
GO
