CREATE TABLE [dbo].[t_Mes_Prod_BatchSplit]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[FFlowID] [int] NOT NULL,
[FRecordID] [int] NOT NULL,
[FQty] [decimal] (18, 4) NOT NULL,
[FOperatorID] [int] NOT NULL,
[FReason] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FCancellation] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_BatchSplit_FCancellation] DEFAULT ((0)),
[FCancellationUserID] [int] NULL,
[FCancellationDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_BatchSplit] ADD CONSTRAINT [PK_t_Mes_Prod_BatchSplit] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-分批记录主表', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'做废人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'流程单id（对应 t_Mes_Prod_Flow 的FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'操作员Id（对应 t_Mes_Basic_Emp 的FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', 'COLUMN', N'FOperatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'原因', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', 'COLUMN', N'FReason'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产记录id（分批时的生产记录，对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplit', 'COLUMN', N'ID'
GO
