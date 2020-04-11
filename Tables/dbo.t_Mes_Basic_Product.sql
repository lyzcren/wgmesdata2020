CREATE TABLE [dbo].[t_Mes_Basic_Product]
(
[FItemID] [int] NOT NULL,
[FName] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FFullName] [nvarchar] (120) COLLATE Chinese_PRC_CI_AS NULL,
[FNumber] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL,
[FShortNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FModel] [nvarchar] (120) COLLATE Chinese_PRC_CI_AS NULL,
[FAlias] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FBrand] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FUnitID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Product_FUnitID] DEFAULT ((0)),
[FUnitName] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL,
[FUnitNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FUnitShortNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FUnit2ID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Product_FUnit2ID] DEFAULT ((0)),
[FUnit2Name] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL,
[FUnit2Number] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FUnit2ShortNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FUnit2Rate] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Product_FUnit2Rate] DEFAULT ((1)),
[FIsBatchManage] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Product_FIsBatchManage] DEFAULT ((0)),
[FQtyDecimal] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Product_FQtyDecimal] DEFAULT ((0)),
[FWeight] [decimal] (28, 10) NOT NULL CONSTRAINT [DF_t_Mes_Basic_Product_FWeight] DEFAULT ((0)),
[FErpClsID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Product_FErpClsID] DEFAULT ((0)),
[FParentID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Product_FParentID] DEFAULT ((0)),
[FParentName] [nvarchar] (255) COLLATE Chinese_PRC_CI_AS NULL,
[FParentNumber] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL,
[FRouteID] [int] NULL,
[FIsActive] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Basic_Product_FIsActive] DEFAULT ((1)),
[FComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_Product] ADD CONSTRAINT [PK_t_Mes_Basic_Product] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料基础信息表', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'别名', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FAlias'
GO
EXEC sp_addextendedproperty N'MS_Description', N'品牌', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FBrand'
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ERP类别id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FErpClsID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'全称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用批次管理', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FIsBatchManage'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'规格型号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FModel'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'父件id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FParentID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'父件名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FParentName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'父件编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FParentNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'精度', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FQtyDecimal'
GO
EXEC sp_addextendedproperty N'MS_Description', N'默认工艺路线id（对应 t_Mes_Tech_Route 的 FInterID）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FRouteID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'短码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'副单位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FUnit2ID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'副单位名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FUnit2Name'
GO
EXEC sp_addextendedproperty N'MS_Description', N'副单位编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FUnit2Number'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位转换率', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FUnit2Rate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'副单位短码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FUnit2ShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FUnitNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位短码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FUnitShortNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'重量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_Product', 'COLUMN', N'FWeight'
GO
