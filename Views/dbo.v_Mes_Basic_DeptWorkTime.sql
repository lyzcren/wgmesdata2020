SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-08-06
-- Description:	
-- 部门绑定班次信息
-- =============================================
CREATE VIEW [dbo].[v_Mes_Basic_DeptWorkTime] 
AS
	Select head.Guid, head.FWorkTimeID, workTime.FName FWorkTimeName, workTime.FIsActive
		, head.FDeptID
		, head.FEntryID
		, workTime.FBeginTime, workTime.FEndTime, workTime.FLastEndTime
	from t_Mes_Basic_DeptWorkTime head
	Left Join t_Mes_Basic_WorkTime workTime On head.FWorkTimeID = workTime.FItemID
	
GO
EXEC sp_addextendedproperty N'MS_Description', N'基础资料-车间/岗位班次', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptWorkTime', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'班次开始时间', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptWorkTime', 'COLUMN', N'FBeginTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptWorkTime', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'班次结束时间', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptWorkTime', 'COLUMN', N'FEndTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptWorkTime', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptWorkTime', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'班次最晚结束时间', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptWorkTime', 'COLUMN', N'FLastEndTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'班次id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptWorkTime', 'COLUMN', N'FWorkTimeID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'班次名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptWorkTime', 'COLUMN', N'FWorkTimeName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Basic_DeptWorkTime', 'COLUMN', N'Guid'
GO
