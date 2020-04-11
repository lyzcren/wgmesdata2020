SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-17
-- Description:	
-- 不良库存
-- =============================================
CREATE View [dbo].[v_Mes_Defect_Inv] 
As
	Select pdef.FInterID, pdef.FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, pdef.FDefectID, defect.FName FDefectName, defect.FNumber FDefectNumber
		, pdef.FMissionID, mission.FSoBillNo, mission.FMoBillNo
		--, mission.FWorkShop, mission.FWorkShopName, mission.FWorkShopNumber
			-- MES 同步后的车间
		, workshop.FItemID FWorkShop, workshop.FName FWorkShopName, workshop.FNumber FWorkShopNumber
		, mission.FProductID, prd.FName FProductName, prd.FNumber FProductNumber, prd.FModel FProductModel
		, mission.FUnitName, mission.FUnitID
		, pdef.FQty, pdef.FRepairQty, pdef.FScrapQty, pdef.FDivertQty
		, pdef.FQty - pdef.FRepairQty - pdef.FScrapQty - pdef.FDivertQty + pdef.FInvCheckDeltaQty FCurrentQty
		, pdef.FInvCheckDeltaQty
	From t_Mes_Defect_Inv pdef
	Left Join t_Mes_Basic_Dept dept On pdef.FDeptID = dept.FItemID
	Left Join t_Mes_Tech_Defect defect On pdef.FDefectID = defect.FItemID
	Left Join t_Mes_Prod_Mission mission On pdef.FMissionId = mission.FInterID
	Left Join t_Mes_Basic_Product prd On mission.FProductID = prd.FItemID
	Left Join t_Mes_Basic_Dept workshop On mission.FWorkShop = workshop.FItemID
	


GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良品库存', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '当前数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FCurrentQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良类型id（对应 t_Mes_Tech_Defect 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FDefectID'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FDefectName'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FDefectNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '转移数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FDivertQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '盘点盈亏数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FInvCheckDeltaQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '返修数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FRepairQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '报废数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FScrapQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FWorkShop'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FWorkShopName'
GO
EXEC sp_addextendedproperty N'MS_Description', '车间编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Inv', 'COLUMN', N'FWorkShopNumber'
GO
