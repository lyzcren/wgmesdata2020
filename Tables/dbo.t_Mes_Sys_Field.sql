CREATE TABLE [dbo].[t_Mes_Sys_Field]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FField] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FIsShow] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Sys_Field_FIsShow] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Sys_Field] ADD CONSTRAINT [PK_t_Mes_Sys_Field] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
