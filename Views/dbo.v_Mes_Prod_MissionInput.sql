SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-07-15
-- Description:	
-- 开流程单记录
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_MissionInput] 
AS
	
	Select head.ID
			, head.FMissionID, mis.FMOInterID, mis.FMoBillNo, mis.FSoBillNo
			-- 车间
			--, mis.FWorkShop, mis.FWorkShopName, mis.FWorkShopNumber
			-- MES 同步后的车间
			, workshop.FItemID FWorkShop, workshop.FName FWorkShopName, workshop.FNumber FWorkShopNumber
			, head.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
			, head.FPriority
			, head.FRouteID, rout.FNumber FRouteNumber, rout.FName FRouteName
			, head.FBatchNo, head.FTotalBatchCount
			, head.FInputQty
			, head.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, head.FCreateDate
			-- 撤销记录信息
			, head.FCancellation, head.FCancellationUserID, cancellator.FName FCancellationUserName, cancellator.FNumber FCancellationUserNumber
			, head.FCancellationDate
		from t_Mes_Prod_MissionInput head
		Left Join t_Mes_Prod_Mission mis On head.FMissionID = mis.FInterID
		Left Join t_Mes_Basic_Product prd On head.FProductID = prd.FItemID
		Left Join t_Mes_Tech_Route rout On head.FRouteID = rout.FInterID
		Left Join t_Mes_Basic_Dept workshop On head.FWorkShop = workshop.FItemID
		Left Join t_Mes_UM_User creator On head.FCreatorID = creator.FItemID
		Left Join t_Mes_UM_User cancellator On head.FCancellationUserID = cancellator.FItemID


GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产任务单开流程单记录', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否作废', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FCancellationUserName'
GO
EXEC sp_addextendedproperty N'MS_Description', '作废人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FCancellationUserNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FMOInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '优先级', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FPriority'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线id（对应 t_Mes_Tech_Route 的 FInterID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FRouteName'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FRouteNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '总批数', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FTotalBatchCount'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'FWorkShopNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', 'id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInput', 'COLUMN', N'ID'
GO
