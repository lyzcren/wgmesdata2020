CREATE TABLE [dbo].[t_Mes_Tech_DefectDept]
(
[FDefectID] [int] NOT NULL,
[FDeptID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Tech_DefectDept_FDeptID] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Tech_DefectDept] ADD CONSTRAINT [PK_t_Mes_Tech_DefectDept] PRIMARY KEY CLUSTERED  ([FDefectID], [FDeptID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺-不良类型对应岗位表。
该表存储指定不良类型可用于指定岗位（多岗位），供工艺路线等其它模块使用。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_DefectDept', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'不良类型id（对应 t_Mes_Tech_Defect 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_DefectDept', 'COLUMN', N'FDefectID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id（对应 t_Mes_Basic_Dept 的 FItemID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Tech_DefectDept', 'COLUMN', N'FDeptID'
GO
