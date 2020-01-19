CREATE TABLE [dbo].[t_Mes_Sys_BillNoRule]
(
[FItemID] [int] NOT NULL IDENTITY(1, 1),
[FName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,
[FNumber] [varchar] (25) COLLATE Chinese_PRC_CI_AS NULL,
[FPrefix] [varchar] (25) COLLATE Chinese_PRC_CI_AS NULL CONSTRAINT [DF_t_Mes_Sys_BillRule_FPrefix] DEFAULT (''),
[FSuffix] [varchar] (25) COLLATE Chinese_PRC_CI_AS NULL CONSTRAINT [DF_t_Mes_Sys_BillRule_FSuffix] DEFAULT (''),
[FNoLength] [int] NOT NULL,
[FAppendYear] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Sys_BillNoRule_FAppendYear] DEFAULT ((1)),
[FLongYear] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Sys_BillNoRule_FLongYear] DEFAULT ((0)),
[FAppendMonth] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Sys_BillNoRule_FAppendMonth] DEFAULT ((1)),
[FAppendDate] [bit] NOT NULL CONSTRAINT [DF_t_Mes_Sys_BillNoRule_FAppendDate] DEFAULT ((1)),
[FTimeFormat] [varchar] (3) COLLATE Chinese_PRC_CI_AS NULL CONSTRAINT [DF_t_Mes_Sys_BillRule_FTimeFormat] DEFAULT (''),
[FYearMaxID] [int] NOT NULL,
[FMonthMaxID] [int] NOT NULL,
[FMaxID] [int] NOT NULL,
[FCurrentDate] [datetime] NULL,
[FIsAutoReset] [bit] NOT NULL,
[FComments] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL CONSTRAINT [DF_t_Mes_Sys_BillRule_FComments] DEFAULT ('')
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Sys_BillNoRule] ADD CONSTRAINT [PK_t_Mes_Sys_BillRule] PRIMARY KEY CLUSTERED  ([FItemID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'系统-编码规则表。
该表记录系统中所有默认编码规则，部分特殊模块可根据车间、岗位再次指定编码规则，指定车间、岗位的编码规则请参照车间、岗位基础资料表。', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否包含日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FAppendDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否包含月', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FAppendMonth'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否包含年', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FAppendYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'备注', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FComments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'当前日期', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FCurrentDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否自动重置id为1（如第二天、第二月、第二年）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FIsAutoReset'
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FItemID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'是否4位年', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FLongYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'日最大id（默认，编码包含日期时使用）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FMaxID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'月最大id（编码包含月、未包含日期时使用）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FMonthMaxID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'名称', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码长度', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FNoLength'
GO
EXEC sp_addextendedproperty N'MS_Description', N'编码', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'前缀', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FPrefix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'后缀', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FSuffix'
GO
EXEC sp_addextendedproperty N'MS_Description', N'时间格式', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FTimeFormat'
GO
EXEC sp_addextendedproperty N'MS_Description', N'年最大id（编码包含年、未包含月、未包含日期时使用）', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Sys_BillNoRule', 'COLUMN', N'FYearMaxID'
GO
