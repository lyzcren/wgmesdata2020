SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-23
-- Description:	
-- 在制品盘点单明细
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_InvCheckDetail] 
AS
	
	Select detail.FInterID, detail.FEntryID, head.FStatus
		, mission.FMoBillNo, mission.FSoBillNo
		, mission.FProductID, prd.FName FProductName, prd.FNumber FProductNumber, prd.FModel FProductModel
		, unit.FItemID FUnitID, unit.FName FUnitName
		, rcd.FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, detail.FMissionID, detail.FRecordID, flow.FInterID FFlowID, flow.FBatchNo, flow.FFullBatchNo
		, rcd.FInputQty, detail.FInvQty, detail.FQty
		, detail.FIsNew, detail.FRowComments
	from t_Mes_Prod_InvCheckDetail detail
	Left Join t_Mes_Prod_InvCheck head On detail.FInterID = head.FInterID
	Left Join t_Mes_Prod_Record rcd On detail.FRecordID = rcd.FInterID
	Left Join t_Mes_Prod_Flow flow On rcd.FFlowID = flow.FInterID
	Left Join t_Mes_Prod_Mission mission On detail.FMissionID = mission.FInterID
	Left Join t_Mes_Basic_Product prd On mission.FProductID = prd.FItemID
	Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
	Left Join t_Mes_Basic_Unit unit On mission.FUnitUUID = unit.UUID




GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-在制品盘点明细', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '库存数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FInvQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否新行', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FIsNew'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', '行备注', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FRowComments'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_InvCheckDetail', 'COLUMN', N'FUnitName'
GO
