CREATE TABLE [dbo].[t_Mes_Prod_RecordDefect]
(
[FInterID] [int] NOT NULL,
[FDefectID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FQty] [decimal] (18, 4) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_RecordDefect] ADD CONSTRAINT [PK_t_Mes_Prod_RecordDefect] PRIMARY KEY CLUSTERED  ([FInterID], [FDefectID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产记录不良信息表。
每个生产记录均有其对应的不良品信息，该表数据在转序时产生，转序时由操作员填入的不良品信息存储在该表中。并且在拒收重新转序时，会清空对应生产记录原来的不良信息，重新存入新的不良信息。
当要查找流程单的不良品信息或者指定岗位的不良品信息时，可以在该表中查询。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordDefect', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良类型id（对应 t_Mes_Tech_Defect 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordDefect', 'COLUMN', N'FDefectID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordDefect', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordDefect', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordDefect', 'COLUMN', N'FQty'
GO
