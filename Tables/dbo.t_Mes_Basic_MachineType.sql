CREATE TABLE [dbo].[t_Mes_Basic_MachineType]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[FMachineTypeName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FManufacturer] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FSpecificationModel] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_MachineType] ADD CONSTRAINT [PK_t_Mes_Basic_MachineType] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'机器类别名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_MachineType', 'COLUMN', N'FMachineTypeName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'厂商', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_MachineType', 'COLUMN', N'FManufacturer'
GO
EXEC sp_addextendedproperty N'MS_Description', N'规格型号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_MachineType', 'COLUMN', N'FSpecificationModel'
GO
EXEC sp_addextendedproperty N'MS_Description', N'机器类别编号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_MachineType', 'COLUMN', N'ID'
GO
