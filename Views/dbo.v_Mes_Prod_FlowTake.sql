SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-06-24
-- Description:	
-- 生产流程单取走记录
-- =============================================
CREATE VIEW [dbo].[v_Mes_Prod_FlowTake] 
AS
	
	Select tak.Guid, tak.FRecordID
		, rcd.FFlowID, flow.FBatchNo, flow.FFullBatchNo
		, rcd.FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
		, tak.FQty, tak.FReason
		, tak.FOperatorID, emp.FName FOperatorName, emp.FNumber FOperatorNumber
		, tak.FCreatorID, creator.FName FCreatorName, creator.FNumber FCreatorNumber, tak.FCreateDate
	from [dbo].[t_Mes_Prod_RecordTake] tak
	Left Join t_Mes_Prod_Record rcd On tak.FRecordID = rcd.FInterID
	Left Join t_Mes_Prod_Flow flow On rcd.FFlowID = flow.FInterID
	Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
	Left Join t_Mes_Basic_Emp emp On tak.FOperatorID = emp.FItemID
	Left Join t_Mes_UM_User creator On tak.FCreatorID = creator.FItemID

GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-流程单取走记录', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FCreatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '创建人编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FCreatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员id（对应 t_Mes_Basic_Emp 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FOperatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FOperatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FOperatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '原因', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FReason'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', '全局id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_FlowTake', 'COLUMN', N'Guid'
GO
