SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-03-11
-- Description:	
-- 产品列表
-- =============================================
CREATE View [dbo].[v_Mes_Basic_ProductList] 
As
	Select  
		  prd.[FItemID], prd.[FName], prd.[FFullName], prd.[FNumber], prd.[FShortNumber]
		, prd.[FModel]
		, '' [FAlias], '' [FBrand]
		, prd.[FUnitID], prd.FUnitName, prd.FUnitNumber, prd.FUnitShortNumber
		, prd.[FUnit2ID], prd.FUnit2Name, prd.FUnit2Number, prd.FUnit2ShortNumber, prd.FUnit2Rate 
		, prd.[FIsActive], prd.[FIsBatchManage], prd.FQtyDecimal
		, prd.[FWeight]
		, prd.[FErpClsID], kv.FValue FErpClsName
		, prd.[FParentID], prd.FParentName, prd.FParentNumber
		, prd.[FRouteID], rt.FNumber FRouteNumber, rt.FName FRouteName
		, prd.[FComments] 
	From  
		dbo.t_Mes_Basic_Product prd
		Left Join dbo.t_Mes_Tech_Route rt On prd.FRouteID = rt.FInterID
		Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'ErpCls' And kv.FKey = prd.FErpClsID
		
GO
EXEC sp_addextendedproperty N'MS_Description', N'基础资料-物料信息', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'别名', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FAlias'
GO
EXEC sp_addextendedproperty N'MS_Description', N'品牌', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FBrand'
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ERP物料类别id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FErpClsID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ERP物料类别名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FErpClsName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用批次管理', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FIsBatchManage'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FModel'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'父件id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FParentID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'父件名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FParentName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'父件编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FParentNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'精度', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FQtyDecimal'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FRouteName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FRouteNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料短码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'副单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FUnit2ID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'副单位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FUnit2Name'
GO
EXEC sp_addextendedproperty N'MS_Description', N'副单位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FUnit2Number'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位转换率', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FUnit2Rate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'副单位短码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FUnit2ShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FUnitNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位短码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FUnitShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'重量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_ProductList', 'COLUMN', N'FWeight'
GO
