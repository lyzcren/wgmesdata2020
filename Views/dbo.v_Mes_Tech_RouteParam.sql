SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-10
-- Description:	
-- 工艺路线工艺参数
-- =============================================
CREATE VIEW [dbo].[v_Mes_Tech_RouteParam] 
AS

	Select routParam.FInterID, routParam.FRouteEntryID
		, routParam.FDeptID, dept.FName FDeptName
		, routParam.FParamID, para.FName FParamName, routParam.FDefaultValue, routParam.FIsRequired
		, para.FType, kv.FValue FTypeName, kv.FKeyName FTypeNumber, kv.FColor FTypeColor
		, para.FIsActive
		, routParam.FEntryID
		, (select Cast(FValue as Varchar) + ',' from t_Mes_Tech_ParamValue where FItemID = para.FItemID for xml path('')) FAllValues
	from t_Mes_Tech_RouteParam routParam
	Left Join t_Mes_Tech_Route rout On rout.FInterID = routParam.FInterID
	Left Join t_Mes_Basic_Dept dept On routParam.FDeptID = dept.FItemID
	Left Join t_Mes_Tech_Param para On routParam.FParamID = para.FItemID
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'ParamType' And kv.FKey = para.FType		

GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-工艺路线包含的工艺参数', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteParam', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '所有值', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteParam', 'COLUMN', N'FAllValues'
GO
EXEC sp_addextendedproperty N'MS_Description', '默认值', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteParam', 'COLUMN', N'FDefaultValue'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteParam', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteParam', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteParam', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteParam', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺参数id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteParam', 'COLUMN', N'FParamID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺参数名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteParam', 'COLUMN', N'FParamName'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线明细id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteParam', 'COLUMN', N'FRouteEntryID'
GO
