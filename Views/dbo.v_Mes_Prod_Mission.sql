SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-04-26
-- Description:	
-- 已同步的生产任务单
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_Mission] 
AS
	Select mis.FInterID, mis.FDate, mis.FPlanFinishDate
			, mis.FSoInterID, mis.FSoBillNo, mis.FSoEntryID
			, mis.FMoInterID, mis.FMoBillNo, mis.FMoQty
			, mis.FAuxInHighLimitQty, mis.FAuxInLowLimitQty
			, mis.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel, prd.FErpClsID, kv.FValue FErpClsName
			, mis.FPriority, mis.FPlanQty, mis.FInputQty, mis.FFinishQty, mis.FPassQty, mis.FRepairPassQty, mis.FScrapQty
			, mis.FUnitID, mis.FUnitName, mis.FUnitUUID
			, mis.FParentModel, mis.FWorkShop, mis.FWorkShopNumber, mis.FWorkShopName
			, dept.FItemID FWorkShopID
			, mis.FStatus
			, mis.FCreatorID, mis.FCreateDate
			, mis.FCheckerID, mis.FCheckDate
			, mis.FErpSyncDate, mis.FComments
			-- 自定义字段
			, mis.FMesSelf001, mis.FMesSelf002, mis.FMesSelf003, mis.FMesSelf004, mis.FMesSelf005
			, mis.FMesSelf006, mis.FMesSelf007, mis.FMesSelf008, mis.FMesSelf009, mis.FMesSelf010
			/*, mis.FRouteID*/, prd.FRouteID
			, rout.FName FRoutingName, rout.FNumber FRoutingNumber
			-- 精度
			, prd.FQtyDecimal
		from t_Mes_Prod_Mission mis
		Left Join t_Mes_Basic_Product prd On mis.FProductID = prd.FItemID
		Left Join t_Mes_Tech_Route rout On prd.FRouteID = rout.FInterID
		Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'ErpCls' And kv.FKey = prd.FErpClsID
		Left Join t_Mes_Basic_Dept dept On dept.FIsFromErp = 1 And mis.FWorkShop = dept.FErpID

GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产任务单', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '完工上限', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FAuxInHighLimitQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '完工下限', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FAuxInLowLimitQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', '备注', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FDate'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ERP类别id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FErpClsID'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ERP类别', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FErpClsName'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ERP同步日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FErpSyncDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '完工数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FFinishQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段1', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMesSelf001'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段2', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMesSelf002'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段3', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMesSelf003'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段4', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMesSelf004'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段5', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMesSelf005'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段6', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMesSelf006'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段7', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMesSelf007'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段8', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMesSelf008'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段9', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMesSelf009'
GO
EXEC sp_addextendedproperty N'MS_Description', '自定义字段10', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMesSelf010'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMoInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FMoQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '附件型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FParentModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '良品数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FPassQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '计划完工日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FPlanFinishDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '计划数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FPlanQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '优先级', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FPriority'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量精度', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FQtyDecimal'
GO
EXEC sp_addextendedproperty N'MS_Description', '返修良品数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FRepairPassQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线id（对应 t_Mes_Tech_Route 的 FInterID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FRoutingName'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FRoutingNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '报废数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FScrapQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单分录id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FSoEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FSoInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位唯一id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FUnitUUID'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FWorkShopID'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Mission', 'COLUMN', N'FWorkShopNumber'
GO
