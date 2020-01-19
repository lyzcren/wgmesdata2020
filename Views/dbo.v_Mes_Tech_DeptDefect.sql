SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-06-24
-- Description:	
-- 部门不良信息
-- =============================================
CREATE View [dbo].[v_Mes_Tech_DeptDefect]
As
	Select def.FItemID, def.FNumber, def.FName
		, def.FIsActive
		, defDept.FDeptID FDeptID
		, dept.FName FDeptName
		, def.FTypeID, kv.FValue FTypeName
		, def.FCreatorID, def.FCreateDate
        , def.FEditorID, def.FEditDate	 
		From dbo.t_Mes_Tech_Defect def
			Left Join t_Mes_Tech_DefectDept defDept On def.FItemID = defDept.FDefectID
			Left Join dbo.t_Mes_Basic_Dept dept On defDept.FDeptID = dept.FItemID
			Left Join dbo.t_Mes_Sys_KeyValue kv On kv.FNumber = 'DefectType' And kv.FKey = def.FTypeID


GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-岗位不良', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否启用', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', '名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', '编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '类型id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FTypeID'
GO
EXEC sp_addextendedproperty N'MS_Description', '类型', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_DeptDefect', 'COLUMN', N'FTypeName'
GO
