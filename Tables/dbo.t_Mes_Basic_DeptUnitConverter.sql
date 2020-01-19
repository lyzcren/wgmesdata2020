CREATE TABLE [dbo].[t_Mes_Basic_DeptUnitConverter]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Basic_DeptUnitConverter_Guid] DEFAULT (newid()),
[FItemID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FDeptID] [int] NOT NULL,
[FPriority] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_DeptUnitConverter] ADD CONSTRAINT [PK_t_Mes_Basic_DeptUnitConverter_1] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
