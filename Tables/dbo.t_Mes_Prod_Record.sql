CREATE TABLE [dbo].[t_Mes_Prod_Record]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FFlowID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FPreRecordID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FPreRecordID] DEFAULT ((0)),
[FGroupID] [int] NOT NULL,
[FDeptID] [int] NOT NULL,
[FOperatorID] [int] NULL,
[FDebuggerID] [int] NULL,
[FStatus] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FStatus] DEFAULT ((0)),
[FInputQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FInputQty] DEFAULT ((0)),
[FPassQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FPassQty] DEFAULT ((0)),
[FDefectQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FDefectQty] DEFAULT ((0)),
[FRefundQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FRefundQty] DEFAULT ((0)),
[FTakeQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FTakeQty] DEFAULT ((0)),
[FInvCheckDeltaQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FInvCheckDeltaQty] DEFAULT ((0)),
[FOrder] [int] NULL,
[FRouteID] [int] NOT NULL,
[FRouteEntryID] [int] NOT NULL,
[FRouteGroupID] [int] NOT NULL,
[FRequireMachine] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FRequireMachine] DEFAULT ((0)),
[FRequireDebugger] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FRequireDebugger] DEFAULT ((0)),
[FAutoSign] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FAutoSign] DEFAULT ((0)),
[FSignUserID] [int] NULL,
[FSignDate] [datetime] NULL,
[FBeginDate] [datetime] NULL,
[FTransferUserID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FTransferUserID] DEFAULT ((0)),
[FTransferDateTime] [datetime] NULL,
[FTransferDate] [date] NULL,
[FProduceMinute] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FProduceMinute] DEFAULT ((0)),
[FStopMinute] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FStopMinute] DEFAULT ((0)),
[FMachineID] [int] NULL,
[FIsReproduce] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FIsReproduce] DEFAULT ((0)),
[FIsCancellation] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_Record_FIsCancellation] DEFAULT ((0)),
[FWorkTimeID] [int] NULL,
[FUnitConverterID] [int] NULL,
[FUnitConverterName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FConvertUnitName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FConvertMode] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FConvertDecimal] [int] NULL CONSTRAINT [DF_t_Mes_Prod_Record_FDecimal] DEFAULT ((0)),
[FConvertRate] [decimal] (18, 4) NULL,
[FConvertInputQty] [decimal] (18, 4) NULL CONSTRAINT [DF_t_Mes_Prod_Record_FInputQty1] DEFAULT ((0)),
[FConvertPassQty] [decimal] (18, 4) NULL CONSTRAINT [DF_t_Mes_Prod_Record_FPassQty1] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_Record] ADD CONSTRAINT [PK_t_Mes_Prod_Record] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产记录表。
每个流程单均有其对应工艺路线中每个岗位的生产记录（即生产记录=流程单+岗位），此记录在流程单开出时就已产生，在后续对流程单的签收、转序、变更工艺路线、作废、取走、分批等操作，均会作用于该表。即对流程单的操作，就是对当时流程单所在岗位的生产记录进行操作。当然，生产任务单中属于生产任务单的字段亦会相应更新。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否自动签收', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FAutoSign'
GO
EXEC sp_addextendedproperty N'MS_Description', N'开始生产时间', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FBeginDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'投入数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FConvertInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'良品数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FConvertPassQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FDefectQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id（对应 t_Mes_Basic_Dept 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id（分组下）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分组id（对应节点顺序）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FGroupID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'投入数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产记录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'盘点盈亏数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FInvCheckDeltaQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FIsCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否为重做的生产记录（一般为退回时产生的新生产记录）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FIsReproduce'
GO
EXEC sp_addextendedproperty N'MS_Description', N'机台id（对应 t_Mes_Basic_Machine 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FMachineID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'操作员id（对应 t_Mes_Basic_Emp 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FOperatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'在工艺路线节点中的排序（已完工，未完工为空或0）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FOrder'
GO
EXEC sp_addextendedproperty N'MS_Description', N'良品数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FPassQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产总耗时（分钟）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FProduceMinute'
GO
EXEC sp_addextendedproperty N'MS_Description', N'退回数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FRefundQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'机台是否必填', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FRequireMachine'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线节点明细id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FRouteEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线节点分组id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FRouteGroupID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线id（对应 t_Mes_Tech_Route 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'签收日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FSignDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'签收人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FSignUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'状态（对应 t_Mes_Sys_KeyValue 的 RecordStatus ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', N'停工时间（分钟）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FStopMinute'
GO
EXEC sp_addextendedproperty N'MS_Description', N'取走数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FTakeQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'转序日期（根据班次推算的日期，有可能非当前自然日）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FTransferDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'转序时间', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FTransferDateTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'转序人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FTransferUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'班次id（对应 t_Mes_Basic_WorkTime 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_Record', 'COLUMN', N'FWorkTimeID'
GO
