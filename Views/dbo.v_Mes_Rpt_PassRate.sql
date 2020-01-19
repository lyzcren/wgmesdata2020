SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		ywlin
-- Create date: 2019-06-14
-- Description:	
-- 已完工生产记录（只记产出，用于产量、产能报表等报表计算）
-- =============================================
CREATE VIEW [dbo].[v_Mes_Rpt_PassRate] 
AS
	
	Select 
			-- 部门
			rcd.FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
			, rcd.FInputQty, rcd.FPassQty, rcd.FDefectQty
			, rcd.FRefundQty, rcd.FTakeQty, rcd.FInvCheckDeltaQty
			, flow.FMissionID, mis.FMoBillNo, mis.FSoBillNo
			, flow.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
			, flow.FInputQty FFlowInputQty
			-- 机台
			, rcd.FMachineID, mac.FName FMachineName, mac.FNumber FMachineNumber
			-- 操作员
			, rcd.FOperatorID, emp.FName FOperatorName, emp.FNumber FOperatorNumber
			, rcd.FTransferUserID, rcd.FTransferDate, rcd.FTransferDateTime
			, DATENAME(month, rcd.FTransferDate) FMonth
			, DATENAME(week, rcd.FTransferDate) FWeek
			, dateadd(week, datediff(week, 0, rcd.FTransferDate), 0) FMonday
			, dateadd(week, datediff(week, 0, rcd.FTransferDate), 6) FSunday
			, rcd.FProduceMinute, rcd.FStopMinute
			-- 良率
			, Case When rcd.FInputQty = 0 Then 0 Else rcd.FPassQty / rcd.FInputQty End FPassRate
			-- 单位
			, unit.FItemID FUnitID, unit.FName FUnitName, unit.FNumber FUnitNumber, unit.FShortNumber FUnitShortNumber
		from t_Mes_Prod_Record rcd
		Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
		Left Join t_Mes_Prod_Flow flow On rcd.FFlowID = flow.FInterID
		Left Join t_Mes_Tech_Route rout On rcd.FRouteID = rout.FInterID
		Left Join t_Mes_Prod_Mission mis On flow.FMissionID = mis.FInterID
		Left Join t_Mes_Basic_Product prd On flow.FProductID = prd.FItemID
		Left Join t_Mes_Basic_Emp emp On rcd.FOperatorID = emp.FItemID 
		Left Join t_Mes_Basic_Machine mac On rcd.FMachineID = mac.FItemID
		Left Join t_Mes_Basic_Unit unit On flow.FUnitUUID = unit.UUID
		Left Join t_Mes_Sys_KeyValue kvRcd On kvRcd.FNumber = 'RecordStatus' And kvRcd.FKey = rcd.FStatus
		Where kvRcd.FKeyName = 'ManufEndProduce' And rcd.FIsCancellation = 0


GO
EXEC sp_addextendedproperty N'MS_Description', N'报表-良率', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '不良数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FDefectQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FFlowInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '盘点盈亏数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FInvCheckDeltaQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '机台id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FMachineID'
GO
EXEC sp_addextendedproperty N'MS_Description', '机台名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FMachineName'
GO
EXEC sp_addextendedproperty N'MS_Description', '机台编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FMachineNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '周一', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FMonday'
GO
EXEC sp_addextendedproperty N'MS_Description', '月', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FMonth'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员id（对应 t_Mes_Basic_Emp 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FOperatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FOperatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FOperatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '良品数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FPassQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '良率', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FPassRate'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产总耗时（分钟）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FProduceMinute'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '退回数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FRefundQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '停工时间（分钟）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FStopMinute'
GO
EXEC sp_addextendedproperty N'MS_Description', '周日', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FSunday'
GO
EXEC sp_addextendedproperty N'MS_Description', '取走数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FTakeQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '转序日期（根据班次推算的日期，有可能非当前自然日）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FTransferDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '转序时间', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FTransferDateTime'
GO
EXEC sp_addextendedproperty N'MS_Description', '转序人id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FTransferUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FUnitNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位短码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FUnitShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '周', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Rpt_PassRate', 'COLUMN', N'FWeek'
GO
