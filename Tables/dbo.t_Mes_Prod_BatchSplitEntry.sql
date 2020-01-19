CREATE TABLE [dbo].[t_Mes_Prod_BatchSplitEntry]
(
[ID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FFlowID] [int] NOT NULL,
[FQty] [decimal] (18, 4) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_BatchSplitEntry] ADD CONSTRAINT [PK_t_Mes_Prod_BatchSplitEntry] PRIMARY KEY CLUSTERED  ([ID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生成-分批记录明细表', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplitEntry', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分批后的流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分批后流程单的数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id（对应t_Mes_Prod_BatchSplit的id）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_BatchSplitEntry', 'COLUMN', N'ID'
GO
