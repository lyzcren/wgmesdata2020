SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-07-11
-- Description:	
-- 拒收记录
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_RecordReject] 
AS
	SELECT rej.ID, rej.FRecordID, rcd.FFlowID, flow.FBatchNo, flow.FFullBatchNo
		, workshop.FItemID FWorkShop, workshop.FName FWorkShopName, workshop.FNumber FWorkShopNumber
		, dept.FItemID FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, flow.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
		, rej.FRejectDeptID, rejectDept.FName FRejectDeptName, rejectDept.FNumber FRejectDeptNumber, rej.FReason
		, rej.FOperatorID, emp.FName FOperatorName, emp.FNumber FOperatorNumber
		, rej.FCreatorID, creator.FName FCreator, creator.FNumber FCreatorNumber, rej.FCreateDate
	  FROM t_Mes_Prod_RecordReject rej 
	  Left Join t_Mes_Prod_Record rcd On rej.FRecordID = rcd.FInterID
	  Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
	  Left Join t_Mes_Basic_Dept rejectDept On rej.FRejectDeptID = rejectDept.FItemID
	  Left Join t_Mes_Prod_Flow flow On rcd.FFlowID = flow.FInterID
	  Left Join t_Mes_Basic_Product prd On flow.FProductID = prd.FItemID
	  Left Join t_Mes_Basic_Dept workshop On flow.FWorkShop = workshop.FItemID
	  Left Join t_Mes_Basic_Emp emp On rej.FOperatorID = emp.FItemID
	  Left Join t_Mes_UM_User creator On rej.FCreatorID = creator.FItemID

GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-拒签记录', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FCreator'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员id（对应 t_Mes_Basic_Emp 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FOperatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FOperatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FOperatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '原因', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FReason'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', '拒签岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FRejectDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '拒签岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FRejectDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '拒签岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FRejectDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'FWorkShopNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', 'id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordReject', 'COLUMN', N'ID'
GO
