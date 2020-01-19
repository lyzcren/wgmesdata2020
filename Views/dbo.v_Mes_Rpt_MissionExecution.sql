SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-06-19
-- Description:	
-- 任务执行情况，统计任务关联的流程单执行情况
-- =============================================
CREATE VIEW [dbo].[v_Mes_Rpt_MissionExecution] 
AS
		
	Select mis.FInterID FMissionID, mis.FMoBillNo, mis.FSoBillNo
		-- 任务单相关事件
		, mis.FDate, mis.FPlanFinishDate
		-- 任务单相关数量
		, mis.FMoQty, mis.FAuxInHighLimitQty, mis.FAuxInLowLimitQty, mis.FPlanQty
		-- 物料信息
		, mis.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
		-- 车间
		--, mis.FWorkShop, mis.FWorkShopName, mis.FWorkShopNumber
		-- MES 同步后的车间
		, workshop.FItemID FWorkShop, workshop.FName FWorkShopName, workshop.FNumber FWorkShopNumber
		-- 单位
		, mis.FUnitID, mis.FUnitName
		-- 流程单相关数量
		-- 返修/分批/已作废，不记投入数量
		, Sum(Case When flow.FIsRepair = 1 Then 0 
					When flow.FIsFromBatchChange = 1 Then 0 
					When flow.FCancellation = 1 Then 0 
					When kvFlow.FKeyName = 'Cancelled' Then 0
					Else IsNull(flow.FInputQty, 0) End) FInputQty
		-- 返修/分批/已作废，不记待生产数量
		, Sum(Case When flow.FIsRepair = 1 Then 0 
					When flow.FIsFromBatchChange = 1 Then 0 
					When flow.FCancellation = 1 Then 0 
					When kvFlow.FKeyName = 'BeforeProduce' Then IsNull(flow.FInputQty, 0)
					Else 0 End) FBeforeProduceQty
		-- 返修/分批/已作废，不记在制数量
		, Sum(Case When flow.FIsRepair = 1 Then 0 
					When flow.FIsFromBatchChange = 1 Then 0 
					When flow.FCancellation = 1 Then 0 
					When kvFlow.FKeyName = 'Producing' Then IsNull(flow.FInputQty, 0)
					Else 0 End) FProducingQty
		-- 一次良品数量，不包含返修数量
		, Sum(Case When flow.FIsRepair = 1 Then 0 
				When kvFlow.FKeyName = 'EndProduce' Then IsNull(flow.FInputQty + flow.FTotalInvCheckDeltaQty - flow.FTotalTakeQty - flow.FTotalDefectQty, 0)
				When kvFlow.FKeyName = 'Reported' Then IsNull(flow.FInputQty + flow.FTotalInvCheckDeltaQty - flow.FTotalTakeQty - flow.FTotalDefectQty, 0)
				Else 0 End) FPassQty
		-- 最终良品数，包含返修良品
		, Sum(Case When kvFlow.FKeyName = 'EndProduce' Then IsNull(flow.FInputQty + flow.FTotalInvCheckDeltaQty - flow.FTotalTakeQty - flow.FTotalDefectQty, 0)
				When kvFlow.FKeyName = 'Reported' Then IsNull(flow.FInputQty + flow.FTotalInvCheckDeltaQty - flow.FTotalTakeQty - flow.FTotalDefectQty, 0)
				Else 0 End) FPassQty2
		-- 汇报数量
		, Sum(Case When kvFlow.FKeyName = 'Reported' Then flow.FInputQty + flow.FTotalInvCheckDeltaQty - flow.FTotalTakeQty - flow.FTotalDefectQty Else 0 End) FReportQty
		---- 一次良率（不在数据库层面计算）
		--, 0 FPassRate
		---- 二次良率（不在数据库层面计算）
		--, 0 FPassRate2
	from t_Mes_Prod_Mission mis 
	Left Join t_Mes_Prod_Flow flow On flow.FMissionID = mis.FInterID -- 只记已完工的
	Left Join t_Mes_Basic_Product prd On mis.FProductID = prd.FItemID
	Left Join t_Mes_Basic_Dept workshop On mis.FWorkShop = workshop.FErpID
	Left Join t_Mes_Sys_KeyValue kvFlow On kvFlow.FNumber = 'FlowStatus' And kvFlow.FKey = flow.FStatus
	Group By mis.FInterID, mis.FMoBillNo, mis.FSoBillNo
		, mis.FDate, mis.FPlanFinishDate
		, mis.FMoQty, mis.FAuxInHighLimitQty, mis.FAuxInLowLimitQty, mis.FPlanQty
		, mis.FProductID, prd.FName, prd.FFullName, prd.FNumber, prd.FModel
		, workshop.FItemID, workshop.FName, workshop.FNumber
		, mis.FUnitID, mis.FUnitName
		, kvFlow.FKey, kvFlow.FKeyName, kvFlow.FValue


GO
EXEC sp_addextendedproperty N'MS_Description', N'报表-生产任务执行情况', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '完工上限', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FAuxInHighLimitQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '完工下限', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FAuxInLowLimitQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FMoQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '良品数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FPassQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '最终良品数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FPassQty2'
GO
EXEC sp_addextendedproperty N'MS_Description', '计划完工日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FPlanFinishDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '计划数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FPlanQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '汇报数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FReportQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_MissionExecution', 'COLUMN', N'FWorkShopNumber'
GO
