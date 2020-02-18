SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2020-02-15
-- Description:	
-- 末岗位良品库存
-- =============================================
CREATE View [dbo].[v_Mes_Prod_PassInv] 
As
	
	SELECT 
		inv.[FInterID],inv.[FInvTypeID], kv.FKeyName FInvTypeNumber, kv.FValue FInvTypeName
		  ,inv.[FSourceInterID]
		  ,flow.FBatchNo, flow.FFullBatchNo
		  ,flow.FFullBatchNo FSourceBillNo
		  ,mission.FWorkShop, mission.FWorkShopName, mission.FWorkShopNumber
		  ,mission.FInterID FMissionID,mission.FMoBillNo
		  ,inv.[FDeptID], dept.FNumber FDeptNumber, dept.FName FDeptName
		  ,inv.[FProductID], prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
		  ,inv.[FQty]
		  ,inv.[FReportedQty]
		  ,inv.[FUnitUUID]
		  ,inv.[FUnitID]
		  ,inv.[FUnitName]
	  FROM [dbo].[t_Mes_Prod_PassInv] inv
	  Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'InvType' And inv.FInvTypeID = kv.FKey
	  Left Join t_Mes_Prod_Flow flow On inv.FSourceInterID = flow.FInterID
	  Left Join t_Mes_Prod_Mission mission On flow.FMissionID = mission.FInterID
	  Left Join t_Mes_Basic_Dept dept On inv.FDeptID = dept.FItemID
	  Left Join t_Mes_Basic_Product prd On inv.FProductID = prd.FItemID
	  Where kv.FKeyName = 'Flow' Or kv.FKeyName = 'OriginFlow'

	  Union All

	  SELECT 
		inv.[FInterID],inv.[FInvTypeID], kv.FKeyName FInvTypeNumber, kv.FValue FInvTypeName
		  ,inv.[FSourceInterID]
		  ,'' FBatchNo, '' FFullBatchNo
		  ,mission.FMOBillNo FSourceBillNo
		  ,mission.FWorkShop, mission.FWorkShopName, mission.FWorkShopNumber
		  ,mission.FInterID FMissionID,mission.FMoBillNo
		  ,inv.[FDeptID], dept.FNumber FDeptNumber, dept.FName FDeptName
		  ,inv.[FProductID], prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
		  ,inv.[FQty]
		  ,inv.[FReportedQty]
		  ,inv.[FUnitUUID]
		  ,inv.[FUnitID]
		  ,inv.[FUnitName]
	  FROM [dbo].[t_Mes_Prod_PassInv] inv
	  Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'InvType' And inv.FInvTypeID = kv.FKey
	  Left Join t_Mes_Prod_Mission mission On inv.FSourceInterID = mission.FInterID
	  Left Join t_Mes_Basic_Dept dept On inv.FDeptID = dept.FItemID
	  Left Join t_Mes_Basic_Product prd On inv.FProductID = prd.FItemID
	  Where kv.FKeyName = 'Mission'


GO
