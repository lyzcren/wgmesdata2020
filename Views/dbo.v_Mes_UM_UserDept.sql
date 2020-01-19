SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-08-08
-- Description:	
-- 用户授权部门视图
-- =============================================
CREATE View [dbo].[v_Mes_UM_UserDept]
As
	
	Select
		usr.FItemID FUserID, dept.FItemID FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, dept.FTypeID, dept.FIsActive
	From t_Mes_UM_User usr
		, t_Mes_Basic_Dept dept
	Where Exists(Select Top 1 1 From t_Mes_UM_UserDept uDept Where usr.FItemID = uDept.FUserID And uDept.FDeptID = dept.FItemID)


GO
EXEC sp_addextendedproperty N'MS_Description', N'用户管理-用户授权部门', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_UserDept', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_UserDept', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_UserDept', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_UserDept', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否启用', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_UserDept', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', '用户id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_UM_UserDept', 'COLUMN', N'FUserID'
GO
