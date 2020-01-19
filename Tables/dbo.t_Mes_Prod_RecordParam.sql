CREATE TABLE [dbo].[t_Mes_Prod_RecordParam]
(
[FInterID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FParamID] [int] NOT NULL,
[FValue] [varchar] (250) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FIsRequired] [bit] NULL CONSTRAINT [DF_t_Mes_Prod_RecordParam_FIsRequired] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_RecordParam] ADD CONSTRAINT [PK_t_Mes_Prod_RecordParam_1] PRIMARY KEY CLUSTERED  ([FInterID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产-生产记录工艺参数表。
每个生产记录均有其对应的工艺参数信息，该表数据在转序时产生，转序时由操作员填入的工艺参数信息存储在该表中。流程单的所有工艺参数信息均可以在该表中查询。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordParam', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordParam', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'生产记录id（对应 t_Mes_Prod_Record 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordParam', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良类型id（对应 t_Mes_Tech_Param 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordParam', 'COLUMN', N'FParamID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'参数值', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_RecordParam', 'COLUMN', N'FValue'
GO
