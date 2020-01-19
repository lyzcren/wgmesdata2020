SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-12-31
-- Description:	
-- 单位转换匹配列表
-- =============================================
CREATE VIEW [dbo].[v_Mes_Basic_UnitConverterMatch] 
AS
	
	Select detail.FItemID, detail.FEntryID, detail.FField
		,detail.FMatchType, kv.FValue FMatchTypeName, kv.FKeyName FMatchTypeNumber
		,detail.FExpression, detail.FRowComments
	From t_Mes_Basic_UnitConverterMatch detail
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'MatchType' And kv.FKey = detail.FMatchType



GO
EXEC sp_addextendedproperty N'MS_Description', N'基础资料-单位转换匹配列表', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_UnitConverterMatch', NULL, NULL
GO
