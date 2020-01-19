CREATE TABLE [dbo].[t_Mes_Prod_ChangeRoute]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Prod_RecordChangeRoute_Guid] DEFAULT (newid()),
[FRecordID] [int] NOT NULL,
[FRouteID] [int] NOT NULL,
[FNewRouteID] [int] NOT NULL,
[FCancelCurrentDept] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_ChangeRoute_FHoldCurrentDept] DEFAULT ((0)),
[FReason] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FCancellation] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_ChangeRoute_FCancellation] DEFAULT ((0)),
[FCancellationUserID] [int] NULL,
[FCancellationDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_ChangeRoute] ADD CONSTRAINT [PK_t_Mes_Prod_RecordChangeRoute] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-变更工艺路线主表。
流程单变更工艺路线时，会在该表生产一条记录，记录指定流程单在指定时间、岗位上的表更记录。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否取消当前岗位', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', 'COLUMN', N'FCancelCurrentDept'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'新工艺路线id（对应 t_Mes_Tech_Route 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', 'COLUMN', N'FNewRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'原因', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', 'COLUMN', N'FReason'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', 'COLUMN', N'FRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'原工艺路线id（对应 t_Mes_Tech_Route 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRoute', 'COLUMN', N'Guid'
GO
