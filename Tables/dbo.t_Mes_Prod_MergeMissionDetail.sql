CREATE TABLE [dbo].[t_Mes_Prod_MergeMissionDetail]
(
[FInterID] [int] NOT NULL,
[FEntryID] [int] NOT NULL,
[FMissionID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_Mes_Prod_MergeMissionDetail] ADD CONSTRAINT [PK_t_Mes_Prod_MergeMissionDetail] PRIMARY KEY CLUSTERED  ([FInterID], [FEntryID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'id', 'SCHEMA', N'dbo', 'TABLE', N't_Mes_Prod_MergeMissionDetail', 'COLUMN', N'FInterID'
GO
