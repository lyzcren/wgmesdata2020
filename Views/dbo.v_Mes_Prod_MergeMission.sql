SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-04-26
-- Description:	
-- 已同步的生产任务单
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_MergeMission] 
AS
	Select mis.FInterID, mis.FMoBillNo
			, mis.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel, prd.FErpClsID
			, mis.FQty, mis.FUnitID
			, mis.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber , mis.FCreateDate
			, mis.FCancellation, mis.FCancellationDate, mis.FCancellationUserID
			, mis.FMissionID
		from t_Mes_Prod_MergeMission mis
		Left Join t_Mes_Basic_Product prd On mis.FProductID = prd.FItemID
		Left Join t_Mes_UM_User creator On mis.FCreatorID = creator.FItemID



GO
