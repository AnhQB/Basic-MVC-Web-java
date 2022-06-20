CREATE DATABASE [SE1605]
GO
USE [SE1605]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 6/20/2022 10:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NOT NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](25) NULL,
	[zip_code] [varchar](5) NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 6/20/2022 10:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/20/2022 10:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[order_status] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/20/2022 10:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[model_year] [smallint] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[brand_name] [nvarchar](255) NULL,
	[category_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staffs]    Script Date: 6/20/2022 10:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staffs](
	[staff_id] [int] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[active] [tinyint] NOT NULL,
	[store_id] [int] NOT NULL,
	[manager_id] [int] NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stocks]    Script Date: 6/20/2022 10:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stocks](
	[store_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stores]    Script Date: 6/20/2022 10:28:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stores](
	[store_id] [int] NOT NULL,
	[store_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](10) NULL,
	[zip_code] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (1, N'Debra', N'Burks', NULL, N'debra.burks@yahoo.com', N'9273 Thorne Ave. ', N'Orchard Park', N'NY', N'14127', N'anh', N'12345678')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (2, N'Kasha', N'Todd', NULL, N'kasha.todd@yahoo.com', N'910 Vine Street ', N'Campbell', N'CA', N'95008', N'anhpn', N'12345678')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (3, N'Tameka', N'Fisher', NULL, N'tameka.fisher@aol.com', N'769C Honey Creek St. ', N'Redondo Beach', N'CA', N'90278', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (4, N'Daryl', N'Spence', NULL, N'daryl.spence@aol.com', N'988 Pearl Lane ', N'Uniondale', N'NY', N'11553', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (5, N'Charolette', N'Rice', N'(916) 381-6003', N'charolette.rice@msn.com', N'107 River Dr. ', N'Sacramento', N'CA', N'95820', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (6, N'Lyndsey', N'Bean', NULL, N'lyndsey.bean@hotmail.com', N'769 West Road ', N'Fairport', N'NY', N'14450', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (7, N'Latasha', N'Hays', N'(716) 986-3359', N'latasha.hays@hotmail.com', N'7014 Manor Station Rd. ', N'Buffalo', N'NY', N'14215', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (8, N'Jacquline', N'Duncan', NULL, N'jacquline.duncan@yahoo.com', N'15 Brown St. ', N'Jackson Heights', N'NY', N'11372', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (9, N'Genoveva', N'Baldwin', NULL, N'genoveva.baldwin@msn.com', N'8550 Spruce Drive ', N'Port Washington', N'NY', N'11050', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (10, N'Pamelia', N'Newman', NULL, N'pamelia.newman@gmail.com', N'476 Chestnut Ave. ', N'Monroe', N'NY', N'10950', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (11, N'Deshawn', N'Mendoza', NULL, N'deshawn.mendoza@yahoo.com', N'8790 Cobblestone Street ', N'Monsey', N'NY', N'10952', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (12, N'Robby', N'Sykes', N'(516) 583-7761', N'robby.sykes@hotmail.com', N'486 Rock Maple Street ', N'Hempstead', N'NY', N'11550', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (13, N'Lashawn', N'Ortiz', NULL, N'lashawn.ortiz@msn.com', N'27 Washington Rd. ', N'Longview', N'TX', N'75604', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (14, N'Garry', N'Espinoza', NULL, N'garry.espinoza@hotmail.com', N'7858 Rockaway Court ', N'Forney', N'TX', N'75126', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (15, N'Linnie', N'Branch', NULL, N'linnie.branch@gmail.com', N'314 South Columbia Ave. ', N'Plattsburgh', N'NY', N'12901', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (16, N'Emmitt', N'Sanchez', N'(212) 945-8823', N'emmitt.sanchez@hotmail.com', N'461 Squaw Creek Road ', N'New York', N'NY', N'10002', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (17, N'Caren', N'Stephens', NULL, N'caren.stephens@msn.com', N'914 Brook St. ', N'Scarsdale', N'NY', N'10583', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (18, N'Georgetta', N'Hardin', NULL, N'georgetta.hardin@aol.com', N'474 Chapel Dr. ', N'Canandaigua', N'NY', N'14424', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (19, N'Lizzette', N'Stein', NULL, N'lizzette.stein@yahoo.com', N'19 Green Hill Lane ', N'Orchard Park', N'NY', N'14127', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (20, N'Aleta', N'Shepard', NULL, N'aleta.shepard@aol.com', N'684 Howard St. ', N'Sugar Land', N'TX', N'77478', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (21, N'Tobie', N'Little', NULL, N'tobie.little@gmail.com', N'10 Silver Spear Dr. ', N'Victoria', N'TX', N'77904', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (22, N'Adelle', N'Larsen', NULL, N'adelle.larsen@gmail.com', N'683 West Kirkland Dr. ', N'East Northport', N'NY', N'11731', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (23, N'Kaylee', N'English', NULL, N'kaylee.english@msn.com', N'8786 Fulton Rd. ', N'Hollis', N'NY', N'11423', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (24, N'Corene', N'Wall', NULL, N'corene.wall@msn.com', N'9601 Ocean Rd. ', N'Atwater', N'CA', N'95301', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (25, N'Regenia', N'Vaughan', NULL, N'regenia.vaughan@gmail.com', N'44 Stonybrook Street ', N'Mahopac', N'NY', N'10541', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (26, N'Theo', N'Reese', N'(562) 215-2907', N'theo.reese@gmail.com', N'8755 W. Wild Horse St. ', N'Long Beach', N'NY', N'11561', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (27, N'Santos', N'Valencia', NULL, N'santos.valencia@yahoo.com', N'7479 Carpenter Street ', N'Sunnyside', N'NY', N'11104', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (28, N'Jeanice', N'Frost', NULL, N'jeanice.frost@hotmail.com', N'76 Devon Lane ', N'Ossining', N'NY', N'10562', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (29, N'Syreeta', N'Hendricks', NULL, N'syreeta.hendricks@msn.com', N'193 Spruce Road ', N'Mahopac', N'NY', N'10541', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (30, N'Jamaal', N'Albert', NULL, N'jamaal.albert@gmail.com', N'853 Stonybrook Street ', N'Torrance', N'CA', N'90505', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (31, N'Williemae', N'Holloway', N'(510) 246-8375', N'williemae.holloway@msn.com', N'69 Cypress St. ', N'Oakland', N'CA', N'94603', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (32, N'Araceli', N'Golden', NULL, N'araceli.golden@msn.com', N'12 Ridgeview Ave. ', N'Fullerton', N'CA', N'92831', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (33, N'Deloris', N'Burke', NULL, N'deloris.burke@hotmail.com', N'895 Edgemont Drive ', N'Palos Verdes Peninsula', N'CA', N'90274', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (34, N'Brittney', N'Woodward', NULL, N'brittney.woodward@aol.com', N'960 River St. ', N'East Northport', N'NY', N'11731', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (35, N'Guillermina', N'Noble', NULL, N'guillermina.noble@msn.com', N'6 Del Monte Lane ', N'Baldwinsville', N'NY', N'13027', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (36, N'Bernita', N'Mcdaniel', NULL, N'bernita.mcdaniel@hotmail.com', N'2 Peg Shop Ave. ', N'Liverpool', N'NY', N'13090', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (37, N'Melia', N'Brady', NULL, N'melia.brady@gmail.com', N'907 Shirley Rd. ', N'Maspeth', N'NY', N'11378', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (38, N'Zelma', N'Browning', NULL, N'zelma.browning@aol.com', N'296 Second Street ', N'Astoria', N'NY', N'11102', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (39, N'Janetta', N'Aguirre', N'(717) 670-2634', N'janetta.aguirre@aol.com', N'214 Second Court ', N'Lancaster', N'NY', N'14086', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (40, N'Ronna', N'Butler', NULL, N'ronna.butler@gmail.com', N'9438 Plymouth Court ', N'Encino', N'CA', N'91316', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (41, N'Kathie', N'Freeman', NULL, N'kathie.freeman@msn.com', N'667 Temple Dr. ', N'Queensbury', N'NY', N'12804', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (42, N'Tangela', N'Quinn', NULL, N'tangela.quinn@aol.com', N'4 S. Purple Finch Road ', N'Richmond Hill', N'NY', N'11418', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (43, N'Mozelle', N'Carter', N'(281) 489-9656', N'mozelle.carter@aol.com', N'895 Chestnut Ave. ', N'Houston', N'TX', N'77016', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (44, N'Onita', N'Johns', NULL, N'onita.johns@msn.com', N'32 Glen Creek Lane ', N'Elmont', N'NY', N'11003', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (45, N'Bennett', N'Armstrong', NULL, N'bennett.armstrong@aol.com', N'688 Walnut Street ', N'Bethpage', N'NY', N'11714', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (46, N'Monika', N'Berg', NULL, N'monika.berg@gmail.com', N'369 Vernon Dr. ', N'Encino', N'CA', N'91316', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (47, N'Bridgette', N'Guerra', NULL, N'bridgette.guerra@hotmail.com', N'9982 Manor Drive ', N'San Lorenzo', N'CA', N'94580', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (48, N'Cesar', N'Jackson', NULL, N'cesar.jackson@gmail.com', N'8068 N. Griffin Ave. ', N'Liverpool', N'NY', N'13090', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (49, N'Caroll', N'Hays', NULL, N'caroll.hays@yahoo.com', N'9381 Wrangler St. ', N'Fairport', N'NY', N'14450', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (50, N'Cleotilde', N'Booth', NULL, N'cleotilde.booth@gmail.com', N'17 Corona St. ', N'Sugar Land', N'TX', N'77478', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (51, N'Gertrud', N'Rhodes', NULL, N'gertrud.rhodes@aol.com', N'9961 Meadowbrook Street ', N'Merrick', N'NY', N'11566', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (52, N'Tu', N'Ramirez', NULL, N'tu.ramirez@hotmail.com', N'24 W. Courtland Street ', N'East Elmhurst', N'NY', N'11369', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (53, N'Saturnina', N'Garner', NULL, N'saturnina.garner@gmail.com', N'8538 Fairground St. ', N'Glendora', N'CA', N'91740', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (54, N'Fran', N'Yang', NULL, N'fran.yang@hotmail.com', N'440 Pearl St. ', N'Utica', N'NY', N'13501', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (55, N'Diana', N'Guerra', NULL, N'diana.guerra@hotmail.com', N'45 Chapel Ave. ', N'Merrick', N'NY', N'11566', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (56, N'Lolita', N'Mosley', N'(281) 363-3309', N'lolita.mosley@hotmail.com', N'376 S. High Ridge St. ', N'Houston', N'TX', N'77016', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (57, N'Pamala', N'Henry', NULL, N'pamala.henry@aol.com', N'197 Bridgeton Ave. ', N'Bronx', N'NY', N'10451', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (58, N'Damien', N'Dorsey', NULL, N'damien.dorsey@yahoo.com', N'161 Old York Street ', N'Central Islip', N'NY', N'11722', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (59, N'Latasha', N'Stanley', NULL, N'latasha.stanley@gmail.com', N'8068 Fordham Drive ', N'Rockville Centre', N'NY', N'11570', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (60, N'Neil', N'Mccall', NULL, N'neil.mccall@gmail.com', N'7476 Oakland Dr. ', N'San Carlos', N'CA', N'94070', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (61, N'Elinore', N'Aguilar', NULL, N'elinore.aguilar@msn.com', N'9766 Rockcrest Ave. ', N'San Angelo', N'TX', N'76901', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (62, N'Alica', N'Hunter', NULL, N'alica.hunter@hotmail.com', N'8 San Juan Drive ', N'East Elmhurst', N'NY', N'11369', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (63, N'Tenisha', N'Lyons', NULL, N'tenisha.lyons@aol.com', N'78 E. Rock Creek Street ', N'Amityville', N'NY', N'11701', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (64, N'Bobbie', N'Foster', NULL, N'bobbie.foster@yahoo.com', N'988 Pineknoll Ave. ', N'Desoto', N'TX', N'75115', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (65, N'Kanesha', N'Vega', NULL, N'kanesha.vega@gmail.com', N'771 E. Oxford Drive ', N'Rome', N'NY', N'13440', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (66, N'Lorrie', N'Becker', NULL, N'lorrie.becker@yahoo.com', N'19 North Court ', N'Garland', N'TX', N'75043', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (67, N'Tommie', N'Melton', N'(916) 802-2952', N'tommie.melton@gmail.com', N'8 West Old York St. ', N'Sacramento', N'CA', N'95820', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (68, N'Jayne', N'Kirkland', NULL, N'jayne.kirkland@hotmail.com', N'7800 Second Lane ', N'Rowlett', N'TX', N'75088', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (69, N'Katelin', N'Kennedy', NULL, N'katelin.kennedy@gmail.com', N'286 Myrtle Lane ', N'Rocklin', N'CA', N'95677', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (70, N'Tomasa', N'Carson', NULL, N'tomasa.carson@aol.com', N'10 Clark Avenue ', N'East Elmhurst', N'NY', N'11369', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (71, N'Takako', N'Casey', NULL, N'takako.casey@aol.com', N'7548 Court Lane ', N'Bronx', N'NY', N'10451', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (72, N'Petronila', N'Norris', NULL, N'petronila.norris@aol.com', N'72 South Marshall Lane ', N'South El Monte', N'CA', N'91733', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (73, N'Melanie', N'Hayes', NULL, N'melanie.hayes@msn.com', N'5 N. Hall Dr. ', N'Liverpool', N'NY', N'13090', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (74, N'Georgeann', N'Waller', NULL, N'georgeann.waller@yahoo.com', N'9797 Bald Hill Ave. ', N'North Tonawanda', N'NY', N'14120', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (75, N'Abby', N'Gamble', NULL, N'abby.gamble@aol.com', N'60 Myers Dr. ', N'Amityville', N'NY', N'11701', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (76, N'Parker', N'Prince', NULL, N'parker.prince@hotmail.com', N'21 Sulphur Springs Drive ', N'Port Jefferson Station', N'NY', N'11776', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (77, N'Keri', N'Bridges', NULL, N'keri.bridges@gmail.com', N'8504 Brickell Ave. ', N'Richardson', N'TX', N'75080', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (78, N'Chi', N'Goff', NULL, N'chi.goff@aol.com', N'3 W. Glen Ridge Avenue ', N'Palos Verdes Peninsula', N'CA', N'90274', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (79, N'Ashanti', N'Parks', NULL, N'ashanti.parks@hotmail.com', N'846 N. Helen St. ', N'Baldwin', N'NY', N'11510', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (80, N'Sarai', N'Mckee', N'(716) 912-8110', N'sarai.mckee@msn.com', N'641 Glenwood Avenue ', N'Buffalo', N'NY', N'14215', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (81, N'Zina', N'Bonner', NULL, N'zina.bonner@hotmail.com', N'9312 8th Street ', N'San Lorenzo', N'CA', N'94580', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (82, N'Lizzie', N'Joyner', NULL, N'lizzie.joyner@msn.com', N'8541 Roberts St. ', N'Coachella', N'CA', N'92236', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (83, N'Tiesha', N'Daniel', NULL, N'tiesha.daniel@yahoo.com', N'6 West Bohemia Lane ', N'Scarsdale', N'NY', N'10583', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (84, N'Armand', N'Whitehead', NULL, N'armand.whitehead@hotmail.com', N'639 Harvey St. ', N'Lindenhurst', N'NY', N'11757', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (85, N'Teofila', N'Fischer', NULL, N'teofila.fischer@aol.com', N'1 West Brickyard St. ', N'Huntington Station', N'NY', N'11746', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (86, N'Lissa', N'Vargas', NULL, N'lissa.vargas@yahoo.com', N'517 Victoria Ave. ', N'Oswego', N'NY', N'13126', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (87, N'Yan', N'Mcgowan', NULL, N'yan.mcgowan@msn.com', N'8960 Newport Ave. ', N'Duarte', N'CA', N'91010', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (88, N'Titus', N'Bullock', NULL, N'titus.bullock@gmail.com', N'29 Oxford Avenue ', N'Hollis', N'NY', N'11423', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (89, N'Arvilla', N'Osborn', NULL, N'arvilla.osborn@gmail.com', N'60 Acacia Lane ', N'Upland', N'CA', N'91784', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (90, N'Marjorie', N'Logan', NULL, N'marjorie.logan@msn.com', N'95 Grandrose St. ', N'Franklin Square', N'NY', N'11010', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (91, N'Marvin', N'Mullins', N'(619) 635-2027', N'marvin.mullins@aol.com', N'7489 Redwood Drive ', N'San Diego', N'CA', N'92111', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (92, N'Tena', N'Cruz', NULL, N'tena.cruz@yahoo.com', N'1 South St. ', N'Farmingdale', N'NY', N'11735', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (93, N'Corrina', N'Sawyer', N'(248) 370-1364', N'corrina.sawyer@yahoo.com', N'95 Briarwood Lane ', N'Troy', N'NY', N'12180', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (94, N'Sharyn', N'Hopkins', NULL, N'sharyn.hopkins@hotmail.com', N'4 South Temple Ave. ', N'Baldwinsville', N'NY', N'13027', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (95, N'Letitia', N'Franco', NULL, N'letitia.franco@aol.com', N'607 Lakeview Drive ', N'Saratoga Springs', N'NY', N'12866', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (96, N'Floretta', N'Higgins', NULL, N'floretta.higgins@hotmail.com', N'870 Lilac Dr. ', N'Bayside', N'NY', N'11361', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (97, N'Louanne', N'Martin', NULL, N'louanne.martin@hotmail.com', N'1 Campfire Ave. ', N'Yuba City', N'CA', N'95993', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (98, N'Violet', N'Valenzuela', NULL, N'violet.valenzuela@msn.com', N'8668 Piper Street ', N'Plattsburgh', N'NY', N'12901', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (99, N'Carie', N'Kidd', NULL, N'carie.kidd@yahoo.com', N'6 East Clinton Street ', N'Monroe', N'NY', N'10950', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (100, N'Kellie', N'Franco', NULL, N'kellie.franco@yahoo.com', N'444 South Walnut Rd. ', N'Commack', N'NY', N'11725', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (101, N'Nichelle', N'Howell', NULL, N'nichelle.howell@aol.com', N'7670 Forest St. ', N'Scarsdale', N'NY', N'10583', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (102, N'Marisol', N'Goodman', NULL, N'marisol.goodman@gmail.com', N'864 East Cherry St. ', N'Canandaigua', N'NY', N'14424', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (103, N'Sylvie', N'Wilkerson', NULL, N'sylvie.wilkerson@yahoo.com', N'750 Central Ave. ', N'Syosset', N'NY', N'11791', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (104, N'Katharina', N'Bates', NULL, N'katharina.bates@gmail.com', N'54 South Greenview Drive ', N'Campbell', N'CA', N'95008', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (105, N'Marget', N'Hodge', NULL, N'marget.hodge@msn.com', N'7199 Selby Lane ', N'Woodhaven', N'NY', N'11421', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (106, N'Raul', N'Melendez', NULL, N'raul.melendez@hotmail.com', N'9772 Manhattan St. ', N'Elmhurst', N'NY', N'11373', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (107, N'Cecil', N'Hopper', NULL, N'cecil.hopper@yahoo.com', N'471 Glenlake Ave. ', N'Central Islip', N'NY', N'11722', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (108, N'Shae', N'Hickman', NULL, N'shae.hickman@hotmail.com', N'740 Pin Oak Street ', N'Floral Park', N'NY', N'11001', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (109, N'Monica', N'Sears', N'(408) 704-8863', N'monica.sears@aol.com', N'57 Glenholme St. ', N'San Jose', N'CA', N'95127', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (110, N'Ollie', N'Zimmerman', N'(657) 648-2863', N'ollie.zimmerman@yahoo.com', N'69 Wood Rd. ', N'Anaheim', N'CA', N'92806', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (111, N'Shila', N'White', NULL, N'shila.white@msn.com', N'94 Lakeshore Street ', N'Orchard Park', N'NY', N'14127', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (112, N'Yuk', N'Vega', NULL, N'yuk.vega@yahoo.com', N'413 Wood St. ', N'West Hempstead', N'NY', N'11552', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (113, N'Eliana', N'Silva', NULL, N'eliana.silva@gmail.com', N'7119 Summer Rd. ', N'Farmingdale', N'NY', N'11735', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (114, N'Thalia', N'Horne', NULL, N'thalia.horne@yahoo.com', N'9312 Harvard Street ', N'Amityville', N'NY', N'11701', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (115, N'Rey', N'Lindsay', NULL, N'rey.lindsay@gmail.com', N'16 Philmont St. ', N'Monroe', N'NY', N'10950', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (116, N'Merlene', N'Vinson', NULL, N'merlene.vinson@gmail.com', N'431 Vine Dr. ', N'Euless', N'TX', N'76039', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (117, N'Dacia', N'William', NULL, N'dacia.william@msn.com', N'62 Cypress Drive ', N'Sugar Land', N'TX', N'77478', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (118, N'Le', N'Wood', NULL, N'le.wood@yahoo.com', N'90 Primrose Dr. ', N'Pittsford', N'NY', N'14534', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (119, N'Thalia', N'Dillard', NULL, N'thalia.dillard@yahoo.com', N'987 NE. Gates Street ', N'San Angelo', N'TX', N'76901', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (120, N'Luz', N'House', N'(559) 114-2580', N'luz.house@gmail.com', N'491 Railroad Street ', N'Fresno', N'CA', N'93706', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (121, N'Lucy', N'Woods', NULL, N'lucy.woods@gmail.com', N'8437 West Rockaway St. ', N'Palos Verdes Peninsula', N'CA', N'90274', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (122, N'Shena', N'Carter', NULL, N'shena.carter@yahoo.com', N'72 University Road ', N'Howard Beach', N'NY', N'11414', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (123, N'Robena', N'Hill', N'(361) 598-4414', N'robena.hill@hotmail.com', N'263 Cross St. ', N'Corpus Christi', N'TX', N'78418', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (124, N'Jeni', N'Booker', NULL, N'jeni.booker@gmail.com', N'546 Railroad Dr. ', N'South El Monte', N'CA', N'91733', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (125, N'Herlinda', N'Stone', NULL, N'herlinda.stone@msn.com', N'725 Gulf St. ', N'Canandaigua', N'NY', N'14424', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (126, N'Lavina', N'Dejesus', NULL, N'lavina.dejesus@msn.com', N'59 E. Valley Avenue ', N'Newburgh', N'NY', N'12550', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (127, N'Erlinda', N'Nielsen', NULL, N'erlinda.nielsen@aol.com', N'728 Oxford Lane ', N'Maspeth', N'NY', N'11378', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (128, N'Terrance', N'Lynn', NULL, N'terrance.lynn@yahoo.com', N'91 East Buckingham Drive ', N'Plattsburgh', N'NY', N'12901', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (129, N'Walton', N'Dejesus', NULL, N'walton.dejesus@yahoo.com', N'15 Washington Rd. ', N'Lockport', N'NY', N'14094', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (130, N'Wes', N'Stanton', N'(248) 247-5074', N'wes.stanton@msn.com', N'8662 Tunnel Street ', N'Troy', N'NY', N'12180', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (131, N'Tanesha', N'Hampton', NULL, N'tanesha.hampton@hotmail.com', N'19 Belmont Ave. ', N'Syosset', N'NY', N'11791', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (132, N'Boyd', N'Irwin', NULL, N'boyd.irwin@hotmail.com', N'221 Whitemarsh St. ', N'Hamburg', N'NY', N'14075', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (133, N'Delbert', N'Wilkins', NULL, N'delbert.wilkins@aol.com', N'420 Greenview St. ', N'Coram', N'NY', N'11727', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (134, N'Brianna', N'Moss', N'(516) 156-8031', N'brianna.moss@msn.com', N'4 Longfellow St. ', N'Hempstead', N'NY', N'11550', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (135, N'Dorthey', N'Jackson', N'(281) 926-8010', N'dorthey.jackson@msn.com', N'9768 Brookside St. ', N'Houston', N'TX', N'77016', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (136, N'Sarita', N'Parks', NULL, N'sarita.parks@msn.com', N'7809 Second Lane ', N'Forney', N'TX', N'75126', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (137, N'Shonta', N'Mercer', NULL, N'shonta.mercer@aol.com', N'319 NE. La Sierra Avenue ', N'Massapequa', N'NY', N'11758', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (138, N'Jone', N'Bernard', N'(657) 536-5165', N'jone.bernard@hotmail.com', N'99 Longbranch Court ', N'Anaheim', N'CA', N'92806', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (139, N'Wanita', N'Davenport', NULL, N'wanita.davenport@aol.com', N'525 Dogwood Ave. ', N'Spring Valley', N'NY', N'10977', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (140, N'Cleopatra', N'Tate', NULL, N'cleopatra.tate@aol.com', N'97 N. Glenwood St. ', N'East Elmhurst', N'NY', N'11369', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (141, N'Ramiro', N'Byers', NULL, N'ramiro.byers@gmail.com', N'16 Pleasant St. ', N'Saint Albans', N'NY', N'11412', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (142, N'Nicholas', N'Vazquez', NULL, N'nicholas.vazquez@hotmail.com', N'9 Roosevelt Street ', N'West Hempstead', N'NY', N'11552', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (143, N'Janae', N'Doyle', NULL, N'janae.doyle@gmail.com', N'760 Rose Ave. ', N'Jackson Heights', N'NY', N'11372', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (144, N'Hans', N'Price', NULL, N'hans.price@hotmail.com', N'51 Glendale Road ', N'Port Chester', N'NY', N'10573', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (145, N'Miquel', N'Neal', NULL, N'miquel.neal@hotmail.com', N'9564 Deerfield Lane ', N'Staten Island', N'NY', N'10301', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (146, N'Stefany', N'Potter', NULL, N'stefany.potter@gmail.com', N'256 South Academy St. ', N'Saratoga Springs', N'NY', N'12866', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (147, N'Bernetta', N'Marquez', NULL, N'bernetta.marquez@hotmail.com', N'626 E. Dunbar Street ', N'Smithtown', N'NY', N'11787', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (148, N'Julee', N'Woodard', NULL, N'julee.woodard@yahoo.com', N'869 Summerhouse Dr. ', N'Richmond Hill', N'NY', N'11418', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (149, N'Meredith', N'Bryan', NULL, N'meredith.bryan@hotmail.com', N'8935 E. Oxford St. ', N'Spring Valley', N'NY', N'10977', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (150, N'Weldon', N'Michael', NULL, N'weldon.michael@hotmail.com', N'9952 Nut Swamp St. ', N'Huntington', N'NY', N'11743', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (151, N'Joesph', N'Delacruz', NULL, N'joesph.delacruz@aol.com', N'184 Cypress Street ', N'Atwater', N'CA', N'95301', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (152, N'Katherina', N'Odom', NULL, N'katherina.odom@yahoo.com', N'897 N. Oak Drive ', N'Plainview', N'NY', N'11803', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (153, N'Laraine', N'Robbins', NULL, N'laraine.robbins@yahoo.com', N'8214 E. Pin Oak Lane ', N'San Angelo', N'TX', N'76901', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (154, N'Jenise', N'Preston', NULL, N'jenise.preston@yahoo.com', N'9 Littleton Drive ', N'Helotes', N'TX', N'78023', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (155, N'Lory', N'Page', NULL, N'lory.page@hotmail.com', N'58 Summerhouse Street ', N'Bay Shore', N'NY', N'11706', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (156, N'Charlyn', N'Cantrell', NULL, N'charlyn.cantrell@yahoo.com', N'8756 Euclid St. ', N'West Islip', N'NY', N'11795', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (157, N'Carola', N'Rodriquez', NULL, N'carola.rodriquez@hotmail.com', N'9433 Heritage Lane ', N'Banning', N'CA', N'92220', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (158, N'Alane', N'Kennedy', NULL, N'alane.kennedy@yahoo.com', N'34 Green Lake Street ', N'Spring Valley', N'NY', N'10977', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (159, N'Regina', N'Burns', NULL, N'regina.burns@aol.com', N'713 Buckingham St. ', N'Garland', N'TX', N'75043', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (160, N'Omer', N'Estrada', NULL, N'omer.estrada@gmail.com', N'9 Honey Creek Street ', N'Rowlett', N'TX', N'75088', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (161, N'Crystle', N'Gilliam', NULL, N'crystle.gilliam@yahoo.com', N'86 Edgewater Road ', N'Smithtown', N'NY', N'11787', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (162, N'Kam', N'Wilder', NULL, N'kam.wilder@hotmail.com', N'500 West Clay Ave. ', N'Newburgh', N'NY', N'12550', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (163, N'Margert', N'Stevens', NULL, N'margert.stevens@aol.com', N'502 North Poplar St. ', N'Rome', N'NY', N'13440', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (164, N'Tomika', N'Larson', NULL, N'tomika.larson@yahoo.com', N'254 Canal St. ', N'Woodside', N'NY', N'11377', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (165, N'Jeromy', N'Burch', N'(408) 955-8238', N'jeromy.burch@msn.com', N'889 Mulberry Street ', N'San Jose', N'CA', N'95127', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (166, N'Lena', N'Mills', NULL, N'lena.mills@yahoo.com', N'42 Homestead St. ', N'Woodhaven', N'NY', N'11421', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (167, N'Loreta', N'Johnston', NULL, N'loreta.johnston@yahoo.com', N'39 Lafayette Dr. ', N'Spring Valley', N'NY', N'10977', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (168, N'Nettie', N'Mcdaniel', NULL, N'nettie.mcdaniel@hotmail.com', N'7004 E. Wakehurst St. ', N'South Ozone Park', N'NY', N'11420', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (169, N'Karla', N'Kirk', NULL, N'karla.kirk@yahoo.com', N'9718 Harvard Rd. ', N'Palos Verdes Peninsula', N'CA', N'90274', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (170, N'Regine', N'Gonzales', N'(805) 763-4045', N'regine.gonzales@gmail.com', N'798 Court Drive ', N'Oxnard', N'CA', N'93035', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (171, N'Miriam', N'Baker', NULL, N'miriam.baker@hotmail.com', N'90 Studebaker St. ', N'Uniondale', N'NY', N'11553', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (172, N'Jeanie', N'Kirkland', NULL, N'jeanie.kirkland@aol.com', N'7643 Old Theatre St. ', N'Santa Clara', N'CA', N'95050', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (173, N'Marquerite', N'Dawson', NULL, N'marquerite.dawson@gmail.com', N'37 Hamilton Court ', N'Garland', N'TX', N'75043', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (174, N'Babara', N'Ochoa', NULL, N'babara.ochoa@aol.com', N'872 Smith Store St. ', N'Scarsdale', N'NY', N'10583', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (175, N'Nova', N'Hess', NULL, N'nova.hess@msn.com', N'773 South Lafayette St. ', N'Duarte', N'CA', N'91010', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (176, N'Carley', N'Reynolds', NULL, N'carley.reynolds@gmail.com', N'2 Snake Hill Drive ', N'South El Monte', N'CA', N'91733', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (177, N'Carissa', N'Foreman', NULL, N'carissa.foreman@msn.com', N'69C N. Ridge Rd. ', N'Maspeth', N'NY', N'11378', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (178, N'Genoveva', N'Tyler', N'(212) 152-6381', N'genoveva.tyler@gmail.com', N'8121 Windfall Ave. ', N'New York', N'NY', N'10002', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (179, N'Deane', N'Sears', NULL, N'deane.sears@hotmail.com', N'3 Bradford Court ', N'Pittsford', N'NY', N'14534', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (180, N'Karey', N'Steele', NULL, N'karey.steele@gmail.com', N'8879 Kent Lane ', N'Farmingdale', N'NY', N'11735', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (181, N'Olevia', N'Pitts', NULL, N'olevia.pitts@gmail.com', N'39 Fieldstone Drive ', N'Redondo Beach', N'CA', N'90278', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (182, N'Jenniffer', N'Bullock', NULL, N'jenniffer.bullock@msn.com', N'38 Oxford Avenue ', N'Bay Shore', N'NY', N'11706', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (183, N'Jeniffer', N'Ratliff', NULL, N'jeniffer.ratliff@gmail.com', N'510 Rocky River Court ', N'Floral Park', N'NY', N'11001', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (184, N'Klara', N'Stanley', NULL, N'klara.stanley@aol.com', N'603 Mechanic St. ', N'Webster', N'NY', N'14580', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (185, N'Morton', N'Lee', NULL, N'morton.lee@yahoo.com', N'313 Ridge St. ', N'San Angelo', N'TX', N'76901', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (186, N'Ken', N'Charles', NULL, N'ken.charles@msn.com', N'9124 W. Piper Lane ', N'Monsey', N'NY', N'10952', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (187, N'Hedwig', N'Paul', NULL, N'hedwig.paul@msn.com', N'422 Manor Ave. ', N'Apple Valley', N'CA', N'92307', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (188, N'Sharla', N'Flynn', N'(805) 478-7724', N'sharla.flynn@hotmail.com', N'7 Brown Drive ', N'Oxnard', N'CA', N'93035', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (189, N'Damian', N'Dawson', NULL, N'damian.dawson@hotmail.com', N'528 St Margarets Street ', N'Liverpool', N'NY', N'13090', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (190, N'Toya', N'Pratt', N'(562) 218-6405', N'toya.pratt@yahoo.com', N'485 San Pablo Drive ', N'Long Beach', N'NY', N'11561', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (191, N'Graciela', N'Barber', N'(805) 656-6987', N'graciela.barber@hotmail.com', N'1 E. Young St. ', N'Oxnard', N'CA', N'93035', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (192, N'Bong', N'Hebert', NULL, N'bong.hebert@gmail.com', N'545 Brook St. ', N'Torrance', N'CA', N'90505', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (193, N'Ayanna', N'Rhodes', NULL, N'ayanna.rhodes@msn.com', N'7425 Pheasant St. ', N'Hicksville', N'NY', N'11801', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (194, N'Dorine', N'Roberson', NULL, N'dorine.roberson@msn.com', N'396 Meadowbrook Lane ', N'Santa Cruz', N'CA', N'95060', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (195, N'Addie', N'Hahn', NULL, N'addie.hahn@hotmail.com', N'8165 Baker Ave. ', N'Franklin Square', N'NY', N'11010', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (196, N'Edythe', N'Valencia', NULL, N'edythe.valencia@yahoo.com', N'9346 Wall St. ', N'North Tonawanda', N'NY', N'14120', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (197, N'Andy', N'O''neill', NULL, N'andy.o''neill@msn.com', N'9544 Mulberry Drive ', N'Rego Park', N'NY', N'11374', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (198, N'Luis', N'Tyler', NULL, N'luis.tyler@gmail.com', N'9568 Campfire Circle ', N'Amarillo', N'TX', N'79106', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (199, N'Clelia', N'Workman', NULL, N'clelia.workman@yahoo.com', N'620 North Somerset St. ', N'New Windsor', N'NY', N'12553', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (200, N'Ashely', N'Holmes', NULL, N'ashely.holmes@aol.com', N'45 High Ridge Ave. ', N'Farmingdale', N'NY', N'11735', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (201, N'Candis', N'Harding', NULL, N'candis.harding@gmail.com', N'33 NW. Cambridge Ave. ', N'Ballston Spa', N'NY', N'12020', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (202, N'Marni', N'Bolton', N'(717) 670-6268', N'marni.bolton@msn.com', N'7469 Plymouth Ave. ', N'Lancaster', N'NY', N'14086', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (203, N'Minerva', N'Decker', N'(281) 271-6390', N'minerva.decker@yahoo.com', N'794 Greenrose Street ', N'Houston', N'TX', N'77016', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (204, N'Alpha', N'King', NULL, N'alpha.king@hotmail.com', N'14 Henry Smith St. ', N'Rockville Centre', N'NY', N'11570', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (205, N'Harris', N'Pittman', NULL, N'harris.pittman@yahoo.com', N'404 Cherry Hill Road ', N'Jamaica', N'NY', N'11432', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (206, N'Stephaine', N'Riddle', NULL, N'stephaine.riddle@hotmail.com', N'199 Vermont Court ', N'Brooklyn', N'NY', N'11201', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (207, N'Michel', N'Blankenship', NULL, N'michel.blankenship@msn.com', N'382 West Hill Dr. ', N'Forney', N'TX', N'75126', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (208, N'Denis', N'Logan', NULL, N'denis.logan@msn.com', N'121 Rockcrest Street ', N'Ridgecrest', N'CA', N'93555', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (209, N'Jutta', N'Everett', NULL, N'jutta.everett@gmail.com', N'27 Taylor Ave. ', N'Selden', N'NY', N'11784', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (210, N'Priscilla', N'Wilkins', N'(229) 322-2269', N'priscilla.wilkins@aol.com', N'653 Pawnee Rd. ', N'Albany', N'NY', N'12203', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (211, N'Gilma', N'Dejesus', NULL, N'gilma.dejesus@yahoo.com', N'777 Thompson Ave. ', N'Scarsdale', N'NY', N'10583', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (212, N'Buford', N'Bridges', N'(248) 604-7346', N'buford.bridges@msn.com', N'239 Oak Valley Court ', N'Troy', N'NY', N'12180', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (213, N'Elenore', N'Hensley', NULL, N'elenore.hensley@hotmail.com', N'7037 Aspen St. ', N'Hamburg', N'NY', N'14075', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (214, N'Ross', N'Pugh', NULL, N'ross.pugh@msn.com', N'8598 Saxon St. ', N'North Tonawanda', N'NY', N'14120', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (215, N'Judith', N'Finley', NULL, N'judith.finley@hotmail.com', N'474 West Bank Road ', N'Whitestone', N'NY', N'11357', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (216, N'Wai', N'Soto', NULL, N'wai.soto@msn.com', N'30 Arch Drive ', N'Bethpage', N'NY', N'11714', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (217, N'Carline', N'Collier', N'(559) 810-6070', N'carline.collier@msn.com', N'28 Trenton Lane ', N'Fresno', N'CA', N'93706', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (218, N'Casey', N'Gill', NULL, N'casey.gill@gmail.com', N'636 Prospect Avenue ', N'Port Washington', N'NY', N'11050', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (219, N'Darcie', N'Morgan', N'(442) 618-7068', N'darcie.morgan@aol.com', N'476 East Adams Ave. ', N'Oceanside', N'NY', N'11572', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (220, N'Lucio', N'Sherman', NULL, N'lucio.sherman@gmail.com', N'842 Corona Ave. ', N'Smithtown', N'NY', N'11787', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (221, N'Clementine', N'Mooney', NULL, N'clementine.mooney@yahoo.com', N'678 Charles Court ', N'Mcallen', N'TX', N'78501', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (222, N'Anya', N'Contreras', NULL, N'anya.contreras@msn.com', N'38 Old Fairground St. ', N'East Northport', N'NY', N'11731', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (223, N'Scarlet', N'Yates', NULL, N'scarlet.yates@hotmail.com', N'687 Shirley St. ', N'Patchogue', N'NY', N'11772', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (224, N'Moses', N'Pope', NULL, N'moses.pope@yahoo.com', N'654 Theatre Street ', N'Lawndale', N'CA', N'90260', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (225, N'Barbera', N'Riggs', NULL, N'barbera.riggs@aol.com', N'12 Gartner Drive ', N'Plainview', N'NY', N'11803', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (226, N'Kiana', N'Rivera', NULL, N'kiana.rivera@gmail.com', N'9 Sheffield Dr. ', N'Richmond Hill', N'NY', N'11418', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (227, N'Danielle', N'Bond', NULL, N'danielle.bond@msn.com', N'8589 Shub Farm Street ', N'Patchogue', N'NY', N'11772', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (228, N'Whitney', N'Estes', N'(631) 315-4020', N'whitney.estes@gmail.com', N'454 Bear Hill Street ', N'Brentwood', N'NY', N'11717', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (229, N'Molly', N'Langley', NULL, N'molly.langley@aol.com', N'63 Bridgeton Street ', N'Holbrook', N'NY', N'11741', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (230, N'Chelsey', N'Hardin', NULL, N'chelsey.hardin@hotmail.com', N'13 Brickyard Street ', N'Deer Park', N'NY', N'11729', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (231, N'Jenee', N'Rasmussen', N'(916) 219-1774', N'jenee.rasmussen@hotmail.com', N'19 George Lane ', N'Sacramento', N'CA', N'95820', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (232, N'Freddie', N'Mathis', NULL, N'freddie.mathis@hotmail.com', N'31 Shady St. ', N'Euless', N'TX', N'76039', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (233, N'Mariana', N'Strong', NULL, N'mariana.strong@msn.com', N'972 Dunbar Dr. ', N'Santa Clara', N'CA', N'95050', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (234, N'Winfred', N'Harris', NULL, N'winfred.harris@msn.com', N'734 Glen Eagles St. ', N'East Meadow', N'NY', N'11554', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (235, N'Jeromy', N'Elliott', NULL, N'jeromy.elliott@gmail.com', N'7112 Laurel Street ', N'Bay Shore', N'NY', N'11706', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (236, N'Verona', N'O''neill', NULL, N'verona.o''neill@hotmail.com', N'8279 W. Sussex St. ', N'Selden', N'NY', N'11784', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (237, N'Elvera', N'Peck', NULL, N'elvera.peck@yahoo.com', N'759 Lakewood Street ', N'Banning', N'CA', N'92220', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (238, N'Cindi', N'Larson', NULL, N'cindi.larson@msn.com', N'896 Golden Star Rd. ', N'Howard Beach', N'NY', N'11414', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (239, N'Felice', N'Guzman', NULL, N'felice.guzman@hotmail.com', N'7 Creekside Lane ', N'Canyon Country', N'CA', N'91387', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (240, N'Le', N'Deleon', NULL, N'le.deleon@msn.com', N'58 Clark Court ', N'Banning', N'CA', N'92220', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (241, N'Manie', N'Sanchez', NULL, N'manie.sanchez@hotmail.com', N'471 Illinois Ave. ', N'Queensbury', N'NY', N'12804', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (242, N'Rutha', N'Howell', NULL, N'rutha.howell@gmail.com', N'9247 Jones Street ', N'Canyon Country', N'CA', N'91387', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (243, N'Natosha', N'Rowland', NULL, N'natosha.rowland@aol.com', N'51 Elmwood St. ', N'Ballston Spa', N'NY', N'12020', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (244, N'Jessika', N'Bray', NULL, N'jessika.bray@yahoo.com', N'37 East Greystone St. ', N'San Pablo', N'CA', N'94806', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (245, N'Delila', N'Hamilton', NULL, N'delila.hamilton@yahoo.com', N'7451 East James Ave. ', N'Palos Verdes Peninsula', N'CA', N'90274', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (246, N'Dionne', N'Norris', NULL, N'dionne.norris@yahoo.com', N'9993 Greenview Circle ', N'Niagara Falls', N'NY', N'14304', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (247, N'Muriel', N'Juarez', NULL, N'muriel.juarez@gmail.com', N'8073 Cemetery Drive ', N'Palos Verdes Peninsula', N'CA', N'90274', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (248, N'Cecelia', N'Gill', NULL, N'cecelia.gill@aol.com', N'372 Silver Spear Dr. ', N'Mcallen', N'TX', N'78501', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (249, N'Magda', N'Eaton', NULL, N'magda.eaton@aol.com', N'860 Middle River Street ', N'Ossining', N'NY', N'10562', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (250, N'Ivonne', N'Yang', N'(915) 181-1950', N'ivonne.yang@gmail.com', N'7359 North Lake View St. ', N'El Paso', N'TX', N'79930', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (251, N'Kasie', N'Rodriquez', NULL, N'kasie.rodriquez@aol.com', N'7 North Beech St. ', N'Ballston Spa', N'NY', N'12020', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (252, N'Eleni', N'Gordon', NULL, N'eleni.gordon@hotmail.com', N'583 W. San Carlos Street ', N'Richmond Hill', N'NY', N'11418', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (253, N'Maurice', N'Norton', NULL, N'maurice.norton@hotmail.com', N'32 Mayflower Dr. ', N'Atwater', N'CA', N'95301', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (254, N'Cristobal', N'Hutchinson', NULL, N'cristobal.hutchinson@gmail.com', N'58 Washington Avenue ', N'Lawndale', N'CA', N'90260', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (255, N'Flossie', N'Holder', NULL, N'flossie.holder@msn.com', N'8459 W. Newport Court ', N'Massapequa Park', N'NY', N'11762', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (256, N'Erma', N'Salinas', NULL, N'erma.salinas@gmail.com', N'347 Sheffield St. ', N'Merrick', N'NY', N'11566', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (257, N'Earl', N'Stanley', NULL, N'earl.stanley@gmail.com', N'569 Lake Lane ', N'Elmhurst', N'NY', N'11373', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (258, N'Maribel', N'William', NULL, N'maribel.william@aol.com', N'65 Magnolia Ave. ', N'Torrance', N'CA', N'90505', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (259, N'Johnathan', N'Velazquez', NULL, N'johnathan.velazquez@hotmail.com', N'9680 E. Somerset Street ', N'Pleasanton', N'CA', N'94566', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (260, N'Rodrick', N'Shelton', NULL, N'rodrick.shelton@hotmail.com', N'7157 Addison Street ', N'Canyon Country', N'CA', N'91387', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (261, N'Ferne', N'Kline', NULL, N'ferne.kline@hotmail.com', N'303 Shady St. ', N'Fullerton', N'CA', N'92831', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (262, N'Rubin', N'Decker', N'(716) 950-9835', N'rubin.decker@gmail.com', N'9875 Shady Ave. ', N'Buffalo', N'NY', N'14215', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (263, N'Dortha', N'Jarvis', N'(442) 919-8256', N'dortha.jarvis@yahoo.com', N'76 Prince Drive ', N'Oceanside', N'NY', N'11572', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (264, N'Mariela', N'Huffman', NULL, N'mariela.huffman@gmail.com', N'531 Fieldstone Road ', N'Garden City', N'NY', N'11530', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (265, N'Mellisa', N'Farley', NULL, N'mellisa.farley@yahoo.com', N'21 West Princess St. ', N'Central Islip', N'NY', N'11722', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (266, N'Myung', N'Hooper', NULL, N'myung.hooper@gmail.com', N'951 Mill Road ', N'Elmont', N'NY', N'11003', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (267, N'Angelina', N'Lloyd', NULL, N'angelina.lloyd@yahoo.com', N'9593 North Sherman Dr. ', N'Apple Valley', N'CA', N'92307', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (268, N'Trinity', N'Riddle', NULL, N'trinity.riddle@aol.com', N'23 Oakland Lane ', N'Ballston Spa', N'NY', N'12020', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (269, N'Barton', N'Crosby', NULL, N'barton.crosby@msn.com', N'896 Edgewater St. ', N'Bellmore', N'NY', N'11710', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (270, N'Claudio', N'Wise', NULL, N'claudio.wise@hotmail.com', N'810 Oxford Ave. ', N'Kingston', N'NY', N'12401', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (271, N'Katheleen', N'Marks', NULL, N'katheleen.marks@yahoo.com', N'69 North Tower St. ', N'Longview', N'TX', N'75604', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (272, N'Deja', N'Chaney', NULL, N'deja.chaney@hotmail.com', N'52 Woodside Ave. ', N'Jamaica', N'NY', N'11432', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (273, N'Queenie', N'Vance', NULL, N'queenie.vance@gmail.com', N'172 Arcadia Ave. ', N'Ozone Park', N'NY', N'11417', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (274, N'Josh', N'Shaw', NULL, N'josh.shaw@gmail.com', N'212 North Leeton Ridge Street ', N'Hopewell Junction', N'NY', N'12533', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (275, N'Pinkie', N'Kirkland', NULL, N'pinkie.kirkland@yahoo.com', N'18 Myers St. ', N'San Angelo', N'TX', N'76901', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (276, N'Lavette', N'Wright', NULL, N'lavette.wright@msn.com', N'6 Windsor Street ', N'Ronkonkoma', N'NY', N'11779', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (277, N'Mark', N'Garrett', NULL, N'mark.garrett@msn.com', N'285 Rosewood Dr. ', N'Monroe', N'NY', N'10950', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (278, N'Myesha', N'Burgess', NULL, N'myesha.burgess@gmail.com', N'306 Trenton Rd. ', N'Campbell', N'CA', N'95008', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (279, N'Justina', N'Long', NULL, N'justina.long@aol.com', N'39 Littleton Ave. ', N'South El Monte', N'CA', N'91733', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (280, N'Brenda', N'Tate', NULL, N'brenda.tate@msn.com', N'36 Hilltop Street ', N'San Angelo', N'TX', N'76901', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (281, N'Rayna', N'Perry', NULL, N'rayna.perry@hotmail.com', N'7238 Oakland St. ', N'Ozone Park', N'NY', N'11417', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (282, N'Randolph', N'Chase', NULL, N'randolph.chase@yahoo.com', N'828 Bridle Ave. ', N'San Lorenzo', N'CA', N'94580', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (283, N'Jaimee', N'Day', NULL, N'jaimee.day@aol.com', N'7534 Whitemarsh Ave. ', N'Poughkeepsie', N'NY', N'12601', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (284, N'Susann', N'Bass', NULL, N'susann.bass@msn.com', N'21 Old Rock Maple Ave. ', N'Commack', N'NY', N'11725', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (285, N'Leola', N'Gould', NULL, N'leola.gould@gmail.com', N'8 Kirkland St. ', N'Astoria', N'NY', N'11102', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (286, N'Virgil', N'Frost', NULL, N'virgil.frost@gmail.com', N'9798 Beacon St. ', N'Levittown', N'NY', N'11756', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (287, N'Mireille', N'Puckett', N'(805) 961-9909', N'mireille.puckett@hotmail.com', N'378 Purple Finch Drive ', N'Oxnard', N'CA', N'93035', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (288, N'Keturah', N'Massey', NULL, N'keturah.massey@msn.com', N'189 Arnold Drive ', N'Banning', N'CA', N'92220', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (289, N'Charmain', N'Webster', NULL, N'charmain.webster@hotmail.com', N'36 East Stonybrook Rd. ', N'Richardson', N'TX', N'75080', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (290, N'Barry', N'Buckner', NULL, N'barry.buckner@gmail.com', N'8779 High Noon Rd. ', N'Centereach', N'NY', N'11720', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (291, N'Boyce', N'Burks', NULL, N'boyce.burks@gmail.com', N'879 Harvey Dr. ', N'Sunnyside', N'NY', N'11104', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (292, N'Monty', N'Frost', N'(516) 460-5396', N'monty.frost@aol.com', N'76 Foxrun Dr. ', N'Hempstead', N'NY', N'11550', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (293, N'Tiny', N'French', NULL, N'tiny.french@hotmail.com', N'7163 Hall St. ', N'Plainview', N'NY', N'11803', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (294, N'Clementina', N'Sargent', NULL, N'clementina.sargent@hotmail.com', N'9853 Catherine Road ', N'Rome', N'NY', N'13440', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (295, N'Danny', N'Kim', NULL, N'danny.kim@msn.com', N'74 Essex Drive ', N'South Ozone Park', N'NY', N'11420', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (296, N'Sophia', N'Mcmillan', NULL, N'sophia.mcmillan@msn.com', N'8541 S. Pleasant Street ', N'Uniondale', N'NY', N'11553', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (297, N'Christia', N'Carson', NULL, N'christia.carson@gmail.com', N'220 Orchard Street ', N'Helotes', N'TX', N'78023', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (298, N'Jennie', N'Middleton', NULL, N'jennie.middleton@gmail.com', N'95 High Noon Dr. ', N'Upland', N'CA', N'91784', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (299, N'Jame', N'Riggs', NULL, N'jame.riggs@hotmail.com', N'9237 Hudson Drive ', N'Bay Shore', N'NY', N'11706', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (300, N'Rayford', N'Simon', NULL, N'rayford.simon@msn.com', N'998 Whitemarsh Road ', N'Mountain View', N'CA', N'94043', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (301, N'Annett', N'Garrett', NULL, N'annett.garrett@yahoo.com', N'19 Euclid Lane ', N'Scarsdale', N'NY', N'10583', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (302, N'Hayden', N'Cross', NULL, N'hayden.cross@gmail.com', N'90 Pumpkin Hill St. ', N'Apple Valley', N'CA', N'92307', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (303, N'Rolanda', N'Larsen', NULL, N'rolanda.larsen@yahoo.com', N'5 West University Court ', N'Woodhaven', N'NY', N'11421', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (304, N'Jayme', N'Zamora', NULL, N'jayme.zamora@gmail.com', N'2 Ridge Lane ', N'Springfield Gardens', N'NY', N'11413', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (305, N'Hope', N'Cotton', NULL, N'hope.cotton@aol.com', N'9092 Blue Spring Dr. ', N'Redondo Beach', N'CA', N'90278', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (306, N'Vikki', N'Erickson', NULL, N'vikki.erickson@yahoo.com', N'24 Jones Street ', N'Kingston', N'NY', N'12401', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (307, N'Fransisca', N'Nicholson', NULL, N'fransisca.nicholson@aol.com', N'945 Schoolhouse Street ', N'Glendora', N'CA', N'91740', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (308, N'Mazie', N'Fernandez', NULL, N'mazie.fernandez@hotmail.com', N'583 Harvard Ave. ', N'Webster', N'NY', N'14580', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (309, N'Anderson', N'Martin', NULL, N'anderson.martin@hotmail.com', N'9051 Hillside Dr. ', N'Canandaigua', N'NY', N'14424', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (310, N'Gilberto', N'Parsons', NULL, N'gilberto.parsons@gmail.com', N'8115 North Edgewater Drive ', N'Middle Village', N'NY', N'11379', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (311, N'Charise', N'Burt', N'(559) 888-2229', N'charise.burt@aol.com', N'582 Creek St. ', N'Fresno', N'CA', N'93706', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (312, N'Cameron', N'Carroll', NULL, N'cameron.carroll@yahoo.com', N'9133 South Halifax Ave. ', N'Longview', N'TX', N'75604', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (313, N'Melani', N'Jarvis', NULL, N'melani.jarvis@hotmail.com', N'8 Tunnel St. ', N'Maspeth', N'NY', N'11378', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (314, N'Javier', N'Nichols', NULL, N'javier.nichols@msn.com', N'8944 Marconi St. ', N'Rowlett', N'TX', N'75088', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (315, N'Justina', N'Jenkins', NULL, N'justina.jenkins@yahoo.com', N'8236 Creek St. ', N'Baldwin', N'NY', N'11510', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (316, N'Hortencia', N'Graham', NULL, N'hortencia.graham@aol.com', N'7764 Greenrose Street ', N'Euless', N'TX', N'76039', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (317, N'Christia', N'Wilkins', NULL, N'christia.wilkins@msn.com', N'7062 Willow Court ', N'Woodside', N'NY', N'11377', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (318, N'Eliz', N'Whitney', NULL, N'eliz.whitney@msn.com', N'523 Crescent Court ', N'Fullerton', N'CA', N'92831', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (319, N'Justin', N'Newton', NULL, N'justin.newton@hotmail.com', N'93 Shore Rd. ', N'Apple Valley', N'CA', N'92307', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (320, N'Aron', N'Wiggins', N'(442) 497-3353', N'aron.wiggins@aol.com', N'6 Bradford St. ', N'Oceanside', N'NY', N'11572', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (321, N'Chere', N'Hardin', NULL, N'chere.hardin@yahoo.com', N'763 Fulton Road ', N'Brooklyn', N'NY', N'11201', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (322, N'Merideth', N'Preston', NULL, N'merideth.preston@yahoo.com', N'794 Rockaway St. ', N'Poughkeepsie', N'NY', N'12601', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (323, N'Jeniffer', N'Slater', NULL, N'jeniffer.slater@aol.com', N'30 Old Orange Lane ', N'Schenectady', N'NY', N'12302', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (324, N'Laureen', N'Paul', NULL, N'laureen.paul@yahoo.com', N'617 Squaw Creek Rd. ', N'Bellmore', N'NY', N'11710', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (325, N'Berna', N'Moore', NULL, N'berna.moore@hotmail.com', N'7230 Lafayette Drive ', N'Bronx', N'NY', N'10451', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (326, N'Shiela', N'Calderon', NULL, N'shiela.calderon@msn.com', N'844 Albany St. ', N'Rocklin', N'CA', N'95677', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (327, N'Sharie', N'Alvarez', N'(212) 211-7621', N'sharie.alvarez@msn.com', N'987 West Leatherwood Dr. ', N'New York', N'NY', N'10002', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (328, N'Bettie', N'Glover', NULL, N'bettie.glover@gmail.com', N'9083 Addison Dr. ', N'Euless', N'TX', N'76039', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (329, N'Marilyn', N'Frank', NULL, N'marilyn.frank@aol.com', N'8878 Branch Street ', N'Port Chester', N'NY', N'10573', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (330, N'Sheba', N'Knapp', NULL, N'sheba.knapp@aol.com', N'86 Gates Street ', N'Woodside', N'NY', N'11377', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (331, N'Aleta', N'Mack', NULL, N'aleta.mack@yahoo.com', N'8869 W. Edgemont Lane ', N'Bay Shore', N'NY', N'11706', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (332, N'Reena', N'Higgins', NULL, N'reena.higgins@gmail.com', N'900 South Columbia Street ', N'Canyon Country', N'CA', N'91387', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (333, N'Ami', N'Mcmahon', NULL, N'ami.mcmahon@aol.com', N'566 Hilldale Drive ', N'Sunnyside', N'NY', N'11104', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (334, N'Somer', N'Jordan', NULL, N'somer.jordan@msn.com', N'7046 Helen Avenue ', N'Huntington Station', N'NY', N'11746', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (335, N'Scarlet', N'Reed', NULL, N'scarlet.reed@hotmail.com', N'151 S. Myers Court ', N'Bronx', N'NY', N'10451', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (336, N'Trisha', N'Johnson', N'(717) 126-8787', N'trisha.johnson@msn.com', N'59 Wild Horse St. ', N'Lancaster', N'NY', N'14086', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (337, N'Majorie', N'Wyatt', NULL, N'majorie.wyatt@yahoo.com', N'8507 Miller St. ', N'South Ozone Park', N'NY', N'11420', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (338, N'Abbey', N'Pugh', NULL, N'abbey.pugh@gmail.com', N'26 Market Drive ', N'Forest Hills', N'NY', N'11375', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (339, N'Tamela', N'Harrell', NULL, N'tamela.harrell@aol.com', N'7316 Cypress Rd. ', N'Central Islip', N'NY', N'11722', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (340, N'Yanira', N'Bradshaw', NULL, N'yanira.bradshaw@gmail.com', N'7484 Ann Court ', N'Smithtown', N'NY', N'11787', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (341, N'Delana', N'Scott', NULL, N'delana.scott@yahoo.com', N'7372 Ridgeview St. ', N'Mount Vernon', N'NY', N'10550', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (342, N'Cassondra', N'Pruitt', NULL, N'cassondra.pruitt@aol.com', N'4 Alderwood Circle ', N'Merrick', N'NY', N'11566', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (343, N'Jesica', N'Fields', NULL, N'jesica.fields@yahoo.com', N'318 Country Dr. ', N'Commack', N'NY', N'11725', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (344, N'Herta', N'Rollins', NULL, N'herta.rollins@msn.com', N'287 1st Drive ', N'Mountain View', N'CA', N'94043', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (345, N'Mi', N'Gray', N'(229) 813-2130', N'mi.gray@aol.com', N'27 Roehampton Dr. ', N'Albany', N'NY', N'12203', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (346, N'Jacalyn', N'Barnett', NULL, N'jacalyn.barnett@gmail.com', N'7537 Swanson Street ', N'Maspeth', N'NY', N'11378', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (347, N'Kanesha', N'Hudson', N'(510) 788-7298', N'kanesha.hudson@gmail.com', N'8293 Gartner Drive ', N'Oakland', N'CA', N'94603', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (348, N'Darren', N'Witt', NULL, N'darren.witt@aol.com', N'916 Hillcrest Ave. ', N'Coachella', N'CA', N'92236', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (349, N'Mable', N'Pratt', NULL, N'mable.pratt@gmail.com', N'254 SW. Temple Street ', N'Coachella', N'CA', N'92236', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (350, N'Christoper', N'Mccall', NULL, N'christoper.mccall@msn.com', N'72 Summit St. ', N'Bay Shore', N'NY', N'11706', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (351, N'Margorie', N'Wynn', NULL, N'margorie.wynn@gmail.com', N'707 Schoolhouse St. ', N'Monsey', N'NY', N'10952', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (352, N'Josef', N'Greer', NULL, N'josef.greer@gmail.com', N'92 Summer Court ', N'Jamaica', N'NY', N'11432', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (353, N'Tisa', N'Whitney', NULL, N'tisa.whitney@yahoo.com', N'549 Newbridge Dr. ', N'Monsey', N'NY', N'10952', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (354, N'Tonda', N'Armstrong', NULL, N'tonda.armstrong@aol.com', N'19 Forest Rd. ', N'Sunnyside', N'NY', N'11104', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (355, N'Arvilla', N'Weiss', NULL, N'arvilla.weiss@msn.com', N'477 Blue Spring St. ', N'Bay Shore', N'NY', N'11706', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (356, N'Vashti', N'Rosario', NULL, N'vashti.rosario@yahoo.com', N'623 Johnson Circle ', N'Bronx', N'NY', N'10451', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (357, N'Sheri', N'Cole', N'(408) 658-2285', N'sheri.cole@aol.com', N'479 Chapel Court ', N'San Jose', N'CA', N'95127', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (358, N'Kandace', N'Giles', NULL, N'kandace.giles@msn.com', N'30 NE. Walt Whitman Drive ', N'Wantagh', N'NY', N'11793', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (359, N'Angie', N'Powers', NULL, N'angie.powers@aol.com', N'6 Rockland Dr. ', N'Pomona', N'CA', N'91768', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (360, N'Van', N'Peters', N'(281) 658-7772', N'van.peters@yahoo.com', N'45 Fifth Dr. ', N'Houston', N'TX', N'77016', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (361, N'Virgina', N'Berg', NULL, N'virgina.berg@yahoo.com', N'804 South Purple Finch Drive ', N'Valley Stream', N'NY', N'11580', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (362, N'Olevia', N'Noel', NULL, N'olevia.noel@yahoo.com', N'39 N. Rosewood Dr. ', N'Kingston', N'NY', N'12401', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (363, N'Kaci', N'Gallegos', NULL, N'kaci.gallegos@gmail.com', N'8573 Halifax St. ', N'Ballston Spa', N'NY', N'12020', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (364, N'Bev', N'Chang', NULL, N'bev.chang@yahoo.com', N'104 Rockville St. ', N'Ithaca', N'NY', N'14850', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (365, N'Rodger', N'Rojas', NULL, N'rodger.rojas@yahoo.com', N'8442 Cooper Ave. ', N'Bayside', N'NY', N'11361', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (366, N'Lavonne', N'Anderson', NULL, N'lavonne.anderson@aol.com', N'9420 Wintergreen Court ', N'Floral Park', N'NY', N'11001', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (367, N'Blanca', N'Hooper', NULL, N'blanca.hooper@msn.com', N'340 Bald Hill St. ', N'Ozone Park', N'NY', N'11417', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (368, N'Alysha', N'Powers', NULL, N'alysha.powers@msn.com', N'39 West Marshall Ave. ', N'Forest Hills', N'NY', N'11375', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (369, N'Mary', N'Singleton', NULL, N'mary.singleton@hotmail.com', N'474 Amerige Ave. ', N'Woodside', N'NY', N'11377', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (370, N'Jina', N'Cooper', NULL, N'jina.cooper@aol.com', N'8947 W. Lexington Rd. ', N'Howard Beach', N'NY', N'11414', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (371, N'Loni', N'Duncan', NULL, N'loni.duncan@gmail.com', N'80 Saxton Lane ', N'Rosedale', N'NY', N'11422', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (372, N'Collene', N'Roman', NULL, N'collene.roman@aol.com', N'30 North Argyle Dr. ', N'Wappingers Falls', N'NY', N'12590', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (373, N'Mariette', N'Trevino', NULL, N'mariette.trevino@aol.com', N'4 Border Court ', N'Utica', N'NY', N'13501', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (374, N'Candelaria', N'Coffey', NULL, N'candelaria.coffey@aol.com', N'45 Newport Lane ', N'Merrick', N'NY', N'11566', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (375, N'Yan', N'Trevino', NULL, N'yan.trevino@gmail.com', N'796 Jefferson Rd. ', N'Uniondale', N'NY', N'11553', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (376, N'Elanor', N'Patrick', NULL, N'elanor.patrick@aol.com', N'51 Howard Ave. ', N'Victoria', N'TX', N'77904', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (377, N'Klara', N'Mosley', NULL, N'klara.mosley@gmail.com', N'518 Devon Court ', N'Port Chester', N'NY', N'10573', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (378, N'Rosalba', N'O''neal', NULL, N'rosalba.o''neal@yahoo.com', N'7517 Pennsylvania St. ', N'Mount Vernon', N'NY', N'10550', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (379, N'Mina', N'Carrillo', NULL, N'mina.carrillo@aol.com', N'8659 Trenton Lane ', N'Uniondale', N'NY', N'11553', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (380, N'Alesia', N'Horne', NULL, N'alesia.horne@aol.com', N'9229 Amherst Lane ', N'Selden', N'NY', N'11784', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (381, N'Kristen', N'Alvarez', NULL, N'kristen.alvarez@aol.com', N'9778 North River St. ', N'Bronx', N'NY', N'10451', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (382, N'Collin', N'Webster', NULL, N'collin.webster@aol.com', N'475 Cottage Rd. ', N'Howard Beach', N'NY', N'11414', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (383, N'Ashlee', N'Pena', NULL, N'ashlee.pena@aol.com', N'966 Highland St. ', N'Whitestone', N'NY', N'11357', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (384, N'Aimee', N'Merritt', NULL, N'aimee.merritt@yahoo.com', N'537 East Meadowbrook St. ', N'Flushing', N'NY', N'11354', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (385, N'Rochelle', N'Ward', NULL, N'rochelle.ward@yahoo.com', N'7855 La Sierra Street ', N'Glendora', N'CA', N'91740', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (386, N'Nelle', N'Beck', NULL, N'nelle.beck@aol.com', N'8998 Wakehurst Drive ', N'Upland', N'CA', N'91784', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (387, N'Kaila', N'Walters', NULL, N'kaila.walters@msn.com', N'57 Gates Drive ', N'Elmhurst', N'NY', N'11373', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (388, N'Aleta', N'Stone', NULL, N'aleta.stone@aol.com', N'8 Elm Dr. ', N'Whitestone', N'NY', N'11357', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (389, N'Leif', N'Short', NULL, N'leif.short@gmail.com', N'962 Carpenter Ave. ', N'San Angelo', N'TX', N'76901', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (390, N'Lorrie', N'Pollard', NULL, N'lorrie.pollard@yahoo.com', N'7834 Shore Ave. ', N'Ronkonkoma', N'NY', N'11779', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (391, N'Vernita', N'Ball', NULL, N'vernita.ball@gmail.com', N'126 Arnold Dr. ', N'Los Banos', N'CA', N'93635', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (392, N'Cyndi', N'Bush', NULL, N'cyndi.bush@gmail.com', N'18 Smoky Hollow Drive ', N'Elmhurst', N'NY', N'11373', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (393, N'Gertrude', N'Terry', NULL, N'gertrude.terry@hotmail.com', N'34 Airport Dr. ', N'Upland', N'CA', N'91784', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (394, N'Virgen', N'Clemons', NULL, N'virgen.clemons@gmail.com', N'354 Cactus Drive ', N'South El Monte', N'CA', N'91733', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (395, N'Fairy', N'Robinson', NULL, N'fairy.robinson@msn.com', N'8837 Joy Ridge St. ', N'Liverpool', N'NY', N'13090', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (396, N'Laverna', N'Hernandez', NULL, N'laverna.hernandez@hotmail.com', N'34 South Longfellow St. ', N'Niagara Falls', N'NY', N'14304', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (397, N'Jeannie', N'Wilcox', NULL, N'jeannie.wilcox@yahoo.com', N'7744 Miles Dr. ', N'Franklin Square', N'NY', N'11010', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (398, N'Suellen', N'Mercado', NULL, N'suellen.mercado@yahoo.com', N'3 Taylor Drive ', N'Sunnyside', N'NY', N'11104', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (399, N'Bart', N'Hess', NULL, N'bart.hess@aol.com', N'799 N. Maiden Street ', N'Kingston', N'NY', N'12401', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (400, N'Alfredo', N'Dodson', NULL, N'alfredo.dodson@hotmail.com', N'8960 Glenholme Dr. ', N'Depew', N'NY', N'14043', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (401, N'Shaunda', N'Barnett', NULL, N'shaunda.barnett@gmail.com', N'9366 San Carlos Lane ', N'Longview', N'TX', N'75604', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (402, N'Kerrie', N'Morton', NULL, N'kerrie.morton@hotmail.com', N'8772 State St. ', N'Pittsford', N'NY', N'14534', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (403, N'Elouise', N'Fry', NULL, N'elouise.fry@aol.com', N'49 Bohemia Street ', N'Canyon Country', N'CA', N'91387', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (404, N'Augustus', N'Steele', NULL, N'augustus.steele@aol.com', N'7474 N. Orchard St. ', N'Ballston Spa', N'NY', N'12020', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (405, N'Greta', N'Page', NULL, N'greta.page@hotmail.com', N'8316 Augusta Drive ', N'Commack', N'NY', N'11725', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (406, N'Kerrie', N'O''neill', NULL, N'kerrie.o''neill@gmail.com', N'69 Wellington Ave. ', N'Shirley', N'NY', N'11967', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (407, N'Dannette', N'Guerrero', NULL, N'dannette.guerrero@gmail.com', N'68 Carriage Street ', N'San Pablo', N'CA', N'94806', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (408, N'Edra', N'Fitzgerald', NULL, N'edra.fitzgerald@msn.com', N'8892 Birchwood St. ', N'Central Islip', N'NY', N'11722', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (409, N'Jerome', N'Bolton', NULL, N'jerome.bolton@msn.com', N'9921 Argyle Street ', N'Carmel', N'NY', N'10512', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (410, N'Conception', N'Slater', NULL, N'conception.slater@gmail.com', N'5 Sunset Street ', N'Bellmore', N'NY', N'11710', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (411, N'Octavia', N'Case', N'(212) 171-1335', N'octavia.case@aol.com', N'40 Charles Road ', N'New York', N'NY', N'10002', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (412, N'Dexter', N'Roberts', NULL, N'dexter.roberts@gmail.com', N'84 Thatcher Court ', N'Sunnyside', N'NY', N'11104', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (413, N'Ginette', N'Edwards', NULL, N'ginette.edwards@hotmail.com', N'9262 NW. Center Ave. ', N'Baldwin', N'NY', N'11510', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (414, N'Romaine', N'Haley', NULL, N'romaine.haley@aol.com', N'737 Edgefield Drive ', N'Ithaca', N'NY', N'14850', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (415, N'Gwendolyn', N'Miller', NULL, N'gwendolyn.miller@msn.com', N'90 Fordham Ave. ', N'Harlingen', N'TX', N'78552', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (416, N'Luke', N'Fuller', N'(516) 363-2253', N'luke.fuller@hotmail.com', N'576 Cleveland Lane ', N'Hempstead', N'NY', N'11550', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (417, N'Zoraida', N'Patton', NULL, N'zoraida.patton@aol.com', N'95 Grand Dr. ', N'Huntington Station', N'NY', N'11746', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (418, N'Georgeanna', N'Webster', N'(805) 885-8830', N'georgeanna.webster@msn.com', N'40 Creekside Circle ', N'Oxnard', N'CA', N'93035', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (419, N'Krystin', N'Marshall', NULL, N'krystin.marshall@hotmail.com', N'10 Old Proctor Lane ', N'Poughkeepsie', N'NY', N'12601', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (420, N'Vince', N'Schneider', NULL, N'vince.schneider@hotmail.com', N'473 Corona Ave. ', N'Merrick', N'NY', N'11566', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (421, N'Iola', N'Rasmussen', NULL, N'iola.rasmussen@yahoo.com', N'283 N. Manor Station Dr. ', N'Monroe', N'NY', N'10950', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (422, N'Valery', N'Saunders', NULL, N'valery.saunders@msn.com', N'42 Marlborough St. ', N'Victoria', N'TX', N'77904', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (423, N'Johna', N'Powers', NULL, N'johna.powers@hotmail.com', N'379 Central Ave. ', N'Deer Park', N'NY', N'11729', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (424, N'Charleen', N'Hurst', NULL, N'charleen.hurst@yahoo.com', N'87 Country Avenue ', N'Utica', N'NY', N'13501', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (425, N'Augustina', N'Joyner', NULL, N'augustina.joyner@aol.com', N'7931 Honey Creek Court ', N'Mount Vernon', N'NY', N'10550', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (426, N'Daisy', N'Ward', NULL, N'daisy.ward@msn.com', N'45 Silver Spear Ave. ', N'Pomona', N'CA', N'91768', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (427, N'Latonya', N'Dixon', NULL, N'latonya.dixon@hotmail.com', N'9399 Evergreen Street ', N'Garland', N'TX', N'75043', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (428, N'Hipolito', N'Padilla', NULL, N'hipolito.padilla@hotmail.com', N'311 E. Rose Avenue ', N'New Rochelle', N'NY', N'10801', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (429, N'Emmett', N'Casey', NULL, N'emmett.casey@yahoo.com', N'893 Logan St. ', N'Valley Stream', N'NY', N'11580', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (430, N'Kandi', N'Mcneil', NULL, N'kandi.mcneil@msn.com', N'402 Border Street ', N'Massapequa Park', N'NY', N'11762', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (431, N'Luciano', N'Marsh', NULL, N'luciano.marsh@aol.com', N'7685 South Willow Drive ', N'Bellmore', N'NY', N'11710', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (432, N'Julius', N'Holt', NULL, N'julius.holt@aol.com', N'386 Lower River Street ', N'East Meadow', N'NY', N'11554', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (433, N'Holly', N'Nieves', NULL, N'holly.nieves@aol.com', N'60 Cleveland St. ', N'Longview', N'TX', N'75604', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (434, N'Douglass', N'Little', NULL, N'douglass.little@hotmail.com', N'294 Harvey Drive ', N'Duarte', N'CA', N'91010', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (435, N'Izola', N'Hobbs', NULL, N'izola.hobbs@gmail.com', N'685 Beacon Dr. ', N'Woodhaven', N'NY', N'11421', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (436, N'Honey', N'Camacho', NULL, N'honey.camacho@gmail.com', N'934 2nd St. ', N'Bayside', N'NY', N'11361', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (437, N'Laureen', N'Barry', NULL, N'laureen.barry@yahoo.com', N'909 Ridge St. ', N'Orchard Park', N'NY', N'14127', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (438, N'Katharine', N'Herrera', NULL, N'katharine.herrera@hotmail.com', N'395 SE. Branch St. ', N'Queensbury', N'NY', N'12804', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (439, N'Sunshine', N'Rosario', NULL, N'sunshine.rosario@aol.com', N'1 Chestnut Lane ', N'Jamaica', N'NY', N'11432', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (440, N'Yevette', N'Todd', NULL, N'yevette.todd@aol.com', N'119 Lakewood Rd. ', N'Ballston Spa', N'NY', N'12020', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (441, N'Dorthea', N'Walker', NULL, N'dorthea.walker@aol.com', N'11 Third St. ', N'Port Washington', N'NY', N'11050', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (442, N'Alane', N'Munoz', N'(914) 706-7576', N'alane.munoz@gmail.com', N'8 Strawberry Dr. ', N'Yonkers', N'NY', N'10701', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (443, N'Ayana', N'Keith', N'(805) 230-2101', N'ayana.keith@hotmail.com', N'182 Thorne Road ', N'Oxnard', N'CA', N'93035', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (444, N'Caridad', N'Compton', NULL, N'caridad.compton@aol.com', N'9575 SW. Kingston Court ', N'San Lorenzo', N'CA', N'94580', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (445, N'Earline', N'Ballard', NULL, N'earline.ballard@hotmail.com', N'939 Lyme Road ', N'Mount Vernon', N'NY', N'10550', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (446, N'Nathanael', N'Bradley', NULL, N'nathanael.bradley@aol.com', N'58 Third St. ', N'Amsterdam', N'NY', N'12010', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (447, N'Chasidy', N'Tran', NULL, N'chasidy.tran@msn.com', N'9286 Anderson Street ', N'Vista', N'CA', N'92083', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (448, N'Janella', N'Bright', N'(507) 616-2958', N'janella.bright@aol.com', N'7317 Tower Dr. ', N'Rochester', N'NY', N'14606', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (449, N'Josie', N'Schultz', NULL, N'josie.schultz@hotmail.com', N'225 Mammoth Street ', N'Canyon Country', N'CA', N'91387', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (450, N'Ellsworth', N'Michael', NULL, N'ellsworth.michael@yahoo.com', N'9982 White St. ', N'Carmel', N'NY', N'10512', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (451, N'Jennette', N'Wooten', NULL, N'jennette.wooten@msn.com', N'8221 Bow Ridge Lane ', N'Rowlett', N'TX', N'75088', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (452, N'Cassandra', N'Nichols', NULL, N'cassandra.nichols@yahoo.com', N'4 Glenwood Circle ', N'Hicksville', N'NY', N'11801', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (453, N'Courtney', N'Wyatt', NULL, N'courtney.wyatt@gmail.com', N'369 Arrowhead St. ', N'Garden City', N'NY', N'11530', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (454, N'Terese', N'Palmer', NULL, N'terese.palmer@hotmail.com', N'8 Sugar Drive ', N'Bay Shore', N'NY', N'11706', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (455, N'Sherita', N'Cherry', NULL, N'sherita.cherry@gmail.com', N'9636 Old Cedarwood Street ', N'Liverpool', N'NY', N'13090', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (456, N'Serina', N'Hensley', NULL, N'serina.hensley@yahoo.com', N'53 Proctor Drive ', N'Jamaica', N'NY', N'11432', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (457, N'Jeni', N'Farley', NULL, N'jeni.farley@aol.com', N'4 Mill Lane ', N'Richmond Hill', N'NY', N'11418', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (458, N'Everett', N'Vega', NULL, N'everett.vega@yahoo.com', N'7859 James Ave. ', N'Holbrook', N'NY', N'11741', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (459, N'Latosha', N'Dalton', N'(661) 529-4501', N'latosha.dalton@yahoo.com', N'59 E. Wintergreen Ave. ', N'Bakersfield', N'CA', N'93306', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (460, N'Romelia', N'Myers', NULL, N'romelia.myers@msn.com', N'8630 Brook St. ', N'Garden City', N'NY', N'11530', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (461, N'Effie', N'Jenkins', N'(631) 477-1277', N'effie.jenkins@msn.com', N'75 South Glen Eagles Court ', N'Brentwood', N'NY', N'11717', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (462, N'Efren', N'Oliver', NULL, N'efren.oliver@gmail.com', N'9343 1st Rd. ', N'Nanuet', N'NY', N'10954', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (463, N'Jerlene', N'Rios', NULL, N'jerlene.rios@yahoo.com', N'32 Griffin St. ', N'Plainview', N'NY', N'11803', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (464, N'Bess', N'Mcbride', NULL, N'bess.mcbride@yahoo.com', N'9832 Winchester St. ', N'Garden City', N'NY', N'11530', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (465, N'Birdie', N'Kramer', N'(248) 725-2174', N'birdie.kramer@hotmail.com', N'311 Newcastle Dr. ', N'Troy', N'NY', N'12180', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (466, N'Collen', N'Hayes', NULL, N'collen.hayes@yahoo.com', N'117 Eagle St. ', N'Smithtown', N'NY', N'11787', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (467, N'Clare', N'Neal', NULL, N'clare.neal@msn.com', N'8922 Shady Ave. ', N'Mahopac', N'NY', N'10541', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (468, N'Jeanett', N'Herman', NULL, N'jeanett.herman@hotmail.com', N'839 East Arch Street ', N'Lindenhurst', N'NY', N'11757', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (469, N'Micki', N'Rutledge', NULL, N'micki.rutledge@aol.com', N'9868 Marvon Street ', N'Richmond Hill', N'NY', N'11418', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (470, N'Loise', N'Walker', NULL, N'loise.walker@aol.com', N'201 Glen Eagles St. ', N'Shirley', N'NY', N'11967', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (471, N'Burma', N'Summers', NULL, N'burma.summers@yahoo.com', N'890 East Elmwood Street ', N'Freeport', N'NY', N'11520', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (472, N'Myron', N'Ruiz', NULL, N'myron.ruiz@gmail.com', N'45 Shadow Brook Lane ', N'Amityville', N'NY', N'11701', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (473, N'Lashawna', N'Richardson', NULL, N'lashawna.richardson@hotmail.com', N'9920 Purple Finch St. ', N'Baldwin', N'NY', N'11510', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (474, N'Lavern', N'Orr', NULL, N'lavern.orr@hotmail.com', N'913 N. Young Street ', N'Webster', N'NY', N'14580', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (475, N'Alec', N'Peck', NULL, N'alec.peck@hotmail.com', N'4 W. Belmont St. ', N'Victoria', N'TX', N'77904', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (476, N'Christopher', N'Richardson', NULL, N'christopher.richardson@gmail.com', N'7846 Windfall Dr. ', N'Santa Cruz', N'CA', N'95060', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (477, N'Arminda', N'Weber', NULL, N'arminda.weber@yahoo.com', N'6 Hill Field St. ', N'Bellmore', N'NY', N'11710', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (478, N'Emmett', N'Hahn', NULL, N'emmett.hahn@hotmail.com', N'7727 6th St. ', N'Freeport', N'NY', N'11520', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (479, N'Gertha', N'Mejia', NULL, N'gertha.mejia@yahoo.com', N'518 Orchard St. ', N'Flushing', N'NY', N'11354', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (480, N'Garland', N'Weaver', NULL, N'garland.weaver@gmail.com', N'7161 Goldfield Court ', N'Amsterdam', N'NY', N'12010', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (481, N'Jayson', N'Rutledge', NULL, N'jayson.rutledge@yahoo.com', N'8672 Coffee St. ', N'Lake Jackson', N'TX', N'77566', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (482, N'Narcisa', N'Knapp', NULL, N'narcisa.knapp@aol.com', N'435 Dogwood Dr. ', N'Amarillo', N'TX', N'79106', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (483, N'Gayla', N'Sims', NULL, N'gayla.sims@gmail.com', N'98 Hall Street ', N'Lindenhurst', N'NY', N'11757', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (484, N'Chelsey', N'Boyd', NULL, N'chelsey.boyd@yahoo.com', N'9569 Birchpond Ave. ', N'Euless', N'TX', N'76039', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (485, N'Catherine', N'Miles', NULL, N'catherine.miles@msn.com', N'7189 Elm Dr. ', N'East Elmhurst', N'NY', N'11369', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (486, N'Valeri', N'Marshall', NULL, N'valeri.marshall@hotmail.com', N'494 East Brewery Dr. ', N'East Meadow', N'NY', N'11554', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (487, N'Grace', N'Madden', NULL, N'grace.madden@gmail.com', N'606 East Rocky River St. ', N'San Pablo', N'CA', N'94806', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (488, N'Joaquin', N'Hawkins', N'(657) 557-1746', N'joaquin.hawkins@aol.com', N'3 Oklahoma Lane ', N'Anaheim', N'CA', N'92806', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (489, N'Kirstie', N'Vazquez', NULL, N'kirstie.vazquez@gmail.com', N'8006 Rockland Ave. ', N'Saratoga Springs', N'NY', N'12866', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (490, N'Yu', N'Mcdonald', NULL, N'yu.mcdonald@aol.com', N'784 Pheasant Rd. ', N'Ossining', N'NY', N'10562', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (491, N'Celestine', N'Jacobs', NULL, N'celestine.jacobs@gmail.com', N'87 Hanover Rd. ', N'Massapequa', N'NY', N'11758', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (492, N'Justa', N'Thompson', NULL, N'justa.thompson@aol.com', N'43 Manor Ave. ', N'Corona', N'NY', N'11368', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (493, N'Lise', N'Alvarado', NULL, N'lise.alvarado@gmail.com', N'9816 Newcastle Dr. ', N'Hamburg', N'NY', N'14075', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (494, N'Pearl', N'Fox', NULL, N'pearl.fox@yahoo.com', N'9415 Honey Creek Dr. ', N'Uniondale', N'NY', N'11553', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (495, N'Travis', N'Goodman', NULL, N'travis.goodman@yahoo.com', N'65 Rockcrest Dr. ', N'Los Banos', N'CA', N'93635', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (496, N'Shu', N'Mays', NULL, N'shu.mays@gmail.com', N'996 St Margarets Lane ', N'Astoria', N'NY', N'11102', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (497, N'Ezra', N'Fowler', NULL, N'ezra.fowler@hotmail.com', N'16 Pearl St. ', N'Nanuet', N'NY', N'10954', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (498, N'Edda', N'Young', NULL, N'edda.young@gmail.com', N'50 S. Airport Street ', N'North Tonawanda', N'NY', N'14120', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (499, N'Lidia', N'Ashley', NULL, N'lidia.ashley@hotmail.com', N'8436 Meadow St. ', N'Baldwinsville', N'NY', N'13027', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (500, N'Moira', N'Lester', NULL, N'moira.lester@msn.com', N'496 Greystone Court ', N'Jackson Heights', N'NY', N'11372', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (501, N'abc', N'fasof', N'0490348', N'fhsaif@abc.com', N'fasif', N'Albany', N'CA', N'10002', NULL, NULL)
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code], [username], [password]) VALUES (502, N'an', N'fasof', N'0490348', N'fhsaif@abc.com', N'fasif', N'Albany', N'CA', N'10002', NULL, NULL)
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1, 2, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1, 3, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1, 4, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1, 5, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (4, 1, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (6, 1, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (6, 2, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (6, 3, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (6, 4, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (6, 5, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (7, 1, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (7, 2, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (7, 3, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (9, 1, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (10, 1, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (12, 1, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (12, 2, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (14, 1, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (15, 1, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (15, 2, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (15, 3, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (15, 4, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (27, 1, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (27, 2, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (27, 3, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (27, 4, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (28, 1, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (28, 2, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (28, 3, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (28, 4, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (29, 1, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (29, 2, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (29, 3, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (29, 4, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (29, 5, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (33, 1, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (33, 2, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (34, 1, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (34, 2, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (34, 3, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (37, 1, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (40, 1, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (40, 2, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (60, 1, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (60, 2, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (60, 3, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (60, 4, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (61, 1, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (61, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (61, 3, 5, 2, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (62, 1, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (62, 2, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (62, 3, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (68, 1, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (68, 2, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (70, 1, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (70, 2, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (70, 3, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (74, 1, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (74, 2, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (76, 1, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (76, 2, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (76, 3, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (77, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (77, 2, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (77, 3, 26, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (77, 4, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (80, 1, 26, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (80, 2, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (80, 3, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (83, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (83, 2, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (84, 1, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (84, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (86, 1, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (86, 2, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (86, 3, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (86, 4, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (90, 1, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (90, 2, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (95, 1, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (95, 2, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (95, 3, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (95, 4, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (97, 1, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (97, 2, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (97, 3, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (97, 4, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (101, 1, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (102, 1, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (102, 2, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (104, 1, 19, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (104, 2, 26, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (105, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (105, 2, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (105, 3, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (106, 1, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (106, 2, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (108, 1, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (108, 2, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (108, 3, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (112, 1, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (112, 2, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (112, 3, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (112, 4, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (116, 1, 26, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (120, 1, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (120, 2, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (120, 3, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (120, 4, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (120, 5, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (124, 1, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (124, 2, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (124, 3, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (127, 1, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (127, 2, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (127, 3, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (128, 1, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (128, 2, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (128, 3, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (128, 4, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (129, 1, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (129, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (131, 1, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (131, 2, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (131, 3, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (132, 1, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (132, 2, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (132, 3, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (133, 1, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (133, 2, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (137, 1, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (137, 2, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (138, 1, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (138, 2, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (142, 1, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (142, 2, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (142, 3, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (145, 1, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (145, 2, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (146, 1, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (146, 2, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (146, 3, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (146, 4, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (146, 5, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (147, 1, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (150, 1, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (150, 2, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (150, 3, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (150, 4, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (152, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (152, 2, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (152, 3, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (153, 1, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (153, 2, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (153, 3, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (155, 1, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (156, 1, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (156, 2, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (156, 3, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (157, 1, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (157, 2, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (158, 1, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (159, 1, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (160, 1, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (160, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (160, 3, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (160, 4, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (161, 1, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (161, 2, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (161, 3, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (162, 1, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (162, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (162, 3, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (166, 1, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (166, 2, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (169, 1, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (169, 2, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (169, 3, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (169, 4, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (169, 5, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (171, 1, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (173, 1, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (173, 2, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (173, 3, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (177, 1, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (181, 1, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (181, 2, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (181, 3, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (181, 4, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (183, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (183, 2, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (183, 3, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (183, 4, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (184, 1, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (184, 2, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (184, 3, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (185, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (185, 2, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (187, 1, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (188, 1, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (190, 1, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (190, 2, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (190, 3, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (197, 1, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (197, 2, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (201, 1, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (201, 2, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (201, 3, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (201, 4, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (207, 1, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (207, 2, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (207, 3, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (207, 4, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (214, 1, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (216, 1, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (216, 2, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (222, 1, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (222, 2, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (224, 1, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (224, 2, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (224, 3, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (224, 4, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (225, 1, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (225, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (227, 1, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (227, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (236, 1, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (236, 2, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (236, 3, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (239, 1, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (239, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (239, 3, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (239, 4, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (240, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (240, 2, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (240, 3, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (240, 4, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (245, 1, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (245, 2, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (246, 1, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (249, 1, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (249, 2, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (249, 3, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (250, 1, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (250, 2, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (252, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (252, 2, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (252, 3, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (256, 1, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (256, 2, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (258, 1, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (258, 2, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (258, 3, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (258, 4, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (259, 1, 26, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (259, 2, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (259, 3, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (259, 4, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (264, 1, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (264, 2, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (264, 3, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (264, 4, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (267, 1, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (267, 2, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (267, 3, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (267, 4, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (267, 5, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (271, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (271, 2, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (271, 3, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (271, 4, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (272, 1, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (272, 2, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (274, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (274, 2, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (274, 3, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (279, 1, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (282, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (282, 2, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (282, 3, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (282, 4, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (283, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (283, 2, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (285, 1, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (285, 2, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (285, 3, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (286, 1, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (286, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (286, 3, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (286, 4, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (287, 1, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (287, 2, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (287, 3, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (287, 4, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (290, 1, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (290, 2, 5, 2, CAST(1320.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (290, 3, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (291, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (291, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (292, 1, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (292, 2, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (292, 3, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (299, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (299, 2, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (301, 1, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (301, 2, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (303, 1, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (303, 2, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (304, 1, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (304, 2, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (304, 3, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (306, 1, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (306, 2, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (308, 1, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (308, 2, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (308, 3, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (309, 1, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (309, 2, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (312, 1, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (312, 2, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (312, 3, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (324, 1, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (324, 2, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (324, 3, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (324, 4, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (324, 5, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (327, 1, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (327, 2, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (327, 3, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (329, 1, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (329, 2, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (329, 3, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (329, 4, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (329, 5, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (349, 1, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (350, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (350, 2, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (350, 3, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (352, 1, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (352, 2, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (357, 1, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (357, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (357, 3, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (357, 4, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (359, 1, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (359, 2, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (359, 3, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (362, 1, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (364, 1, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (372, 1, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (372, 2, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (372, 3, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (373, 1, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (373, 2, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (373, 3, 19, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (373, 4, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (373, 5, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (378, 1, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (382, 1, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (382, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (382, 3, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (383, 1, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (383, 2, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (383, 3, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (383, 4, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (383, 5, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (384, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (384, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (384, 3, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (384, 4, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (384, 5, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (387, 1, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (389, 1, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (389, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (389, 3, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (389, 4, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (389, 5, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (391, 1, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (391, 2, 5, 2, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (391, 3, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (392, 1, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (392, 2, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (393, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (395, 1, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (398, 1, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (398, 2, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (398, 3, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (398, 4, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (401, 1, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (401, 2, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (404, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (404, 2, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (404, 3, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (407, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (407, 2, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (409, 1, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (409, 2, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (409, 3, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (411, 1, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (411, 2, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (417, 1, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (417, 2, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (418, 1, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (418, 2, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (419, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (420, 1, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (420, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (420, 3, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (421, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (421, 2, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (421, 3, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (421, 4, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (421, 5, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (422, 1, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (424, 1, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (424, 2, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (427, 1, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (427, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (427, 3, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (429, 1, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (429, 2, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (429, 3, 5, 2, CAST(1320.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (429, 4, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (429, 5, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (430, 1, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (430, 2, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (430, 3, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (430, 4, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (430, 5, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (432, 1, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (432, 2, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (435, 1, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (435, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (435, 3, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (438, 1, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (438, 2, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (438, 3, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (438, 4, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (439, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (439, 2, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (444, 1, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (444, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (444, 3, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (444, 4, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (444, 5, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (445, 1, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (445, 2, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (445, 3, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (446, 1, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (446, 2, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (448, 1, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (448, 2, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (449, 1, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (449, 2, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (449, 3, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (449, 4, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (458, 1, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (458, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (458, 3, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (458, 4, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (458, 5, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (464, 1, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (472, 1, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (472, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (475, 1, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (475, 2, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (475, 3, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (477, 1, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (477, 2, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (478, 1, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (481, 1, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (481, 2, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (481, 3, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (484, 1, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (484, 2, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (484, 3, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (484, 4, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (485, 1, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (485, 2, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (492, 1, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (492, 2, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (492, 3, 26, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (496, 1, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (496, 2, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (496, 3, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (499, 1, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (499, 2, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (499, 3, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (499, 4, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (500, 1, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (500, 2, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (502, 1, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (509, 1, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (509, 2, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (511, 1, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (511, 2, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (512, 1, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (513, 1, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (513, 2, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (513, 3, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (516, 1, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (516, 2, 5, 2, CAST(1320.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (519, 1, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (519, 2, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (519, 3, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (519, 4, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (519, 5, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (531, 1, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (531, 2, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (531, 3, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (538, 1, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (542, 1, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (542, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (542, 3, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (542, 4, 19, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (543, 1, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (543, 2, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (543, 3, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (544, 1, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (544, 2, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (544, 3, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (546, 1, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (546, 2, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (546, 3, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (547, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (547, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (547, 3, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (549, 1, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (549, 2, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (549, 3, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (549, 4, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (549, 5, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (554, 1, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (554, 2, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (554, 3, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (555, 1, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (555, 2, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (555, 3, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (556, 1, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (556, 2, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (561, 1, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (561, 2, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (561, 3, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (561, 4, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (563, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (563, 2, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (563, 3, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (566, 1, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (566, 2, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (566, 3, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (566, 4, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (571, 1, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (571, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (572, 1, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (572, 2, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (572, 3, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (573, 1, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (575, 1, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (575, 2, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (577, 1, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (579, 1, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (579, 2, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (582, 1, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (582, 2, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (587, 1, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (587, 2, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (587, 3, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (587, 4, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (588, 1, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (588, 2, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (593, 1, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (593, 2, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (598, 1, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (598, 2, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (598, 3, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (599, 1, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (599, 2, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (599, 3, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (599, 4, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (604, 1, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (604, 2, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (606, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (606, 2, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (607, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (607, 2, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (607, 3, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (617, 1, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (617, 2, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (618, 1, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (618, 2, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (619, 1, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (620, 1, 5, 2, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (626, 1, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (632, 1, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (632, 2, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (632, 3, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (632, 4, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (632, 5, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (634, 1, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (634, 2, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (644, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (647, 1, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (647, 2, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (651, 1, 79, 1, CAST(402.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (651, 2, 85, 1, CAST(329.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (651, 3, 102, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (651, 4, 94, 2, CAST(249.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (655, 1, 67, 1, CAST(250.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (657, 1, 52, 1, CAST(875.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (657, 2, 54, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (660, 1, 30, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (660, 2, 59, 2, CAST(2599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (660, 3, 47, 2, CAST(5299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (660, 4, 29, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (663, 1, 41, 2, CAST(1469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (663, 2, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (663, 3, 94, 1, CAST(249.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (663, 4, 71, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (663, 5, 106, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (665, 1, 58, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (665, 2, 42, 2, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (665, 3, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (668, 1, 48, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (668, 2, 19, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (670, 1, 108, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (670, 2, 28, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (670, 3, 104, 2, CAST(481.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (670, 4, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (673, 1, 66, 1, CAST(250.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (673, 2, 38, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (673, 3, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (673, 4, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (675, 1, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (675, 2, 89, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (675, 3, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (675, 4, 32, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (678, 1, 52, 2, CAST(875.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (678, 2, 37, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (679, 1, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (679, 2, 83, 2, CAST(149.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (680, 1, 81, 2, CAST(1099.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (680, 2, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (680, 3, 50, 1, CAST(5999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (681, 1, 82, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (681, 2, 63, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (681, 3, 61, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (681, 4, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (681, 5, 30, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (686, 1, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (686, 2, 30, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (686, 3, 88, 2, CAST(189.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (686, 4, 19, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (686, 5, 104, 1, CAST(481.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (688, 1, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (688, 2, 88, 1, CAST(189.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (692, 1, 59, 1, CAST(2599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (692, 2, 75, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (692, 3, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (692, 4, 56, 2, CAST(5499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (694, 1, 48, 1, CAST(1499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (694, 2, 39, 1, CAST(1499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (694, 3, 55, 2, CAST(2699.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (694, 4, 103, 2, CAST(551.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (694, 5, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (700, 1, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (700, 2, 63, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (703, 1, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (703, 2, 66, 2, CAST(250.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (703, 3, 72, 1, CAST(619.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (703, 4, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (707, 1, 106, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (707, 2, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (707, 3, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (707, 4, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (710, 1, 42, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (710, 2, 60, 2, CAST(1559.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (710, 3, 39, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (710, 4, 57, 1, CAST(1999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (710, 5, 28, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (712, 1, 44, 2, CAST(539.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (712, 2, 74, 2, CAST(439.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (712, 3, 35, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (712, 4, 76, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (712, 5, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (713, 1, 93, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (713, 2, 97, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (713, 3, 53, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (713, 4, 108, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (715, 1, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (715, 2, 50, 1, CAST(5999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (718, 1, 92, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (718, 2, 40, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (718, 3, 64, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (719, 1, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (720, 1, 111, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (720, 2, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (730, 1, 59, 2, CAST(2599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (730, 2, 79, 1, CAST(402.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (730, 3, 96, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (730, 4, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (732, 1, 47, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (732, 2, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (735, 1, 71, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (735, 2, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (736, 1, 56, 2, CAST(5499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (736, 2, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (736, 3, 62, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (738, 1, 82, 2, CAST(659.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (738, 2, 38, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (738, 3, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (738, 4, 63, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (739, 1, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (741, 1, 58, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (741, 2, 76, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (741, 3, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (741, 4, 56, 2, CAST(5499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (742, 1, 107, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (742, 2, 45, 1, CAST(869.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (743, 1, 80, 1, CAST(761.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (744, 1, 33, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (746, 1, 99, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (747, 1, 110, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (747, 2, 86, 1, CAST(149.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (747, 3, 33, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (747, 4, 81, 1, CAST(1099.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (749, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (749, 2, 28, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (749, 3, 79, 1, CAST(402.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (749, 4, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (749, 5, 40, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (750, 1, 72, 1, CAST(619.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (750, 2, 78, 2, CAST(647.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (752, 1, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (752, 2, 31, 2, CAST(1632.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (759, 1, 93, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (759, 2, 78, 1, CAST(647.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (766, 1, 111, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (770, 1, 110, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (770, 2, 42, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (770, 3, 103, 1, CAST(551.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (770, 4, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (772, 1, 103, 1, CAST(551.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (776, 1, 28, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (776, 2, 42, 2, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (776, 3, 71, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (776, 4, 35, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (777, 1, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (777, 2, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (777, 3, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (778, 1, 64, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (778, 2, 85, 1, CAST(329.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (779, 1, 101, 1, CAST(339.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (779, 2, 90, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (779, 3, 47, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (779, 4, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (779, 5, 85, 1, CAST(329.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (784, 1, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (784, 2, 72, 2, CAST(619.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (784, 3, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (786, 1, 80, 1, CAST(761.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (791, 1, 54, 1, CAST(3199.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (791, 2, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (792, 1, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (792, 2, 39, 1, CAST(1499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (792, 3, 56, 1, CAST(5499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (792, 4, 30, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (792, 5, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (796, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (797, 1, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (797, 2, 69, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (797, 3, 74, 1, CAST(439.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (797, 4, 54, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (797, 5, 62, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (801, 1, 101, 1, CAST(339.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (802, 1, 30, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (802, 2, 36, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (802, 3, 40, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (802, 4, 28, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (804, 1, 89, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (804, 2, 53, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (804, 3, 50, 2, CAST(5999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (805, 1, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (805, 2, 33, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (805, 3, 62, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (805, 4, 32, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (805, 5, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (806, 1, 93, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (806, 2, 97, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (806, 3, 77, 2, CAST(799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (806, 4, 82, 2, CAST(659.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (806, 5, 91, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (808, 1, 96, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (808, 2, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (808, 3, 85, 1, CAST(329.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (808, 4, 19, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (810, 1, 103, 2, CAST(551.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (810, 2, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (810, 3, 56, 1, CAST(5499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (810, 4, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (817, 1, 85, 1, CAST(329.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (817, 2, 105, 2, CAST(533.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (817, 3, 48, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (819, 1, 94, 1, CAST(249.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (822, 1, 53, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (822, 2, 72, 1, CAST(619.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (823, 1, 56, 2, CAST(5499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (823, 2, 86, 2, CAST(149.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (823, 3, 81, 1, CAST(1099.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (825, 1, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (825, 2, 30, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (826, 1, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (826, 2, 36, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (828, 1, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (828, 2, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (828, 3, 55, 2, CAST(2699.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (830, 1, 85, 2, CAST(329.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (830, 2, 100, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (830, 3, 96, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (833, 1, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (836, 1, 108, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (840, 1, 27, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (840, 2, 43, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (840, 3, 106, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (841, 1, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (841, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (841, 3, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (841, 4, 90, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (841, 5, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (847, 1, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (852, 1, 46, 2, CAST(1409.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (854, 1, 87, 1, CAST(189.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (856, 1, 38, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (858, 1, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (858, 2, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (858, 3, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (858, 4, 73, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (860, 1, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (860, 2, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (860, 3, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (860, 4, 58, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (860, 5, 95, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (863, 1, 93, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (867, 1, 101, 1, CAST(339.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (871, 1, 106, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (871, 2, 38, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (871, 3, 30, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (871, 4, 107, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (872, 1, 62, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (872, 2, 53, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (875, 1, 5, 2, CAST(1320.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (875, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (875, 3, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (875, 4, 111, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (878, 1, 103, 1, CAST(551.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (878, 2, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (878, 3, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (878, 4, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (879, 1, 100, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (879, 2, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (879, 3, 83, 2, CAST(149.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (879, 4, 82, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (882, 1, 63, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (882, 2, 108, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (882, 3, 57, 2, CAST(1999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (885, 1, 106, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (885, 2, 43, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (890, 1, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (890, 2, 105, 2, CAST(533.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (890, 3, 52, 1, CAST(875.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (890, 4, 67, 1, CAST(250.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (890, 5, 65, 2, CAST(346.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (891, 1, 107, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (891, 2, 32, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (891, 3, 35, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (891, 4, 50, 1, CAST(5999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (896, 1, 91, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (896, 2, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (897, 1, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (897, 2, 96, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (898, 1, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (898, 2, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (898, 3, 57, 2, CAST(1999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (898, 4, 69, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (901, 1, 50, 1, CAST(5999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (901, 2, 43, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (903, 1, 31, 2, CAST(1632.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (903, 2, 48, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (907, 1, 84, 2, CAST(109.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (907, 2, 65, 1, CAST(346.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (908, 1, 41, 1, CAST(1469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (908, 2, 94, 1, CAST(249.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (908, 3, 102, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (909, 1, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (910, 1, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (915, 1, 64, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (915, 2, 48, 1, CAST(1499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (915, 3, 42, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (915, 4, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (918, 1, 91, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (918, 2, 31, 1, CAST(1632.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (918, 3, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (924, 1, 97, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (924, 2, 36, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (926, 1, 37, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (929, 1, 82, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (929, 2, 63, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (929, 3, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (934, 1, 35, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (934, 2, 48, 1, CAST(1499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (934, 3, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (934, 4, 61, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (934, 5, 56, 2, CAST(5499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (935, 1, 65, 2, CAST(346.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (935, 2, 76, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (935, 3, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (935, 4, 38, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (936, 1, 70, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (936, 2, 44, 1, CAST(539.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (937, 1, 108, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (937, 2, 51, 2, CAST(6499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (937, 3, 58, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (937, 4, 28, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (937, 5, 66, 1, CAST(250.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (938, 1, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (938, 2, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (944, 1, 29, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (944, 2, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (944, 3, 70, 2, CAST(659.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (944, 4, 85, 2, CAST(329.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (944, 5, 69, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (945, 1, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (945, 2, 94, 2, CAST(249.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (945, 3, 34, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (945, 4, 44, 2, CAST(539.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (945, 5, 50, 2, CAST(5999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (947, 1, 32, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (947, 2, 42, 2, CAST(2299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (947, 3, 44, 1, CAST(539.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (950, 1, 56, 1, CAST(5499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (951, 1, 59, 1, CAST(2599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (951, 2, 43, 2, CAST(5299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (951, 3, 62, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (952, 1, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (952, 2, 57, 1, CAST(1999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (961, 1, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (961, 2, 47, 2, CAST(5299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (961, 3, 65, 2, CAST(346.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (964, 1, 90, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (964, 2, 74, 1, CAST(439.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (965, 1, 90, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (966, 1, 88, 1, CAST(189.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (966, 2, 73, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (969, 1, 74, 1, CAST(439.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (969, 2, 36, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (972, 1, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (972, 2, 63, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (973, 1, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (973, 2, 28, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (973, 3, 47, 2, CAST(5299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (973, 4, 71, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (977, 1, 52, 2, CAST(875.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (977, 2, 69, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (977, 3, 27, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (977, 4, 80, 2, CAST(761.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (980, 1, 49, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (980, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (980, 3, 64, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (985, 1, 5, 2, CAST(1320.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (985, 2, 59, 1, CAST(2599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (985, 3, 78, 2, CAST(647.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (987, 1, 51, 2, CAST(6499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (987, 2, 60, 2, CAST(1559.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (987, 3, 80, 1, CAST(761.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (988, 1, 35, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (988, 2, 38, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (988, 3, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (994, 1, 37, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (994, 2, 45, 1, CAST(869.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (994, 3, 66, 1, CAST(250.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (997, 1, 86, 2, CAST(149.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (997, 2, 105, 2, CAST(533.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (997, 3, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (998, 1, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (998, 2, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1001, 1, 72, 1, CAST(619.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1001, 2, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1001, 3, 58, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1001, 4, 111, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1005, 1, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1005, 2, 81, 2, CAST(1099.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1005, 3, 99, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1010, 1, 109, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1011, 1, 88, 1, CAST(189.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1011, 2, 99, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1011, 3, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1011, 4, 68, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1013, 1, 60, 2, CAST(1559.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1017, 1, 89, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1017, 2, 82, 2, CAST(659.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1017, 3, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1017, 4, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1017, 5, 77, 2, CAST(799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1018, 1, 76, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1018, 2, 97, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1018, 3, 91, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1019, 1, 30, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1019, 2, 52, 1, CAST(875.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1019, 3, 37, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1019, 4, 93, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1020, 1, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1020, 2, 69, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1020, 3, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1020, 4, 57, 2, CAST(1999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1020, 5, 40, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1021, 1, 49, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1021, 2, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1022, 1, 33, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1022, 2, 46, 1, CAST(1409.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1022, 3, 65, 1, CAST(346.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1022, 4, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1023, 1, 91, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1023, 2, 43, 2, CAST(5299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1029, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1029, 2, 55, 1, CAST(2699.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1029, 3, 40, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1029, 4, 68, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1030, 1, 27, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1030, 2, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1030, 3, 72, 1, CAST(619.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1032, 1, 60, 2, CAST(1559.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1032, 2, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1041, 1, 89, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1041, 2, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1041, 3, 94, 2, CAST(249.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1045, 1, 28, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1045, 2, 104, 2, CAST(481.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1047, 1, 28, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1047, 2, 78, 1, CAST(647.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1047, 3, 35, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1047, 4, 49, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1049, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1049, 2, 36, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1049, 3, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1049, 4, 26, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1049, 5, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1050, 1, 96, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1050, 2, 99, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1050, 3, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1050, 4, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1051, 1, 46, 1, CAST(1409.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1052, 1, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1052, 2, 103, 1, CAST(551.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1052, 3, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1054, 1, 36, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1054, 2, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1055, 1, 43, 2, CAST(5299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1055, 2, 101, 2, CAST(339.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1055, 3, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1055, 4, 83, 2, CAST(149.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1055, 5, 60, 1, CAST(1559.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1056, 1, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1057, 1, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1057, 2, 97, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1057, 3, 98, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1059, 1, 46, 2, CAST(1409.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1059, 2, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1059, 3, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1060, 1, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1060, 2, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1060, 3, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1060, 4, 30, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1063, 1, 33, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1063, 2, 100, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1063, 3, 72, 2, CAST(619.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1065, 1, 48, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1065, 2, 103, 2, CAST(551.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1065, 3, 63, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1066, 1, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1066, 2, 46, 1, CAST(1409.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1066, 3, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1067, 1, 74, 2, CAST(439.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1067, 2, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1067, 3, 72, 2, CAST(619.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1067, 4, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1068, 1, 87, 2, CAST(189.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1068, 2, 82, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1068, 3, 49, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1068, 4, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1069, 1, 109, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1069, 2, 93, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1072, 1, 83, 1, CAST(149.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1072, 2, 89, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1072, 3, 36, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1074, 1, 59, 1, CAST(2599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1074, 2, 87, 1, CAST(189.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1074, 3, 89, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1076, 1, 95, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1076, 2, 102, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1076, 3, 73, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1077, 1, 60, 2, CAST(1559.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1084, 1, 30, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1084, 2, 70, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1084, 3, 98, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1084, 4, 65, 2, CAST(346.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1084, 5, 60, 1, CAST(1559.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1085, 1, 66, 2, CAST(250.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1085, 2, 64, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1085, 3, 74, 1, CAST(439.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1086, 1, 108, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1086, 2, 67, 1, CAST(250.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1086, 3, 81, 2, CAST(1099.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1086, 4, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1086, 5, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1089, 1, 70, 2, CAST(659.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1089, 2, 30, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1092, 1, 34, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1092, 2, 30, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1092, 3, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1092, 4, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1093, 1, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1093, 2, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1093, 3, 90, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1101, 1, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1101, 2, 51, 1, CAST(6499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1104, 1, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1104, 2, 70, 2, CAST(659.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1104, 3, 43, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1104, 4, 80, 1, CAST(761.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1109, 1, 72, 2, CAST(619.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1113, 1, 106, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1116, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1117, 1, 37, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1117, 2, 91, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1117, 3, 51, 2, CAST(6499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1121, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1121, 2, 110, 2, CAST(470.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1124, 1, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1124, 2, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1124, 3, 109, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1124, 4, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1124, 5, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1127, 1, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1127, 2, 96, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1127, 3, 37, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1130, 1, 54, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1132, 1, 43, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1132, 2, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1132, 3, 36, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1132, 4, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1138, 1, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1138, 2, 105, 2, CAST(533.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1138, 3, 93, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1157, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1157, 2, 31, 2, CAST(1632.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1157, 3, 37, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1157, 4, 41, 1, CAST(1469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1161, 1, 71, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1161, 2, 38, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1161, 3, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1161, 4, 29, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1166, 1, 103, 2, CAST(551.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1175, 1, 58, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1175, 2, 65, 1, CAST(346.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1175, 3, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1175, 4, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1175, 5, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1177, 1, 62, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1177, 2, 74, 1, CAST(439.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1183, 1, 63, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1183, 2, 80, 2, CAST(761.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1183, 3, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1184, 1, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1184, 2, 71, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1187, 1, 36, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1187, 2, 79, 1, CAST(402.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1187, 3, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1187, 4, 53, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1190, 1, 71, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1191, 1, 40, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1191, 2, 89, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1191, 3, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1194, 1, 71, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1194, 2, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1194, 3, 105, 2, CAST(533.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1194, 4, 84, 1, CAST(109.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1195, 1, 52, 1, CAST(875.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1197, 1, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1197, 2, 108, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1197, 3, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1197, 4, 106, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1199, 1, 32, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1199, 2, 94, 2, CAST(249.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1199, 3, 109, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1200, 1, 42, 2, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1201, 1, 95, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1201, 2, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1201, 3, 26, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1201, 4, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1201, 5, 19, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1206, 1, 73, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1206, 2, 29, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1211, 1, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1211, 2, 59, 1, CAST(2599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1211, 3, 92, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1211, 4, 93, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1211, 5, 108, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1212, 1, 74, 1, CAST(439.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1212, 2, 37, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1212, 3, 39, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1212, 4, 68, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1222, 1, 97, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1226, 1, 77, 2, CAST(799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1226, 2, 101, 1, CAST(339.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1226, 3, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1226, 4, 51, 1, CAST(6499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1226, 5, 42, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1229, 1, 36, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1229, 2, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1233, 1, 87, 2, CAST(189.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1233, 2, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1233, 3, 55, 1, CAST(2699.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1234, 1, 56, 2, CAST(5499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1234, 2, 71, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1235, 1, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1236, 1, 60, 1, CAST(1559.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1236, 2, 32, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1236, 3, 91, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1242, 1, 94, 1, CAST(249.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1242, 2, 27, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1242, 3, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1242, 4, 70, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1243, 1, 44, 1, CAST(539.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1244, 1, 45, 1, CAST(869.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1244, 2, 38, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1244, 3, 33, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1244, 4, 37, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1247, 1, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1247, 2, 28, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1247, 3, 26, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1251, 1, 40, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1251, 2, 56, 1, CAST(5499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1251, 3, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1252, 1, 79, 1, CAST(402.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1252, 2, 84, 1, CAST(109.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1252, 3, 57, 2, CAST(1999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1253, 1, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1253, 2, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1253, 3, 88, 1, CAST(189.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1255, 1, 43, 2, CAST(5299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1255, 2, 53, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1255, 3, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1255, 4, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1255, 5, 82, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1256, 1, 44, 2, CAST(539.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1256, 2, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1259, 1, 60, 1, CAST(1559.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1259, 2, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1261, 1, 73, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1261, 2, 88, 2, CAST(189.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1261, 3, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1261, 4, 42, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1264, 1, 101, 1, CAST(339.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1264, 2, 77, 2, CAST(799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1264, 3, 29, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1264, 4, 52, 1, CAST(875.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1266, 1, 90, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1266, 2, 48, 1, CAST(1499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1267, 1, 45, 1, CAST(869.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1267, 2, 27, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1267, 3, 108, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1267, 4, 95, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1275, 1, 58, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1275, 2, 30, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1277, 1, 56, 2, CAST(5499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1277, 2, 93, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1277, 3, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1277, 4, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1277, 5, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1280, 1, 72, 2, CAST(619.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1280, 2, 74, 1, CAST(439.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1280, 3, 52, 1, CAST(875.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1280, 4, 63, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1282, 1, 111, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1282, 2, 50, 2, CAST(5999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1283, 1, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1283, 2, 81, 1, CAST(1099.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1283, 3, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1283, 4, 32, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1283, 5, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1284, 1, 101, 1, CAST(339.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1284, 2, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1284, 3, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1285, 1, 78, 2, CAST(647.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1285, 2, 93, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1285, 3, 69, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1285, 4, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1287, 1, 27, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1287, 2, 62, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1287, 3, 103, 1, CAST(551.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1287, 4, 100, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1292, 1, 70, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1295, 1, 5, 2, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1295, 2, 61, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1295, 3, 52, 1, CAST(875.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1296, 1, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1296, 2, 90, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1296, 3, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1296, 4, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1297, 1, 104, 2, CAST(481.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1297, 2, 43, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1297, 3, 51, 2, CAST(6499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1302, 1, 38, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1302, 2, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1302, 3, 56, 2, CAST(5499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1305, 1, 85, 1, CAST(329.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1305, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1305, 3, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1305, 4, 91, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1306, 1, 103, 2, CAST(551.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1306, 2, 81, 2, CAST(1099.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1306, 3, 45, 1, CAST(869.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1306, 4, 42, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1306, 5, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1310, 1, 59, 1, CAST(2599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1310, 2, 77, 2, CAST(799.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1310, 3, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1310, 4, 54, 1, CAST(3199.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1312, 1, 67, 2, CAST(250.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1312, 2, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1312, 3, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1317, 1, 82, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1318, 1, 82, 2, CAST(659.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1318, 2, 62, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1318, 3, 111, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1318, 4, 92, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1320, 1, 104, 1, CAST(481.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1320, 2, 93, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1320, 3, 99, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1321, 1, 34, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1321, 2, 107, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1321, 3, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1322, 1, 28, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1322, 2, 104, 2, CAST(481.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1323, 1, 27, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1323, 2, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1323, 3, 70, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1325, 1, 139, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1325, 4, 28, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1329, 1, 143, 1, CAST(1099.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1329, 2, 107, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1329, 3, 55, 1, CAST(2699.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1329, 5, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1332, 2, 93, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1332, 3, 179, 2, CAST(919.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1333, 3, 99, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1333, 4, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1333, 5, 78, 1, CAST(647.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1334, 2, 160, 2, CAST(4499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1334, 3, 84, 2, CAST(109.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1334, 4, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1334, 5, 42, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1346, 1, 134, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1346, 2, 150, 1, CAST(4499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1346, 3, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1347, 1, 43, 2, CAST(5299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1347, 2, 53, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1349, 1, 138, 2, CAST(2249.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1349, 3, 168, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1349, 4, 184, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1354, 1, 166, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1357, 1, 145, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1357, 2, 60, 1, CAST(1559.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1357, 3, 130, 1, CAST(919.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1360, 1, 31, 1, CAST(1632.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1362, 1, 27, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1362, 3, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1364, 1, 78, 1, CAST(647.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1364, 2, 155, 2, CAST(11999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1364, 3, 152, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1364, 4, 110, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1370, 1, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1370, 2, 89, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1370, 4, 134, 1, CAST(1499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1373, 1, 63, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1375, 1, 147, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1375, 2, 182, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1383, 1, 188, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1383, 2, 65, 2, CAST(346.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1387, 1, 106, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1389, 1, 85, 2, CAST(329.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1389, 2, 171, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1390, 1, 41, 2, CAST(1469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1390, 2, 27, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1390, 4, 104, 1, CAST(481.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1390, 5, 147, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1399, 3, 127, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1399, 4, 28, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1401, 1, 112, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1403, 1, 93, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1405, 1, 162, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1407, 2, 36, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1407, 4, 35, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1409, 2, 170, 1, CAST(1299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1409, 3, 171, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1411, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1414, 1, 162, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1418, 1, 120, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1419, 1, 124, 1, CAST(1499.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1425, 3, 93, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1425, 4, 54, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1425, 5, 145, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1428, 2, 126, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1428, 3, 187, 2, CAST(2799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1428, 4, 28, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1428, 5, 194, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1431, 2, 53, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1432, 1, 161, 1, CAST(1899.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1438, 2, 140, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1438, 3, 81, 2, CAST(1099.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1438, 4, 137, 1, CAST(2599.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1438, 5, 190, 2, CAST(2799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1439, 1, 42, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1439, 3, 102, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1439, 4, 149, 1, CAST(7499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1442, 1, 160, 1, CAST(4499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1449, 1, 159, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1449, 2, 55, 1, CAST(2699.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1449, 5, 14, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1450, 1, 98, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1450, 2, 173, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1452, 1, 99, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1452, 3, 86, 2, CAST(149.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1452, 4, 109, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1454, 2, 35, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1454, 3, 124, 1, CAST(1499.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1454, 4, 38, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1455, 1, 101, 2, CAST(339.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1461, 1, 48, 1, CAST(1499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1467, 1, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1467, 2, 115, 1, CAST(3199.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1468, 2, 58, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1468, 3, 50, 2, CAST(5999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1472, 1, 84, 1, CAST(109.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1473, 1, 84, 2, CAST(109.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1473, 2, 102, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1475, 3, 161, 2, CAST(1899.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1476, 1, 142, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1476, 2, 91, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1476, 3, 43, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1476, 4, 191, 1, CAST(2799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1478, 1, 100, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1478, 2, 123, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1480, 2, 82, 2, CAST(659.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1480, 3, 92, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1481, 1, 53, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1481, 2, 130, 1, CAST(919.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1482, 1, 48, 1, CAST(1499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1482, 2, 113, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1482, 3, 58, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1482, 4, 40, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1484, 2, 49, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1485, 1, 122, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1486, 1, 60, 2, CAST(1559.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1486, 2, 98, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1486, 3, 113, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1487, 1, 160, 1, CAST(4499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1487, 2, 151, 2, CAST(1549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1487, 3, 198, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1487, 4, 196, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1487, 5, 96, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1488, 1, 42, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1488, 2, 122, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1489, 1, 198, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1489, 3, 52, 1, CAST(875.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1490, 1, 99, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1491, 1, 95, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1491, 3, 60, 2, CAST(1559.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1491, 4, 139, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1492, 1, 37, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1494, 2, 178, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1495, 3, 137, 1, CAST(2599.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1497, 1, 141, 2, CAST(1599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1497, 2, 198, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1498, 1, 172, 1, CAST(3199.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1499, 1, 110, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1499, 4, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1499, 5, 171, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1500, 1, 41, 2, CAST(1469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1501, 3, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1501, 4, 67, 1, CAST(250.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1502, 2, 19, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1502, 3, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1505, 2, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1505, 3, 43, 2, CAST(5299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1506, 1, 184, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1506, 2, 153, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1506, 3, 149, 2, CAST(7499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1507, 1, 39, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1507, 2, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1508, 1, 37, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1508, 2, 109, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1508, 3, 52, 2, CAST(875.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1508, 4, 88, 1, CAST(189.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1510, 1, 142, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1510, 2, 68, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1510, 5, 137, 1, CAST(2599.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1511, 1, 144, 2, CAST(1549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1511, 3, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1511, 4, 41, 1, CAST(1469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1511, 5, 124, 2, CAST(1499.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1513, 1, 166, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1513, 2, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1513, 3, 159, 2, CAST(2299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1515, 1, 27, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1515, 4, 40, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1515, 5, 158, 2, CAST(959.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1516, 1, 172, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1516, 3, 196, 2, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1518, 2, 182, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1519, 1, 150, 1, CAST(4499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1519, 2, 85, 2, CAST(329.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1519, 3, 124, 2, CAST(1499.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1519, 4, 65, 1, CAST(346.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1520, 1, 186, 1, CAST(4499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1520, 2, 188, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1521, 1, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1521, 3, 123, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1521, 4, 135, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1522, 1, 95, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1522, 2, 141, 1, CAST(1599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1522, 3, 117, 1, CAST(1469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1524, 1, 168, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1525, 1, 156, 1, CAST(6499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1525, 2, 163, 2, CAST(1349.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1525, 3, 193, 1, CAST(2799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1526, 1, 151, 1, CAST(1549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1526, 2, 56, 1, CAST(5499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1527, 1, 33, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1527, 2, 103, 1, CAST(551.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1527, 3, 57, 2, CAST(1999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1529, 1, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1529, 2, 50, 2, CAST(5999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1530, 2, 116, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1531, 1, 128, 1, CAST(1899.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1533, 2, 78, 1, CAST(647.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1533, 3, 96, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1533, 5, 51, 1, CAST(6499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1534, 1, 194, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1534, 2, 117, 1, CAST(1469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1534, 4, 172, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1535, 1, 92, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1535, 2, 75, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1536, 1, 183, 1, CAST(2199.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1536, 2, 185, 2, CAST(2799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1536, 3, 196, 2, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1538, 2, 46, 2, CAST(1409.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1538, 3, 117, 1, CAST(1469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1538, 4, 197, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1539, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1539, 2, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1540, 1, 71, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1540, 4, 177, 2, CAST(5499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1540, 5, 78, 1, CAST(647.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1541, 1, 155, 2, CAST(11999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1541, 3, 142, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1541, 4, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1541, 5, 86, 2, CAST(149.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1542, 1, 79, 1, CAST(402.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1542, 2, 122, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1542, 3, 184, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1542, 4, 37, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1543, 1, 108, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1543, 2, 93, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1543, 3, 158, 2, CAST(959.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1543, 4, 97, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1543, 5, 136, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1544, 1, 194, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1544, 2, 107, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1545, 1, 45, 1, CAST(869.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1546, 1, 156, 1, CAST(6499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1546, 2, 185, 2, CAST(2799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1546, 4, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1547, 1, 106, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1548, 1, 32, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1548, 3, 62, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1549, 1, 158, 1, CAST(959.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1549, 2, 119, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1550, 3, 185, 2, CAST(2799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1550, 4, 148, 1, CAST(5499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1550, 5, 86, 2, CAST(149.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1552, 1, 197, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1552, 2, 41, 2, CAST(1469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1553, 1, 102, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1553, 2, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1553, 4, 89, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1554, 1, 166, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1555, 1, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1555, 2, 156, 1, CAST(6499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1555, 3, 126, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1555, 4, 128, 2, CAST(1899.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1555, 5, 174, 1, CAST(3199.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1556, 1, 49, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1556, 2, 82, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1556, 4, 119, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1557, 1, 163, 2, CAST(1349.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1558, 1, 46, 2, CAST(1409.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1558, 2, 123, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1558, 3, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1558, 4, 55, 1, CAST(2699.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1559, 1, 101, 2, CAST(339.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1559, 2, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1559, 3, 54, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1560, 1, 118, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1560, 2, 41, 1, CAST(1469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1561, 1, 181, 2, CAST(2199.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1562, 1, 54, 1, CAST(3199.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1562, 2, 66, 1, CAST(250.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1562, 3, 115, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1563, 1, 188, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1564, 2, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1565, 1, 37, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1565, 2, 92, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1565, 4, 95, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1566, 1, 179, 1, CAST(919.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1566, 2, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1568, 1, 146, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1568, 2, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1570, 1, 155, 1, CAST(11999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1571, 3, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1572, 2, 198, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1572, 3, 115, 1, CAST(3199.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1573, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1573, 2, 129, 1, CAST(919.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1573, 3, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1574, 1, 127, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1575, 1, 44, 1, CAST(539.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1575, 4, 126, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1575, 5, 92, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1576, 1, 69, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1577, 2, 111, 2, CAST(470.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1577, 4, 131, 2, CAST(2599.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1579, 1, 49, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1579, 4, 65, 2, CAST(346.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1580, 1, 119, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1580, 2, 86, 2, CAST(149.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1581, 1, 64, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1582, 1, 75, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1582, 2, 133, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1583, 1, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1584, 1, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1584, 3, 43, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1584, 4, 187, 1, CAST(2799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1584, 5, 147, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1585, 2, 106, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1585, 4, 95, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1585, 5, 191, 1, CAST(2799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1586, 1, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1586, 4, 173, 1, CAST(3199.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1586, 5, 36, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1587, 1, 104, 1, CAST(481.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1587, 2, 63, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1587, 3, 78, 2, CAST(647.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1588, 1, 93, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1589, 3, 28, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1590, 1, 175, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1590, 3, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1591, 2, 126, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1591, 3, 97, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1591, 4, 138, 2, CAST(2249.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1592, 2, 159, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1592, 3, 40, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1592, 4, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1593, 1, 97, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1593, 2, 34, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1593, 3, 190, 2, CAST(2799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1593, 4, 107, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1593, 5, 169, 2, CAST(6499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1594, 1, 79, 2, CAST(402.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1594, 2, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1595, 1, 112, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1596, 1, 91, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1596, 2, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1597, 1, 176, 1, CAST(3199.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1597, 2, 59, 1, CAST(2599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1598, 2, 49, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1598, 3, 88, 1, CAST(189.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1599, 1, 104, 2, CAST(481.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1600, 1, 146, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1600, 3, 36, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1601, 1, 114, 2, CAST(579.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1601, 2, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1601, 4, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1601, 5, 180, 1, CAST(919.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1602, 1, 71, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1602, 2, 37, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1605, 1, 72, 1, CAST(619.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1605, 2, 186, 1, CAST(4499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1605, 3, 132, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1605, 5, 29, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1607, 1, 29, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1609, 1, 96, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1609, 4, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1610, 1, 36, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1610, 2, 173, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1611, 1, 191, 1, CAST(2799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1611, 2, 171, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1612, 3, 101, 2, CAST(339.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1612, 5, 60, 1, CAST(1559.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1613, 1, 153, 1, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1614, 1, 124, 1, CAST(1499.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1614, 2, 159, 2, CAST(2299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1615, 1, 197, 2, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1615, 3, 182, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1616, 1, 1, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1616, 2, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1617, 10, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1618, 1, 1, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1619, 1, 1, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1619, 3, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1620, 1, 1, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1620, 2, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1620, 4, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1621, 1, 1, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1621, 2, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1621, 4, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1622, 1, 1, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1622, 5, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1623, 2, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1624, 1, 1, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1625, 1, 1, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1626, 37, 37, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1627, 1, 1, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1628, 1, 1, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1628, 3, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1629, 2, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1630, 1, 1, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1631, 2, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1, 259, 1, CAST(N'2016-01-01' AS Date), CAST(N'2016-01-03' AS Date), CAST(N'2016-01-03' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (4, 175, 4, CAST(N'2016-01-03' AS Date), CAST(N'2016-01-04' AS Date), CAST(N'2016-01-05' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (6, 94, 4, CAST(N'2016-01-04' AS Date), CAST(N'2016-01-07' AS Date), CAST(N'2016-01-05' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (7, 324, 4, CAST(N'2016-01-04' AS Date), CAST(N'2016-01-07' AS Date), CAST(N'2016-01-05' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (9, 60, 4, CAST(N'2016-01-05' AS Date), CAST(N'2016-01-08' AS Date), CAST(N'2016-01-08' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (10, 442, 4, CAST(N'2016-01-05' AS Date), CAST(N'2016-01-06' AS Date), CAST(N'2016-01-06' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (12, 91, 4, CAST(N'2016-01-06' AS Date), CAST(N'2016-01-08' AS Date), CAST(N'2016-01-09' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (14, 258, 4, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), CAST(N'2016-01-12' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (15, 450, 4, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-10' AS Date), CAST(N'2016-01-12' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (27, 57, 4, CAST(N'2016-01-19' AS Date), CAST(N'2016-01-21' AS Date), CAST(N'2016-01-20' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (28, 252, 4, CAST(N'2016-01-19' AS Date), CAST(N'2016-01-20' AS Date), CAST(N'2016-01-21' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (29, 437, 4, CAST(N'2016-01-20' AS Date), CAST(N'2016-01-22' AS Date), CAST(N'2016-01-21' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (33, 236, 4, CAST(N'2016-01-21' AS Date), CAST(N'2016-01-22' AS Date), CAST(N'2016-01-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (34, 80, 4, CAST(N'2016-01-22' AS Date), CAST(N'2016-01-25' AS Date), CAST(N'2016-01-23' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (37, 164, 4, CAST(N'2016-01-25' AS Date), CAST(N'2016-01-28' AS Date), CAST(N'2016-01-26' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (40, 348, 4, CAST(N'2016-01-27' AS Date), CAST(N'2016-01-28' AS Date), CAST(N'2016-01-29' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (60, 151, 4, CAST(N'2016-02-06' AS Date), CAST(N'2016-02-08' AS Date), CAST(N'2016-02-07' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (61, 277, 4, CAST(N'2016-02-06' AS Date), CAST(N'2016-02-09' AS Date), CAST(N'2016-02-09' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (62, 208, 4, CAST(N'2016-02-07' AS Date), CAST(N'2016-02-10' AS Date), CAST(N'2016-02-10' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (68, 381, 4, CAST(N'2016-02-10' AS Date), CAST(N'2016-02-11' AS Date), CAST(N'2016-02-13' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (70, 50, 3, CAST(N'2016-02-11' AS Date), CAST(N'2016-02-11' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (74, 264, 4, CAST(N'2016-02-13' AS Date), CAST(N'2016-02-15' AS Date), CAST(N'2016-02-15' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (76, 9, 3, CAST(N'2016-02-16' AS Date), CAST(N'2016-02-16' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (77, 385, 4, CAST(N'2016-02-16' AS Date), CAST(N'2016-02-19' AS Date), CAST(N'2016-02-19' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (80, 397, 4, CAST(N'2016-02-17' AS Date), CAST(N'2016-02-20' AS Date), CAST(N'2016-02-19' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (83, 393, 4, CAST(N'2016-02-19' AS Date), CAST(N'2016-02-20' AS Date), CAST(N'2016-02-20' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (84, 317, 4, CAST(N'2016-02-20' AS Date), CAST(N'2016-02-22' AS Date), CAST(N'2016-02-21' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (86, 276, 4, CAST(N'2016-02-21' AS Date), CAST(N'2016-02-22' AS Date), CAST(N'2016-02-23' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (90, 414, 4, CAST(N'2016-02-23' AS Date), CAST(N'2016-02-25' AS Date), CAST(N'2016-02-24' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (95, 218, 4, CAST(N'2016-02-27' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2016-02-28' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (97, 204, 4, CAST(N'2016-02-28' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2016-03-01' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (101, 271, 4, CAST(N'2016-03-01' AS Date), CAST(N'2016-03-04' AS Date), CAST(N'2016-03-04' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (102, 336, 4, CAST(N'2016-03-02' AS Date), CAST(N'2016-03-05' AS Date), CAST(N'2016-03-03' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (104, 7, 4, CAST(N'2016-03-03' AS Date), CAST(N'2016-03-05' AS Date), CAST(N'2016-03-05' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (105, 306, 4, CAST(N'2016-03-03' AS Date), CAST(N'2016-03-05' AS Date), CAST(N'2016-03-04' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (106, 422, 4, CAST(N'2016-03-04' AS Date), CAST(N'2016-03-05' AS Date), CAST(N'2016-03-05' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (108, 12, 4, CAST(N'2016-03-06' AS Date), CAST(N'2016-03-09' AS Date), CAST(N'2016-03-07' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (112, 469, 4, CAST(N'2016-03-08' AS Date), CAST(N'2016-03-11' AS Date), CAST(N'2016-03-10' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (116, 471, 4, CAST(N'2016-03-10' AS Date), CAST(N'2016-03-11' AS Date), CAST(N'2016-03-11' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (120, 327, 4, CAST(N'2016-03-14' AS Date), CAST(N'2016-03-15' AS Date), CAST(N'2016-03-17' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (124, 403, 4, CAST(N'2016-03-16' AS Date), CAST(N'2016-03-18' AS Date), CAST(N'2016-03-17' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (127, 484, 4, CAST(N'2016-03-17' AS Date), CAST(N'2016-03-18' AS Date), CAST(N'2016-03-19' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (128, 86, 4, CAST(N'2016-03-18' AS Date), CAST(N'2016-03-20' AS Date), CAST(N'2016-03-21' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (129, 84, 4, CAST(N'2016-03-19' AS Date), CAST(N'2016-03-21' AS Date), CAST(N'2016-03-21' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (131, 316, 4, CAST(N'2016-03-19' AS Date), CAST(N'2016-03-22' AS Date), CAST(N'2016-03-20' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (132, 46, 4, CAST(N'2016-03-20' AS Date), CAST(N'2016-03-22' AS Date), CAST(N'2016-03-23' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (133, 409, 4, CAST(N'2016-03-20' AS Date), CAST(N'2016-03-22' AS Date), CAST(N'2016-03-21' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (137, 370, 4, CAST(N'2016-03-23' AS Date), CAST(N'2016-03-26' AS Date), CAST(N'2016-03-25' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (138, 438, 4, CAST(N'2016-03-23' AS Date), CAST(N'2016-03-24' AS Date), CAST(N'2016-03-25' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (142, 170, 4, CAST(N'2016-03-26' AS Date), CAST(N'2016-03-27' AS Date), CAST(N'2016-03-27' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (145, 366, 4, CAST(N'2016-03-27' AS Date), CAST(N'2016-03-29' AS Date), CAST(N'2016-03-30' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (146, 288, 4, CAST(N'2016-03-28' AS Date), CAST(N'2016-03-30' AS Date), CAST(N'2016-03-30' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (147, 55, 4, CAST(N'2016-03-28' AS Date), CAST(N'2016-03-31' AS Date), CAST(N'2016-03-31' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (150, 332, 4, CAST(N'2016-03-29' AS Date), CAST(N'2016-03-31' AS Date), CAST(N'2016-04-01' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (152, 76, 4, CAST(N'2016-03-29' AS Date), CAST(N'2016-03-30' AS Date), CAST(N'2016-03-30' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (153, 498, 4, CAST(N'2016-03-30' AS Date), CAST(N'2016-04-02' AS Date), CAST(N'2016-04-01' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (155, 371, 4, CAST(N'2016-04-02' AS Date), CAST(N'2016-04-03' AS Date), CAST(N'2016-04-04' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (156, 357, 4, CAST(N'2016-04-03' AS Date), CAST(N'2016-04-06' AS Date), CAST(N'2016-04-05' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (157, 43, 4, CAST(N'2016-04-03' AS Date), CAST(N'2016-04-06' AS Date), CAST(N'2016-04-06' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (158, 117, 3, CAST(N'2016-04-04' AS Date), CAST(N'2016-04-04' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (159, 32, 4, CAST(N'2016-04-04' AS Date), CAST(N'2016-04-06' AS Date), CAST(N'2016-04-06' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (160, 205, 4, CAST(N'2016-04-04' AS Date), CAST(N'2016-04-06' AS Date), CAST(N'2016-04-06' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (161, 251, 4, CAST(N'2016-04-04' AS Date), CAST(N'2016-04-07' AS Date), CAST(N'2016-04-05' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (162, 31, 4, CAST(N'2016-04-06' AS Date), CAST(N'2016-04-08' AS Date), CAST(N'2016-04-07' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (166, 338, 4, CAST(N'2016-04-08' AS Date), CAST(N'2016-04-11' AS Date), CAST(N'2016-04-11' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (169, 99, 4, CAST(N'2016-04-10' AS Date), CAST(N'2016-04-11' AS Date), CAST(N'2016-04-11' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (171, 237, 4, CAST(N'2016-04-11' AS Date), CAST(N'2016-04-14' AS Date), CAST(N'2016-04-14' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (173, 117, 4, CAST(N'2016-04-11' AS Date), CAST(N'2016-04-14' AS Date), CAST(N'2016-04-13' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (177, 121, 4, CAST(N'2016-04-16' AS Date), CAST(N'2016-04-19' AS Date), CAST(N'2016-04-19' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (181, 459, 4, CAST(N'2016-04-18' AS Date), CAST(N'2016-04-20' AS Date), CAST(N'2016-04-20' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (183, 22, 4, CAST(N'2016-04-19' AS Date), CAST(N'2016-04-20' AS Date), CAST(N'2016-04-20' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (184, 134, 4, CAST(N'2016-04-19' AS Date), CAST(N'2016-04-21' AS Date), CAST(N'2016-04-22' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (185, 24, 3, CAST(N'2016-04-20' AS Date), CAST(N'2016-04-20' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (187, 183, 4, CAST(N'2016-04-22' AS Date), CAST(N'2016-04-23' AS Date), CAST(N'2016-04-24' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (188, 390, 4, CAST(N'2016-04-22' AS Date), CAST(N'2016-04-23' AS Date), CAST(N'2016-04-25' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (190, 98, 4, CAST(N'2016-04-23' AS Date), CAST(N'2016-04-25' AS Date), CAST(N'2016-04-25' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (197, 127, 4, CAST(N'2016-04-30' AS Date), CAST(N'2016-05-03' AS Date), CAST(N'2016-05-03' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (201, 280, 4, CAST(N'2016-05-01' AS Date), CAST(N'2016-05-04' AS Date), CAST(N'2016-05-02' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (207, 105, 4, CAST(N'2016-05-05' AS Date), CAST(N'2016-05-07' AS Date), CAST(N'2016-05-07' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (214, 363, 4, CAST(N'2016-05-10' AS Date), CAST(N'2016-05-12' AS Date), CAST(N'2016-05-11' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (216, 267, 4, CAST(N'2016-05-11' AS Date), CAST(N'2016-05-14' AS Date), CAST(N'2016-05-13' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (222, 51, 4, CAST(N'2016-05-13' AS Date), CAST(N'2016-05-16' AS Date), CAST(N'2016-05-14' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (224, 157, 4, CAST(N'2016-05-17' AS Date), CAST(N'2016-05-18' AS Date), CAST(N'2016-05-19' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (225, 307, 4, CAST(N'2016-05-17' AS Date), CAST(N'2016-05-20' AS Date), CAST(N'2016-05-19' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (227, 489, 4, CAST(N'2016-05-17' AS Date), CAST(N'2016-05-18' AS Date), CAST(N'2016-05-20' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (236, 206, 4, CAST(N'2016-05-25' AS Date), CAST(N'2016-05-27' AS Date), CAST(N'2016-05-26' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (239, 13, 3, CAST(N'2016-05-27' AS Date), CAST(N'2016-05-27' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (240, 65, 4, CAST(N'2016-05-27' AS Date), CAST(N'2016-05-29' AS Date), CAST(N'2016-05-30' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (245, 223, 4, CAST(N'2016-05-29' AS Date), CAST(N'2016-05-31' AS Date), CAST(N'2016-05-30' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (246, 17, 3, CAST(N'2016-05-30' AS Date), CAST(N'2016-05-30' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (249, 145, 4, CAST(N'2016-06-01' AS Date), CAST(N'2016-06-04' AS Date), CAST(N'2016-06-04' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (250, 150, 4, CAST(N'2016-06-01' AS Date), CAST(N'2016-06-02' AS Date), CAST(N'2016-06-04' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (252, 66, 4, CAST(N'2016-06-01' AS Date), CAST(N'2016-06-04' AS Date), CAST(N'2016-06-02' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (256, 26, 4, CAST(N'2016-06-04' AS Date), CAST(N'2016-06-05' AS Date), CAST(N'2016-06-07' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (258, 107, 4, CAST(N'2016-06-06' AS Date), CAST(N'2016-06-07' AS Date), CAST(N'2016-06-07' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (259, 413, 4, CAST(N'2016-06-06' AS Date), CAST(N'2016-06-09' AS Date), CAST(N'2016-06-09' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (264, 5, 3, CAST(N'2016-06-10' AS Date), CAST(N'2016-06-10' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (267, 282, 4, CAST(N'2016-06-11' AS Date), CAST(N'2016-06-14' AS Date), CAST(N'2016-06-14' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (271, 350, 4, CAST(N'2016-06-13' AS Date), CAST(N'2016-06-16' AS Date), CAST(N'2016-06-14' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (272, 497, 4, CAST(N'2016-06-15' AS Date), CAST(N'2016-06-18' AS Date), CAST(N'2016-06-16' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (274, 411, 4, CAST(N'2016-06-17' AS Date), CAST(N'2016-06-20' AS Date), CAST(N'2016-06-18' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (279, 378, 4, CAST(N'2016-06-21' AS Date), CAST(N'2016-06-22' AS Date), CAST(N'2016-06-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (282, 159, 4, CAST(N'2016-06-22' AS Date), CAST(N'2016-06-25' AS Date), CAST(N'2016-06-25' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (283, 181, 4, CAST(N'2016-06-23' AS Date), CAST(N'2016-06-26' AS Date), CAST(N'2016-06-26' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (285, 319, 4, CAST(N'2016-06-25' AS Date), CAST(N'2016-06-26' AS Date), CAST(N'2016-06-27' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (286, 59, 4, CAST(N'2016-06-25' AS Date), CAST(N'2016-06-26' AS Date), CAST(N'2016-06-26' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (287, 133, 4, CAST(N'2016-06-25' AS Date), CAST(N'2016-06-26' AS Date), CAST(N'2016-06-27' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (290, 202, 4, CAST(N'2016-06-28' AS Date), CAST(N'2016-06-29' AS Date), CAST(N'2016-06-30' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (291, 158, 4, CAST(N'2016-06-29' AS Date), CAST(N'2016-06-30' AS Date), CAST(N'2016-07-01' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (292, 360, 4, CAST(N'2016-06-29' AS Date), CAST(N'2016-06-30' AS Date), CAST(N'2016-07-02' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (299, 281, 4, CAST(N'2016-07-05' AS Date), CAST(N'2016-07-06' AS Date), CAST(N'2016-07-07' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (301, 17, 4, CAST(N'2016-07-06' AS Date), CAST(N'2016-07-09' AS Date), CAST(N'2016-07-08' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (303, 36, 4, CAST(N'2016-07-07' AS Date), CAST(N'2016-07-08' AS Date), CAST(N'2016-07-09' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (304, 230, 4, CAST(N'2016-07-07' AS Date), CAST(N'2016-07-08' AS Date), CAST(N'2016-07-08' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (306, 424, 4, CAST(N'2016-07-09' AS Date), CAST(N'2016-07-10' AS Date), CAST(N'2016-07-12' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (308, 156, 4, CAST(N'2016-07-11' AS Date), CAST(N'2016-07-12' AS Date), CAST(N'2016-07-14' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (309, 211, 4, CAST(N'2016-07-11' AS Date), CAST(N'2016-07-13' AS Date), CAST(N'2016-07-13' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (312, 299, 4, CAST(N'2016-07-13' AS Date), CAST(N'2016-07-15' AS Date), CAST(N'2016-07-16' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (324, 480, 4, CAST(N'2016-07-20' AS Date), CAST(N'2016-07-22' AS Date), CAST(N'2016-07-23' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (327, 83, 4, CAST(N'2016-07-21' AS Date), CAST(N'2016-07-24' AS Date), CAST(N'2016-07-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (329, 274, 4, CAST(N'2016-07-24' AS Date), CAST(N'2016-07-27' AS Date), CAST(N'2016-07-26' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (349, 30, 3, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-03' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (350, 31, 3, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-03' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (352, 16, 4, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-04' AS Date), CAST(N'2016-08-06' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (357, 14, 3, CAST(N'2016-08-05' AS Date), CAST(N'2016-08-05' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (359, 441, 4, CAST(N'2016-08-07' AS Date), CAST(N'2016-08-10' AS Date), CAST(N'2016-08-10' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (362, 187, 4, CAST(N'2016-08-09' AS Date), CAST(N'2016-08-11' AS Date), CAST(N'2016-08-11' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (364, 373, 4, CAST(N'2016-08-12' AS Date), CAST(N'2016-08-14' AS Date), CAST(N'2016-08-13' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (372, 132, 4, CAST(N'2016-08-16' AS Date), CAST(N'2016-08-18' AS Date), CAST(N'2016-08-18' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (373, 337, 4, CAST(N'2016-08-16' AS Date), CAST(N'2016-08-19' AS Date), CAST(N'2016-08-17' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (378, 475, 4, CAST(N'2016-08-17' AS Date), CAST(N'2016-08-20' AS Date), CAST(N'2016-08-20' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (382, 199, 4, CAST(N'2016-08-20' AS Date), CAST(N'2016-08-23' AS Date), CAST(N'2016-08-23' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (383, 331, 4, CAST(N'2016-08-20' AS Date), CAST(N'2016-08-23' AS Date), CAST(N'2016-08-22' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (384, 410, 4, CAST(N'2016-08-20' AS Date), CAST(N'2016-08-22' AS Date), CAST(N'2016-08-23' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (387, 451, 4, CAST(N'2016-08-20' AS Date), CAST(N'2016-08-21' AS Date), CAST(N'2016-08-21' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (389, 53, 4, CAST(N'2016-08-22' AS Date), CAST(N'2016-08-24' AS Date), CAST(N'2016-08-25' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (391, 61, 3, CAST(N'2016-08-23' AS Date), CAST(N'2016-08-23' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (392, 176, 4, CAST(N'2016-08-23' AS Date), CAST(N'2016-08-26' AS Date), CAST(N'2016-08-24' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (393, 368, 4, CAST(N'2016-08-25' AS Date), CAST(N'2016-08-26' AS Date), CAST(N'2016-08-27' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (395, 144, 4, CAST(N'2016-08-26' AS Date), CAST(N'2016-08-27' AS Date), CAST(N'2016-08-29' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (398, 447, 4, CAST(N'2016-08-29' AS Date), CAST(N'2016-08-30' AS Date), CAST(N'2016-09-01' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (401, 103, 4, CAST(N'2016-08-30' AS Date), CAST(N'2016-09-02' AS Date), CAST(N'2016-09-01' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (404, 396, 4, CAST(N'2016-08-31' AS Date), CAST(N'2016-09-03' AS Date), CAST(N'2016-09-01' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (407, 77, 3, CAST(N'2016-09-01' AS Date), CAST(N'2016-09-01' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (409, 416, 4, CAST(N'2016-09-01' AS Date), CAST(N'2016-09-04' AS Date), CAST(N'2016-09-04' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (411, 261, 4, CAST(N'2016-09-02' AS Date), CAST(N'2016-09-04' AS Date), CAST(N'2016-09-04' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (417, 359, 4, CAST(N'2016-09-04' AS Date), CAST(N'2016-09-05' AS Date), CAST(N'2016-09-06' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (418, 88, 4, CAST(N'2016-09-04' AS Date), CAST(N'2016-09-05' AS Date), CAST(N'2016-09-05' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (419, 14, 4, CAST(N'2016-09-04' AS Date), CAST(N'2016-09-07' AS Date), CAST(N'2016-09-06' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (420, 72, 4, CAST(N'2016-09-05' AS Date), CAST(N'2016-09-06' AS Date), CAST(N'2016-09-07' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (421, 240, 4, CAST(N'2016-09-05' AS Date), CAST(N'2016-09-06' AS Date), CAST(N'2016-09-08' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (422, 398, 4, CAST(N'2016-09-06' AS Date), CAST(N'2016-09-07' AS Date), CAST(N'2016-09-09' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (424, 67, 4, CAST(N'2016-09-08' AS Date), CAST(N'2016-09-11' AS Date), CAST(N'2016-09-11' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (427, 434, 4, CAST(N'2016-09-09' AS Date), CAST(N'2016-09-10' AS Date), CAST(N'2016-09-11' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (429, 153, 4, CAST(N'2016-09-10' AS Date), CAST(N'2016-09-12' AS Date), CAST(N'2016-09-12' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (430, 272, 4, CAST(N'2016-09-11' AS Date), CAST(N'2016-09-13' AS Date), CAST(N'2016-09-12' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (432, 169, 4, CAST(N'2016-09-12' AS Date), CAST(N'2016-09-15' AS Date), CAST(N'2016-09-14' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (435, 77, 4, CAST(N'2016-09-14' AS Date), CAST(N'2016-09-15' AS Date), CAST(N'2016-09-16' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (438, 314, 4, CAST(N'2016-09-16' AS Date), CAST(N'2016-09-19' AS Date), CAST(N'2016-09-18' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (439, 149, 4, CAST(N'2016-09-17' AS Date), CAST(N'2016-09-20' AS Date), CAST(N'2016-09-18' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (444, 30, 4, CAST(N'2016-09-19' AS Date), CAST(N'2016-09-20' AS Date), CAST(N'2016-09-21' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (445, 362, 4, CAST(N'2016-09-19' AS Date), CAST(N'2016-09-22' AS Date), CAST(N'2016-09-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (446, 399, 4, CAST(N'2016-09-19' AS Date), CAST(N'2016-09-21' AS Date), CAST(N'2016-09-20' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (448, 101, 4, CAST(N'2016-09-21' AS Date), CAST(N'2016-09-22' AS Date), CAST(N'2016-09-24' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (449, 492, 4, CAST(N'2016-09-21' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-22' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (458, 197, 4, CAST(N'2016-09-25' AS Date), CAST(N'2016-09-28' AS Date), CAST(N'2016-09-26' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (464, 74, 4, CAST(N'2016-09-28' AS Date), CAST(N'2016-09-30' AS Date), CAST(N'2016-09-29' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (472, 468, 4, CAST(N'2016-09-30' AS Date), CAST(N'2016-10-01' AS Date), CAST(N'2016-10-01' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (475, 241, 4, CAST(N'2016-10-01' AS Date), CAST(N'2016-10-04' AS Date), CAST(N'2016-10-03' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (477, 449, 4, CAST(N'2016-10-02' AS Date), CAST(N'2016-10-05' AS Date), CAST(N'2016-10-04' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (478, 304, 4, CAST(N'2016-10-02' AS Date), CAST(N'2016-10-05' AS Date), CAST(N'2016-10-03' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (481, 481, 4, CAST(N'2016-10-04' AS Date), CAST(N'2016-10-07' AS Date), CAST(N'2016-10-06' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (484, 421, 4, CAST(N'2016-10-06' AS Date), CAST(N'2016-10-09' AS Date), CAST(N'2016-10-07' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (485, 465, 4, CAST(N'2016-10-06' AS Date), CAST(N'2016-10-08' AS Date), CAST(N'2016-10-07' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (492, 191, 4, CAST(N'2016-10-09' AS Date), CAST(N'2016-10-10' AS Date), CAST(N'2016-10-12' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (496, 193, 4, CAST(N'2016-10-10' AS Date), CAST(N'2016-10-12' AS Date), CAST(N'2016-10-11' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (499, 260, 4, CAST(N'2016-10-11' AS Date), CAST(N'2016-10-14' AS Date), CAST(N'2016-10-13' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (500, 148, 4, CAST(N'2016-10-11' AS Date), CAST(N'2016-10-12' AS Date), CAST(N'2016-10-13' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (502, 401, 4, CAST(N'2016-10-12' AS Date), CAST(N'2016-10-13' AS Date), CAST(N'2016-10-13' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (509, 235, 4, CAST(N'2016-10-16' AS Date), CAST(N'2016-10-17' AS Date), CAST(N'2016-10-17' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (511, 377, 4, CAST(N'2016-10-18' AS Date), CAST(N'2016-10-20' AS Date), CAST(N'2016-10-19' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (512, 8, 4, CAST(N'2016-10-19' AS Date), CAST(N'2016-10-22' AS Date), CAST(N'2016-10-20' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (513, 155, 4, CAST(N'2016-10-19' AS Date), CAST(N'2016-10-21' AS Date), CAST(N'2016-10-21' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (516, 111, 4, CAST(N'2016-10-21' AS Date), CAST(N'2016-10-23' AS Date), CAST(N'2016-10-24' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (519, 54, 4, CAST(N'2016-10-22' AS Date), CAST(N'2016-10-23' AS Date), CAST(N'2016-10-24' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (531, 116, 4, CAST(N'2016-10-28' AS Date), CAST(N'2016-10-29' AS Date), CAST(N'2016-10-30' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (538, 341, 4, CAST(N'2016-11-02' AS Date), CAST(N'2016-11-05' AS Date), CAST(N'2016-11-05' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (542, 313, 4, CAST(N'2016-11-04' AS Date), CAST(N'2016-11-06' AS Date), CAST(N'2016-11-05' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (543, 62, 4, CAST(N'2016-11-06' AS Date), CAST(N'2016-11-09' AS Date), CAST(N'2016-11-08' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (544, 321, 4, CAST(N'2016-11-06' AS Date), CAST(N'2016-11-07' AS Date), CAST(N'2016-11-08' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (546, 470, 4, CAST(N'2016-11-09' AS Date), CAST(N'2016-11-12' AS Date), CAST(N'2016-11-10' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (547, 20, 4, CAST(N'2016-11-09' AS Date), CAST(N'2016-11-11' AS Date), CAST(N'2016-11-10' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (549, 64, 3, CAST(N'2016-11-12' AS Date), CAST(N'2016-11-12' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (554, 104, 4, CAST(N'2016-11-13' AS Date), CAST(N'2016-11-14' AS Date), CAST(N'2016-11-16' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (555, 212, 4, CAST(N'2016-11-13' AS Date), CAST(N'2016-11-14' AS Date), CAST(N'2016-11-16' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (556, 61, 4, CAST(N'2016-11-13' AS Date), CAST(N'2016-11-14' AS Date), CAST(N'2016-11-15' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (561, 90, 4, CAST(N'2016-11-19' AS Date), CAST(N'2016-11-22' AS Date), CAST(N'2016-11-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (563, 365, 4, CAST(N'2016-11-20' AS Date), CAST(N'2016-11-22' AS Date), CAST(N'2016-11-21' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (566, 298, 4, CAST(N'2016-11-22' AS Date), CAST(N'2016-11-25' AS Date), CAST(N'2016-11-23' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (571, 5, 4, CAST(N'2016-11-24' AS Date), CAST(N'2016-11-25' AS Date), CAST(N'2016-11-27' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (572, 178, 4, CAST(N'2016-11-24' AS Date), CAST(N'2016-11-26' AS Date), CAST(N'2016-11-26' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (573, 423, 4, CAST(N'2016-11-24' AS Date), CAST(N'2016-11-26' AS Date), CAST(N'2016-11-27' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (575, 33, 4, CAST(N'2016-11-27' AS Date), CAST(N'2016-11-28' AS Date), CAST(N'2016-11-30' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (577, 445, 4, CAST(N'2016-11-27' AS Date), CAST(N'2016-11-30' AS Date), CAST(N'2016-11-29' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (579, 160, 4, CAST(N'2016-11-27' AS Date), CAST(N'2016-11-30' AS Date), CAST(N'2016-11-29' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (582, 32, 3, CAST(N'2016-12-04' AS Date), CAST(N'2016-12-04' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (587, 487, 4, CAST(N'2016-12-06' AS Date), CAST(N'2016-12-08' AS Date), CAST(N'2016-12-08' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (588, 102, 4, CAST(N'2016-12-06' AS Date), CAST(N'2016-12-07' AS Date), CAST(N'2016-12-07' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (593, 50, 4, CAST(N'2016-12-07' AS Date), CAST(N'2016-12-10' AS Date), CAST(N'2016-12-08' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (598, 40, 3, CAST(N'2016-12-09' AS Date), CAST(N'2016-12-09' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (599, 1, 4, CAST(N'2016-12-09' AS Date), CAST(N'2016-12-10' AS Date), CAST(N'2016-12-12' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (604, 96, 4, CAST(N'2016-12-10' AS Date), CAST(N'2016-12-13' AS Date), CAST(N'2016-12-12' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (606, 18, 4, CAST(N'2016-12-11' AS Date), CAST(N'2016-12-12' AS Date), CAST(N'2016-12-13' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (607, 309, 4, CAST(N'2016-12-11' AS Date), CAST(N'2016-12-14' AS Date), CAST(N'2016-12-13' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (617, 118, 4, CAST(N'2016-12-21' AS Date), CAST(N'2016-12-23' AS Date), CAST(N'2016-12-23' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (618, 131, 4, CAST(N'2016-12-21' AS Date), CAST(N'2016-12-22' AS Date), CAST(N'2016-12-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (619, 454, 4, CAST(N'2016-12-22' AS Date), CAST(N'2016-12-25' AS Date), CAST(N'2016-12-25' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (620, 466, 4, CAST(N'2016-12-22' AS Date), CAST(N'2016-12-24' AS Date), CAST(N'2016-12-24' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (626, 130, 4, CAST(N'2016-12-25' AS Date), CAST(N'2016-12-28' AS Date), CAST(N'2016-12-27' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (632, 163, 4, CAST(N'2016-12-27' AS Date), CAST(N'2016-12-29' AS Date), CAST(N'2016-12-29' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (634, 27, 4, CAST(N'2016-12-29' AS Date), CAST(N'2017-01-01' AS Date), CAST(N'2016-12-30' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (644, 439, 4, CAST(N'2017-01-08' AS Date), CAST(N'2017-01-11' AS Date), CAST(N'2017-01-10' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (647, 283, 4, CAST(N'2017-01-09' AS Date), CAST(N'2017-01-10' AS Date), CAST(N'2017-01-11' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (651, 190, 4, CAST(N'2017-01-11' AS Date), CAST(N'2017-01-13' AS Date), CAST(N'2017-01-13' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (655, 347, 4, CAST(N'2017-01-16' AS Date), CAST(N'2017-01-17' AS Date), CAST(N'2017-01-18' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (657, 349, 4, CAST(N'2017-01-17' AS Date), CAST(N'2017-01-19' AS Date), CAST(N'2017-01-20' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (660, 383, 4, CAST(N'2017-01-18' AS Date), CAST(N'2017-01-19' AS Date), CAST(N'2017-01-19' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (663, 344, 4, CAST(N'2017-01-20' AS Date), CAST(N'2017-01-22' AS Date), CAST(N'2017-01-23' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (665, 29, 4, CAST(N'2017-01-21' AS Date), CAST(N'2017-01-22' AS Date), CAST(N'2017-01-23' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (668, 297, 4, CAST(N'2017-01-22' AS Date), CAST(N'2017-01-23' AS Date), CAST(N'2017-01-24' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (670, 361, 4, CAST(N'2017-01-24' AS Date), CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (673, 64, 4, CAST(N'2017-01-26' AS Date), CAST(N'2017-01-28' AS Date), CAST(N'2017-01-27' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (675, 291, 4, CAST(N'2017-01-28' AS Date), CAST(N'2017-01-31' AS Date), CAST(N'2017-01-30' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (678, 250, 4, CAST(N'2017-01-28' AS Date), CAST(N'2017-01-29' AS Date), CAST(N'2017-01-31' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (679, 81, 4, CAST(N'2017-01-29' AS Date), CAST(N'2017-01-30' AS Date), CAST(N'2017-01-30' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (680, 245, 4, CAST(N'2017-01-29' AS Date), CAST(N'2017-02-01' AS Date), CAST(N'2017-01-30' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (681, 499, 4, CAST(N'2017-01-29' AS Date), CAST(N'2017-02-01' AS Date), CAST(N'2017-01-31' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (686, 380, 4, CAST(N'2017-02-01' AS Date), CAST(N'2017-02-03' AS Date), CAST(N'2017-02-04' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (688, 343, 4, CAST(N'2017-02-02' AS Date), CAST(N'2017-02-03' AS Date), CAST(N'2017-02-05' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (692, 2, 3, CAST(N'2017-02-05' AS Date), CAST(N'2017-02-05' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (694, 58, 4, CAST(N'2017-02-05' AS Date), CAST(N'2017-02-06' AS Date), CAST(N'2017-02-08' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (700, 4, 4, CAST(N'2017-02-07' AS Date), CAST(N'2017-02-10' AS Date), CAST(N'2017-02-08' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (703, 417, 4, CAST(N'2017-02-08' AS Date), CAST(N'2017-02-09' AS Date), CAST(N'2017-02-09' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (707, 79, 4, CAST(N'2017-02-09' AS Date), CAST(N'2017-02-11' AS Date), CAST(N'2017-02-11' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (710, 295, 4, CAST(N'2017-02-13' AS Date), CAST(N'2017-02-15' AS Date), CAST(N'2017-02-16' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (712, 173, 4, CAST(N'2017-02-13' AS Date), CAST(N'2017-02-14' AS Date), CAST(N'2017-02-16' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (713, 207, 4, CAST(N'2017-02-13' AS Date), CAST(N'2017-02-14' AS Date), CAST(N'2017-02-15' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (715, 12, 3, CAST(N'2017-02-15' AS Date), CAST(N'2017-02-15' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (718, 38, 4, CAST(N'2017-02-16' AS Date), CAST(N'2017-02-17' AS Date), CAST(N'2017-02-17' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (719, 200, 4, CAST(N'2017-02-16' AS Date), CAST(N'2017-02-19' AS Date), CAST(N'2017-02-18' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (720, 382, 4, CAST(N'2017-02-16' AS Date), CAST(N'2017-02-19' AS Date), CAST(N'2017-02-19' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (730, 500, 4, CAST(N'2017-02-21' AS Date), CAST(N'2017-02-24' AS Date), CAST(N'2017-02-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (732, 147, 4, CAST(N'2017-02-26' AS Date), CAST(N'2017-02-27' AS Date), CAST(N'2017-03-01' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (735, 20, 3, CAST(N'2017-02-27' AS Date), CAST(N'2017-02-27' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (736, 184, 4, CAST(N'2017-02-27' AS Date), CAST(N'2017-02-28' AS Date), CAST(N'2017-02-28' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (738, 124, 4, CAST(N'2017-02-28' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-03-03' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (739, 49, 4, CAST(N'2017-02-28' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-03-02' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (741, 119, 4, CAST(N'2017-02-28' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-03-01' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (742, 433, 4, CAST(N'2017-02-28' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-03-01' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (743, 137, 4, CAST(N'2017-03-01' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-04' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (744, 166, 4, CAST(N'2017-03-01' AS Date), CAST(N'2017-03-02' AS Date), CAST(N'2017-03-02' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (746, 391, 4, CAST(N'2017-03-02' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-05' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (747, 87, 4, CAST(N'2017-03-03' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-05' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (749, 255, 4, CAST(N'2017-03-04' AS Date), CAST(N'2017-03-07' AS Date), CAST(N'2017-03-05' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (750, 232, 4, CAST(N'2017-03-04' AS Date), CAST(N'2017-03-07' AS Date), CAST(N'2017-03-05' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (752, 335, 4, CAST(N'2017-03-05' AS Date), CAST(N'2017-03-06' AS Date), CAST(N'2017-03-07' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (759, 284, 4, CAST(N'2017-03-07' AS Date), CAST(N'2017-03-09' AS Date), CAST(N'2017-03-08' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (766, 141, 4, CAST(N'2017-03-09' AS Date), CAST(N'2017-03-11' AS Date), CAST(N'2017-03-12' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (770, 135, 4, CAST(N'2017-03-09' AS Date), CAST(N'2017-03-11' AS Date), CAST(N'2017-03-11' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (772, 448, 4, CAST(N'2017-03-11' AS Date), CAST(N'2017-03-12' AS Date), CAST(N'2017-03-13' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (776, 490, 4, CAST(N'2017-03-13' AS Date), CAST(N'2017-03-15' AS Date), CAST(N'2017-03-16' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (777, 496, 4, CAST(N'2017-03-13' AS Date), CAST(N'2017-03-16' AS Date), CAST(N'2017-03-16' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (778, 56, 3, CAST(N'2017-03-15' AS Date), CAST(N'2017-03-15' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (779, 367, 4, CAST(N'2017-03-15' AS Date), CAST(N'2017-03-16' AS Date), CAST(N'2017-03-18' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (784, 430, 4, CAST(N'2017-03-16' AS Date), CAST(N'2017-03-19' AS Date), CAST(N'2017-03-19' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (786, 249, 4, CAST(N'2017-03-18' AS Date), CAST(N'2017-03-20' AS Date), CAST(N'2017-03-19' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (791, 432, 4, CAST(N'2017-03-20' AS Date), CAST(N'2017-03-22' AS Date), CAST(N'2017-03-23' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (792, 479, 4, CAST(N'2017-03-22' AS Date), CAST(N'2017-03-23' AS Date), CAST(N'2017-03-24' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (796, 154, 4, CAST(N'2017-03-23' AS Date), CAST(N'2017-03-26' AS Date), CAST(N'2017-03-25' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (797, 374, 4, CAST(N'2017-03-24' AS Date), CAST(N'2017-03-26' AS Date), CAST(N'2017-03-26' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (801, 78, 4, CAST(N'2017-03-28' AS Date), CAST(N'2017-03-29' AS Date), CAST(N'2017-03-30' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (802, 340, 4, CAST(N'2017-03-28' AS Date), CAST(N'2017-03-29' AS Date), CAST(N'2017-03-30' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (804, 95, 4, CAST(N'2017-03-29' AS Date), CAST(N'2017-03-31' AS Date), CAST(N'2017-03-30' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (805, 420, 4, CAST(N'2017-03-29' AS Date), CAST(N'2017-03-30' AS Date), CAST(N'2017-04-01' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (806, 234, 4, CAST(N'2017-03-30' AS Date), CAST(N'2017-03-31' AS Date), CAST(N'2017-03-31' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (808, 315, 4, CAST(N'2017-03-31' AS Date), CAST(N'2017-04-02' AS Date), CAST(N'2017-04-02' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (810, 153, 3, CAST(N'2017-04-01' AS Date), CAST(N'2017-04-01' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (817, 301, 4, CAST(N'2017-04-04' AS Date), CAST(N'2017-04-05' AS Date), CAST(N'2017-04-07' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (819, 221, 4, CAST(N'2017-04-04' AS Date), CAST(N'2017-04-07' AS Date), CAST(N'2017-04-05' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (822, 294, 4, CAST(N'2017-04-06' AS Date), CAST(N'2017-04-08' AS Date), CAST(N'2017-04-09' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (823, 415, 4, CAST(N'2017-04-06' AS Date), CAST(N'2017-04-07' AS Date), CAST(N'2017-04-08' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (825, 10, 4, CAST(N'2017-04-07' AS Date), CAST(N'2017-04-08' AS Date), CAST(N'2017-04-09' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (826, 45, 4, CAST(N'2017-04-07' AS Date), CAST(N'2017-04-10' AS Date), CAST(N'2017-04-10' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (828, 246, 4, CAST(N'2017-04-09' AS Date), CAST(N'2017-04-10' AS Date), CAST(N'2017-04-12' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (830, 431, 4, CAST(N'2017-04-11' AS Date), CAST(N'2017-04-14' AS Date), CAST(N'2017-04-12' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (833, 406, 4, CAST(N'2017-04-12' AS Date), CAST(N'2017-04-14' AS Date), CAST(N'2017-04-15' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (836, 455, 4, CAST(N'2017-04-13' AS Date), CAST(N'2017-04-16' AS Date), CAST(N'2017-04-14' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (840, 372, 4, CAST(N'2017-04-15' AS Date), CAST(N'2017-04-16' AS Date), CAST(N'2017-04-16' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (841, 428, 4, CAST(N'2017-04-15' AS Date), CAST(N'2017-04-18' AS Date), CAST(N'2017-04-17' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (847, 329, 4, CAST(N'2017-04-18' AS Date), CAST(N'2017-04-19' AS Date), CAST(N'2017-04-19' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (852, 13, 4, CAST(N'2017-04-21' AS Date), CAST(N'2017-04-23' AS Date), CAST(N'2017-04-22' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (854, 177, 4, CAST(N'2017-04-22' AS Date), CAST(N'2017-04-25' AS Date), CAST(N'2017-04-23' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (856, 477, 4, CAST(N'2017-04-23' AS Date), CAST(N'2017-04-25' AS Date), CAST(N'2017-04-26' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (858, 162, 4, CAST(N'2017-04-25' AS Date), CAST(N'2017-04-27' AS Date), CAST(N'2017-04-28' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (860, 473, 4, CAST(N'2017-04-27' AS Date), CAST(N'2017-04-29' AS Date), CAST(N'2017-04-28' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (863, 446, 4, CAST(N'2017-04-28' AS Date), CAST(N'2017-04-30' AS Date), CAST(N'2017-05-01' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (867, 97, 4, CAST(N'2017-05-01' AS Date), CAST(N'2017-05-03' AS Date), CAST(N'2017-05-02' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (871, 358, 4, CAST(N'2017-05-02' AS Date), CAST(N'2017-05-04' AS Date), CAST(N'2017-05-03' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (872, 394, 4, CAST(N'2017-05-03' AS Date), CAST(N'2017-05-06' AS Date), CAST(N'2017-05-06' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (875, 386, 4, CAST(N'2017-05-05' AS Date), CAST(N'2017-05-06' AS Date), CAST(N'2017-05-08' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (878, 224, 4, CAST(N'2017-05-07' AS Date), CAST(N'2017-05-10' AS Date), CAST(N'2017-05-09' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (879, 214, 4, CAST(N'2017-05-08' AS Date), CAST(N'2017-05-09' AS Date), CAST(N'2017-05-09' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (882, 196, 4, CAST(N'2017-05-09' AS Date), CAST(N'2017-05-12' AS Date), CAST(N'2017-05-10' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (885, 66, 3, CAST(N'2017-05-13' AS Date), CAST(N'2017-05-13' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (890, 171, 4, CAST(N'2017-05-15' AS Date), CAST(N'2017-05-18' AS Date), CAST(N'2017-05-18' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (891, 384, 4, CAST(N'2017-05-15' AS Date), CAST(N'2017-05-18' AS Date), CAST(N'2017-05-16' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (896, 376, 4, CAST(N'2017-05-19' AS Date), CAST(N'2017-05-22' AS Date), CAST(N'2017-05-21' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (897, 47, 4, CAST(N'2017-05-20' AS Date), CAST(N'2017-05-21' AS Date), CAST(N'2017-05-21' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (898, 352, 4, CAST(N'2017-05-20' AS Date), CAST(N'2017-05-21' AS Date), CAST(N'2017-05-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (901, 345, 4, CAST(N'2017-05-21' AS Date), CAST(N'2017-05-22' AS Date), CAST(N'2017-05-24' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (903, 179, 4, CAST(N'2017-05-22' AS Date), CAST(N'2017-05-23' AS Date), CAST(N'2017-05-24' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (907, 120, 4, CAST(N'2017-05-24' AS Date), CAST(N'2017-05-26' AS Date), CAST(N'2017-05-27' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (908, 402, 4, CAST(N'2017-05-25' AS Date), CAST(N'2017-05-28' AS Date), CAST(N'2017-05-27' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (909, 188, 4, CAST(N'2017-05-26' AS Date), CAST(N'2017-05-27' AS Date), CAST(N'2017-05-28' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (910, 342, 4, CAST(N'2017-05-26' AS Date), CAST(N'2017-05-28' AS Date), CAST(N'2017-05-28' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (915, 215, 4, CAST(N'2017-05-28' AS Date), CAST(N'2017-05-30' AS Date), CAST(N'2017-05-30' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (918, 242, 4, CAST(N'2017-05-30' AS Date), CAST(N'2017-05-31' AS Date), CAST(N'2017-05-31' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (924, 68, 3, CAST(N'2017-06-02' AS Date), CAST(N'2017-06-02' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (926, 233, 4, CAST(N'2017-06-03' AS Date), CAST(N'2017-06-05' AS Date), CAST(N'2017-06-06' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (929, 472, 4, CAST(N'2017-06-05' AS Date), CAST(N'2017-06-06' AS Date), CAST(N'2017-06-08' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (934, 93, 4, CAST(N'2017-06-09' AS Date), CAST(N'2017-06-10' AS Date), CAST(N'2017-06-12' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (935, 43, 3, CAST(N'2017-06-10' AS Date), CAST(N'2017-06-10' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (936, 265, 4, CAST(N'2017-06-10' AS Date), CAST(N'2017-06-13' AS Date), CAST(N'2017-06-12' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (937, 73, 4, CAST(N'2017-06-11' AS Date), CAST(N'2017-06-14' AS Date), CAST(N'2017-06-13' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (938, 129, 4, CAST(N'2017-06-11' AS Date), CAST(N'2017-06-12' AS Date), CAST(N'2017-06-12' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (944, 138, 4, CAST(N'2017-06-14' AS Date), CAST(N'2017-06-15' AS Date), CAST(N'2017-06-17' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (945, 167, 4, CAST(N'2017-06-14' AS Date), CAST(N'2017-06-15' AS Date), CAST(N'2017-06-16' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (947, 278, 4, CAST(N'2017-06-15' AS Date), CAST(N'2017-06-18' AS Date), CAST(N'2017-06-17' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (950, 142, 4, CAST(N'2017-06-16' AS Date), CAST(N'2017-06-19' AS Date), CAST(N'2017-06-18' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (951, 339, 4, CAST(N'2017-06-16' AS Date), CAST(N'2017-06-19' AS Date), CAST(N'2017-06-19' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (952, 355, 4, CAST(N'2017-06-16' AS Date), CAST(N'2017-06-18' AS Date), CAST(N'2017-06-18' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (961, 82, 4, CAST(N'2017-06-19' AS Date), CAST(N'2017-06-21' AS Date), CAST(N'2017-06-22' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (964, 404, 4, CAST(N'2017-06-20' AS Date), CAST(N'2017-06-22' AS Date), CAST(N'2017-06-22' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (965, 457, 4, CAST(N'2017-06-20' AS Date), CAST(N'2017-06-22' AS Date), CAST(N'2017-06-23' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (966, 389, 4, CAST(N'2017-06-20' AS Date), CAST(N'2017-06-22' AS Date), CAST(N'2017-06-22' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (969, 248, 4, CAST(N'2017-06-21' AS Date), CAST(N'2017-06-24' AS Date), CAST(N'2017-06-22' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (972, 270, 4, CAST(N'2017-06-23' AS Date), CAST(N'2017-06-24' AS Date), CAST(N'2017-06-25' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (973, 238, 4, CAST(N'2017-06-24' AS Date), CAST(N'2017-06-27' AS Date), CAST(N'2017-06-27' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (977, 400, 4, CAST(N'2017-06-26' AS Date), CAST(N'2017-06-28' AS Date), CAST(N'2017-06-27' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (980, 328, 4, CAST(N'2017-06-26' AS Date), CAST(N'2017-06-28' AS Date), CAST(N'2017-06-27' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (985, 461, 4, CAST(N'2017-06-30' AS Date), CAST(N'2017-07-02' AS Date), CAST(N'2017-07-01' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (987, 172, 4, CAST(N'2017-07-02' AS Date), CAST(N'2017-07-04' AS Date), CAST(N'2017-07-04' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (988, 436, 4, CAST(N'2017-07-02' AS Date), CAST(N'2017-07-04' AS Date), CAST(N'2017-07-05' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (994, 419, 4, CAST(N'2017-07-09' AS Date), CAST(N'2017-07-11' AS Date), CAST(N'2017-07-11' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (997, 485, 4, CAST(N'2017-07-11' AS Date), CAST(N'2017-07-13' AS Date), CAST(N'2017-07-14' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (998, 219, 4, CAST(N'2017-07-12' AS Date), CAST(N'2017-07-13' AS Date), CAST(N'2017-07-14' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1001, 354, 4, CAST(N'2017-07-13' AS Date), CAST(N'2017-07-16' AS Date), CAST(N'2017-07-15' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1005, 266, 4, CAST(N'2017-07-15' AS Date), CAST(N'2017-07-17' AS Date), CAST(N'2017-07-16' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1010, 8, 3, CAST(N'2017-07-18' AS Date), CAST(N'2017-07-18' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1011, 495, 4, CAST(N'2017-07-18' AS Date), CAST(N'2017-07-21' AS Date), CAST(N'2017-07-21' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1013, 174, 4, CAST(N'2017-07-19' AS Date), CAST(N'2017-07-22' AS Date), CAST(N'2017-07-21' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1017, 168, 4, CAST(N'2017-07-20' AS Date), CAST(N'2017-07-21' AS Date), CAST(N'2017-07-23' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1018, 290, 4, CAST(N'2017-07-22' AS Date), CAST(N'2017-07-23' AS Date), CAST(N'2017-07-23' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1019, 408, 4, CAST(N'2017-07-22' AS Date), CAST(N'2017-07-23' AS Date), CAST(N'2017-07-24' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1020, 16, 3, CAST(N'2017-07-23' AS Date), CAST(N'2017-07-23' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1021, 125, 4, CAST(N'2017-07-23' AS Date), CAST(N'2017-07-24' AS Date), CAST(N'2017-07-26' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1022, 353, 4, CAST(N'2017-07-23' AS Date), CAST(N'2017-07-26' AS Date), CAST(N'2017-07-24' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1023, 356, 4, CAST(N'2017-07-23' AS Date), CAST(N'2017-07-26' AS Date), CAST(N'2017-07-25' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1029, 407, 4, CAST(N'2017-07-29' AS Date), CAST(N'2017-07-30' AS Date), CAST(N'2017-08-01' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1030, 161, 4, CAST(N'2017-07-29' AS Date), CAST(N'2017-07-30' AS Date), CAST(N'2017-07-31' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1032, 429, 4, CAST(N'2017-07-30' AS Date), CAST(N'2017-08-02' AS Date), CAST(N'2017-08-01' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1041, 70, 4, CAST(N'2017-08-04' AS Date), CAST(N'2017-08-06' AS Date), CAST(N'2017-08-05' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1045, 185, 4, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-09' AS Date), CAST(N'2017-08-10' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1047, 116, 3, CAST(N'2017-08-08' AS Date), CAST(N'2017-08-08' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1049, 194, 4, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-11' AS Date), CAST(N'2017-08-10' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1050, 239, 4, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-12' AS Date), CAST(N'2017-08-12' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1051, 209, 4, CAST(N'2017-08-10' AS Date), CAST(N'2017-08-11' AS Date), CAST(N'2017-08-11' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1052, 460, 4, CAST(N'2017-08-10' AS Date), CAST(N'2017-08-12' AS Date), CAST(N'2017-08-13' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1054, 189, 4, CAST(N'2017-08-11' AS Date), CAST(N'2017-08-12' AS Date), CAST(N'2017-08-12' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1055, 140, 4, CAST(N'2017-08-12' AS Date), CAST(N'2017-08-15' AS Date), CAST(N'2017-08-15' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1056, 325, 4, CAST(N'2017-08-12' AS Date), CAST(N'2017-08-15' AS Date), CAST(N'2017-08-13' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1057, 456, 4, CAST(N'2017-08-12' AS Date), CAST(N'2017-08-15' AS Date), CAST(N'2017-08-13' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1059, 6, 4, CAST(N'2017-08-14' AS Date), CAST(N'2017-08-17' AS Date), CAST(N'2017-08-17' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1060, 182, 4, CAST(N'2017-08-15' AS Date), CAST(N'2017-08-18' AS Date), CAST(N'2017-08-17' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1063, 198, 4, CAST(N'2017-08-16' AS Date), CAST(N'2017-08-19' AS Date), CAST(N'2017-08-19' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1065, 25, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-19' AS Date), CAST(N'2017-08-19' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1066, 106, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-20' AS Date), CAST(N'2017-08-19' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1067, 225, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-19' AS Date), CAST(N'2017-08-19' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1068, 453, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-20' AS Date), CAST(N'2017-08-19' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1069, 493, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-19' AS Date), CAST(N'2017-08-18' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1072, 47, 3, CAST(N'2017-08-18' AS Date), CAST(N'2017-08-18' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1074, 11, 3, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-19' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1076, 42, 4, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-22' AS Date), CAST(N'2017-08-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1077, 412, 4, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-20' AS Date), CAST(N'2017-08-21' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1084, 2, 4, CAST(N'2017-08-21' AS Date), CAST(N'2017-08-24' AS Date), CAST(N'2017-08-23' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1085, 305, 4, CAST(N'2017-08-21' AS Date), CAST(N'2017-08-23' AS Date), CAST(N'2017-08-23' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1086, 220, 4, CAST(N'2017-08-21' AS Date), CAST(N'2017-08-23' AS Date), CAST(N'2017-08-24' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1089, 46, 3, CAST(N'2017-08-23' AS Date), CAST(N'2017-08-23' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1092, 40, 4, CAST(N'2017-08-25' AS Date), CAST(N'2017-08-28' AS Date), CAST(N'2017-08-27' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1093, 326, 4, CAST(N'2017-08-25' AS Date), CAST(N'2017-08-28' AS Date), CAST(N'2017-08-26' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1101, 379, 4, CAST(N'2017-08-29' AS Date), CAST(N'2017-08-30' AS Date), CAST(N'2017-08-30' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1104, 268, 4, CAST(N'2017-09-01' AS Date), CAST(N'2017-09-04' AS Date), CAST(N'2017-09-03' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1109, 23, 4, CAST(N'2017-09-03' AS Date), CAST(N'2017-09-04' AS Date), CAST(N'2017-09-04' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1113, 388, 4, CAST(N'2017-09-06' AS Date), CAST(N'2017-09-08' AS Date), CAST(N'2017-09-07' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1116, 52, 4, CAST(N'2017-09-08' AS Date), CAST(N'2017-09-10' AS Date), CAST(N'2017-09-10' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1117, 334, 4, CAST(N'2017-09-08' AS Date), CAST(N'2017-09-10' AS Date), CAST(N'2017-09-10' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1121, 143, 4, CAST(N'2017-09-11' AS Date), CAST(N'2017-09-13' AS Date), CAST(N'2017-09-12' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1124, 275, 4, CAST(N'2017-09-13' AS Date), CAST(N'2017-09-14' AS Date), CAST(N'2017-09-16' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1127, 494, 4, CAST(N'2017-09-15' AS Date), CAST(N'2017-09-16' AS Date), CAST(N'2017-09-16' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1130, 69, 4, CAST(N'2017-09-18' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1132, 351, 4, CAST(N'2017-09-19' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1138, 254, 4, CAST(N'2017-09-21' AS Date), CAST(N'2017-09-23' AS Date), CAST(N'2017-09-22' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1157, 24, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-04' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1161, 41, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-04' AS Date), CAST(N'2017-10-02' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1166, 286, 4, CAST(N'2017-10-03' AS Date), CAST(N'2017-10-04' AS Date), CAST(N'2017-10-04' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1175, 292, 4, CAST(N'2017-10-09' AS Date), CAST(N'2017-10-11' AS Date), CAST(N'2017-10-12' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1177, 21, 3, CAST(N'2017-10-12' AS Date), CAST(N'2017-10-12' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1183, 216, 4, CAST(N'2017-10-14' AS Date), CAST(N'2017-10-17' AS Date), CAST(N'2017-10-17' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1184, 369, 4, CAST(N'2017-10-14' AS Date), CAST(N'2017-10-15' AS Date), CAST(N'2017-10-16' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1187, 486, 4, CAST(N'2017-10-15' AS Date), CAST(N'2017-10-18' AS Date), CAST(N'2017-10-16' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1190, 34, 4, CAST(N'2017-10-16' AS Date), CAST(N'2017-10-19' AS Date), CAST(N'2017-10-17' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1191, 186, 4, CAST(N'2017-10-17' AS Date), CAST(N'2017-10-18' AS Date), CAST(N'2017-10-18' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1194, 192, 4, CAST(N'2017-10-19' AS Date), CAST(N'2017-10-22' AS Date), CAST(N'2017-10-22' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1195, 229, 4, CAST(N'2017-10-19' AS Date), CAST(N'2017-10-21' AS Date), CAST(N'2017-10-21' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1197, 269, 4, CAST(N'2017-10-21' AS Date), CAST(N'2017-10-23' AS Date), CAST(N'2017-10-23' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1199, 318, 4, CAST(N'2017-10-23' AS Date), CAST(N'2017-10-24' AS Date), CAST(N'2017-10-26' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1200, 48, 4, CAST(N'2017-10-23' AS Date), CAST(N'2017-10-25' AS Date), CAST(N'2017-10-26' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1201, 201, 4, CAST(N'2017-10-23' AS Date), CAST(N'2017-10-24' AS Date), CAST(N'2017-10-24' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1206, 222, 4, CAST(N'2017-10-26' AS Date), CAST(N'2017-10-29' AS Date), CAST(N'2017-10-29' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1211, 19, 4, CAST(N'2017-10-27' AS Date), CAST(N'2017-10-28' AS Date), CAST(N'2017-10-29' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1212, 213, 4, CAST(N'2017-10-27' AS Date), CAST(N'2017-10-30' AS Date), CAST(N'2017-10-29' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1222, 482, 4, CAST(N'2017-11-01' AS Date), CAST(N'2017-11-04' AS Date), CAST(N'2017-11-03' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1226, 226, 4, CAST(N'2017-11-04' AS Date), CAST(N'2017-11-07' AS Date), CAST(N'2017-11-06' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1229, 89, 4, CAST(N'2017-11-05' AS Date), CAST(N'2017-11-08' AS Date), CAST(N'2017-11-06' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1233, 462, 4, CAST(N'2017-11-06' AS Date), CAST(N'2017-11-07' AS Date), CAST(N'2017-11-08' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1234, 19, 3, CAST(N'2017-11-07' AS Date), CAST(N'2017-11-07' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1235, 210, 4, CAST(N'2017-11-07' AS Date), CAST(N'2017-11-08' AS Date), CAST(N'2017-11-09' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1236, 243, 4, CAST(N'2017-11-08' AS Date), CAST(N'2017-11-11' AS Date), CAST(N'2017-11-09' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1242, 303, 4, CAST(N'2017-11-11' AS Date), CAST(N'2017-11-12' AS Date), CAST(N'2017-11-12' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1243, 346, 4, CAST(N'2017-11-11' AS Date), CAST(N'2017-11-13' AS Date), CAST(N'2017-11-14' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1244, 333, 4, CAST(N'2017-11-12' AS Date), CAST(N'2017-11-14' AS Date), CAST(N'2017-11-13' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1247, 426, 4, CAST(N'2017-11-16' AS Date), CAST(N'2017-11-18' AS Date), CAST(N'2017-11-17' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1251, 289, 4, CAST(N'2017-11-17' AS Date), CAST(N'2017-11-19' AS Date), CAST(N'2017-11-19' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1252, 110, 4, CAST(N'2017-11-18' AS Date), CAST(N'2017-11-20' AS Date), CAST(N'2017-11-21' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1253, 44, 4, CAST(N'2017-11-18' AS Date), CAST(N'2017-11-21' AS Date), CAST(N'2017-11-21' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1255, 375, 4, CAST(N'2017-11-19' AS Date), CAST(N'2017-11-20' AS Date), CAST(N'2017-11-21' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1256, 458, 4, CAST(N'2017-11-19' AS Date), CAST(N'2017-11-20' AS Date), CAST(N'2017-11-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1259, 4, 3, CAST(N'2017-11-21' AS Date), CAST(N'2017-11-21' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1261, 435, 4, CAST(N'2017-11-23' AS Date), CAST(N'2017-11-25' AS Date), CAST(N'2017-11-24' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1264, 113, 4, CAST(N'2017-11-24' AS Date), CAST(N'2017-11-27' AS Date), CAST(N'2017-11-25' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1266, 387, 4, CAST(N'2017-11-25' AS Date), CAST(N'2017-11-28' AS Date), CAST(N'2017-11-27' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1267, 467, 4, CAST(N'2017-11-25' AS Date), CAST(N'2017-11-26' AS Date), CAST(N'2017-11-26' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1275, 165, 4, CAST(N'2017-11-29' AS Date), CAST(N'2017-12-01' AS Date), CAST(N'2017-11-30' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1277, 227, 4, CAST(N'2017-12-01' AS Date), CAST(N'2017-12-04' AS Date), CAST(N'2017-12-02' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1280, 123, 4, CAST(N'2017-12-01' AS Date), CAST(N'2017-12-03' AS Date), CAST(N'2017-12-03' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1282, 320, 4, CAST(N'2017-12-03' AS Date), CAST(N'2017-12-05' AS Date), CAST(N'2017-12-05' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1283, 85, 4, CAST(N'2017-12-04' AS Date), CAST(N'2017-12-07' AS Date), CAST(N'2017-12-07' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1284, 128, 4, CAST(N'2017-12-04' AS Date), CAST(N'2017-12-06' AS Date), CAST(N'2017-12-07' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1285, 262, 4, CAST(N'2017-12-04' AS Date), CAST(N'2017-12-07' AS Date), CAST(N'2017-12-07' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1287, 279, 4, CAST(N'2017-12-07' AS Date), CAST(N'2017-12-10' AS Date), CAST(N'2017-12-09' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1292, 285, 4, CAST(N'2017-12-10' AS Date), CAST(N'2017-12-13' AS Date), CAST(N'2017-12-11' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1295, 37, 4, CAST(N'2017-12-11' AS Date), CAST(N'2017-12-12' AS Date), CAST(N'2017-12-14' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1296, 231, 4, CAST(N'2017-12-14' AS Date), CAST(N'2017-12-17' AS Date), CAST(N'2017-12-15' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1297, 108, 4, CAST(N'2017-12-14' AS Date), CAST(N'2017-12-17' AS Date), CAST(N'2017-12-16' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1302, 322, 4, CAST(N'2017-12-16' AS Date), CAST(N'2017-12-18' AS Date), CAST(N'2017-12-19' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1305, 257, 4, CAST(N'2017-12-17' AS Date), CAST(N'2017-12-19' AS Date), CAST(N'2017-12-18' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1306, 28, 4, CAST(N'2017-12-20' AS Date), CAST(N'2017-12-21' AS Date), CAST(N'2017-12-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1310, 444, 4, CAST(N'2017-12-24' AS Date), CAST(N'2017-12-25' AS Date), CAST(N'2017-12-26' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1312, 311, 4, CAST(N'2017-12-25' AS Date), CAST(N'2017-12-28' AS Date), CAST(N'2017-12-26' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1317, 418, 4, CAST(N'2017-12-27' AS Date), CAST(N'2017-12-28' AS Date), CAST(N'2017-12-29' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1318, 75, 4, CAST(N'2017-12-27' AS Date), CAST(N'2017-12-30' AS Date), CAST(N'2017-12-29' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1320, 244, 4, CAST(N'2017-12-28' AS Date), CAST(N'2017-12-30' AS Date), CAST(N'2017-12-29' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1321, 217, 4, CAST(N'2017-12-30' AS Date), CAST(N'2017-12-31' AS Date), CAST(N'2017-12-31' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1322, 39, 4, CAST(N'2017-12-31' AS Date), CAST(N'2018-01-03' AS Date), CAST(N'2018-01-02' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1323, 273, 4, CAST(N'2017-12-31' AS Date), CAST(N'2018-01-01' AS Date), CAST(N'2018-01-01' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1325, 68, 4, CAST(N'2018-01-01' AS Date), CAST(N'2018-01-02' AS Date), CAST(N'2018-01-03' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1329, 443, 4, CAST(N'2018-01-04' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-06' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1332, 256, 4, CAST(N'2018-01-06' AS Date), CAST(N'2018-01-07' AS Date), CAST(N'2018-01-09' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1333, 203, 4, CAST(N'2018-01-06' AS Date), CAST(N'2018-01-07' AS Date), CAST(N'2018-01-07' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1334, 425, 4, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-09' AS Date), CAST(N'2018-01-10' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1346, 136, 4, CAST(N'2018-01-14' AS Date), CAST(N'2018-01-15' AS Date), CAST(N'2018-01-15' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1347, 247, 4, CAST(N'2018-01-15' AS Date), CAST(N'2018-01-18' AS Date), CAST(N'2018-01-18' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1349, 464, 4, CAST(N'2018-01-15' AS Date), CAST(N'2018-01-17' AS Date), CAST(N'2018-01-16' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1354, 476, 4, CAST(N'2018-01-19' AS Date), CAST(N'2018-01-20' AS Date), CAST(N'2018-01-21' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1357, 440, 4, CAST(N'2018-01-20' AS Date), CAST(N'2018-01-23' AS Date), CAST(N'2018-01-21' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1360, 71, 4, CAST(N'2018-01-22' AS Date), CAST(N'2018-01-25' AS Date), CAST(N'2018-01-24' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1362, 310, 4, CAST(N'2018-01-23' AS Date), CAST(N'2018-01-24' AS Date), CAST(N'2018-01-25' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1364, 122, 4, CAST(N'2018-01-25' AS Date), CAST(N'2018-01-28' AS Date), CAST(N'2018-01-28' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1370, 115, 4, CAST(N'2018-01-28' AS Date), CAST(N'2018-01-29' AS Date), CAST(N'2018-01-29' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1373, 427, 4, CAST(N'2018-01-29' AS Date), CAST(N'2018-01-31' AS Date), CAST(N'2018-01-31' AS Date), 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1375, 312, 4, CAST(N'2018-01-30' AS Date), CAST(N'2018-02-01' AS Date), CAST(N'2018-02-01' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1383, 488, 4, CAST(N'2018-02-07' AS Date), CAST(N'2018-02-08' AS Date), CAST(N'2018-02-08' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1387, 11, 4, CAST(N'2018-02-09' AS Date), CAST(N'2018-02-11' AS Date), CAST(N'2018-02-11' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1389, 491, 4, CAST(N'2018-02-11' AS Date), CAST(N'2018-02-12' AS Date), CAST(N'2018-02-14' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1390, 63, 4, CAST(N'2018-02-12' AS Date), CAST(N'2018-02-13' AS Date), CAST(N'2018-02-13' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1399, 146, 4, CAST(N'2018-02-16' AS Date), CAST(N'2018-02-18' AS Date), CAST(N'2018-02-18' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1401, 15, 4, CAST(N'2018-02-18' AS Date), CAST(N'2018-02-19' AS Date), CAST(N'2018-02-20' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1403, 452, 4, CAST(N'2018-02-21' AS Date), CAST(N'2018-02-22' AS Date), CAST(N'2018-02-22' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1405, 100, 4, CAST(N'2018-02-25' AS Date), CAST(N'2018-02-28' AS Date), CAST(N'2018-02-27' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1407, 18, 3, CAST(N'2018-02-26' AS Date), CAST(N'2018-02-26' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1409, 21, 4, CAST(N'2018-02-26' AS Date), CAST(N'2018-02-28' AS Date), CAST(N'2018-02-28' AS Date), 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1411, 109, 4, CAST(N'2018-03-01' AS Date), CAST(N'2018-03-02' AS Date), CAST(N'2018-03-02' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1414, 293, 4, CAST(N'2018-03-03' AS Date), CAST(N'2018-03-05' AS Date), CAST(N'2018-03-06' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1418, 364, 4, CAST(N'2018-03-04' AS Date), CAST(N'2018-03-05' AS Date), CAST(N'2018-03-07' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1419, 474, 4, CAST(N'2018-03-04' AS Date), CAST(N'2018-03-07' AS Date), CAST(N'2018-03-07' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1425, 126, 4, CAST(N'2018-03-07' AS Date), CAST(N'2018-03-09' AS Date), CAST(N'2018-03-09' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1428, 195, 4, CAST(N'2018-03-08' AS Date), CAST(N'2018-03-10' AS Date), CAST(N'2018-03-11' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1431, 308, 4, CAST(N'2018-03-11' AS Date), CAST(N'2018-03-12' AS Date), CAST(N'2018-03-14' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1432, 483, 4, CAST(N'2018-03-11' AS Date), CAST(N'2018-03-12' AS Date), CAST(N'2018-03-14' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1438, 263, 4, CAST(N'2018-03-15' AS Date), CAST(N'2018-03-17' AS Date), CAST(N'2018-03-16' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1439, 463, 4, CAST(N'2018-03-15' AS Date), CAST(N'2018-03-16' AS Date), CAST(N'2018-03-17' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1442, 478, 4, CAST(N'2018-03-16' AS Date), CAST(N'2018-03-17' AS Date), CAST(N'2018-03-17' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1449, 330, 4, CAST(N'2018-03-18' AS Date), CAST(N'2018-03-19' AS Date), CAST(N'2018-03-20' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1450, 296, 4, CAST(N'2018-03-19' AS Date), CAST(N'2018-03-20' AS Date), CAST(N'2018-03-22' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1452, 287, 4, CAST(N'2018-03-20' AS Date), CAST(N'2018-03-23' AS Date), CAST(N'2018-03-23' AS Date), 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1454, 395, 4, CAST(N'2018-03-20' AS Date), CAST(N'2018-03-21' AS Date), CAST(N'2018-03-22' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1455, 405, 4, CAST(N'2018-03-20' AS Date), CAST(N'2018-03-22' AS Date), CAST(N'2018-03-21' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1461, 139, 4, CAST(N'2018-03-22' AS Date), CAST(N'2018-03-25' AS Date), CAST(N'2018-03-23' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1467, 152, 4, CAST(N'2018-03-26' AS Date), CAST(N'2018-03-27' AS Date), CAST(N'2018-03-29' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1468, 3, 4, CAST(N'2018-03-27' AS Date), CAST(N'2018-03-30' AS Date), CAST(N'2018-03-29' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1472, 114, 4, CAST(N'2018-03-29' AS Date), CAST(N'2018-03-30' AS Date), CAST(N'2018-03-31' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1473, 302, 4, CAST(N'2018-03-30' AS Date), CAST(N'2018-04-01' AS Date), CAST(N'2018-04-02' AS Date), 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1475, 112, 4, CAST(N'2018-03-30' AS Date), CAST(N'2018-04-01' AS Date), CAST(N'2018-03-31' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1476, 35, 4, CAST(N'2018-03-31' AS Date), CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1478, 392, 4, CAST(N'2018-03-31' AS Date), CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1480, 27, 2, CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1481, 62, 1, CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1482, 94, 1, CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1484, 35, 2, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1485, 51, 2, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1486, 84, 2, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1487, 33, 1, CAST(N'2018-04-03' AS Date), CAST(N'2018-04-03' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1488, 181, 2, CAST(N'2018-04-03' AS Date), CAST(N'2018-04-03' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1489, 194, 1, CAST(N'2018-04-03' AS Date), CAST(N'2018-04-03' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1490, 217, 2, CAST(N'2018-04-03' AS Date), CAST(N'2018-04-03' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1491, 82, 1, CAST(N'2018-04-04' AS Date), CAST(N'2018-04-04' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1492, 41, 1, CAST(N'2018-04-04' AS Date), CAST(N'2018-04-04' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1494, 69, 2, CAST(N'2018-04-05' AS Date), CAST(N'2018-04-05' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1495, 86, 2, CAST(N'2018-04-05' AS Date), CAST(N'2018-04-05' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1497, 31, 2, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1498, 81, 1, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1499, 120, 2, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1500, 151, 2, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1501, 52, 1, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1502, 83, 2, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1505, 22, 1, CAST(N'2018-04-08' AS Date), CAST(N'2018-04-08' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1506, 75, 1, CAST(N'2018-04-08' AS Date), CAST(N'2018-04-08' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1507, 85, 2, CAST(N'2018-04-08' AS Date), CAST(N'2018-04-08' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1508, 92, 2, CAST(N'2018-04-08' AS Date), CAST(N'2018-04-08' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1510, 16, 2, CAST(N'2018-04-09' AS Date), CAST(N'2018-04-09' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1511, 25, 1, CAST(N'2018-04-09' AS Date), CAST(N'2018-04-09' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1513, 32, 2, CAST(N'2018-04-10' AS Date), CAST(N'2018-04-10' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1515, 61, 1, CAST(N'2018-04-10' AS Date), CAST(N'2018-04-10' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1516, 47, 2, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-11' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1518, 175, 1, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-11' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1519, 26, 2, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-11' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1520, 66, 2, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-11' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1521, 53, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1522, 78, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1524, 37, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1525, 38, 2, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1526, 59, 2, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1527, 13, 2, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1529, 50, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1530, 110, 1, CAST(N'2018-04-13' AS Date), CAST(N'2018-04-13' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1531, 233, 1, CAST(N'2018-04-13' AS Date), CAST(N'2018-04-13' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1533, 28, 2, CAST(N'2018-04-13' AS Date), CAST(N'2018-04-13' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1534, 18, 2, CAST(N'2018-04-14' AS Date), CAST(N'2018-04-14' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1535, 19, 2, CAST(N'2018-04-14' AS Date), CAST(N'2018-04-14' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1536, 34, 2, CAST(N'2018-04-14' AS Date), CAST(N'2018-04-14' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1538, 79, 2, CAST(N'2018-04-15' AS Date), CAST(N'2018-04-15' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1539, 116, 1, CAST(N'2018-04-15' AS Date), CAST(N'2018-04-15' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1540, 187, 1, CAST(N'2018-04-16' AS Date), CAST(N'2018-04-16' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1541, 10, 2, CAST(N'2018-04-16' AS Date), CAST(N'2018-04-16' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1542, 58, 2, CAST(N'2018-04-16' AS Date), CAST(N'2018-04-16' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1543, 76, 1, CAST(N'2018-04-16' AS Date), CAST(N'2018-04-16' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1544, 5, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1545, 67, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1546, 91, 2, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1547, 169, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1548, 170, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1549, 17, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1550, 39, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1552, 73, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1553, 30, 2, CAST(N'2018-04-18' AS Date), CAST(N'2018-04-18' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1554, 172, 1, CAST(N'2018-04-18' AS Date), CAST(N'2018-04-18' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1555, 1, 1, CAST(N'2018-04-18' AS Date), CAST(N'2018-04-18' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1556, 4, 2, CAST(N'2018-04-18' AS Date), CAST(N'2018-04-18' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1557, 121, 2, CAST(N'2018-04-19' AS Date), CAST(N'2018-04-19' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1558, 63, 1, CAST(N'2018-04-19' AS Date), CAST(N'2018-04-19' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1559, 42, 2, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1560, 57, 1, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1561, 65, 2, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1562, 88, 1, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1563, 77, 2, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1564, 46, 1, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1565, 60, 2, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1566, 72, 1, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1568, 192, 2, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1570, 54, 2, CAST(N'2018-04-22' AS Date), CAST(N'2018-04-22' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1571, 80, 1, CAST(N'2018-04-22' AS Date), CAST(N'2018-04-22' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1572, 14, 1, CAST(N'2018-04-22' AS Date), CAST(N'2018-04-22' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1573, 24, 2, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1574, 124, 1, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1575, 224, 2, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1576, 12, 2, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1577, 48, 1, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1579, 104, 2, CAST(N'2018-04-24' AS Date), CAST(N'2018-04-24' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1580, 191, 2, CAST(N'2018-04-24' AS Date), CAST(N'2018-04-24' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1581, 188, 2, CAST(N'2018-04-25' AS Date), CAST(N'2018-04-25' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1582, 240, 1, CAST(N'2018-04-25' AS Date), CAST(N'2018-04-25' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1583, 44, 1, CAST(N'2018-04-25' AS Date), CAST(N'2018-04-25' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1584, 109, 2, CAST(N'2018-04-26' AS Date), CAST(N'2018-04-26' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1585, 157, 1, CAST(N'2018-04-26' AS Date), CAST(N'2018-04-26' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1586, 176, 1, CAST(N'2018-04-26' AS Date), CAST(N'2018-04-26' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1587, 231, 2, CAST(N'2018-04-26' AS Date), CAST(N'2018-04-26' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1588, 11, 1, CAST(N'2018-04-26' AS Date), CAST(N'2018-04-26' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1589, 40, 2, CAST(N'2018-04-27' AS Date), CAST(N'2018-04-27' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1590, 138, 1, CAST(N'2018-04-27' AS Date), CAST(N'2018-04-27' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1591, 165, 2, CAST(N'2018-04-27' AS Date), CAST(N'2018-04-27' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1592, 6, 2, CAST(N'2018-04-27' AS Date), CAST(N'2018-04-27' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1593, 9, 1, CAST(N'2018-04-27' AS Date), CAST(N'2018-04-27' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1594, 45, 1, CAST(N'2018-04-28' AS Date), CAST(N'2018-04-28' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1595, 71, 2, CAST(N'2018-04-28' AS Date), CAST(N'2018-04-28' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1596, 21, 2, CAST(N'2018-04-28' AS Date), CAST(N'2018-04-28' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1597, 56, 1, CAST(N'2018-04-28' AS Date), CAST(N'2018-04-28' AS Date), NULL, 3, 9)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1598, 239, 2, CAST(N'2018-04-29' AS Date), CAST(N'2018-04-29' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1599, 49, 1, CAST(N'2018-04-29' AS Date), CAST(N'2018-04-29' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1600, 90, 1, CAST(N'2018-04-29' AS Date), CAST(N'2018-04-29' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1601, 43, 1, CAST(N'2018-04-29' AS Date), CAST(N'2018-04-29' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1602, 55, 1, CAST(N'2018-04-30' AS Date), CAST(N'2018-04-30' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1605, 123, 3, CAST(N'2018-07-01' AS Date), CAST(N'2018-07-01' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1607, 33, 3, CAST(N'2018-07-11' AS Date), CAST(N'2018-07-11' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1609, 10, 3, CAST(N'2018-08-23' AS Date), CAST(N'2018-08-23' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1610, 15, 3, CAST(N'2018-08-25' AS Date), CAST(N'2018-08-25' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1611, 6, 3, CAST(N'2018-09-06' AS Date), CAST(N'2018-09-06' AS Date), NULL, 2, 7)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1612, 3, 3, CAST(N'2018-10-21' AS Date), CAST(N'2018-10-21' AS Date), NULL, 1, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1613, 1, 3, CAST(N'2018-11-18' AS Date), CAST(N'2018-11-18' AS Date), NULL, 2, 6)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1614, 135, 3, CAST(N'2018-11-28' AS Date), CAST(N'2018-11-28' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1615, 136, 3, CAST(N'2018-12-28' AS Date), CAST(N'2018-12-28' AS Date), NULL, 3, 8)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1616, 2, 1, CAST(N'2022-03-03' AS Date), CAST(N'2022-03-03' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1617, 1, 1, CAST(N'2022-03-03' AS Date), CAST(N'2022-03-03' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1618, 2, 1, CAST(N'2022-03-05' AS Date), CAST(N'2022-03-05' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1619, 2, 1, CAST(N'2022-03-06' AS Date), CAST(N'2022-03-06' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1620, 2, 1, CAST(N'2022-03-07' AS Date), CAST(N'2022-03-07' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1621, 2, 1, CAST(N'2022-03-07' AS Date), CAST(N'2022-03-07' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1622, 2, 1, CAST(N'2022-03-08' AS Date), CAST(N'2022-03-08' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1623, 2, 1, CAST(N'2022-03-11' AS Date), CAST(N'2022-03-11' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1624, 2, 1, CAST(N'2022-03-18' AS Date), CAST(N'2022-03-18' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1625, 2, 1, CAST(N'2022-03-23' AS Date), CAST(N'2022-03-23' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1626, 2, 1, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-24' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1627, 2, 1, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-24' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1628, 2, 1, CAST(N'2022-05-31' AS Date), CAST(N'2022-05-31' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1629, 2, 1, CAST(N'2022-05-31' AS Date), CAST(N'2022-05-31' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1630, 1, 1, CAST(N'2022-06-05' AS Date), CAST(N'2022-06-05' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1631, 2, 1, CAST(N'2022-06-05' AS Date), CAST(N'2022-06-05' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (1, N'Trek 820 - 2016', 2016, CAST(379.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (2, N'Ritchey Timberwolf Frameset - 2016', 2016, CAST(749.99 AS Decimal(10, 2)), N'Ritchey', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (3, N'Surly Wednesday Frameset - 2016', 2016, CAST(999.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (4, N'Trek Fuel EX 8 29 - 2016', 2016, CAST(2899.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (5, N'Heller Shagamaw Frame - 2016', 2016, CAST(1320.99 AS Decimal(10, 2)), N'Heller', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (6, N'Surly Ice Cream Truck Frameset - 2016', 2016, CAST(469.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (7, N'Trek Slash 8 27.5 - 2016', 2016, CAST(3999.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (8, N'Trek Remedy 29 Carbon Frameset - 2016', 2016, CAST(1799.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (9, N'Trek Conduit+ - 2016', 2016, CAST(2999.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (10, N'Surly Straggler - 2016', 2016, CAST(1549.00 AS Decimal(10, 2)), N'Surly', N'Cyclocross Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (11, N'Surly Straggler 650b - 2016', 2016, CAST(1680.99 AS Decimal(10, 2)), N'Surly', N'Cyclocross Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (12, N'Electra Townie Original 21D - 2016', 2016, CAST(549.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (13, N'Electra Cruiser 1 (24-Inch) - 2016', 2016, CAST(269.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (14, N'Electra Girl''s Hawaii 1 (16-inch) - 2015/2016', 2016, CAST(269.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (15, N'Electra Moto 1 - 2016', 2016, CAST(529.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (16, N'Electra Townie Original 7D EQ - 2016', 2016, CAST(599.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (17, N'Pure Cycles Vine 8-Speed - 2016', 2016, CAST(429.00 AS Decimal(10, 2)), N'Pure Cycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (18, N'Pure Cycles Western 3-Speed - Women''s - 2015/2016', 2016, CAST(449.00 AS Decimal(10, 2)), N'Pure Cycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (19, N'Pure Cycles William 3-Speed - 2016', 2016, CAST(449.00 AS Decimal(10, 2)), N'Pure Cycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (20, N'Electra Townie Original 7D EQ - Women''s - 2016', 2016, CAST(599.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (21, N'Electra Cruiser 1 (24-Inch) - 2016', 2016, CAST(269.99 AS Decimal(10, 2)), N'Electra', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (22, N'Electra Girl''s Hawaii 1 (16-inch) - 2015/2016', 2016, CAST(269.99 AS Decimal(10, 2)), N'Electra', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (23, N'Electra Girl''s Hawaii 1 (20-inch) - 2015/2016', 2016, CAST(299.99 AS Decimal(10, 2)), N'Electra', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (24, N'Electra Townie Original 21D - 2016', 2016, CAST(549.99 AS Decimal(10, 2)), N'Electra', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (25, N'Electra Townie Original 7D - 2015/2016', 2016, CAST(499.99 AS Decimal(10, 2)), N'Electra', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (26, N'Electra Townie Original 7D EQ - 2016', 2016, CAST(599.99 AS Decimal(10, 2)), N'Electra', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (27, N'Surly Big Dummy Frameset - 2017', 2017, CAST(999.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (28, N'Surly Karate Monkey 27.5+ Frameset - 2017', 2017, CAST(2499.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (29, N'Trek X-Caliber 8 - 2017', 2017, CAST(999.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (30, N'Surly Ice Cream Truck Frameset - 2017', 2017, CAST(999.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (31, N'Surly Wednesday - 2017', 2017, CAST(1632.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (32, N'Trek Farley Alloy Frameset - 2017', 2017, CAST(469.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (33, N'Surly Wednesday Frameset - 2017', 2017, CAST(469.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (34, N'Trek Session DH 27.5 Carbon Frameset - 2017', 2017, CAST(469.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (35, N'Sun Bicycles Spider 3i - 2017', 2017, CAST(832.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (36, N'Surly Troll Frameset - 2017', 2017, CAST(832.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (37, N'Haro Flightline One ST - 2017', 2017, CAST(379.99 AS Decimal(10, 2)), N'Haro', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (38, N'Haro Flightline Two 26 Plus - 2017', 2017, CAST(549.99 AS Decimal(10, 2)), N'Haro', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (39, N'Trek Stache 5 - 2017', 2017, CAST(1499.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (40, N'Trek Fuel EX 9.8 29 - 2017', 2017, CAST(4999.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (41, N'Haro Shift R3 - 2017', 2017, CAST(1469.99 AS Decimal(10, 2)), N'Haro', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (42, N'Trek Fuel EX 5 27.5 Plus - 2017', 2017, CAST(2299.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (43, N'Trek Fuel EX 9.8 27.5 Plus - 2017', 2017, CAST(5299.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (44, N'Haro SR 1.1 - 2017', 2017, CAST(539.99 AS Decimal(10, 2)), N'Haro', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (45, N'Haro SR 1.2 - 2017', 2017, CAST(869.99 AS Decimal(10, 2)), N'Haro', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (46, N'Haro SR 1.3 - 2017', 2017, CAST(1409.99 AS Decimal(10, 2)), N'Haro', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (47, N'Trek Remedy 9.8 - 2017', 2017, CAST(5299.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (48, N'Trek Emonda S 4 - 2017', 2017, CAST(1499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (49, N'Trek Domane SL 6 - 2017', 2017, CAST(3499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (50, N'Trek Silque SLR 7 Women''s - 2017', 2017, CAST(5999.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (51, N'Trek Silque SLR 8 Women''s - 2017', 2017, CAST(6499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (52, N'Surly Steamroller - 2017', 2017, CAST(875.99 AS Decimal(10, 2)), N'Surly', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (53, N'Surly Ogre Frameset - 2017', 2017, CAST(749.99 AS Decimal(10, 2)), N'Surly', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (54, N'Trek Domane SL Disc Frameset - 2017', 2017, CAST(3199.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (55, N'Trek Domane S 6 - 2017', 2017, CAST(2699.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (56, N'Trek Domane SLR 6 Disc - 2017', 2017, CAST(5499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (57, N'Trek Emonda S 5 - 2017', 2017, CAST(1999.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (58, N'Trek Madone 9.2 - 2017', 2017, CAST(4999.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (59, N'Trek Domane S 5 Disc - 2017', 2017, CAST(2599.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (60, N'Sun Bicycles ElectroLite - 2017', 2017, CAST(1559.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (61, N'Trek Powerfly 8 FS Plus - 2017', 2017, CAST(4999.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (62, N'Trek Boone 7 - 2017', 2017, CAST(3499.99 AS Decimal(10, 2)), N'Trek', N'Cyclocross Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (63, N'Trek Boone Race Shop Limited - 2017', 2017, CAST(3499.99 AS Decimal(10, 2)), N'Trek', N'Cyclocross Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (64, N'Electra Townie Original 7D - 2017', 2017, CAST(489.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (65, N'Sun Bicycles Lil Bolt Type-R - 2017', 2017, CAST(346.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (66, N'Sun Bicycles Revolutions 24 - 2017', 2017, CAST(250.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (67, N'Sun Bicycles Revolutions 24 - Girl''s - 2017', 2017, CAST(250.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (68, N'Sun Bicycles Cruz 3 - 2017', 2017, CAST(449.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (69, N'Sun Bicycles Cruz 7 - 2017', 2017, CAST(416.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (70, N'Electra Amsterdam Original 3i - 2015/2017', 2017, CAST(659.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (71, N'Sun Bicycles Atlas X-Type - 2017', 2017, CAST(416.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (72, N'Sun Bicycles Biscayne Tandem 7 - 2017', 2017, CAST(619.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (73, N'Sun Bicycles Brickell Tandem 7 - 2017', 2017, CAST(749.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (74, N'Electra Cruiser Lux 1 - 2017', 2017, CAST(439.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (75, N'Electra Cruiser Lux Fat Tire 1 Ladies - 2017', 2017, CAST(599.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (76, N'Electra Girl''s Hawaii 1 16" - 2017', 2017, CAST(299.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (77, N'Electra Glam Punk 3i Ladies'' - 2017', 2017, CAST(799.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (78, N'Sun Bicycles Biscayne Tandem CB - 2017', 2017, CAST(647.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (79, N'Sun Bicycles Boardwalk (24-inch Wheels) - 2017', 2017, CAST(402.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (80, N'Sun Bicycles Brickell Tandem CB - 2017', 2017, CAST(761.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (81, N'Electra Amsterdam Fashion 7i Ladies'' - 2017', 2017, CAST(1099.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (82, N'Electra Amsterdam Original 3i Ladies'' - 2017', 2017, CAST(659.99 AS Decimal(10, 2)), N'Electra', N'Cruisers Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (83, N'Trek Boy''s Kickster - 2015/2017', 2017, CAST(149.99 AS Decimal(10, 2)), N'Trek', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (84, N'Sun Bicycles Lil Kitt''n - 2017', 2017, CAST(109.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (85, N'Haro Downtown 16 - 2017', 2017, CAST(329.99 AS Decimal(10, 2)), N'Haro', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (86, N'Trek Girl''s Kickster - 2017', 2017, CAST(149.99 AS Decimal(10, 2)), N'Trek', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (87, N'Trek Precaliber 12 Boys - 2017', 2017, CAST(189.99 AS Decimal(10, 2)), N'Trek', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (88, N'Trek Precaliber 12 Girls - 2017', 2017, CAST(189.99 AS Decimal(10, 2)), N'Trek', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (89, N'Trek Precaliber 16 Boys - 2017', 2017, CAST(209.99 AS Decimal(10, 2)), N'Trek', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (90, N'Trek Precaliber 16 Girls - 2017', 2017, CAST(209.99 AS Decimal(10, 2)), N'Trek', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (91, N'Trek Precaliber 24 (21-Speed) - Girls - 2017', 2017, CAST(349.99 AS Decimal(10, 2)), N'Trek', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (92, N'Haro Shredder 20 - 2017', 2017, CAST(209.99 AS Decimal(10, 2)), N'Haro', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (93, N'Haro Shredder 20 Girls - 2017', 2017, CAST(209.99 AS Decimal(10, 2)), N'Haro', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (94, N'Haro Shredder Pro 20 - 2017', 2017, CAST(249.99 AS Decimal(10, 2)), N'Haro', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (95, N'Electra Girl''s Hawaii 1 16" - 2017', 2017, CAST(299.99 AS Decimal(10, 2)), N'Electra', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (96, N'Electra Moto 3i (20-inch) - Boy''s - 2017', 2017, CAST(349.99 AS Decimal(10, 2)), N'Electra', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (97, N'Electra Savannah 3i (20-inch) - Girl''s - 2017', 2017, CAST(349.99 AS Decimal(10, 2)), N'Electra', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (98, N'Electra Straight 8 3i (20-inch) - Boy''s - 2017', 2017, CAST(489.99 AS Decimal(10, 2)), N'Electra', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (99, N'Electra Sugar Skulls 1 (20-inch) - Girl''s - 2017', 2017, CAST(299.99 AS Decimal(10, 2)), N'Electra', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (100, N'Electra Townie 3i EQ (20-inch) - Boys'' - 2017', 2017, CAST(489.99 AS Decimal(10, 2)), N'Electra', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (101, N'Electra Townie 7D (20-inch) - Boys'' - 2017', 2017, CAST(339.99 AS Decimal(10, 2)), N'Electra', N'Children Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (102, N'Electra Townie Original 7D - 2017', 2017, CAST(489.99 AS Decimal(10, 2)), N'Electra', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (103, N'Sun Bicycles Streamway 3 - 2017', 2017, CAST(551.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (104, N'Sun Bicycles Streamway - 2017', 2017, CAST(481.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (105, N'Sun Bicycles Streamway 7 - 2017', 2017, CAST(533.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (106, N'Sun Bicycles Cruz 3 - 2017', 2017, CAST(449.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (107, N'Sun Bicycles Cruz 7 - 2017', 2017, CAST(416.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (108, N'Sun Bicycles Cruz 3 - Women''s - 2017', 2017, CAST(449.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (109, N'Sun Bicycles Cruz 7 - Women''s - 2017', 2017, CAST(416.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (110, N'Sun Bicycles Drifter 7 - 2017', 2017, CAST(470.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (111, N'Sun Bicycles Drifter 7 - Women''s - 2017', 2017, CAST(470.99 AS Decimal(10, 2)), N'Sun Bicycles', N'Comfort Bicycles')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (112, N'Trek 820 - 2018', 2018, CAST(379.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (113, N'Trek Marlin 5 - 2018', 2018, CAST(489.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (114, N'Trek Marlin 6 - 2018', 2018, CAST(579.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (115, N'Trek Fuel EX 8 29 - 2018', 2018, CAST(3199.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (116, N'Trek Marlin 7 - 2017/2018', 2018, CAST(749.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (117, N'Trek Ticket S Frame - 2018', 2018, CAST(1469.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (118, N'Trek X-Caliber 8 - 2018', 2018, CAST(999.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (119, N'Trek Kids'' Neko - 2018', 2018, CAST(469.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (120, N'Trek Fuel EX 7 29 - 2018', 2018, CAST(2499.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (121, N'Surly Krampus Frameset - 2018', 2018, CAST(2499.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (122, N'Surly Troll Frameset - 2018', 2018, CAST(2499.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (123, N'Trek Farley Carbon Frameset - 2018', 2018, CAST(999.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (124, N'Surly Krampus - 2018', 2018, CAST(1499.00 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (125, N'Trek Kids'' Dual Sport - 2018', 2018, CAST(469.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (126, N'Surly Big Fat Dummy Frameset - 2018', 2018, CAST(469.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (127, N'Surly Pack Rat Frameset - 2018', 2018, CAST(469.99 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (128, N'Surly ECR 27.5 - 2018', 2018, CAST(1899.00 AS Decimal(10, 2)), N'Surly', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (129, N'Trek X-Caliber 7 - 2018', 2018, CAST(919.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (130, N'Trek Stache Carbon Frameset - 2018', 2018, CAST(919.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (131, N'Heller Bloodhound Trail - 2018', 2018, CAST(2599.00 AS Decimal(10, 2)), N'Heller', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (132, N'Trek Procal AL Frameset - 2018', 2018, CAST(1499.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (133, N'Trek Procaliber Frameset - 2018', 2018, CAST(1499.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (134, N'Trek Remedy 27.5 C Frameset - 2018', 2018, CAST(1499.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (135, N'Trek X-Caliber Frameset - 2018', 2018, CAST(1499.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (136, N'Trek Procaliber 6 - 2018', 2018, CAST(1799.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (137, N'Heller Shagamaw GX1 - 2018', 2018, CAST(2599.00 AS Decimal(10, 2)), N'Heller', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (138, N'Trek Fuel EX 5 Plus - 2018', 2018, CAST(2249.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (139, N'Trek Remedy 7 27.5 - 2018', 2018, CAST(2999.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (140, N'Trek Remedy 9.8 27.5 - 2018', 2018, CAST(4999.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (141, N'Trek Stache 5 - 2018', 2018, CAST(1599.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (142, N'Trek Fuel EX 8 29 XT - 2018', 2018, CAST(3199.99 AS Decimal(10, 2)), N'Trek', N'Mountain Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (143, N'Trek Domane ALR 3 - 2018', 2018, CAST(1099.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (144, N'Trek Domane ALR 4 Disc - 2018', 2018, CAST(1549.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (145, N'Trek Domane ALR 5 Disc - 2018', 2018, CAST(1799.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (146, N'Trek Domane SLR 6 - 2018', 2018, CAST(4999.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (147, N'Trek Domane ALR 5 Gravel - 2018', 2018, CAST(1799.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (148, N'Trek Domane SL 8 Disc - 2018', 2018, CAST(5499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (149, N'Trek Domane SLR 8 Disc - 2018', 2018, CAST(7499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (150, N'Trek Emonda SL 7 - 2018', 2018, CAST(4499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (151, N'Trek Domane ALR 4 Disc Women''s - 2018', 2018, CAST(1549.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (152, N'Trek Domane SL 5 Disc Women''s - 2018', 2018, CAST(2499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (153, N'Trek Domane SL 7 Women''s - 2018', 2018, CAST(4999.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (154, N'Trek Domane SLR 6 Disc Women''s - 2018', 2018, CAST(5499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (155, N'Trek Domane SLR 9 Disc - 2018', 2018, CAST(11999.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (156, N'Trek Domane SL Frameset - 2018', 2018, CAST(6499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (157, N'Trek Domane SL Frameset Women''s - 2018', 2018, CAST(6499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (158, N'Trek CrossRip 1 - 2018', 2018, CAST(959.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (159, N'Trek Emonda ALR 6 - 2018', 2018, CAST(2299.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (160, N'Trek Emonda SLR 6 - 2018', 2018, CAST(4499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (161, N'Surly ECR - 2018', 2018, CAST(1899.00 AS Decimal(10, 2)), N'Surly', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (162, N'Trek Emonda SL 6 Disc - 2018', 2018, CAST(2999.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (163, N'Surly Pack Rat - 2018', 2018, CAST(1349.00 AS Decimal(10, 2)), N'Surly', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (164, N'Surly Straggler 650b - 2018', 2018, CAST(1549.00 AS Decimal(10, 2)), N'Surly', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (165, N'Trek 1120 - 2018', 2018, CAST(2499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (166, N'Trek Domane AL 2 Women''s - 2018', 2018, CAST(749.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (167, N'Surly ECR Frameset - 2018', 2018, CAST(749.99 AS Decimal(10, 2)), N'Surly', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (168, N'Surly Straggler - 2018', 2018, CAST(1549.00 AS Decimal(10, 2)), N'Surly', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (169, N'Trek Emonda SLR 8 - 2018', 2018, CAST(6499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (170, N'Trek CrossRip 2 - 2018', 2018, CAST(1299.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (171, N'Trek Domane SL 6 - 2018', 2018, CAST(3199.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (172, N'Trek Domane ALR Disc Frameset - 2018', 2018, CAST(3199.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (173, N'Trek Domane ALR Frameset - 2018', 2018, CAST(3199.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (174, N'Trek Domane SLR Disc Frameset - 2018', 2018, CAST(3199.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (175, N'Trek Domane SLR Frameset - 2018', 2018, CAST(3199.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (176, N'Trek Madone 9 Frameset - 2018', 2018, CAST(3199.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (177, N'Trek Domane SLR 6 Disc - 2018', 2018, CAST(5499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (178, N'Trek Domane AL 2 - 2018', 2018, CAST(749.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (179, N'Trek Domane AL 3 - 2018', 2018, CAST(919.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (180, N'Trek Domane AL 3 Women''s - 2018', 2018, CAST(919.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (181, N'Trek Domane SL 5 - 2018', 2018, CAST(2199.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (182, N'Trek Domane SL 5 Disc - 2018', 2018, CAST(2499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (183, N'Trek Domane SL 5 Women''s - 2018', 2018, CAST(2199.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (184, N'Trek Domane SL 6 Disc - 2018', 2018, CAST(3499.99 AS Decimal(10, 2)), N'Trek', N'Road Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (185, N'Trek Conduit+ - 2018', 2018, CAST(2799.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (186, N'Trek CrossRip+ - 2018', 2018, CAST(4499.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (187, N'Trek Neko+ - 2018', 2018, CAST(2799.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (188, N'Trek XM700+ Lowstep - 2018', 2018, CAST(3499.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (189, N'Trek Lift+ Lowstep - 2018', 2018, CAST(2799.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (190, N'Trek Dual Sport+ - 2018', 2018, CAST(2799.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (191, N'Electra Loft Go! 8i - 2018', 2018, CAST(2799.99 AS Decimal(10, 2)), N'Electra', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (192, N'Electra Townie Go! 8i - 2017/2018', 2018, CAST(2599.99 AS Decimal(10, 2)), N'Electra', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (193, N'Trek Lift+ - 2018', 2018, CAST(2799.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (194, N'Trek XM700+ - 2018', 2018, CAST(3499.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (195, N'Electra Townie Go! 8i Ladies'' - 2018', 2018, CAST(2599.99 AS Decimal(10, 2)), N'Electra', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (196, N'Trek Verve+ - 2018', 2018, CAST(2299.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (197, N'Trek Verve+ Lowstep - 2018', 2018, CAST(2299.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (198, N'Electra Townie Commute Go! - 2018', 2018, CAST(2999.99 AS Decimal(10, 2)), N'Electra', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (199, N'Electra Townie Commute Go! Ladies'' - 2018', 2018, CAST(2999.99 AS Decimal(10, 2)), N'Electra', N'Electric Bikes')
GO
INSERT [dbo].[products] ([product_id], [product_name], [model_year], [list_price], [brand_name], [category_name]) VALUES (200, N'Trek Powerfly 5 - 2018', 2018, CAST(3499.99 AS Decimal(10, 2)), N'Trek', N'Electric Bikes')
GO
INSERT [dbo].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id], [username], [password]) VALUES (1, N'Fabiola', N'Jackson', N'fabiola.jackson@bikes.shop', N'(831) 555-5554', 1, 1, NULL, N'admin', N'admin')
GO
INSERT [dbo].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id], [username], [password]) VALUES (2, N'Mireya', N'Copeland', N'mireya.copeland@bikes.shop', N'(831) 555-5555', 1, 1, 1, NULL, NULL)
GO
INSERT [dbo].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id], [username], [password]) VALUES (3, N'Genna', N'Serrano', N'genna.serrano@bikes.shop', N'(831) 555-5556', 1, 1, 2, NULL, NULL)
GO
INSERT [dbo].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id], [username], [password]) VALUES (4, N'Virgie', N'Wiggins', N'virgie.wiggins@bikes.shop', N'(831) 555-5557', 1, 1, 2, NULL, NULL)
GO
INSERT [dbo].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id], [username], [password]) VALUES (5, N'Jannette', N'David', N'jannette.david@bikes.shop', N'(516) 379-4444', 1, 2, 1, NULL, NULL)
GO
INSERT [dbo].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id], [username], [password]) VALUES (6, N'Marcelene', N'Boyer', N'marcelene.boyer@bikes.shop', N'(516) 379-4445', 1, 2, 5, NULL, NULL)
GO
INSERT [dbo].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id], [username], [password]) VALUES (7, N'Venita', N'Daniel', N'venita.daniel@bikes.shop', N'(516) 379-4446', 1, 2, 5, NULL, NULL)
GO
INSERT [dbo].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id], [username], [password]) VALUES (8, N'Kali', N'Vargas', N'kali.vargas@bikes.shop', N'(972) 530-5555', 1, 3, 1, NULL, NULL)
GO
INSERT [dbo].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id], [username], [password]) VALUES (9, N'Layla', N'Terrell', N'layla.terrell@bikes.shop', N'(972) 530-5556', 1, 3, 7, NULL, NULL)
GO
INSERT [dbo].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id], [username], [password]) VALUES (10, N'Bernardine', N'Houston', N'bernardine.houston@bikes.shop', N'(972) 530-5557', 1, 3, 7, NULL, NULL)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 1, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 2, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 3, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 4, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 5, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 6, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 7, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 8, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 9, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 10, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 11, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 12, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 13, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 14, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 15, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 16, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 17, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 18, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 19, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 20, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 21, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 22, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 23, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 24, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 25, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 26, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 27, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 28, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 29, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 30, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 31, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 32, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 33, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 34, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 35, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 36, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 37, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 38, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 39, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 40, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 41, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 42, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 43, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 44, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 45, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 46, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 47, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 48, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 49, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 50, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 51, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 52, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 53, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 54, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 55, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 56, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 57, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 58, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 59, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 60, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 61, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 62, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 63, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 64, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 65, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 66, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 67, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 68, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 69, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 70, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 71, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 72, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 73, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 74, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 75, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 76, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 77, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 78, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 79, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 80, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 81, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 82, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 83, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 84, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 85, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 86, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 87, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 88, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 89, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 90, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 91, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 92, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 93, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 94, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 95, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 96, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 97, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 98, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 99, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 100, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 101, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 102, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 103, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 104, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 105, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 106, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 107, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 108, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 109, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 110, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 111, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 112, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 113, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 114, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 115, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 116, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 117, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 118, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 119, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 120, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 121, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 122, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 123, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 124, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 125, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 126, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 127, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 128, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 129, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 130, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 131, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 132, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 133, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 134, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 135, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 136, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 137, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 138, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 139, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 140, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 141, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 142, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 143, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 144, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 145, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 146, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 147, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 148, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 149, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 150, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 151, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 152, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 153, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 154, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 155, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 156, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 157, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 158, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 159, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 160, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 161, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 162, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 163, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 164, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 165, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 166, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 167, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 168, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 169, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 170, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 171, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 172, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 173, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 174, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 175, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 176, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 177, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 178, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 179, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 180, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 181, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 182, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 183, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 184, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 185, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 186, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 187, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 188, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 189, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 190, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 191, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 192, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 193, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 194, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 195, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 196, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 197, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 198, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 199, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 200, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 1, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 2, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 3, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 4, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 5, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 6, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 7, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 8, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 9, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 10, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 11, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 12, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 13, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 14, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 15, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 16, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 17, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 18, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 19, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 20, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 21, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 22, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 23, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 24, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 25, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 26, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 27, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 28, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 29, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 30, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 31, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 32, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 33, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 34, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 35, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 36, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 37, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 38, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 39, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 40, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 41, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 42, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 43, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 44, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 45, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 46, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 47, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 48, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 49, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 50, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 51, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 52, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 53, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 54, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 55, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 56, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 57, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 58, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 59, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 60, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 61, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 62, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 63, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 64, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 65, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 66, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 67, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 68, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 69, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 70, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 71, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 72, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 73, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 74, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 75, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 76, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 77, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 78, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 79, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 80, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 81, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 82, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 83, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 84, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 85, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 86, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 87, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 88, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 89, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 90, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 91, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 92, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 93, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 94, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 95, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 96, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 97, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 98, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 99, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 100, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 101, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 102, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 103, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 104, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 105, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 106, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 107, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 108, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 109, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 110, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 111, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 112, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 113, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 114, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 115, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 116, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 117, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 118, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 119, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 120, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 121, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 122, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 123, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 124, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 125, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 126, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 127, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 128, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 129, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 130, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 131, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 132, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 133, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 134, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 135, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 136, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 137, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 138, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 139, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 140, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 141, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 142, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 143, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 144, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 145, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 146, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 147, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 148, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 149, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 150, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 151, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 152, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 153, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 154, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 155, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 156, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 157, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 158, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 159, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 160, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 161, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 162, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 163, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 164, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 165, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 166, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 167, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 168, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 169, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 170, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 171, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 172, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 173, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 174, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 175, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 176, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 177, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 178, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 179, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 180, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 181, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 182, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 183, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 184, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 185, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 186, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 187, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 188, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 189, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 190, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 191, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 192, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 193, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 194, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 195, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 196, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 197, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 198, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 199, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 200, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 1, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 2, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 3, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 4, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 5, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 6, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 7, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 8, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 9, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 10, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 11, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 12, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 13, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 14, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 15, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 16, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 17, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 18, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 19, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 20, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 21, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 22, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 23, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 24, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 25, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 26, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 27, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 28, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 29, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 30, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 31, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 32, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 33, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 34, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 35, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 36, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 37, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 38, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 39, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 40, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 41, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 42, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 43, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 44, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 45, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 46, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 47, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 48, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 49, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 50, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 51, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 52, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 53, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 54, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 55, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 56, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 57, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 58, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 59, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 60, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 61, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 62, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 63, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 64, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 65, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 66, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 67, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 68, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 69, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 70, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 71, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 72, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 73, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 74, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 75, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 76, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 77, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 78, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 79, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 80, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 81, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 82, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 83, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 84, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 85, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 86, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 87, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 88, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 89, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 90, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 91, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 92, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 93, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 94, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 95, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 96, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 97, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 98, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 99, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 100, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 101, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 102, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 103, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 104, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 105, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 106, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 107, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 108, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 109, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 110, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 111, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 112, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 113, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 114, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 115, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 116, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 117, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 118, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 119, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 120, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 121, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 122, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 123, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 124, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 125, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 126, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 127, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 128, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 129, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 130, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 131, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 132, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 133, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 134, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 135, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 136, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 137, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 138, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 139, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 140, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 141, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 142, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 143, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 144, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 145, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 146, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 147, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 148, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 149, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 150, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 151, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 152, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 153, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 154, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 155, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 156, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 157, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 158, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 159, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 160, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 161, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 162, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 163, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 164, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 165, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 166, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 167, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 168, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 169, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 170, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 171, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 172, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 173, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 174, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 175, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 176, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 177, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 178, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 179, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 180, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 181, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 182, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 183, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 184, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 185, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 186, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 187, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 188, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 189, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 190, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 191, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 192, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 193, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 194, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 195, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 196, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 197, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 198, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 199, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 200, 10)
GO
INSERT [dbo].[stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1, N'Santa Cruz Bikes', N'(831) 476-4321', N'santacruz@bikes.shop', N'3700 Portola Drive', N'Santa Cruz', N'CA', N'95060')
GO
INSERT [dbo].[stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (2, N'Baldwin Bikes', N'(516) 379-8888', N'baldwin@bikes.shop', N'4200 Chestnut Lane', N'Baldwin', N'NY', N'11432')
GO
INSERT [dbo].[stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (3, N'Rowlett Bikes', N'(972) 530-5555', N'rowlett@bikes.shop', N'8000 Fairway Avenue', N'Rowlett', N'TX', N'75088')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__staffs__AB6E616479DF6416]    Script Date: 6/20/2022 10:28:55 AM ******/
ALTER TABLE [dbo].[staffs] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order_items] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([staff_id])
REFERENCES [dbo].[staffs] ([staff_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [dbo].[stores] ([store_id])
GO
ALTER TABLE [dbo].[staffs]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [dbo].[staffs] ([staff_id])
GO
ALTER TABLE [dbo].[staffs]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [dbo].[stores] ([store_id])
GO
ALTER TABLE [dbo].[stocks]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[stocks]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [dbo].[stores] ([store_id])
GO
USE [master]
GO
ALTER DATABASE [SE1605] SET  READ_WRITE 
GO