SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[Banche](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Banche] PRIMARY KEY  
(
	[Id] ASC
)
)
GO

CREATE TABLE [dbo].[Banche_Funzionalita](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdBanca] [bigint] NOT NULL,
	[IdFunzionalita] [bigint] NOT NULL,
 CONSTRAINT [PK_Banche_Funzionalita] PRIMARY KEY 
(
	[Id] ASC
)
)
GO

CREATE TABLE [dbo].[Funzionalita](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Funzionalita] PRIMARY KEY 
(
	[Id] ASC
)
)
GO

CREATE TABLE [dbo].[Utenti](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdBanca] [bigint] NOT NULL,
	[NomeUtente] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Bloccato] [bit] NOT NULL,
 CONSTRAINT [PK_Utenti] PRIMARY KEY 
(
	[Id] ASC
)
)
GO

CREATE TABLE [dbo].[ContiCorrente](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUtente] [bigint] NOT NULL,
	[Saldo] [int] NOT NULL,
	[DataUltimaOperazione] [date] NOT NULL,
	CONSTRAINT [PK_ContiCorrente] PRIMARY KEY 
(
	[Id] ASC
)
)
GO

CREATE TABLE [dbo].[Movimenti](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NomeBanca] [nchar](10) NOT NULL,
	[NomeUtente] [nchar](10) NOT NULL,
	[Funzionalita] [varchar](50) NOT NULL,
	[Quantita] [int] NOT NULL,
	[DataOperazione] [date] NOT NULL,
 CONSTRAINT [PK_Movimenti] PRIMARY KEY 
(
	[Id] ASC
)
)
GO



ALTER TABLE [dbo].[Banche_Funzionalita]  WITH CHECK ADD  CONSTRAINT [FK_Banche_Funzionalita_Funzionalita] FOREIGN KEY([IdFunzionalita])
REFERENCES [dbo].[Funzionalita] ([Id])
GO

ALTER TABLE [dbo].[Banche_Funzionalita] CHECK CONSTRAINT [FK_Banche_Funzionalita_Funzionalita]
GO


ALTER TABLE [dbo].[Banche_Funzionalita]  WITH CHECK ADD  CONSTRAINT [FK_Banche_Funzionalita_Banche] FOREIGN KEY([IdBanca])
REFERENCES [dbo].[Banche] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Banche_Funzionalita] CHECK CONSTRAINT [FK_Banche_Funzionalita_Banche]
GO


ALTER TABLE [dbo].[Utenti]  WITH CHECK ADD  CONSTRAINT [FK_Utenti_Banche] FOREIGN KEY([IdBanca])
REFERENCES [dbo].[Banche] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Utenti] CHECK CONSTRAINT [FK_Utenti_Banche]
GO

ALTER TABLE [dbo].[ContiCorrente]  WITH CHECK ADD  CONSTRAINT [FK_ContiCorrente_Utenti] FOREIGN KEY([IdUtente])
REFERENCES [dbo].[Utenti] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ContiCorrente] CHECK CONSTRAINT [FK_ContiCorrente_Utenti]
GO



CREATE UNIQUE INDEX [IX_Funzionalita] ON [dbo].[Funzionalita]
(
	[Nome] ASC
)
GO

CREATE UNIQUE INDEX [IX_Banche] ON [dbo].[Banche]
(
	[Nome] ASC
)
GO

CREATE UNIQUE INDEX [IX_BancheFunzionalita] ON [dbo].[Banche_Funzionalita]
(
	[IdBanca] ASC,
	[IdFunzionalita] ASC
)
GO

CREATE UNIQUE INDEX [IX_Utenti] ON [dbo].[Utenti]
(
	[NomeUtente] ASC
)
GO


COMMIT;