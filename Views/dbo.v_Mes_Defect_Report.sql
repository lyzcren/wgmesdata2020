SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2020-04-02
-- Description:	
-- 不良报废记录
-- =============================================
CREATE View [dbo].[v_Mes_Defect_Report]
As
	Select head.FInterID, head.FBillNo, head.FDate
		-- 岗位信息
		, dept.FItemID FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		-- 状态
		, head.FStatus, kvStatus.FValue FStatusName, kvStatus.FKeyName FStatusNumber, kvStatus.FColor FStatusColor
		-- 数量、汇报结果
		, head.FReportQty, head.FMoRptInterID, head.FMoRptBillNo
		-- 创建信息
		, creator.FItemID FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, head.FCreateDate
		-- 修改信息
		, editor.FItemID FEditorID, editor.FName FEditorName, editor.FNumber FEditorNumber, head.FEditDate
		-- 审核信息
		, checker.FItemID FCheckerID, checker.FName FCheckerName, checker.FNumber FCheckerNumber, head.FCheckDate
		-- 撤销记录信息
		, head.FCancellation, head.FCancellationUserID, cancellator.FName FCancellationUserName, cancellator.FNumber FCancellationUserNumber
		, head.FCancellationDate
		, head.FComments
	From dbo.t_Mes_Defect_Report head
	Left Join dbo.t_Mes_Basic_Dept dept On head.FDeptID = dept.FItemID
	Left Join t_Mes_Sys_KeyValue kvStatus On kvStatus.FNumber = 'ReportStatus' And kvStatus.FKey = head.FStatus
	Left Join t_Mes_UM_User creator On head.FCreatorID = creator.FItemID
	Left Join dbo.t_Mes_UM_User editor On head.FEditorID = editor.FItemID
	Left Join dbo.t_Mes_UM_User checker On head.FCheckerID = checker.FItemID
	Left Join t_Mes_UM_User cancellator On head.FCancellationUserID = cancellator.FItemID

GO
EXEC sp_addextendedproperty N'MS_Description', N'不良报废单', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Defect_Report', NULL, NULL
GO
