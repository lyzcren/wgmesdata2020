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
CREATE View [dbo].[v_Mes_Prod_DefectRepair]
As
	Select repair.FInterID
		, repair.FTotalQty
		, repair.FFlowID, flow.FBatchNo, flow.FFullBatchNo
		, repair.FMissionID, miss.FMoBillNo, miss.FSoBillNo
		, miss.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel, prd.FErpClsID, kv.FValue FErpClsName
		, repair.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, repair.FCreateDate
		-- 撤销记录信息
		, repair.FCancellation, repair.FCancellationUserID, cancellator.FName FCancellationUserName, cancellator.FNumber FCancellationUserNumber
		, repair.FCancellationDate
	From dbo.t_Mes_Prod_DefectRepair repair
	Left Join t_Mes_Prod_Flow flow On repair.FFlowID = flow.FInterID
	Left Join t_Mes_Prod_Mission miss On repair.FMissionID = miss.FInterID
	Left Join t_Mes_Basic_Product prd On miss.FProductID = prd.FItemID
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'ErpCls' And kv.FKey = prd.FErpClsID
	Left Join t_Mes_UM_User creator On repair.FCreatorID = creator.FItemID
	Left Join t_Mes_UM_User cancellator On repair.FCancellationUserID = cancellator.FItemID



GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良返修', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否作废', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FCancellationUserName'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FCancellationUserNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ERP类别id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FErpClsID'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ERP类别', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FErpClsName'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '总数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectRepair', 'COLUMN', N'FTotalQty'
GO
