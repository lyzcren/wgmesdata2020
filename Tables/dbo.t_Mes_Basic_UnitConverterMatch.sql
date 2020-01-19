CREATE TABLE [dbo].[t_Mes_Basic_UnitConverterMatch]
(
[FItemID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FField] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FMatchType] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_UnitConverterMatch_FMatchType] DEFAULT ((0)),
[FExpression] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FRowComments] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_UnitConverterMatch] ADD CONSTRAINT [PK_t_Mes_Basic_UnitConverterRegex] PRIMARY KEY CLUSTERED  ([FItemID], [FEntryID]) ON [PRIMARY]
GO
