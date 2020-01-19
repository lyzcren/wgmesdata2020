SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-03-07
-- Description:	
-- 不良信息
-- =============================================
CREATE View [dbo].[v_Mes_Tech_Defect]
As
	Select def.FItemID, def.FNumber, def.FName
		, def.FIsActive
		, (select '`' + Cast(defDept.FDeptID as Varchar) + '`' 
					from t_Mes_Tech_DefectDept defDept where def.FItemID = defDept.FDefectID for xml path('')) FDeptID
		, (select '`' + Cast(dept.FName as Varchar) + '`' 
					from t_Mes_Tech_DefectDept defDept
					Left Join dbo.t_Mes_Basic_Dept dept On defDept.FDeptID = dept.FItemID
					where def.FItemID = defDept.FDefectID for xml path('')) FDeptName
		, def.FTypeID, kv.FValue FTypeName
		, def.FCreatorID, def.FCreateDate
        , def.FEditorID, def.FEditDate	 
		From dbo.t_Mes_Tech_Defect def
			Left Join dbo.t_Mes_Sys_KeyValue kv On kv.FNumber = 'DefectType' And kv.FKey = def.FTypeID

GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-不良', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否启用', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', '名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', '编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '类型id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FTypeID'
GO
EXEC sp_addextendedproperty N'MS_Description', '类型', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Defect', 'COLUMN', N'FTypeName'
GO
