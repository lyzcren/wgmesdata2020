SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-30
-- Description:	
-- 不良盘点单表头
-- =============================================
CREATE VIEW [dbo].[v_Mes_Defect_Check] 
AS
	
	Select head.FInterID, head.FBillNo, head.FDate, head.FTotalDeltaQty
		, head.FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, head.FStatus, kv.FValue FStatusName, kv.FKeyName FStatusNumber, kv.FColor FStatusColor
		, head.FCheckerID, chr.FName FCheckerName, chr.FNumber FCheckerNumber, head.FCheckDate
		, head.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, head.FCreateDate
		, head.FComments
	from t_Mes_Defect_Check head
	Left Join t_Mes_Basic_Dept dept On head.FDeptID = dept.FItemID
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'DefectCheckStatus' And kv.FKey = head.FStatus
	Left Join t_Mes_UM_User chr On head.FCheckerID = chr.FItemID
	Left Join t_Mes_UM_User creator On head.FCreatorID = creator.FItemID



GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-不良盘点', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FCheckerName'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FCheckerNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '备注', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态颜色', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FStatusColor'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FStatusName'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FStatusNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '总盈亏数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Check', 'COLUMN', N'FTotalDeltaQty'
GO
