SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2020-04-18
-- Description:	
-- 不良转移记录
-- =============================================
CREATE View [dbo].[v_Mes_Defect_Transfer]
As
	Select head.FInterID, head.FBillNo, head.FDate
		-- 岗位信息
		, deptOut.FItemID FOutDeptID, deptOut.FName FOutDeptName, deptOut.FNumber FOutDeptNumber
		, deptIn.FItemID FInDeptID, deptIn.FName FInDeptName, deptIn.FNumber FInDeptNumber
		-- 状态
		, head.FStatus, kvStatus.FValue FStatusName, kvStatus.FKeyName FStatusNumber, kvStatus.FColor FStatusColor
		-- 创建信息
		, creator.FItemID FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, head.FCreateDate
		-- 修改信息
		, editor.FItemID FEditorID, editor.FName FEditorName, editor.FNumber FEditorNumber, head.FEditDate
		-- 审核信息
		, signer.FItemID FSignerID, signer.FName FSignerName, signer.FNumber FSignerNumber, head.FSignDate
		-- 撤销记录信息
		, head.FCancellation, head.FCancellationUserID, cancellator.FName FCancellationUserName, cancellator.FNumber FCancellationUserNumber
		, head.FCancellationDate
		, head.FComments
	From dbo.t_Mes_Defect_Transfer head
	Left Join dbo.t_Mes_Basic_Dept deptOut On head.FOutDeptID = deptOut.FItemID
	Left Join dbo.t_Mes_Basic_Dept deptIn On head.FInDeptID = deptIn.FItemID
	Left Join t_Mes_Sys_KeyValue kvStatus On kvStatus.FNumber = 'DefectTransferStatus' And kvStatus.FKey = head.FStatus
	Left Join t_Mes_UM_User creator On head.FCreatorID = creator.FItemID
	Left Join dbo.t_Mes_UM_User editor On head.FEditorID = editor.FItemID
	Left Join dbo.t_Mes_UM_User signer On head.FSignerID = signer.FItemID
	Left Join t_Mes_UM_User cancellator On head.FCancellationUserID = cancellator.FItemID


GO
