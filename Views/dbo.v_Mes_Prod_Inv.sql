SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-04-29
-- Description:	
-- 在制品库存
-- =============================================
CREATE View [dbo].[v_Mes_Prod_Inv] 
As
	
	Select head.FInterID
			, head.FMissionID, mis.FMOInterID, mis.FMoBillNo, mis.FSoBillNo
			-- 车间
			--, mis.FWorkShop, mis.FWorkShopName, mis.FWorkShopNumber
			-- MES 同步后的车间
			, workshop.FItemID FWorkShop, workshop.FName FWorkShopName, workshop.FNumber FWorkShopNumber
			, head.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
			, head.FRouteID, rout.FNumber FRouteNumber, rout.FName FRouteName
			, head.FBatchNo, head.FTotalBatchCount, head.FEntryID, head.FFullBatchNo
			, head.FTotalInputQty, head.FInputQty, head.FTotalInvCheckDeltaQty, head.FTotalTakeQty, head.FTotalDefectQty
			--, head.FStatus, kv.FValue FStatusName, kv.FKeyName FStatusNumber, kv.FColor FStatusColor
			--, head.FCreatorID, head.FCreateDate
			, head.FCurrentEntryID
			-- 生产记录状态
			, rcd.FInterID FCurrentRecordID, rcd.FStatus FRecordStatus, kvRcd.FValue FRecordStatusName, kvRcd.FKeyName FRecordStatusNumber, kvRcd.FColor FRecordStatusColor
			-- 其他数量
			, rcd.FTakeQty, rcd.FInvCheckDeltaQty
			, rcd.FDeptID FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
			-- 单位
			, unit.FItemID FUnitID, unit.FName FUnitName, unit.FNumber FUnitNumber, unit.FShortNumber FUnitShortNumber, unit.FPrecision
		From t_Mes_Prod_Flow head
		Left Join t_Mes_Prod_Mission mis On head.FMissionID = mis.FInterID
		Left Join t_Mes_Basic_Product prd On head.FProductID = prd.FItemID
		Left Join t_Mes_Tech_Route rout On head.FRouteID = rout.FInterID
		Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'FlowStatus' And kv.FKey = head.FStatus
		Left Join t_Mes_Prod_Record rcd On head.FInterID = rcd.FFlowID And head.FCurrentEntryID = rcd.FEntryID
		Left Join t_Mes_Sys_KeyValue kvRcd On kvRcd.FNumber = 'RecordStatus' And kvRcd.FKey = IsNull(rcd.FStatus, 0)
		Left Join t_Mes_Basic_Dept workshop On head.FWorkShop = workshop.FItemID
		Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
		Left Join t_Mes_Basic_Unit unit On head.FUnitUUID = unit.UUID
		Where kv.FKeyName = 'Producing' And (kvRcd.FKeyName = 'ManufProducing' Or kvRcd.FKeyName = 'ManufTransfered')

GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-在制品库存', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '当前分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FCurrentEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '当前生产记录id（对应 t_Mes_Prod_Record 的 FInterID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FCurrentRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '盘点盈亏数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FInvCheckDeltaQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FMOInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '小数位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FPrecision'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产记录状态', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FRecordStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产记录状态颜色', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FRecordStatusColor'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产记录状态名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FRecordStatusName'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产记录状态编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FRecordStatusNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线id（对应 t_Mes_Tech_Route 的 FInterID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FRouteName'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FRouteNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '取走数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FTakeQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '总批数', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FTotalBatchCount'
GO
EXEC sp_addextendedproperty N'MS_Description', '总投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FTotalInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FUnitNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位短码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FUnitShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Inv', 'COLUMN', N'FWorkShopNumber'
GO
