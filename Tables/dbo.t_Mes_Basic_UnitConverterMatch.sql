CREATE TABLE [dbo].[t_Mes_Basic_UnitConverterMatch]
(
[FItemID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FField] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FMatchType] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_UnitConverterMatch_FMatchType] DEFAULT ((0)),
[FExpression] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FRowComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_UnitConverterMatch] ADD CONSTRAINT [PK_t_Mes_Basic_UnitConverterRegex] PRIMARY KEY CLUSTERED  ([FItemID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位转换匹配规则', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverterMatch', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverterMatch', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'表达式', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverterMatch', 'COLUMN', N'FExpression'
GO
EXEC sp_addextendedproperty N'MS_Description', N'字段名', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverterMatch', 'COLUMN', N'FField'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位转换器id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverterMatch', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'匹配方式', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverterMatch', 'COLUMN', N'FMatchType'
GO
EXEC sp_addextendedproperty N'MS_Description', N'行备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverterMatch', 'COLUMN', N'FRowComments'
GO
