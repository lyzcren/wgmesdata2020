SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-09-08
-- Description:	
-- 汇报单明细
-- =============================================
CREATE View [dbo].[v_Mes_Prod_ReportDetail] 
As
	
	Select detail.FInterID, detail.FEntryID, detail.FInvID
			, inv.FMissionID, mis.FMOInterID, mis.FMoBillNo, mis.FSoBillNo
			-- MES 同步后的车间
			, inv.FWorkShop, inv.FWorkShopName, inv.FWorkShopNumber
			, inv.FProductID, inv.FProductName, inv.FProductFullName, inv.FProductNumber, inv.FProductModel
			, inv.FBatchNo, inv.FFullBatchNo, inv.FSourceBillNo
			, inv.FQty, inv.FReportedQty, detail.FReportingQty
			-- 单位
			, inv.FUnitUUID, inv.FUnitID, inv.FUnitName
			, detail.FRowComments
		From t_Mes_Prod_ReportDetail detail 
		Left Join v_Mes_Prod_PassInv inv On detail.FInvID = inv.FInterID
		Left Join t_Mes_Prod_Mission mis On inv.FMissionID = mis.FInterID


GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-汇报明细', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FMOInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '行备注', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FRowComments'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位唯一id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FUnitUUID'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_ReportDetail', 'COLUMN', N'FWorkShopNumber'
GO
