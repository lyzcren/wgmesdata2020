SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2020-04-02
-- Description:	
-- 不良返修明细
-- =============================================
CREATE View [dbo].[v_Mes_Defect_RepairDetail]
As
	Select detail.FInterID, detail.FEntryID
		, detail.FDefectInvID
		, def.FItemID FDefectID, def.FName FDefectName, def.FNumber FDefectNumber
		, detail.FQty, mission.FUnitName
		, head.FRepairFlowID
		, detail.FRowComments
	From dbo.t_Mes_Defect_RepairDetail detail
		Left Join dbo.t_Mes_Defect_Repair head On detail.FInterID = head.FInterID
		Left Join dbo.t_Mes_Defect_Inv pdef On detail.FDefectInvID = pdef.FInterID
		Left Join dbo.t_Mes_Prod_Mission mission On pdef.FMissionID = mission.FInterID
		Left Join dbo.t_Mes_Tech_Defect def On pdef.FDefectID = def.FItemID
		

GO
