CREATE TABLE [dbo].[t_Mes_Prod_MissionInputDetail]
(
[ID] [int] NOT NULL,
[FEntryID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_MissionInputDetail_FEntryID] DEFAULT ((0)),
[FFullBatchNo] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FInputQty] [decimal] (18, 4) NOT NULL,
[FFlowID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_MissionInputDetail] ADD CONSTRAINT [PK_t_Mes_Prod_MissionInputDetail] PRIMARY KEY CLUSTERED  ([ID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产任务单开流程单记录明细表。
即一次开流程单可同时开出多个流程单，此表记录每个明细流程单的开出记录。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInputDetail', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInputDetail', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInputDetail', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'明细批号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInputDetail', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'投入数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInputDetail', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInputDetail', 'COLUMN', N'ID'
GO
