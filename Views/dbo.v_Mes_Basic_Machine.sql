SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-10
-- Description:	
-- 机台
-- =============================================
CREATE VIEW [dbo].[v_Mes_Basic_Machine] 
AS
	SELECT mac.FItemID, mac.FNumber, mac.FSerialNumber, mac.FName
		, mac.FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, mac.FIsActive, mac.FStatus, mact.ID AS 'FMachineTypeId', mact.FMachineTypeName
	FROM t_Mes_Basic_Machine mac
	LEFT JOIN t_Mes_Basic_Dept dept ON mac.FDeptID = dept.FItemID
	LEFT JOIN t_Mes_Basic_MachineType mact ON macT.ID = mac.FMachineTypeId





GO
EXEC sp_addextendedproperty N'MS_Description', N'机台分类编号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Machine', 'COLUMN', N'FMachineTypeId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'机台分类名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Machine', 'COLUMN', N'FMachineTypeName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'基础资料-机台信息', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Machine', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Machine', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Machine', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Machine', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Machine', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'机台id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Machine', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'机台名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Machine', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'机台编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Machine', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'状态', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_Machine', 'COLUMN', N'FStatus'
GO
