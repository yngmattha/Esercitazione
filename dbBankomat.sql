USE [bankomat]
GO
/****** Object:  Table [dbo].[banca]    Script Date: 29/09/2023 16:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banca](
	[idbanca] [int] NOT NULL,
	[nome_] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idbanca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[conto]    Script Date: 29/09/2023 16:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conto](
	[idconto] [int] NOT NULL,
	[saldo] [int] NOT NULL,
	[idutente] [int] NOT NULL,
	[idbanca] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idconto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[funzionalità]    Script Date: 29/09/2023 16:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funzionalità](
	[idfunzionalità] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idfunzionalità] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[funzionalitàBanche]    Script Date: 29/09/2023 16:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funzionalitàBanche](
	[idbanca] [int] NOT NULL,
	[idfunzionalità] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idbanca] ASC,
	[idfunzionalità] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registroOperazioni]    Script Date: 29/09/2023 16:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registroOperazioni](
	[idoperazione] [int] NOT NULL,
	[importo] [int] NOT NULL,
	[banca] [varchar](50) NOT NULL,
	[idutente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idoperazione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[utente]    Script Date: 29/09/2023 16:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[utente](
	[idutente] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[idbanca] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idutente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[conto]  WITH CHECK ADD FOREIGN KEY([idbanca])
REFERENCES [dbo].[banca] ([idbanca])
GO
ALTER TABLE [dbo].[conto]  WITH CHECK ADD FOREIGN KEY([idutente])
REFERENCES [dbo].[utente] ([idutente])
GO
ALTER TABLE [dbo].[funzionalitàBanche]  WITH CHECK ADD FOREIGN KEY([idbanca])
REFERENCES [dbo].[banca] ([idbanca])
GO
ALTER TABLE [dbo].[funzionalitàBanche]  WITH CHECK ADD FOREIGN KEY([idfunzionalità])
REFERENCES [dbo].[funzionalità] ([idfunzionalità])
GO
ALTER TABLE [dbo].[utente]  WITH CHECK ADD FOREIGN KEY([idbanca])
REFERENCES [dbo].[banca] ([idbanca])
GO
