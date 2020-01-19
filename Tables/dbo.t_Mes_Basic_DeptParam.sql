CREATE TABLE [dbo].[t_Mes_Basic_DeptParam]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Basic_DeptParam_Guid] DEFAULT (newid()),
[FDeptID] [int] NOT NULL,
[FParamID] [int] NOT NULL,
[FDefaultValue] [varchar] (256) COLLATE Chinese_PRC_CI_AS NULL,
[FEntryID] [int] NULL,
[FIsRequired] [bit] NULL CONSTRAINT [DF_t_Mes_Basic_DeptParam_FRequired] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_DeptParam] ADD CONSTRAINT [PK_t_Mes_Basic_DeptParam] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位工艺参数', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptParam', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'默认值', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptParam', 'COLUMN', N'FDefaultValue'
GO
EXEC sp_addextendedproperty N'MS_Description', N'部门id（对应 t_Mes_Basic_Dept 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptParam', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'分录id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptParam', 'COLUMN', N'FEntryID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'参数id（对应 t_Mes_Tech_Param 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptParam', 'COLUMN', N'FParamID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_DeptParam', 'COLUMN', N'Guid'
GO
