SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-07-15
-- Description:	
-- 开流程单记录
-- =============================================
CREATE View [dbo].[v_Mes_Prod_MissionInputDetail] 
As
	
	Select detail.ID
			, detail.FFlowID, flow.FFullBatchNo
			, flow.FTotalTakeQty, flow.FTotalInvCheckDeltaQty, flow.FTotalDefectQty
			-- 状态
			, flow.FStatus, kv.FValue FStatusName, kv.FKeyName FStatusNumber, kv.FColor FStatusColor
			, detail.FInputQty
		From t_Mes_Prod_MissionInputDetail detail
		Left Join t_Mes_Prod_Flow flow On detail.FFlowID = flow.FInterID
		Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'FlowStatus' And kv.FKey = flow.FStatus

GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产任务单开流程单明细', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInputDetail', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInputDetail', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInputDetail', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInputDetail', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInputDetail', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态颜色', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInputDetail', 'COLUMN', N'FStatusColor'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInputDetail', 'COLUMN', N'FStatusName'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInputDetail', 'COLUMN', N'FStatusNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', 'id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_MissionInputDetail', 'COLUMN', N'ID'
GO
