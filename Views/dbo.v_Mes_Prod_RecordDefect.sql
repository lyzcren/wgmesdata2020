SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-17
-- Description:	
-- 生产记录不良
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_RecordDefect] 
AS
	Select rdef.FInterID, rcd.FFlowID, rcd.FDeptID, rdef.fEntryID
		, rdef.FDefectID, def.FName FDefectName, def.FNumber FDefectNumber
		, rdef.FQty
		-- 单位
		, mission.FUnitUUID, mission.FUnitID, mission.FUnitName
	from t_Mes_Prod_RecordDefect rdef
	Left Join t_Mes_Prod_Record rcd On rdef.FInterID = rcd.FInterID
	Left Join t_Mes_Prod_Flow head On head.FInterID = rcd.FFlowID
	Left Join t_Mes_Prod_Mission mission On head.FMissionID = mission.FInterID
	Left Join t_Mes_Tech_Defect def On rdef.FDefectID = def.FItemID

GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产记录不良信息', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordDefect', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '不良类型id（对应 t_Mes_Tech_Defect 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordDefect', 'COLUMN', N'FDefectID'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordDefect', 'COLUMN', N'FDefectName'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordDefect', 'COLUMN', N'FDefectNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordDefect', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordDefect', 'COLUMN', N'fEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordDefect', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordDefect', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordDefect', 'COLUMN', N'FQty'
GO
