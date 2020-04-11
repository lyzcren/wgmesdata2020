SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2020-04-02
-- Description:	
-- 不良返修记录
-- =============================================
CREATE View [dbo].[v_Mes_Defect_Repair]
As
	Select repair.FInterID, repair.FBillNo
		, repair.FRepairQty
		, repair.FMissionID, miss.FMoBillNo, miss.FSoBillNo, miss.FWorkShop, miss.FWorkShopName, miss.FWorkShopNumber
		, miss.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel, prd.FErpClsID, kv.FValue FErpClsName
		-- 岗位信息
		, dept.FItemID FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		-- 返修工艺路线
		, rout.FInterID FRouteID, rout.FName FRouteName, rout.FNumber FRouteNumber
		-- 状态
		, repair.FStatus, kvStatus.FValue FStatusName, kvStatus.FKeyName FStatusNumber, kvStatus.FColor FStatusColor
		, repair.FRepairFlowID
		-- 创建信息
		, creator.FItemID FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, repair.FCreateDate
		-- 修改信息
		, editor.FItemID FEditorID, editor.FName FEditorName, editor.FNumber FEditorNumber, repair.FEditDate
		-- 审核信息
		, checker.FItemID FCheckerID, checker.FName FCheckerName, checker.FNumber FCheckerNumber, repair.FCheckDate
		-- 撤销记录信息
		, repair.FCancellation, repair.FCancellationUserID, cancellator.FName FCancellationUserName, cancellator.FNumber FCancellationUserNumber
		, repair.FCancellationDate
		, repair.FComments
	From dbo.t_Mes_Defect_Repair repair
	Left Join t_Mes_Prod_Mission miss On repair.FMissionID = miss.FInterID
	Left Join dbo.t_Mes_Basic_Dept dept On repair.FDeptID = dept.FItemID
	Left Join t_Mes_Basic_Product prd On miss.FProductID = prd.FItemID
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'ErpCls' And kv.FKey = prd.FErpClsID
	Left Join t_Mes_Sys_KeyValue kvStatus On kvStatus.FNumber = 'RepairStatus' And kvStatus.FKey = repair.FStatus
	Left Join dbo.t_Mes_Tech_Route rout On repair.FRouteID = rout.FInterID
	Left Join t_Mes_UM_User creator On repair.FCreatorID = creator.FItemID
	Left Join dbo.t_Mes_UM_User editor On repair.FEditorID = editor.FItemID
	Left Join dbo.t_Mes_UM_User checker On repair.FCheckerID = checker.FItemID
	Left Join t_Mes_UM_User cancellator On repair.FCancellationUserID = cancellator.FItemID


GO
EXEC sp_addextendedproperty N'MS_Description', N'不良返修单', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FCancellationUserName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FCancellationUserNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FEditorName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FEditorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料类别id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FErpClsID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料类别', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FErpClsName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单据id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'任务单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'任务单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'返修数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FRepairQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FRouteName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FRouteNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'销售订单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Repair', 'COLUMN', N'FWorkShopNumber'
GO
