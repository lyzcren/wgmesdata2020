CREATE TABLE [dbo].[t_Mes_Basic_DeptWorkTime]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Basic_DeptWorkTime_Guid] DEFAULT (newid()),
[FDeptID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FWorkTimeID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_DeptWorkTime] ADD CONSTRAINT [PK_t_Mes_Basic_DeptWorkTime] PRIMARY KEY CLUSTERED  ([FDeptID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'车间班次、岗位班次', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptWorkTime', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门id（对应 t_Mes_Basic_Dept 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptWorkTime', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptWorkTime', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'班次id（对应 t_Mes_Basic_WorkTime 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptWorkTime', 'COLUMN', N'FWorkTimeID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptWorkTime', 'COLUMN', N'Guid'
GO
