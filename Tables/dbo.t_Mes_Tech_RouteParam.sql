CREATE TABLE [dbo].[t_Mes_Tech_RouteParam]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Tech_RouteParam_Guid] DEFAULT (newid()),
[FInterID] [int] NOT NULL,
[FRouteEntryID] [int] NOT NULL,
[FDeptID] [int] NOT NULL,
[FParamID] [int] NOT NULL,
[FDefaultValue] [varchar] (256) COLLATE Chinese_PRC_CI_AS NULL,
[FEntryID] [int] NULL,
[FIsRequired] [bit] NULL CONSTRAINT [DF_t_Mes_Tech_RouteParam_FIsRequired] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Tech_RouteParam] ADD CONSTRAINT [PK_t_Mes_Tech_RouteParam] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-工艺路线工艺参数。
存储指定工艺路线经过岗位的工艺参数，并且可以设定工艺参数的默认值。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteParam', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'默认值', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteParam', 'COLUMN', N'FDefaultValue'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteParam', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteParam', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线id（对应 t_Mes_Tech_Route 的 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteParam', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺参数id（对应 t_Mes_Tech_Param 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteParam', 'COLUMN', N'FParamID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线明细id（对应 t_Mes_Tech_RouteSteps 的 FEntryID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteParam', 'COLUMN', N'FRouteEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_RouteParam', 'COLUMN', N'Guid'
GO
