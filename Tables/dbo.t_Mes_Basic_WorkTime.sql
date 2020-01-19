CREATE TABLE [dbo].[t_Mes_Basic_WorkTime]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FName] [varchar] (25) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FNumber] [varchar] (80) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FIsActive] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Basic_WorkTime_FIsActive] DEFAULT ((1)),
[FBeginTime] [varchar] (5) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FEndTime] [varchar] (5) COLLATE Chinese_PRC_CI_AS NOT NULL,
[FLastEndTime] [varchar] (5) COLLATE Chinese_PRC_CI_AS NULL,
[FCreatorID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_WorkTime_FCreatorID] DEFAULT ((0)),
[FCreateDate] [datetime] NOT NULL,
[FEditorID] [int] NOT NULL CONSTRAINT [DF_t_Mes_Basic_WorkTime_FEditorID] DEFAULT ((0)),
[FEditDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Basic_WorkTime] ADD CONSTRAINT [PK_t_Mes_Basic_WorkTime] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'班次基础资料信息', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'开始时间', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', 'COLUMN', N'FBeginTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', 'COLUMN', N'FCreateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'创建人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', 'COLUMN', N'FCreatorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', 'COLUMN', N'FEditDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'修改人id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', 'COLUMN', N'FEditorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'结束时间', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', 'COLUMN', N'FEndTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否启用（0未启用，1已启用）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', 'COLUMN', N'FIsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'班次id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'最晚结束时间', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', 'COLUMN', N'FLastEndTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Basic_WorkTime', 'COLUMN', N'FNumber'
GO
