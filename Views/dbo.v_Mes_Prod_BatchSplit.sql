SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-07-18
-- Description:	
-- 分批记录
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_BatchSplit] 
AS
	SELECT head.ID, head.FRecordID, rcd.FFlowID, flow.FBatchNo, flow.FFullBatchNo
		, workshop.FItemID FWorkShop, workshop.FName FWorkShopName, workshop.FNumber FWorkShopNumber
		, dept.FItemID FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, flow.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
		-- 操作员
		, head.FQty , head.FOperatorID, emp.FName FOperatorName, emp.FNumber FOperatorNumber
		, head.FReason
		, head.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, head.FCreateDate
		-- 撤销记录信息
		, head.FCancellation, head.FCancellationUserID, cancellator.FName FCancellationUserName, cancellator.FNumber FCancellationUserNumber
		, head.FCancellationDate
	  FROM t_Mes_Prod_BatchSplit head 
	  Left Join t_Mes_Prod_Record rcd On head.FRecordID = rcd.FInterID
	  Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
	  Left Join t_Mes_Prod_Flow flow On rcd.FFlowID = flow.FInterID
	  Left Join t_Mes_Basic_Product prd On flow.FProductID = prd.FItemID
	  Left Join t_Mes_Basic_Dept workshop On flow.FWorkShop = workshop.FItemID
	  Left Join t_Mes_Basic_Emp emp On head.FOperatorID = emp.FItemID
	  Left Join t_Mes_UM_User creator On head.FCreatorID = creator.FItemID
	  Left Join t_Mes_UM_User cancellator On head.FCancellationUserID = cancellator.FItemID


GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-分批', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FCancellationUserName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FCancellationUserNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'流程单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'操作员id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FOperatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'操作员名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FOperatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'操作员编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FOperatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分批总数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'原因', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FReason'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产记录id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间短码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'FWorkShopNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分批单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplit', 'COLUMN', N'ID'
GO
