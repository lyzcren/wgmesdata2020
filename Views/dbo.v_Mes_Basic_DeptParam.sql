SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-10
-- Description:	
-- 部门默认工艺参数
-- =============================================
CREATE VIEW [dbo].[v_Mes_Basic_DeptParam] 
AS
	Select head.Guid, head.FDeptID, dept.FName FDeptName, dept.FIsActive FIsDeptActive
		, head.FParamID, para.FName FParamName
		, head.FDefaultValue, head.FEntryID, head.FIsRequired, para.FIsActive
		, para.FType, kv.FValue FTypeName, kv.FKeyName FTypeNumber, kv.FColor FTypeColor
	from t_Mes_Basic_DeptParam head
	Left Join t_Mes_Basic_Dept dept On head.FDeptID = dept.FItemID
	Left Join t_Mes_Tech_Param para On head.FParamID = para.FItemID
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'ParamType' And kv.FKey = para.FType
	


GO
EXEC sp_addextendedproperty N'MS_Description', N'基础资料-岗位工艺参数', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptParam', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺参数默认值', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptParam', 'COLUMN', N'FDefaultValue'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptParam', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptParam', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptParam', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺参数id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptParam', 'COLUMN', N'FParamID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺参数名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptParam', 'COLUMN', N'FParamName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptParam', 'COLUMN', N'Guid'
GO
