CREATE TABLE [dbo].[t_Mes_Prod_MergeMission]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FMoBillNo] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FProductID] [int] NOT NULL,
[FUnitID] [int] NOT NULL,
[FQty] [decimal] (18, 4) NOT NULL,
[FStatus] [int] NOT NULL CONSTRAINT [DF_t_Mes_Prod_MergeMission_FStatus] DEFAULT ((0)),
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FEditorID] [int] NULL,
[FEditDate] [datetime] NULL,
[FCheckerID] [int] NULL,
[FCheckDate] [datetime] NULL,
[FCancellation] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Prod_MergeMission_FCancellation] DEFAULT ((0)),
[FCancellationUserID] [int] NULL,
[FCancellationDate] [datetime] NULL,
[FMissionID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_MergeMission] ADD CONSTRAINT [PK_t_Mes_Prod_MergeMission] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'做废人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FCheckDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FCheckerID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'物料id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FProductID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FQty'
GO
EXEC sp_addextendedproperty N'MS_Description', N'单位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMission', 'COLUMN', N'FUnitID'
GO
