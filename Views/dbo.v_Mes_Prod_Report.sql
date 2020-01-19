SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-09-08
-- Description:	
-- 汇报单
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_Report] 
AS
	Select head.FInterID, head.FBillNo
		, head.FGroupBy, kv.FValue FGroupByName, kv.FKeyName FGroupByNumber, kv.FColor FGroupByColor 
		, head.FStatus, kvStatus.FValue FStatusName, kvStatus.FKeyName FStatusNumber
		, head.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, head.FCreateDate
		, head.FCheckerID, chr.FName FCheckerName, chr.FNumber FCheckerNumber, head.FCheckDate
		, head.FComments
	from t_Mes_Prod_Report head
	Left Join t_Mes_UM_User creator On head.FCreatorID = creator.FItemID
	Left Join t_Mes_UM_User chr On head.FCheckerID = chr.FItemID
	Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'ReportGroupBy' And kv.FKey = head.FGroupBy
	Left Join t_Mes_Sys_KeyValue kvStatus On kvStatus.FNumber = 'ReportStatus' And kvStatus.FKey = head.FStatus

GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-汇报记录', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCheckerName'
GO
EXEC sp_addextendedproperty N'MS_Description', '审核人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCheckerNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '备注', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '分组id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FGroupBy'
GO
EXEC sp_addextendedproperty N'MS_Description', '分组颜色', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FGroupByColor'
GO
EXEC sp_addextendedproperty N'MS_Description', '分组名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FGroupByName'
GO
EXEC sp_addextendedproperty N'MS_Description', '分组编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FGroupByNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FStatusName'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Report', 'COLUMN', N'FStatusNumber'
GO
