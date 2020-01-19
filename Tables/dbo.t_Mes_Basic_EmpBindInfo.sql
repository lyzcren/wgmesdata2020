CREATE TABLE [dbo].[t_Mes_Basic_EmpBindInfo]
(
[Guid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Basic_EmpBindInfo_Guid] DEFAULT (newid()),
[FEmpID] [int] NOT NULL,
[FWorkTimeID] [int] NULL,
[FMachineID] [int] NULL,
[FDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_EmpBindInfo] ADD CONSTRAINT [PK_t_Mes_Basic_EmpBindInfo] PRIMARY KEY CLUSTERED  ([Guid]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'操作员绑定的机台、班次等信息。
转序时记录，使操作员与对应的机台、班次绑定，供下次当做默认值使用。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_EmpBindInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'时间', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_EmpBindInfo', 'COLUMN', N'FDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'职员id（对应 t_Mes_Basic_Emp 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_EmpBindInfo', 'COLUMN', N'FEmpID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'机台id（对应 t_Mes_Basic_Machine 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_EmpBindInfo', 'COLUMN', N'FMachineID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'班次id（对应 t_Mes_Basic_WorkTime 的 FItemID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_EmpBindInfo', 'COLUMN', N'FWorkTimeID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'唯一id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_EmpBindInfo', 'COLUMN', N'Guid'
GO
