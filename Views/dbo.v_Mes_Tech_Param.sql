SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-10
-- Description:	
-- 工艺参数
-- =============================================
CREATE VIEW [dbo].[v_Mes_Tech_Param] 
AS
	Select head.FItemID, head.FNumber, head.FName
		, head.FType, kv.FValue FTypeName, kv.FKeyName FTypeNumber, kv.FColor FTypeColor
		, head.FIsActive, head.FEditDate, head.FEditorID
			, (select Cast(FValue as Varchar) + ',' from t_Mes_Tech_ParamValue where FItemID = head.FItemID for xml path('')) FAllValues
		, head.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, head.FCreateDate
	from t_Mes_Tech_Param head
	Left Join t_Mes_UM_User creator On head.FCreatorID = creator.FItemID
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'ParamType' And kv.FKey = head.FType
	
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-工艺参数', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '所有值', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', 'COLUMN', N'FAllValues'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否启用', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', 'ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', '名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', '编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Param', 'COLUMN', N'FNumber'
GO
