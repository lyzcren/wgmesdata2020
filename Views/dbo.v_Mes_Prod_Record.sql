SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		ywlin
-- Create date: 2019-05-08
-- Description:	
-- 生产记录
-- =============================================
CREATE View [dbo].[v_Mes_Prod_Record] 
As
	
	Select rcd.FInterID, rcd.FFlowID
			, rcd.FGroupID, rcd.FEntryID
			-- 部门
			, rcd.FDeptID, dept.FName FDeptName, dept.FNumber FDeptNumber
			, rcd.FStatus, kv.FValue FStatusName, kv.FKeyName FStatusNumber, kv.FColor FStatusColor
			, rcd.FInputQty, rcd.FPassQty, rcd.FDefectQty, rcd.FRefundQty, rcd.FTakeQty, rcd.FInvCheckDeltaQty
			, flow.FMissionID, mis.FMoBillNo, mis.FSoBillNo, IsNull(flow.FFirstFlowID, flow.FInterID) FFirstFlowID, firstFlow.FBatchNo FFirstBatchNo
			, flow.FProductID, prd.FName FProductName, prd.FFullName FProductFullName, prd.FNumber FProductNumber, prd.FModel FProductModel
			, flow.FPriority			
			, flow.FBatchNo, flow.FTotalBatchCount, flow.FFullBatchNo
			, flow.FInputQty FFlowInputQty, flow.FTotalTakeQty, flow.FTotalInvCheckDeltaQty, flow.FTotalDefectQty
			, flow.FCancellation
			-- 机台
			, rcd.FMachineID, mac.FName FMachineName, mac.FNumber FMachineNumber
			-- 工艺路线
			, rcd.FRouteID, rout.FNumber FRouteNumber, rout.FName FRouteName
			, rcd.FOrder, rcd.FRouteGroupID, rcd.FRouteEntryID
			, rcd.FRequireMachine, rcd.FRequireDebugger, rcd.FAutoSign
			, Case When rcd.FOrder Is Null And Not Exists(Select Top 1 1 From t_Mes_Prod_Record rcd1 Where rcd.FFlowID = rcd1.FFlowID 
						And rcd.FRouteGroupID != rcd1.FRouteGroupID And rcd.FRouteGroupID > rcd1.FRouteGroupID) Then 1	-- 当前工序可签收
				Else 0 End FManufStatus
			, rcd.FSignUserID, signer.FName FSignUserName, rcd.FSignDate, rcd.FBeginDate
			-- 操作员
			, rcd.FOperatorID, emp.FName FOperatorName, emp.FNumber FOperatorNumber
			-- 调机员
			, rcd.FDebuggerID, debugger.FName FDebuggerName, debugger.FNumber FDebuggerNumber
			-- 时间
			, rcd.FTransferUserID, rcd.FTransferDate, rcd.FTransferDateTime
			, rcd.FProduceMinute, rcd.FStopMinute
			, rcd.FWorkTimeID, workTime.FName FWorkTimeName, workTime.FNumber FWorkTimeNumber
			-- 单位
			, mis.FUnitID, mis.FUnitName, mis.FUnitUUID
			, rcd.FIsReproduce
			-- 精度
			, prd.FQtyDecimal
			-- 单位转换相关
			, rcd.FUnitConverterID, rcd.FUnitConverterName, rcd.FConvertMode, rcd.FConvertDecimal, rcd.FConvertRate
			, rcd.FConvertInputQty, rcd.FConvertPassQty
			-- 转出单位
			, rcd.FConvertUnitName
			-- 生产任务单其他字段
			, mis.FMesSelf001, mis.FMesSelf002, mis.FMesSelf003, mis.FMesSelf004, mis.FMesSelf005
			, mis.FMesSelf006, mis.FMesSelf007, mis.FMesSelf008, mis.FMesSelf009, mis.FMesSelf010
		From t_Mes_Prod_Record rcd
		Left Join t_Mes_Basic_Dept dept On rcd.FDeptID = dept.FItemID
		Left Join t_Mes_Prod_Flow flow On rcd.FFlowID = flow.FInterID
		Left Join t_Mes_Prod_Flow firstFlow On flow.FFirstFlowID = firstFlow.FInterID
		Left Join t_Mes_Tech_Route rout On rcd.FRouteID = rout.FInterID
		Left Join t_Mes_Sys_KeyValue kv On kv.FNumber = 'RecordStatus' And kv.FKey = rcd.FStatus
		Left Join t_Mes_Prod_Mission mis On flow.FMissionID = mis.FInterID
		Left Join t_Mes_Basic_Product prd On flow.FProductID = prd.FItemID
		Left Join t_Mes_Basic_Emp emp On rcd.FOperatorID = emp.FItemID 
		Left Join t_Mes_Basic_Emp debugger On rcd.FDebuggerID = debugger.FItemID 
		Left Join t_Mes_Basic_WorkTime workTime On rcd.FWorkTimeID = workTime.FItemID
		Left Join t_Mes_Basic_Machine mac On rcd.FMachineID = mac.FItemID
		Left Join t_Mes_UM_User signer On rcd.FSignUserID = signer.FItemID		
		Left Join t_Mes_Basic_UnitConverter converter On rcd.FUnitConverterID = converter.FItemID



GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产记录', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', '是否自动签收', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FAutoSign'
GO
EXEC sp_addextendedproperty N'MS_Description', '总批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '开始时间', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FBeginDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否作废', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', '不良数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FDefectQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FDeptName'
GO
EXEC sp_addextendedproperty N'MS_Description', '岗位编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FDeptNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '分录ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单id（对应 t_Mes_Prod_Flow 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FFlowID'
GO
EXEC sp_addextendedproperty N'MS_Description', '流程单投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FFlowInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '完整批号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FFullBatchNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '分组id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FGroupID'
GO
EXEC sp_addextendedproperty N'MS_Description', '投入数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FInputQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '内联ID', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', '盘点盈亏数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FInvCheckDeltaQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '是否重新生产', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FIsReproduce'
GO
EXEC sp_addextendedproperty N'MS_Description', '机台id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FMachineID'
GO
EXEC sp_addextendedproperty N'MS_Description', '机台名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FMachineName'
GO
EXEC sp_addextendedproperty N'MS_Description', '机台编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FMachineNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产状态', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FManufStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '任务单id（对应 t_Mes_Prod_Mission 的 FInterID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FMissionID'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FMoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员id（对应 t_Mes_Basic_Emp 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FOperatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FOperatorName'
GO
EXEC sp_addextendedproperty N'MS_Description', '操作员编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FOperatorNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '排序', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FOrder'
GO
EXEC sp_addextendedproperty N'MS_Description', '良品数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FPassQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '优先级', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FPriority'
GO
EXEC sp_addextendedproperty N'MS_Description', '生产总耗时（分钟）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FProduceMinute'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料全称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FProductFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料id（对应 t_Mes_Basic_Product 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', '规格型号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FProductModel'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', '物料编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '数量精度', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FQtyDecimal'
GO
EXEC sp_addextendedproperty N'MS_Description', '退回数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FRefundQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '机台是否必选', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FRequireMachine'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线明细id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FRouteEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线分组id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FRouteGroupID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线id（对应 t_Mes_Tech_Route 的 FInterID）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FRouteName'
GO
EXEC sp_addextendedproperty N'MS_Description', '工艺路线编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FRouteNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '签收日期', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FSignDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '签收人id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FSignUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', '签收人名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FSignUserName'
GO
EXEC sp_addextendedproperty N'MS_Description', '销售订单单号', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FSoBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FStatus'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态颜色', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FStatusColor'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FStatusName'
GO
EXEC sp_addextendedproperty N'MS_Description', '状态编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FStatusNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', '停工时间（分钟）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FStopMinute'
GO
EXEC sp_addextendedproperty N'MS_Description', '取走数量', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FTakeQty'
GO
EXEC sp_addextendedproperty N'MS_Description', '总批数', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FTotalBatchCount'
GO
EXEC sp_addextendedproperty N'MS_Description', '转序日期（根据班次推算的日期，有可能非当前自然日）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FTransferDate'
GO
EXEC sp_addextendedproperty N'MS_Description', '转序时间', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FTransferDateTime'
GO
EXEC sp_addextendedproperty N'MS_Description', '转序人id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FTransferUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位id', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', '单位', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', '班次id（对应 t_Mes_Basic_WorkTime 的 FItemID ）', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FWorkTimeID'
GO
EXEC sp_addextendedproperty N'MS_Description', '班次名称', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FWorkTimeName'
GO
EXEC sp_addextendedproperty N'MS_Description', '班次编码', 'SCHEMA', N'dbo', 'VIEW', N'v_Mes_Prod_Record', 'COLUMN', N'FWorkTimeNumber'
GO
