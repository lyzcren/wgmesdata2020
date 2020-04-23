CREATE TABLE [dbo].[t_Mes_Defect_Transfer]
(
[FInterID] [int] NOT NULL IDENTITY(1, 1),
[FBillNo] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FOutDeptID] [int] NOT NULL,
[FInDeptID] [int] NOT NULL,
[FDate] [date] NOT NULL,
[FStatus] [int] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Transfer_FStatus] DEFAULT ((0)),
[FComments] [nvarchar] (250) COLLATE Chinese_PRC_CI_AS NULL,
[FCreatorID] [int] NOT NULL,
[FCreateDate] [datetime] NOT NULL,
[FEditorID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Transfer_FEditorID] DEFAULT ((0)),
[FEditDate] [datetime] NULL,
[FSignerID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Transfer_FSignerID] DEFAULT ((0)),
[FSignDate] [datetime] NULL,
[FCancellation] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Transfer_FCancellation] DEFAULT ((0)),
[FCancellationUserID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Defect_Transfer_FCancellationUserID] DEFAULT ((0)),
[FCancellationDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Defect_Transfer] ADD CONSTRAINT [PK_t_Mes_Defect_Transfer] PRIMARY KEY CLUSTERED  ([FInterID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'批号', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FBillNo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否作废', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FCancellation'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FCancellationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'作废人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FCancellationUserID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'总投入数量', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'工艺路线id（对应 t_Mes_Tech_Route 的 FInterID ）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FInDeptID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FInterID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'岗位id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Defect_Transfer', 'COLUMN', N'FOutDeptID'
GO
