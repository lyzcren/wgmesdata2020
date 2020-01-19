CREATE TABLE [dbo].[t_Mes_Prod_MissionInput]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[FMissionID] [int] NOT NULL,
[FProductID] [int] NOT NULL,
[FPriority] [int] NOT NULL,
[FRouteID] [int] NOT NULL,
[FBatchNo] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FTotalBatchCount] [int] NOT NULL,
[FInputQty] [decimal] (18, 4) NOT NULL,
[FWorkShop] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_MissionInput_FWorkShop] DEFAULT ((0)),
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FCancellation] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_MissionInput_FCancellation] DEFAULT ((0)),
[FCancellationUserID] [int] NULL,
[FCancellationDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_MissionInput] ADD CONSTRAINT [PK_t_Mes_Prod_MissionInput] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产任务单开流程单记录主表。
每次开流程单后均有开流程单记录。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'批号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'总投入数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'优先级', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FPriority'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线id（对应 t_Mes_Tech_Route 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'总批数', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FTotalBatchCount'
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MissionInput', 'COLUMN', N'ID'
GO
