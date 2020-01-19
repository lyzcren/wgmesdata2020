SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-9
-- Description:	
-- 部门
-- =============================================
CREATE VIEW [dbo].[v_Mes_Basic_Dept] 
AS
	Select dept.FItemID, dept.FParentID, dept.FNumber, dept.FName, dept.FShortNumber, dept.FFullName, dept.FEnName
		, dept.FWorkShop
		, dept.FIsActive, dept.FCreatorID, dept.FCreateDate, dept.FEditorID, dept.FEditDate
		, dept.FTypeID, kv.FValue FTypeName, kv.FKeyName FTypeNumber
		, dept.FIsFromErp, dept.FErpID
		-- 编码规则
		, dept.FPrefix, dept.FSuffix, dept.FRepairPrefix, dept.FRepairSuffix
		, dept.FSplitInheritBatchNo, dept.FSplitPrefix, dept.FSplitSuffix
	from t_Mes_Basic_Dept dept
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'DeptType' And kv.FKey = dept.FTypeID


GO
EXEC sp_addextendedproperty N'MS_Description', N'基础资料-车间/岗位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门英文名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FEnName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ERP 同步的 ERP 部门id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FErpID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否来自 ERP 同步', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FIsFromErp'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'上级部门id（目前上级部门只有车间、所以一般为车间id），总部的上级id为0', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FParentID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'流程单前缀', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FPrefix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'返修单前缀', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FRepairPrefix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'返修单后缀', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FRepairSuffix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门短码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分批是否继承原批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FSplitInheritBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分批单前缀', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FSplitPrefix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分批单后缀', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FSplitSuffix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'流程单后缀', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FSuffix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门类型（参照 t_Mes_Sys_KeyValue 的 DeptType ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FTypeID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门类型名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FTypeName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门类型编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FTypeNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位所在车间（类型为岗位时才有）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Dept', 'COLUMN', N'FWorkShop'
GO
