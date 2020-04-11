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
EXEC sp_addextendedproperty N'MS_Description', N'单位转换适用岗位', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptUnitConverter', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptUnitConverter', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptUnitConverter', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptUnitConverter', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'优先级', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptUnitConverter', 'COLUMN', N'FPriority'
GO
EXEC sp_addextendedproperty N'MS_Description', N'全局id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptUnitConverter', 'COLUMN', N'Guid'
GO
