SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-07-11
-- Description:	
-- 取走记录
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_RecordTake] 
AS
	SELECT tak.Guid, tak.FRecordID, rcd.FFlowID, flow.FBatchNo, flow.FFullBatchNo
		, workshop.FItemID FWorkShop, workshop.FName FWorkShopName, workshop.FNumber FWorkShopNumber
		, dept.FItemID FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, flow.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
		, tak.FQty, tak.FReason
		, tak.FOperatorID, emp.FName FOperatorName, emp.FNumber FOperatorNumber
		, tak.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, tak.FCreateDate
		-- 撤销记录信息
		, tak.FCancellation, tak.FCancellationUserID, cancellator.FName FCancellationUserName, cancellator.FNumber FCancellationUserNumber
		, tak.FCancellationDate
	  FROM t_Mes_Prod_RecordTake tak 
	  Left Join t_Mes_Prod_Record rcd On tak.FRecordID = rcd.FInterID
	  Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
	  Left Join t_Mes_Prod_Flow flow On rcd.FFlowID = flow.FInterID
	  Left Join t_Mes_Basic_Product prd On flow.FProductID = prd.FItemID
	  Left Join t_Mes_Basic_Dept workshop On flow.FWorkShop = workshop.FItemID
	  Left Join t_Mes_Basic_Emp emp On tak.FOperatorID = emp.FItemID
	  Left Join t_Mes_UM_User creator On tak.FCreatorID = creator.FItemID
	  Left Join t_Mes_UM_User cancellator On tak.FCancellationUserID = cancellator.FItemID


GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-取走记录', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否作废', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FCancellationUserName'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FCancellationUserNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员id（对应 t_Mes_Basic_Emp 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FOperatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FOperatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FOperatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '原因', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FReason'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'FWorkShopNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '全局id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordTake', 'COLUMN', N'Guid'
GO
