SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-09-08
-- Description:	
-- 生产流程单
-- =============================================
CREATE View [dbo].[v_Mes_Prod_ReportDetail] 
As
	
	Select detail.FInterID, detail.FEntryID, detail.FFlowID
			, IsNull(flow.FFirstFlowID, flow.FInterID) FFirstFlowID
			, flow.FMissionID, mis.FMOInterID, mis.FMoBillNo, mis.FSoBillNo
			-- MES 同步后的车间
			, workshop.FItemID FWorkShop, workshop.FName FWorkShopName, workshop.FNumber FWorkShopNumber
			, flow.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
			, flow.FPriority
			, flow.FRouteID, rout.FNumber FRouteNumber, rout.FName FRouteName
			, flow.FBatchNo, flow.FTotalBatchCount, flow.FFullBatchNo
			, flow.FTotalInputQty, flow.FInputQty, flow.FTotalInvCheckDeltaQty, flow.FTotalTakeQty, flow.FTotalDefectQty
			, flow.FCancellation
			, flow.FWorkEndDate
			, flow.FMoRptInterID, flow.FMoRptBillNo, flow.FMoRptEntryID
			-- 单位
			, flow.FUnitUUID, unit.FItemID FUnitID, unit.FName FUnitName, unit.FNumber FUnitNumber, unit.FShortNumber FUnitShortNumber, unit.FPrecision
			-- 精度
			, prd.FQtyDecimal
			, detail.FRowComments
		From t_Mes_Prod_ReportDetail detail 
		Left Join t_Mes_Prod_Flow flow On detail.FFlowID = flow.FInterID
		Left Join t_Mes_Prod_Mission mis On flow.FMissionID = mis.FInterID
		Left Join t_Mes_Basic_Product prd On flow.FProductID = prd.FItemID
		Left Join t_Mes_Tech_Route rout On flow.FRouteID = rout.FInterID
		Left Join t_Mes_Basic_Dept workshop On flow.FWorkShop = workshop.FItemID
		Left Join t_Mes_Basic_Unit unit On flow.FUnitUUID = unit.UUID


GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-汇报明细', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否作废', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '投产流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FFirstFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FMOInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '汇报单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FMoRptBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '汇报单分录id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FMoRptEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '汇报单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FMoRptInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '小数位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FPrecision'
GO
EXEC sp_addextendedproperty N'MS_Description', '优先级', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FPriority'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量精度', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FQtyDecimal'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线id（对应 t_Mes_Tech_Route 的 FInterID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FRouteName'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FRouteNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '行备注', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FRowComments'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '总批数', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FTotalBatchCount'
GO
EXEC sp_addextendedproperty N'MS_Description', '总投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FTotalInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FUnitNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位短码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FUnitShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位唯一id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FUnitUUID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完工时间', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FWorkEndDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FWorkShopNumber'
GO
