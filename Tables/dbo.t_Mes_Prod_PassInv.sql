CREATE TABLE [dbo].[t_Mes_Prod_PassInv]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FInvTypeID] [int] NOT NULL,
[FSourceInterID] [int] NOT NULL,
[FSourceBillNo] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FDeptID] [int] NOT NULL,
[FProductID] [int] NOT NULL,
[FUnitUUID] [uniqueidentifier] NULL,
[FUnitID] [int] NULL CONSTRAINT [DF_t_Mes_Prod_PassInv_FUnitID] DEFAULT ((0)),
[FUnitName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_Table_1_FIsReport] DEFAULT ((0)),
[FReportedQty] [decimal] (18, 4) NOT NULL CONSTRAINT [DF_t_Mes_Prod_PassInv_FReportedQty] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_PassInv] ADD CONSTRAINT [PK_t_Mes_Prod_PassInv] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位UUID', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_PassInv', 'COLUMN', N'FUnitUUID'
GO
