CREATE TABLE [Cap].[Published]
(
[Id] [bigint] NOT NULL,
[Version] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL,
[Name] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL,
[Content] [nvarchar] (max) COLLATE Chinese_PRC_CI_AS NULL,
[Retries] [int] NOT NULL,
[Added] [datetime2] NOT NULL,
[ExpiresAt] [datetime2] NULL,
[StatusName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Cap].[Published] ADD CONSTRAINT [PK_Cap.Published] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
