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
CREATE VIEW [dbo].[v_Mes_Prod_ChangeRoute] 
AS
	SELECT head.Guid, head.FRecordID, rcd.FFlowID, flow.FBatchNo, flow.FFullBatchNo
		, workshop.FItemID FWorkShop, workshop.FName FWorkShopName, workshop.FNumber FWorkShopNumber
		, dept.FItemID FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, flow.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
		-- 工艺路线
		, rout.FInterID FRouteID, rout.FName FRouteName, rout.FNumber FRouteNumber
		, newRout.FInterID FNewRouteID, newRout.FName FNewRouteName, newRout.FNumber FNewRouteNumber
		, head.FCancelCurrentDept, head.FReason
		, head.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, head.FCreateDate
		-- 撤销记录信息
		, head.FCancellation, head.FCancellationUserID, cancellator.FName FCancellationUserName, cancellator.FNumber FCancellationUserNumber
		, head.FCancellationDate
	  FROM t_Mes_Prod_ChangeRoute head 
	  Left Join t_Mes_Prod_Record rcd On head.FRecordID = rcd.FInterID
	  Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
	  Left Join t_Mes_Prod_Flow flow On rcd.FFlowID = flow.FInterID
	  Left Join t_Mes_Basic_Product prd On flow.FProductID = prd.FItemID
	  Left Join t_Mes_Basic_Dept workshop On flow.FWorkShop = workshop.FItemID
	  Left Join t_Mes_Tech_Route rout On head.FRouteID = rout.FInterID
	  Left Join t_Mes_Tech_Route newRout On head.FNewRouteID = newRout.FInterID
	  Left Join t_Mes_UM_User creator On head.FCreatorID = creator.FItemID
	  Left Join t_Mes_UM_User cancellator On head.FCancellationUserID = cancellator.FItemID


GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-变更工艺路线', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否取消当前岗位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FCancelCurrentDept'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否作废', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FCancellationUserName'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FCancellationUserNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '新工艺路线id（对应 t_Mes_Tech_Route 的 FInterID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FNewRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', '新工艺路线名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FNewRouteName'
GO
EXEC sp_addextendedproperty N'MS_Description', '新工艺路线编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FNewRouteNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '原因', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FReason'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线id（对应 t_Mes_Tech_Route 的 FInterID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FRouteName'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FRouteNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'FWorkShopNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '全局id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ChangeRoute', 'COLUMN', N'Guid'
GO
