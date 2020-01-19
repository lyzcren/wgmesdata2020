CREATE TABLE [dbo].[t_Mes_Basic_UnitConverter]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FInUnitName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FInUnitCaseSensitive] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Basic_UnitConverter_FInUnitCaseSensitive] DEFAULT ((1)),
[FOutUnitName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FDecimal] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_UnitConverter_FDecimal] DEFAULT ((0)),
[FDecimalMode] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FConvertMode] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FFormula] [varchar] (250) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FComments] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_UnitConverter] ADD CONSTRAINT [PK_t_Mes_Basic_UnitConverter] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
