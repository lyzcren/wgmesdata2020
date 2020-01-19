CREATE TABLE [dbo].[t_Mes_Prod_ChangeRouteEntry]
(
[UUID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Prod_ChangeRouteEntry_UUID] DEFAULT (newid()),
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Prod_ChangeRouteEntry_Guid] DEFAULT (newid()),
[FRouteEntryID] [int] NOT NULL,
[FNewRecordID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_ChangeRouteEntry] ADD CONSTRAINT [PK_t_Mes_Prod_ChangeRouteEntry] PRIMARY KEY CLUSTERED  ([UUID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-变更工艺路线新增岗位记录。
变更工艺路线时，指定新工艺路线插入的新节点存储在该表中，为后续追溯或者作废时提供依据。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRouteEntry', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'新生成的生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRouteEntry', 'COLUMN', N'FNewRecordID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线明细id（主表的FNewRouteID对应的工艺路线中的明细）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRouteEntry', 'COLUMN', N'FRouteEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRouteEntry', 'COLUMN', N'Guid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_ChangeRouteEntry', 'COLUMN', N'UUID'
GO
