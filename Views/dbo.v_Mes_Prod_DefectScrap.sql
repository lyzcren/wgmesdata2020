SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-22
-- Description:	
-- 不良报废记录
-- =============================================
CREATE View [dbo].[v_Mes_Prod_DefectScrap]
As
	Select repair.FInterID
		, repair.FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, repair.FDefectID, def.FName FDefectName, def.FNumber FDefectNumber
		, repair.FMissionID, miss.FMoBillNo, miss.FSoBillNo
		, miss.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel, prd.FErpClsID, kv.FValue FErpClsName
		, repair.FQty
		, repair.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, repair.FCreateDate
	From dbo.t_Mes_Prod_DefectScrap repair
	Left Join dbo.t_Mes_Basic_Dept dept On repair.FDeptID = dept.FItemID
	Left Join t_Mes_Tech_Defect def	On repair.FDefectID = def.FItemID
	Left Join t_Mes_Prod_Mission miss On repair.FMissionID = miss.FInterID
	Left Join t_Mes_Basic_Product prd On miss.FProductID = prd.FItemID
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'ErpCls' And kv.FKey = prd.FErpClsID
	Left Join t_Mes_UM_User creator On repair.FCreatorID = creator.FItemID


GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良报废', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良类型id（对应 t_Mes_Tech_Defect 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FDefectID'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FDefectName'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FDefectNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ERP类别id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FErpClsID'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ERP类别', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FErpClsName'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_DefectScrap', 'COLUMN', N'FSoBillNo'
GO
