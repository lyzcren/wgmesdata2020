CREATE TABLE [dbo].[t_Mes_Defect_CheckDetail]
(
[FInterID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FDefectInvID] [int] NOT NULL,
[FInvQty] [decimal] (18, 8) NOT NULL,
[FQty] [decimal] (18, 8) NOT NULL,
[FRowComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Defect_CheckDetail] ADD CONSTRAINT [PK_t_Mes_Prod_DefectCheckDetail] PRIMARY KEY CLUSTERED  ([FInterID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良盘点明细表', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_CheckDetail', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良库存id（对应 t_Mes_Prod_Defect 的 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_CheckDetail', 'COLUMN', N'FDefectInvID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_CheckDetail', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id（对应主表id）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_CheckDetail', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良库存数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_CheckDetail', 'COLUMN', N'FInvQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'盘点数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_CheckDetail', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'行备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_CheckDetail', 'COLUMN', N'FRowComments'
GO
