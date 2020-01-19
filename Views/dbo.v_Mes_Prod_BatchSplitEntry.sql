SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-07-18
-- Description:	
-- 分批记录明细
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_BatchSplitEntry] 
AS
	SELECT detail.ID, detail.FFlowID, flow.FBatchNo, flow.FFullBatchNo
		, detail.FQty
		, workshop.FItemID FWorkShop, workshop.FName FWorkShopName, workshop.FNumber FWorkShopNumber
		, flow.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
	  FROM t_Mes_Prod_BatchSplitEntry detail 
	  Left Join t_Mes_Prod_Flow flow On detail.FFlowID = flow.FInterID
	  Left Join t_Mes_Basic_Product prd On flow.FProductID = prd.FItemID
	  Left Join t_Mes_Basic_Dept workshop On flow.FWorkShop = workshop.FItemID


GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-分批明细', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'FWorkShopNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', 'id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_BatchSplitEntry', 'COLUMN', N'ID'
GO
