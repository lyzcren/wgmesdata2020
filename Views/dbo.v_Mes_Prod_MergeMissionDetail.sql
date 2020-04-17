SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2020-04-16
-- Description:	
-- 合并任务单明细
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_MergeMissionDetail] 
AS
	Select detail.FInterID, detail.FEntryID, detail.FMissionID
			, mission.FMoInterID, mission.FMoBillNo, mission.FSoInterID, mission.FSoBillNo, mission.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel, prd.FErpClsID
			, mission.FPlanQty, mission.FInputQty, mission.FAuxInHighLimitQty, mission.FAuxInLowLimitQty, mission.FUnitID, mission.FUnitName
		from t_Mes_Prod_MergeMissionDetail detail
		Left Join t_Mes_Prod_Mission mission On detail.FMissionID = mission.FInterID
		Left Join t_Mes_Basic_Product prd On mission.FProductID = prd.FItemID


GO
