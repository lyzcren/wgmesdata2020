SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-17
-- Description:	
-- 生产记录工艺参数
-- rpara
CREATE VIEW [dbo].[v_Mes_Prod_RecordParam] 
AS
	Select rpara.FInterID, rpara.FEntryID
		, rpara.FParamID, para.FName FParamName, para.FNumber FParamNumber, rpara.FIsRequired
		, rpara.FValue
		, para.FType, kv.FValue FTypeName, kv.FKeyName FTypeNumber, kv.FColor FTypeColor
	from t_Mes_Prod_RecordParam rpara
	Left Join t_Mes_Tech_Param para On rpara.FParamID = para.FItemID
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'ParamType' And kv.FKey = para.FType


GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产记录工艺参数', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordParam', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordParam', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordParam', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺参数id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordParam', 'COLUMN', N'FParamID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺参数名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordParam', 'COLUMN', N'FParamName'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺参数编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordParam', 'COLUMN', N'FParamNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '值', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordParam', 'COLUMN', N'FValue'
GO
