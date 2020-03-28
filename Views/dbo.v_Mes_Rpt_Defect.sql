SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2020-03-27
-- Description:	
-- 不良明细
-- =============================================
CREATE View [dbo].[v_Mes_Rpt_Defect] 
As
	Select 
			-- 不良
			def.FItemID FDefectID, def.FName FDefectName, def.FNumber FDefectNumber,
			rdef.FInterID, rdef.FEntryID ,rdef.FQty,
			-- 部门
			rcd.FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
			, flow.FInterID FFlowID, flow.FMissionID, mis.FMoBillNo, mis.FSoBillNo
			, flow.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
			-- 机台
			, rcd.FMachineID, mac.FName FMachineName, mac.FNumber FMachineNumber
			-- 操作员
			, rcd.FOperatorID, emp.FName FOperatorName, emp.FNumber FOperatorNumber
			, rcd.FTransferUserID, rcd.FTransferDate, rcd.FTransferDateTime
			, Month(rcd.FTransferDate) FMonth
			, DateName(Week, rcd.FTransferDate) FWeek
			, DateAdd(Week, DateDiff(Week, 0, rcd.FTransferDate), 0) FMonday
			, DateAdd(Week, DateDiff(Week, 0, rcd.FTransferDate), 6) FSunday
			-- 单位
			, unit.FItemID FUnitID, unit.FName FUnitName, unit.FNumber FUnitNumber, unit.FShortNumber FUnitShortNumber
		From t_Mes_Prod_Record rcd
		Inner Join t_Mes_Prod_RecordDefect rdef On rcd.FInterID = rdef.FInterID
		Left Join t_Mes_Tech_Defect def On rdef.FDefectID = def.FItemID
		Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
		Left Join t_Mes_Prod_Flow flow On rcd.FFlowID = flow.FInterID
		Left Join t_Mes_Tech_Route rout On rcd.FRouteID = rout.FInterID
		Left Join t_Mes_Prod_Mission mis On flow.FMissionID = mis.FInterID
		Left Join t_Mes_Basic_Product prd On flow.FProductID = prd.FItemID
		Left Join t_Mes_Basic_Emp emp On rcd.FOperatorID = emp.FItemID 
		Left Join t_Mes_Basic_Machine mac On rcd.FMachineID = mac.FItemID
		Left Join t_Mes_Basic_Unit unit On flow.FUnitUUID = unit.UUID
		Left Join t_Mes_Sys_KeyValue kvRcd On kvRcd.FNumber = 'RecordStatus' And kvRcd.FKey = rcd.FStatus
		Where kvRcd.FKeyName = 'ManufEndProduce' And rcd.FIsCancellation = 0 And rdef.FQty > 0

GO
