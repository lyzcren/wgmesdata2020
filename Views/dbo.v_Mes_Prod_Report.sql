SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-09-08
-- Description:	
-- 汇报单
-- =============================================
CREATE View [dbo].[v_Mes_Prod_Report] 
As
	Select head.FInterID, head.FBillNo
		, dept.FItemID FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, head.FStatus, kvStatus.FValue FStatusName, kvStatus.FKeyName FStatusNumber
		, creator.FItemID FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, head.FCreateDate
		, editor.FItemID FEditorID, editor.FName FEditorName, editor.FNumber FEditorNumber, head.FEditDate
		, head.FCheckerID, chr.FName FCheckerName, chr.FNumber FCheckerNumber, head.FCheckDate
		, head.FMoRptInterID, head.FMoRptBillNo
		, head.FComments
	From t_Mes_Prod_Report head
	Left Join dbo.t_Mes_Basic_Dept dept On head.FDeptID = dept.FItemID
	Left Join t_Mes_UM_User creator On head.FCreatorID = creator.FItemID
	Left Join t_Mes_UM_User editor On head.FEditorID = editor.FItemID
	Left Join t_Mes_UM_User chr On head.FCheckerID = chr.FItemID
	Left Join t_Mes_Sys_KeyValue kvStatus On kvStatus.FNumber = 'ReportStatus' And kvStatus.FKey = head.FStatus

GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-汇报记录', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCheckerName'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCheckerNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '备注', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FStatusName'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FStatusNumber'
GO
