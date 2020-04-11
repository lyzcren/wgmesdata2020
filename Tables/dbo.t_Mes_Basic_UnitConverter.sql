CREATE TABLE [dbo].[t_Mes_Basic_UnitConverter]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FInUnitName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FInUnitCaseSensitive] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Basic_UnitConverter_FInUnitCaseSensitive] DEFAULT ((1)),
[FOutUnitName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FDecimal] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_UnitConverter_FDecimal] DEFAULT ((0)),
[FDecimalMode] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FConvertMode] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FFormula] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_UnitConverter] ADD CONSTRAINT [PK_t_Mes_Basic_UnitConverter] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位转换器', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'换算方式', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FConvertMode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'精度', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FDecimal'
GO
EXEC sp_addextendedproperty N'MS_Description', N'计数保留法', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FDecimalMode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'计算公式', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FFormula'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位是否区分大小写', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FInUnitCaseSensitive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FInUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'副单位', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_UnitConverter', 'COLUMN', N'FOutUnitName'
GO
