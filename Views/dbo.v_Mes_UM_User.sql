SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-02-18
-- Description:	
-- 用户视图
-- =============================================
CREATE View [dbo].[v_Mes_UM_User]
As
	
	Select
		u.FItemID, 
		u.FName,u.FNumber,u.FIsAdmin,
		u.FType,u.FIsActive,u.FSex,
		u.FCreatorID,u.FCreateDate,u.FEditorID,u.FEditDate,
		u.FEmail,u.FWeChat,u.FPhone,u.FContact,u.FTel,u.FFax,u.FQQ,u.FAddress,
		u.FDeptID,u.FComments, u.FIndexPage,
		u.FIdCardNumber, u.FBindEmpID, emp.FName FBindEmpName, emp.FNumber FBindEmpNumber,
		cu.FName FCreatorName, cu.FNumber FCreatorNumber, 
		uu.FName FEditorName, uu.FNumber FEditorNumber,
		emp.FIsDebugger, emp.FIsOperator
	From
		t_Mes_UM_User u
		Left Join t_Mes_UM_User cu On u.FCreatorID = cu.FItemID
		Left Join t_Mes_UM_User uu On u.FEditorID = uu.FItemID
		Left Join t_Mes_Basic_Emp emp On u.FBindEmpID = emp.FItemID

GO
EXEC sp_addextendedproperty N'MS_Description', N'用户管理-用户', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '地址', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FAddress'
GO
EXEC sp_addextendedproperty N'MS_Description', '绑定操作员id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FBindEmpID'
GO
EXEC sp_addextendedproperty N'MS_Description', '绑定操作员名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FBindEmpName'
GO
EXEC sp_addextendedproperty N'MS_Description', '绑定操作员编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FBindEmpNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '备注', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', '联系方式', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FContact'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FEditorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FEditorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '右键', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FEmail'
GO
EXEC sp_addextendedproperty N'MS_Description', '传真', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FFax'
GO
EXEC sp_addextendedproperty N'MS_Description', 'id卡号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FIdCardNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否启用', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否超级管理员', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FIsAdmin'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否调机员', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FIsDebugger'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否操作员', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FIsOperator'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', '名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', '编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '电话', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FPhone'
GO
EXEC sp_addextendedproperty N'MS_Description', 'QQ', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FQQ'
GO
EXEC sp_addextendedproperty N'MS_Description', '性别', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FSex'
GO
EXEC sp_addextendedproperty N'MS_Description', '手机', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FTel'
GO
EXEC sp_addextendedproperty N'MS_Description', '类别', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FType'
GO
EXEC sp_addextendedproperty N'MS_Description', '微信', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_User', 'COLUMN', N'FWeChat'
GO
