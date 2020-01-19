SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-12-31
-- Description:	
-- 岗位单位转换器
-- =============================================
CREATE VIEW [dbo].[v_Mes_Basic_DeptUnitConverter] 
AS
	
	Select head.FItemID, head.FName,
		head.FInUnitName, head.FInUnitCaseSensitive,
		head.FOutUnitName,
		head.FDecimal, head.FDecimalMode,head.FConvertMode,head.FFormula,
		deptc.[Guid], deptc.FDeptID, deptc.FEntryID, deptc.FPriority,
		head.FComments,head.FCreatorID, usrc.FName FCreatorName, usrc.FNumber FCreatorNumber, head.FCreateDate
	from t_Mes_Basic_UnitConverter head
	Left Join t_Mes_Basic_DeptUnitConverter deptc On head.FItemID = deptc.FItemID
	Left Join t_Mes_UM_User usrc On head.FCreatorID = usrc.FItemID





GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位-单位转换器', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptUnitConverter', NULL, NULL
GO
