CREATE TABLE [dbo].[t_Mes_Prod_ChangeRouteCancel]
(
[UUID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Prod_ChangeRouteCancel_UUID] DEFAULT (newid()),
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Prod_ChangeRouteCancel_Guid] DEFAULT (newid()),
[FCancelRecordID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_ChangeRouteCancel] ADD CONSTRAINT [PK_t_Mes_Prod_ChangeRouteCancel] PRIMARY KEY CLUSTERED  ([UUID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-变更工艺路线取消的岗位记录。
变更工艺路线时，后续未生产的工艺路线均取消，另外可选“是否取消当前岗位”，取消的岗位对应生产记录记录在该表中。为后续追溯或者作废时提供依据。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRouteCancel', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'取消的生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRouteCancel', 'COLUMN', N'FCancelRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRouteCancel', 'COLUMN', N'Guid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRouteCancel', 'COLUMN', N'UUID'
GO
