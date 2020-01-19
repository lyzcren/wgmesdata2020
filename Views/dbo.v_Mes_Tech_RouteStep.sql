SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-03-09
-- Description:	
-- 工艺路线详情
-- =============================================
CREATE View [dbo].[v_Mes_Tech_RouteStep]
As
	Select step.FInterID, step.FEntryID, step.FGroupID
			, step.FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
			, step.FRequireMachine, step.FAutoSign, step.FRequireDebugger
		From t_Mes_Tech_RouteStep step
			Left Join dbo.t_Mes_Basic_Dept dept On step.FDeptID = dept.FItemID

GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-工艺路线节点', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteStep', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '是否自动签收', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteStep', 'COLUMN', N'FAutoSign'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteStep', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteStep', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteStep', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteStep', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '分组id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteStep', 'COLUMN', N'FGroupID'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteStep', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '机台是否必选', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_RouteStep', 'COLUMN', N'FRequireMachine'
GO
