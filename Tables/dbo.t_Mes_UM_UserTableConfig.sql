CREATE TABLE [dbo].[t_Mes_UM_UserTableConfig]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FUserID] [int] NOT NULL,
[FKey] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FSize] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FTableLayout] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_UM_UserTableConfig] ADD CONSTRAINT [PK_t_Mes_UM_UserTableConfig] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
