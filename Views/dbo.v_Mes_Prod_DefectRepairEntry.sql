SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-22
-- Description:	
-- 不良返修记录
-- =============================================
CREATE View [dbo].[v_Mes_Prod_DefectRepairEntry]
As
	Select head.FInterID, detail.FDefectInvID
		, dept.FItemID FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, def.FItemID FDefectID, def.FName FDefectName, def.FNumber FDefectNumber
		, head.FFlowID, flow.FBatchNo, flow.FFullBatchNo
		, head.FMissionID, miss.FMoBillNo, miss.FSoBillNo
		, miss.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel, prd.FErpClsID, kv.FValue FErpClsName
		, detail.FQty
		, head.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, head.FCreateDate
		-- 撤销记录信息
		, head.FCancellation, head.FCancellationUserID, cancellator.FName FCancellationUserName, cancellator.FNumber FCancellationUserNumber
		, head.FCancellationDate
	From dbo.t_Mes_Prod_DefectRepair head
	Left Join t_Mes_Prod_DefectRepairEntry detail On head.FInterID = detail.FInterID
	Left Join dbo.t_Mes_Basic_Dept dept On detail.FDeptID = dept.FItemID
	Left Join t_Mes_Tech_Defect def	On detail.FDefectID = def.FItemID
	Left Join t_Mes_Prod_Flow flow On head.FFlowID = flow.FInterID
	Left Join t_Mes_Prod_Mission miss On head.FMissionID = miss.FInterID
	Left Join t_Mes_Basic_Product prd On miss.FProductID = prd.FItemID
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'ErpCls' And kv.FKey = prd.FErpClsID
	Left Join t_Mes_UM_User creator On head.FCreatorID = creator.FItemID
	Left Join t_Mes_UM_User cancellator On head.FCancellationUserID = cancellator.FItemID



GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良返修明细', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否作废', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FCancellationUserName'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FCancellationUserNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良类型id（对应 t_Mes_Tech_Defect 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FDefectID'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良库存id（对应 t_Mes_Prod_Defect 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FDefectInvID'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FDefectName'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FDefectNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ERP类别id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FErpClsID'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ERP类别', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FErpClsName'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepairEntry', 'COLUMN', N'FSoBillNo'
GO
