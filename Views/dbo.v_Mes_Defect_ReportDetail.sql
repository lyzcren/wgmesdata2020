SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2020-04-02
-- Description:	
-- 不良报废明细
-- =============================================
CREATE View [dbo].[v_Mes_Defect_ReportDetail]
As
	Select detail.FInterID, detail.FEntryID
		, detail.FDefectInvID
		, def.FItemID FDefectID, def.FName FDefectName, def.FNumber FDefectNumber
		, detail.FQty, mission.FUnitID, mission.FUnitName, mission.FUnitUUID
		, pdef.FMissionID, mission.FMOInterID FMoInterID, mission.FMoBillNo, mission.FSoBillNo
		, mission.FWorkShop, mission.FWorkShopName, mission.FWorkShopNumber
		, prd.FItemID FProductID, prd.FName FProductName, prd.FNumber FProductNumber, prd.FModel FProductModel
		, detail.FRowComments
		, head.FMoRptInterID, head.FMoRptBillNo
	From dbo.t_Mes_Defect_ReportDetail detail
		Left Join dbo.t_Mes_Defect_Report head On detail.FInterID = head.FInterID
		Left Join dbo.t_Mes_Defect_Inv pdef On detail.FDefectInvID = pdef.FInterID
		Left Join dbo.t_Mes_Prod_Mission mission On pdef.FMissionID = mission.FInterID
		Left Join dbo.t_Mes_Tech_Defect def On pdef.FDefectID = def.FItemID
		Left Join dbo.t_Mes_Basic_Product prd On mission.FProductID = prd.FItemID
		
GO
