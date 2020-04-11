CREATE TABLE [dbo].[t_Mes_Basic_Unit]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FNumber] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL,
[FShortNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FPrecision] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Unit_FPrecision] DEFAULT ((0)),
[FCoefficient] [decimal] (18, 8) NOT NULL CONSTRAINT [DF_t_Mes_Basic_Unit_FIsActive] DEFAULT ((1)),
[FStandard] [bit] NOT NULL,
[FUnitGroupID] [int] NOT NULL,
[UUID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Unit_UUID] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_Unit] ADD CONSTRAINT [PK_t_Mes_Basic_Unit] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位基础资料', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Unit', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'转换率', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Unit', 'COLUMN', N'FCoefficient'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Unit', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Unit', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Unit', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'精度（小数位）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Unit', 'COLUMN', N'FPrecision'
GO
EXEC sp_addextendedproperty N'MS_Description', N'短码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Unit', 'COLUMN', N'FShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否标准单位', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Unit', 'COLUMN', N'FStandard'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位分组id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Unit', 'COLUMN', N'FUnitGroupID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'UUID', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Unit', 'COLUMN', N'UUID'
GO
