SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-03-07
-- Description:	
-- 工艺路线
-- =============================================
CREATE View [dbo].[v_Mes_Tech_Route]
As
	Select rout.FInterID,rout.FNumber,rout.FName
      ,rout.FIsActive, rout.FStatus, kv.FValue FStatusName, kv.FKeyName FStatusNumber
      ,rout.FCreatorID, usrc.FName FCreatorName, usrc.FNumber FCreatorNumber, rout.FCreateDate
      ,rout.FEditorID, usre.FName FEditorName, usre.FNumber FEditorNumber, rout.FEditDate
      ,rout.FCheckerID,rout.FCheckDate
      ,rout.FComments
	From dbo.t_Mes_Tech_Route rout
		Left Join dbo.t_Mes_Sys_KeyValue kv On kv.FNumber = 'RouteStatus' And kv.FKey = rout.FStatus
		Left Join dbo.t_Mes_UM_User usrc On rout.FCreatorID = usrc.FItemID
		Left Join dbo.t_Mes_UM_User usre On rout.FEditorID = usre.FItemID

GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-工艺路线', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '审核日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', '备注', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FEditorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '修改人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FEditorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否启用', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', '名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', '编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FStatusName'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Tech_Route', 'COLUMN', N'FStatusNumber'
GO
