SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2020-04-18
-- Description:	
-- 不良转移明细
-- =============================================
CREATE View [dbo].[v_Mes_Defect_TransferDetail]
As
	Select detail.FInterID, detail.FEntryID
		, detail.FDefectInvID
		, def.FItemID FDefectID, def.FName FDefectName, def.FNumber FDefectNumber
		, detail.FQty
		-- 任务单字段
		, mission.FMOBillNo FMoBillNo, mission.FSOBillNo FSoBillNo, mission.FUnitName
		-- 物料字段
		, prd.FItemID FProductID, prd.FName FProductName, prd.FNumber FProductNumber, prd.FModel FProductModel
		, pdef.FQty - pdef.FRepairQty - pdef.FScrapQty - pdef.FDivertQty + pdef.FInvCheckDeltaQty FCurrentQty
		, detail.FRowComments
	From dbo.t_Mes_Defect_TransferDetail detail
		Left Join dbo.t_Mes_Defect_Transfer head On detail.FInterID = head.FInterID
		Left Join dbo.t_Mes_Defect_Inv pdef On detail.FDefectInvID = pdef.FInterID
		Left Join dbo.t_Mes_Prod_Mission mission On pdef.FMissionID = mission.FInterID
		Left Join dbo.t_Mes_Basic_Product prd On mission.FProductID = prd.FItemID
		Left Join dbo.t_Mes_Tech_Defect def On pdef.FDefectID = def.FItemID
		

GO
