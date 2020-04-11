SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-30
-- Description:	
-- 不良盘点单明细
-- =============================================
CREATE View [dbo].[v_Mes_Defect_CheckDetail] 
As
	
	Select detail.FInterID, detail.FEntryID, head.FStatus
		, mission.FMoBillNo, mission.FSoBillNo
		, mission.FProductID, prd.FName FProductName, prd.FNumber FProductNumber, prd.FModel FProductModel
		, mission.FUnitID, unit.FName FUnitName
		, pdef.FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, detail.FDefectInvID, def.FItemID FDefectID, def.FName FDefectName, def.FNumber FDefectNumber
		, pdef.FQty FDefectQty, detail.FInvQty, detail.FQty, detail.FRowComments
	From t_Mes_Defect_CheckDetail detail
	Left Join t_Mes_Defect_Check head On detail.FInterID = head.FInterID
	Left Join t_Mes_Defect_Inv pdef On detail.FDefectInvID = pdef.FInterID
	Left Join t_Mes_Tech_Defect def On pdef.FDefectID = def.FItemID
	Left Join t_Mes_Prod_Mission mission On pdef.FMissionID = mission.FInterID
	Left Join t_Mes_Basic_Product prd On mission.FProductID = prd.FItemID
	Left Join t_Mes_Basic_Dept dept On pdef.FDeptID = dept.FItemID
	Left Join t_Mes_Basic_Unit unit On mission.FUnitID = unit.FItemID



GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良盘点明细', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '不良类型id（对应 t_Mes_Tech_Defect 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FDefectID'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良库存id（对应 t_Mes_Prod_Defect 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FDefectInvID'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FDefectName'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FDefectNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FDefectQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '库存数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FInvQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '行备注', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FRowComments'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_CheckDetail', 'COLUMN', N'FUnitName'
GO
