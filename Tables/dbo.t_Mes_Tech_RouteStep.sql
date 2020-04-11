CREATE TABLE [dbo].[t_Mes_Tech_RouteStep]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Tech_RouteSteps_Guid] DEFAULT (newid()),
[FInterID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FGroupID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Tech_RouteSteps_FGroupID] DEFAULT ((0)),
[FDeptID] [int] NOT NULL,
[FRequireMachine] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Tech_RouteSteps_FRequireMachine] DEFAULT ((1)),
[FAutoSign] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Tech_RouteSteps_FAutoSign] DEFAULT ((0)),
[FRequireDebugger] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Tech_RouteStep_FRequiredDebugger_1] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Tech_RouteStep] ADD CONSTRAINT [PK_t_Mes_Tech_RouteSteps] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-工艺路线具体步骤。
该表记录工艺路线每个节点（经过的岗位）具体情况，并且每个节点的额外配置信息（如是否自动签收及单位转换等）。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteStep', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否自动签收', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteStep', 'COLUMN', N'FAutoSign'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteStep', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteStep', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分组id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteStep', 'COLUMN', N'FGroupID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线id（对应 t_Mes_Tech_Route 的 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteStep', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'调机员是否必填', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteStep', 'COLUMN', N'FRequireDebugger'
GO
EXEC sp_addextendedproperty N'MS_Description', N'机台是否必填', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteStep', 'COLUMN', N'FRequireMachine'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteStep', 'COLUMN', N'Guid'
GO
