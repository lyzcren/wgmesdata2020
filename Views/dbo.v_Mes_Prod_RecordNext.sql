SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-08
-- Description:	
-- 当前可签收的生产记录
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_RecordNext] 
AS
	Select rcd.FInterID, rcd.FFlowID, rcd.FEntryID, rcd.FDeptID
		, dept.FName FDeptName, dept.FNumber FDeptNumber, rcd.FAutoSign
	from t_Mes_Prod_Record rcd
	Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
	Where rcd.FOrder Is Null And rcd.FIsCancellation = 0
	And Not Exists(	Select Top 1 1 From t_Mes_Prod_Record rcd1 where rcd.FFlowID = rcd1.FFlowID  
						And rcd1.FOrder Is Null And rcd1.FIsCancellation = 0
						And rcd.FGroupID != rcd1.FGroupID And rcd.FGroupID > rcd1.FGroupID)


GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-流程单下一岗位节点。
即可签收岗位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordNext', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '是否自动签收', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordNext', 'COLUMN', N'FAutoSign'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordNext', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordNext', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordNext', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordNext', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordNext', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_RecordNext', 'COLUMN', N'FInterID'
GO
