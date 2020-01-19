CREATE TABLE [dbo].[t_Mes_Prod_Mission]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FDate] [datetime] NOT NULL,
[FPlanFinishDate] [datetime] NOT NULL,
[FSOInterID] [int] NOT NULL,
[FSOBillNo] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL,
[FSOEntryID] [int] NOT NULL,
[FMOInterID] [int] NOT NULL,
[FMOBillNo] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL,
[FMOQty] [decimal] (18, 8) NOT NULL,
[FAuxInHighLimitQty] [decimal] (18, 8) NOT NULL,
[FAuxInLowLimitQty] [decimal] (18, 8) NOT NULL,
[FProductID] [int] NOT NULL,
[FPriority] [int] NOT NULL,
[FPlanQty] [decimal] (18, 8) NOT NULL,
[FInputQty] [decimal] (18, 8) NOT NULL,
[FFinishQty] [decimal] (18, 8) NOT NULL,
[FPassQty] [decimal] (18, 8) NOT NULL,
[FRepairPassQty] [decimal] (18, 8) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Mission_FRepairPassQty] DEFAULT ((0)),
[FScrapQty] [decimal] (18, 8) NOT NULL,
[FUnitUUID] [uniqueidentifier] NULL,
[FUnitID] [int] NOT NULL,
[FUnitName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FUnitRate2] [decimal] (18, 4) NOT NULL,
[FUnitID2] [int] NOT NULL,
[FUnitName2] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FParentModel] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FWorkShop] [int] NULL,
[FWorkShopNumber] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FWorkShopName] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FStatus] [int] NOT NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FCheckerID] [int] NULL,
[FCheckDate] [datetime] NULL,
[FErpSyncDate] [datetime] NULL,
[FComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FRouteID] [int] NULL,
[FMesSelf001] [varchar] (128) COLLATE Chinese_PRC_CI_AS NULL,
[FMesSelf002] [varchar] (128) COLLATE Chinese_PRC_CI_AS NULL,
[FMesSelf003] [varchar] (128) COLLATE Chinese_PRC_CI_AS NULL,
[FMesSelf004] [varchar] (128) COLLATE Chinese_PRC_CI_AS NULL,
[FMesSelf005] [varchar] (128) COLLATE Chinese_PRC_CI_AS NULL,
[FMesSelf006] [varchar] (128) COLLATE Chinese_PRC_CI_AS NULL,
[FMesSelf007] [varchar] (128) COLLATE Chinese_PRC_CI_AS NULL,
[FMesSelf008] [varchar] (128) COLLATE Chinese_PRC_CI_AS NULL,
[FMesSelf009] [varchar] (128) COLLATE Chinese_PRC_CI_AS NULL,
[FMesSelf010] [varchar] (128) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_Mission] ADD CONSTRAINT [PK_t_Mes_Prod_MOPlan] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产任务单主表。
生产任务单目前通过从ERP同步而来。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'完工上限', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FAuxInHighLimitQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'完工下限', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FAuxInLowLimitQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'审核日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'审核人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ERP 同步日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FErpSyncDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'完工数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FFinishQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'投入数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'任务单id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'MES 自定义字段', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMesSelf001'
GO
EXEC sp_addextendedproperty N'MS_Description', N'MES 自定义字段', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMesSelf002'
GO
EXEC sp_addextendedproperty N'MS_Description', N'MES 自定义字段', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMesSelf003'
GO
EXEC sp_addextendedproperty N'MS_Description', N'MES 自定义字段', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMesSelf004'
GO
EXEC sp_addextendedproperty N'MS_Description', N'MES 自定义字段', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMesSelf005'
GO
EXEC sp_addextendedproperty N'MS_Description', N'MES 自定义字段', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMesSelf006'
GO
EXEC sp_addextendedproperty N'MS_Description', N'MES 自定义字段', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMesSelf007'
GO
EXEC sp_addextendedproperty N'MS_Description', N'MES 自定义字段', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMesSelf008'
GO
EXEC sp_addextendedproperty N'MS_Description', N'MES 自定义字段', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMesSelf009'
GO
EXEC sp_addextendedproperty N'MS_Description', N'MES 自定义字段', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMesSelf010'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产订单单号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMOBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产订单id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMOInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产订单数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FMOQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'父件型号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FParentModel'
GO
EXEC sp_addextendedproperty N'MS_Description', N'良品数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FPassQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'计划完工日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FPlanFinishDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'计划数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FPlanQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'优先级', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FPriority'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'返修良品数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FRepairPassQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'默认工艺路线id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'报废数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FScrapQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'销售订单号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FSOBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'销售订单分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FSOEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'销售订单id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FSOInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'状态', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'副单位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FUnitID2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'副单位转换率', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FUnitRate2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位UUID', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FUnitUUID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Mission', 'COLUMN', N'FWorkShopNumber'
GO
