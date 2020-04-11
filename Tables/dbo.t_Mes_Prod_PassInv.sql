CREATE TABLE [dbo].[t_Mes_Prod_PassInv]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FInvTypeID] [int] NOT NULL,
[FSourceInterID] [int] NOT NULL,
[FSourceBillNo] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FDeptID] [int] NOT NULL,
[FProductID] [int] NOT NULL,
[FUnitUUID] [uniqueidentifier] NULL,
[FUnitID] [int] NULL CONSTRAINT [DF_t_Mes_Prod_PassInv_FUnitID] DEFAULT ((0)),
[FUnitName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_Table_1_FIsReport] DEFAULT ((0)),
[FReportedQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_PassInv_FReportedQty] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_PassInv] ADD CONSTRAINT [PK_t_Mes_Prod_PassInv] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'良品库存', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'库存类型', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FInvTypeID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'汇报数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FReportedQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'源单单号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FSourceBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'源单id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FSourceInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位UUID', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FUnitUUID'
GO
