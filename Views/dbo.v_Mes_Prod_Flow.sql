SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-04-29
-- Description:	
-- 生产流程单
-- =============================================
CREATE View [dbo].[v_Mes_Prod_Flow] 
As
	
	Select head.FInterID, IsNull(head.FFirstFlowID, head.FInterID) FFirstFlowID
			, head.FMissionID, mis.FMOInterID, mis.FMoBillNo, mis.FSoBillNo
			-- 车间
			--, mis.FWorkShop, mis.FWorkShopName, mis.FWorkShopNumber
			-- MES 同步后的车间
			, workshop.FItemID FWorkShop, workshop.FName FWorkShopName, workshop.FNumber FWorkShopNumber
			-- 生产任务单其他字段
			, mis.FMesSelf001, mis.FMesSelf002, mis.FMesSelf003, mis.FMesSelf004, mis.FMesSelf005
			, mis.FMesSelf006, mis.FMesSelf007, mis.FMesSelf008, mis.FMesSelf009, mis.FMesSelf010
			, head.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
			, head.FPriority
			, head.FRouteID, rout.FNumber FRouteNumber, rout.FName FRouteName
			, head.FBatchNo, head.FTotalBatchCount, head.FEntryID, head.FFullBatchNo
			, head.FStatus, kv.FValue FStatusName, kv.FKeyName FStatusNumber, kv.FColor FStatusColor
			-- 当前岗位
			, head.FCurrentEntryID
			, rcd.FInterID FCurrentRecordID
			, rcd.FDeptID FCurrentDeptID, dept.FName FCurrentDeptName, dept.FNumber FCurrentDeptNumber
			-- 生产记录状态
			, rcd.FStatus FCurrentRecordStatus, kvRcd.FValue FCurrentRecordStatusName, kvRcd.FKeyName FCurrentRecordStatusNumber, kvRcd.FColor FCurrentRecordStatusColor
			-- 流程单数量
			, head.FTotalInputQty, head.FInputQty
			, head.FTotalTakeQty, head.FTotalInvCheckDeltaQty, head.FTotalDefectQty
			-- 单位
			, mis.FUnitUUID, mis.FUnitID, mis.FUnitName
			-- 精度
			, prd.FQtyDecimal
			, head.FWorkEndDate
			, head.FMoRptInterID, head.FMoRptBillNo, head.FMoRptEntryID
			, head.FCreatorID, head.FCreateDate
			, head.FCancellation
			---- 岗位相关数量
			--, rcd.FTakeQty, rcd.FInvCheckDeltaQty
			---- 生产记录数量
			--, rcd.FInputQty FRecordInputQty, rcd.FPassQty FRecordPassQty
		From t_Mes_Prod_Flow head
		Left Join t_Mes_Prod_Mission mis On head.FMissionID = mis.FInterID
		Left Join t_Mes_Basic_Product prd On head.FProductID = prd.FItemID
		Left Join t_Mes_Tech_Route rout On head.FRouteID = rout.FInterID
		Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'FlowStatus' And kv.FKey = head.FStatus
		Left Join t_Mes_Prod_Record rcd On head.FInterID = rcd.FFlowID And head.FCurrentEntryID = rcd.FEntryID
		Left Join t_Mes_Sys_KeyValue kvRcd On kvRcd.FNumber = 'RecordStatus' And kvRcd.FKey = rcd.FStatus
		Left Join t_Mes_Basic_Dept workshop On head.FWorkShop = workshop.FItemID
		Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
		Left Join t_Mes_Basic_UnitConverter converter On rcd.FUnitConverterID = converter.FItemID
		

GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-流程单', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否作废', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '当前岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FCurrentDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '当前岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FCurrentDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '当前岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FCurrentDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '当前分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FCurrentEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '当前生产记录id（对应 t_Mes_Prod_Record 的 FInterID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FCurrentRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '投产流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FFirstFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段1', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMesSelf001'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段2', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMesSelf002'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段3', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMesSelf003'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段4', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMesSelf004'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段5', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMesSelf005'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段6', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMesSelf006'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段7', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMesSelf007'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段8', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMesSelf008'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段9', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMesSelf009'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段10', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMesSelf010'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMOInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '汇报单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMoRptBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '汇报单分录id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMoRptEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '汇报单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FMoRptInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '优先级', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FPriority'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量精度', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FQtyDecimal'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线id（对应 t_Mes_Tech_Route 的 FInterID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FRouteName'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FRouteNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态颜色', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FStatusColor'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FStatusName'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FStatusNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '总批数', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FTotalBatchCount'
GO
EXEC sp_addextendedproperty N'MS_Description', '总投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FTotalInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '总取走数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FTotalTakeQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位唯一id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FUnitUUID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完工时间', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FWorkEndDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Flow', 'COLUMN', N'FWorkShopNumber'
GO
