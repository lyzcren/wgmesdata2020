CREATE TABLE [dbo].[t_Mes_Prod_Flow]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FMissionID] [int] NOT NULL,
[FProductID] [int] NOT NULL,
[FPriority] [int] NOT NULL,
[FRouteID] [int] NOT NULL,
[FBatchNo] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FTotalBatchCount] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FFullBatchNo] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FTotalInputQty] [decimal] (18, 4) NOT NULL,
[FInputQty] [decimal] (18, 4) NOT NULL,
[FIsRepair] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Flow_FIsRepair] DEFAULT ((0)),
[FIsFromBatchChange] [bit] NULL CONSTRAINT [DF_t_Mes_Prod_Flow_FIsFromBatchChange] DEFAULT ((0)),
[FFirstFlowID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Flow_FFirstFlowID] DEFAULT ((0)),
[FStatus] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Flow_FStatus] DEFAULT ((0)),
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FCurrentEntryID] [int] NULL,
[FTotalTakeQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Flow_FTotalTakeQty] DEFAULT ((0)),
[FTotalInvCheckDeltaQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Flow_FInvCheckDeltaQty] DEFAULT ((0)),
[FTotalDefectQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Flow_FTotalInvCheckDeltaQty1] DEFAULT ((0)),
[FWorkEndDate] [datetime] NULL CONSTRAINT [DF_t_Mes_Prod_Flow_FWorkEndDate] DEFAULT ((0)),
[FMoRptInterID] [int] NULL,
[FMoRptBillNo] [varchar] (256) COLLATE Chinese_PRC_CI_AS NULL,
[FMoRptEntryID] [int] NULL,
[FUnitUUID] [uniqueidentifier] NULL,
[FUnitID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Flow_FUnitID] DEFAULT ((0)),
[FUnitName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FWorkShop] [int] NULL CONSTRAINT [DF_t_Mes_Prod_Flow_FWorkShop1] DEFAULT ((0)),
[FCancellation] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Flow_FCancellation] DEFAULT ((0)),
[FStatusBeforeCancel] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_Flow] ADD CONSTRAINT [PK_t_Mes_Prod_Flow_1] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-流程单主表。
该表存储所有流程单信息，一般在开流程单时插入记录，流程单返修、分批、合批等重新生产流程单时亦会插入记录。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'主批号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'当前生产记录分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FCurrentEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'投产时流程单id（分批时记录，用于汇报）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FFirstFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'当前批号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'当前批次投入数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否批次调整单（分合批）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FIsFromBatchChange'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否返修单', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FIsRepair'
GO
EXEC sp_addextendedproperty N'MS_Description', N'任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'汇报单单号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FMoRptBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'汇报单分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FMoRptEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'汇报单id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FMoRptInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'优先级', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FPriority'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线id（对应t_Mes_Tech_Route 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'状态（对应 t_Mes_Sys_KeyValue 的 FlowStatus ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', N'总批数', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FTotalBatchCount'
GO
EXEC sp_addextendedproperty N'MS_Description', N'盘点盈亏数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FTotalDefectQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'主批次总投入数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FTotalInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'盘点盈亏数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FTotalInvCheckDeltaQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'总取走数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FTotalTakeQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位UUID', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FUnitUUID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'完工日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FWorkEndDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Flow', 'COLUMN', N'FWorkShop'
GO
