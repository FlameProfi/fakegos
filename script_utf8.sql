USE [user14]
GO
/****** Объект:  Table [dbo].[AdressPVZ]    Дата создания скрипта: 23.05.2026 11:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdressPVZ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[indexPVZ] [int] NOT NULL,
	[city] [nvarchar](150) NOT NULL,
	[street] [nvarchar](150) NOT NULL,
	[house] [int] NULL,
 CONSTRAINT [PK_AdressPVZ] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Объект:  Table [dbo].[Categories]    Дата создания скрипта: 23.05.2026 11:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Объект:  Table [dbo].[Mackers]    Дата создания скрипта: 23.05.2026 11:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mackers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Mackers] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Объект:  Table [dbo].[Orders]    Дата создания скрипта: 23.05.2026 11:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tovarId] [int] NOT NULL,
	[count] [int] NOT NULL,
	[dateOrder] [date] NOT NULL,
	[dateDelivery] [date] NOT NULL,
	[PVZId] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[issueCode] [int] NOT NULL,
	[statusId] [int] NOT NULL,
	[numderOrder] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Объект:  Table [dbo].[Products]    Дата создания скрипта: 23.05.2026 11:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[articul] [nvarchar](150) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[unitId] [int] NOT NULL,
	[price] [float] NOT NULL,
	[supllierId] [int] NOT NULL,
	[mackerId] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
	[discount] [float] NOT NULL,
	[countInStock] [int] NOT NULL,
	[discription] [nvarchar](max) NOT NULL,
	[image] [nvarchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Объект:  Table [dbo].[RolesUser]    Дата создания скрипта: 23.05.2026 11:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_RolesUser] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Объект:  Table [dbo].[Statuses]    Дата создания скрипта: 23.05.2026 11:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Объект:  Table [dbo].[Suplliers]    Дата создания скрипта: 23.05.2026 11:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suplliers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Suplliers] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Объект:  Table [dbo].[Units]    Дата создания скрипта: 23.05.2026 11:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Объект:  Table [dbo].[Users]    Дата создания скрипта: 23.05.2026 11:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleId] [int] NOT NULL,
	[lastname] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[patronimic] [nvarchar](100) NOT NULL,
	[login] [nvarchar](200) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdressPVZ] ON

INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (1, 420151, N' г. Лесной', N' ул. Вишневая', 32)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (2, 125061, N' г. Лесной', N' ул. Подгорная', 8)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (3, 630370, N' г. Лесной', N' ул. Шоссейная', 24)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (4, 400562, N' г. Лесной', N' ул. Зеленая', 32)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (5, 614510, N' г. Лесной', N' ул. Маяковского', 47)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (6, 410542, N' г. Лесной', N' ул. Светлая', 46)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (7, 620839, N' г. Лесной', N' ул. Цветочная', 8)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (8, 443890, N' г. Лесной', N' ул. Коммунистическая', 1)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (9, 603379, N' г. Лесной', N' ул. Спортивная', 46)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (10, 603721, N' г. Лесной', N' ул. Гоголя', 41)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (11, 410172, N' г. Лесной', N' ул. Северная', 13)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (12, 614611, N' г. Лесной', N' ул. Молодежная', 50)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (13, 454311, N' г.Лесной', N' ул. Новая', 19)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (14, 660007, N' г.Лесной', N' ул. Октябрьская', 19)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (15, 603036, N' г. Лесной', N' ул. Садовая', 4)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (16, 394060, N' г.Лесной', N' ул. Фрунзе', 43)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (17, 410661, N' г. Лесной', N' ул. Школьная', 50)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (18, 625590, N' г. Лесной', N' ул. Коммунистическая', 20)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (19, 625683, N' г. Лесной', N' ул. 8 Марта', NULL)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (20, 450983, N' г.Лесной', N' ул. Комсомольская', 26)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (21, 394782, N' г. Лесной', N' ул. Чехова', 3)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (22, 603002, N' г. Лесной', N' ул. Дзержинского', 28)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (23, 450558, N' г. Лесной', N' ул. Набережная', 30)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (24, 344288, N' г. Лесной', N' ул. Чехова', 1)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (25, 614164, N' г.Лесной', N'  ул. Степная', 30)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (26, 394242, N' г. Лесной', N' ул. Коммунистическая', 43)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (27, 660540, N' г. Лесной', N' ул. Солнечная', 25)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (28, 125837, N' г. Лесной', N' ул. Шоссейная', 40)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (29, 125703, N' г. Лесной', N' ул. Партизанская', 49)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (30, 625283, N' г. Лесной', N' ул. Победы', 46)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (31, 614753, N' г. Лесной', N' ул. Полевая', 35)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (32, 426030, N' г. Лесной', N' ул. Маяковского', 44)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (33, 450375, N' г. Лесной ', N'ул. Клубная', 44)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (34, 625560, N' г. Лесной', N' ул. Некрасова', 12)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (35, 630201, N' г. Лесной', N' ул. Комсомольская', 17)
INSERT [dbo].[AdressPVZ] ([id], [indexPVZ], [city], [street], [house]) VALUES (36, 190949, N' г. Лесной', N' ул. Мичурина', 26)
SET IDENTITY_INSERT [dbo].[AdressPVZ] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON

INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Учебник для вузов')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Учебное пособие')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Хрестоматия')
INSERT [dbo].[Categories] ([id], [name]) VALUES (4, N'Художественная литература')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Mackers] ON

INSERT [dbo].[Mackers] ([id], [name]) VALUES (1, N'
Лениздат')
INSERT [dbo].[Mackers] ([id], [name]) VALUES (2, N'Амрита-Русь')
INSERT [dbo].[Mackers] ([id], [name]) VALUES (3, N'Аспект Пресс')
INSERT [dbo].[Mackers] ([id], [name]) VALUES (4, N'ВКН')
INSERT [dbo].[Mackers] ([id], [name]) VALUES (5, N'Время')
INSERT [dbo].[Mackers] ([id], [name]) VALUES (6, N'Златоуст')
INSERT [dbo].[Mackers] ([id], [name]) VALUES (7, N'Неолит')
INSERT [dbo].[Mackers] ([id], [name]) VALUES (8, N'Прогресс книга')
INSERT [dbo].[Mackers] ([id], [name]) VALUES (9, N'Т8 Издательские технологии')
INSERT [dbo].[Mackers] ([id], [name]) VALUES (10, N'Яуза')
SET IDENTITY_INSERT [dbo].[Mackers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON

INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (1, 1, 2, CAST(N'2024-02-27' AS Date), CAST(N'2024-04-20' AS Date), 1, 4, 901, 1, 1)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (2, 11, 1, CAST(N'2023-09-28' AS Date), CAST(N'2024-04-21' AS Date), 11, 1, 902, 1, 2)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (3, 4, 10, CAST(N'2024-03-21' AS Date), CAST(N'2024-04-22' AS Date), 2, 2, 903, 1, 3)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (4, 6, 5, CAST(N'2024-02-20' AS Date), CAST(N'2024-04-23' AS Date), 11, 3, 904, 1, 4)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (5, 7, 20, CAST(N'2024-03-17' AS Date), CAST(N'2024-04-24' AS Date), 2, 4, 905, 1, 5)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (6, 1, 2, CAST(N'2024-03-01' AS Date), CAST(N'2024-04-25' AS Date), 15, 1, 906, 1, 6)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (8, 6, 1, CAST(N'2024-03-31' AS Date), CAST(N'2024-04-27' AS Date), 19, 3, 908, 2, 8)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (9, 16, 5, CAST(N'2024-04-02' AS Date), CAST(N'2024-04-28' AS Date), 5, 4, 909, 2, 9)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (10, 5, 5, CAST(N'2024-04-03' AS Date), CAST(N'2024-04-29' AS Date), 19, 4, 910, 2, 10)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (11, 11, 2, CAST(N'2024-02-27' AS Date), CAST(N'2024-04-20' AS Date), 1, 4, 901, 1, 1)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (12, 1, 1, CAST(N'2023-09-28' AS Date), CAST(N'2024-04-21' AS Date), 11, 1, 902, 1, 2)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (13, 20, 10, CAST(N'2024-03-21' AS Date), CAST(N'2024-04-22' AS Date), 2, 2, 903, 1, 3)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (14, 4, 4, CAST(N'2024-02-20' AS Date), CAST(N'2024-04-23' AS Date), 11, 3, 904, 1, 4)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (15, 14, 20, CAST(N'2024-03-17' AS Date), CAST(N'2024-04-24' AS Date), 2, 4, 905, 1, 5)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (16, 11, 2, CAST(N'2024-03-01' AS Date), CAST(N'2024-04-25' AS Date), 15, 1, 906, 1, 6)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (18, 7, 1, CAST(N'2024-03-31' AS Date), CAST(N'2024-04-27' AS Date), 19, 3, 908, 2, 8)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (19, 5, 1, CAST(N'2024-04-02' AS Date), CAST(N'2024-04-28' AS Date), 5, 4, 909, 2, 9)
INSERT [dbo].[Orders] ([id], [tovarId], [count], [dateOrder], [dateDelivery], [PVZId], [user_id], [issueCode], [statusId], [numderOrder]) VALUES (20, 16, 5, CAST(N'2024-04-03' AS Date), CAST(N'2024-04-29' AS Date), 19, 4, 910, 2, 10)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON

INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (1, N'А112Т4', N'Прокляты и убиты', 1, 585, 1, 10, 4, 25, 6, N'Роман-эпопею "Прокляты и убиты" Виктора Астафьева по праву считают одним из самых сильных и пронзительных произведений отечественной военной прозы.', N'1.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (2, N'B653G6', N'Русский язык: Первые шаги. Часть 3. Учебное пособие', 1, 2699, 10, 6, 2, 8, 9, N'Пособие является завершающей частью учебного комплекса. Третья часть содержит 10 уроков (21-30, последний-повторительный). Усвоение лексико-грамматического материала рассчитано примерно на 200-240 часов аудиторных занятий. ', N'17.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (3, N'C346F5', N'Квантовые миры и возникновение пространства-времени', 1, 1349, 12, 8, 1, 5, 4, N'Шон Кэрролл — физик-теоретик и один из самых известных в мире популяризаторов науки — заставляет нас по-новому взглянуть на физику. Столкновение с главной загадкой квантовой механики полностью поменяет наши представления о пространстве и времени.', N'8.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (4, N'D325D4', N'Девайс', 1, 1599, 10, 9, 4, 5, 12, N'Молодой фрилансер Захар Скаро устраивается на очередную подработку. Задача, казалось бы, тривиальная: тестирование нового устройства. Вот только вопрос в том, тестированием какой реальности занимается этот новый Девайс?', N'3.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (5, N'F256G6', N'Вселенная. Происхождение жизни, смысл нашего существования и огромный космос', 1, 1799, 12, 8, 1, 6, 2, N'Знаменитый физик Шон Кэрролл в свойственной ему увлекательной манере объясняет принципы, которые лежат в основах научных революций от Дарвина до Эйнштейна, и показывает как невероятные научные открытия последнего столетия изменили наш мир.', N'')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (6, N'F325D4', N'Чук и Гек', 1, 209, 5, 9, 4, 18, 3, N'В книгу вошли повести и рассказы Аркадия Петровича Гайдара: "Чук и Гек", "Горячий камень" и "Сказка о военной тайне, о Мальчише-Кибальчише и его твердом слове"', N'5.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (7, N'G432G6', N'Информационная безопасность. Национальные стандарты Российской Федерации. 3-е издание. Учебное пособие', 1, 3899, 12, 8, 1, 22, 3, N'В учебном пособии рассмотрено более 300 действующих открытых документов национальной системы стандартизации Российской Федерации, включая международные и межгосударственные стандарты в области информационной безопасности по состоянию на начало 2023 года.', N'6.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (8, N'G543F5', N'Религиозные верования с древнейших времен до наших дней', 1, 879, 9, 2, 3, 4, 6, N'Настоящее издание представляет собой сборник переводов лекций по истории дохристианских и нехристианских религий, прочитанных в Лондоне в период с 1888 по 1891 гг. авторитетными исследователями данного раздела религиоведения. ', N'16.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (9, N'G632H6', N'Формирование литературной репутации Н.Г.Чернышевского в ХIX-XXI веках', 1, 1349, 9, 7, 3, 2, 8, N'Монография Д. А. Щербакова - новаторская. Поэтапно рассмотрены не только многочисленные суждения известных отечественных и зарубежных критиков, литературоведов, философов и политиков, различным образом характеризовавших Н. Г. Чернышевского в связи и вне связи со знаменитым романом "Что делать? ', N'14.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (10, N'G643F4', N'Иосиф Бродский. Избранные эссе (комплект из 6-ти книг)', 1, 4925, 10, 1, 3, 2, 24, N'Шесть сборников избранных эссе Иосифа Бродского (1940-1996), великого поэта, драматурга, мыслителя, лауреата Нобелевской премии по литературе (1987): «Будущее или далекое прошлое», «Верь своей боли», «Как читать книгу», «О русской литературе», «О тирании», «Путеводитель по переименованному городу». Все тексты представлены на английском языке и в переводе на русский и открывают автора не только как поэта, но как историка, критика, и глубокого и ироничного мыслителя.', N'11.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (11, N'G843H5', N'Тайны и загадки отца БраунаТайны и загадки отца Брауна', 1, 193, 9, 10, 4, 30, 9, N'Гилберт Кит Честертон — признанный классик английской литературы, один из самых ярких писателей первой половины XX века. Классикой стали его романы и многочисленные эссе, однако любовь массового читателя принесли ему рассказы об отце Брауне, тихом, застенчивом священнике, мастерски раскрывающем наиболее запутанные загадки и преступления. ', N'2.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (12, N'H436H7', N'Английский язык в спорте: Учебное пособие', 1, 1999, 10, 3, 2, 2, 0, N'Учебное пособие подготовлено для слушателей, изу чающих английский язык как язык специальности', N'19.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (13, N'H475R5', N'Лексика и грамматика современного китайского языка (к тому II учебника «Новый практический курс китайского языка» под редакцией Лю Сюня): учебное пособие', 1, 608, 11, 4, 2, 25, 12, N'Пособие выступает дополнением ко второму тому учебника «Новый практический курс китайского языка» (под редакцией Лю Сюня). ', N'20.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (14, N'H542F5', N'Linux. Командная строка. Лучшие практики', 1, 1799, 9, 8, 1, 4, 5, N'Перейдите на новый уровень работы в Linux! Если вы системный администратор, разработчик программного обеспечения, SRE-инженер или пользователь Linux, книга поможет вам работать быстрее, элегантнее и эффективнее. ', N'7.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (15, N'J326V5', N'Тысячелетие императорской керамикиv', 1, 2599, 18, 1, 3, 5, 4, N'Фарфор стал величайшим символом китайской культуры. Это одно из выдающихся изобретений, внесших неоценимый вклад в мировую цивилизацию. ', N'12.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (16, N'J532V5', N'Пушкин. Бродский. Империя и судьба. В 2-х томах (комплект из 2-х книг)', 1, 529, 14, 5, 3, 8, 6, N'Первая книга двухтомника «Пушкин. Бродский. Империя и судьба» пронизана пушкинской темой. Пушкин — «певец империи и свободы» — присутствует даже там, где он впрямую не упоминается, ибо его судьба, как и судьба других героев книги, органично связана с трагедией великой империи.', N'10.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (17, N'J632F6', N'Вечные спутники: Портреты из всемирной литературы', 1, 1599, 9, 1, 3, 0, 6, N'Книга "Вечные спутники" - это цикл критических очерков о культуре и великих литераторах, сопровождавших жизнь и творчество русского писателя, поэта, литературного критика и общественного деятеля Дмитрия Мережковского (1865–1941). ', N'13.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (18, N'J735J7', N'Синтетический образ индивидуального психического мира', 1, 1099, 10, 6, 3, 9, 4, N'Психика подобна определенным объектам, это фиксируют сами люди в языке и искусстве. В данном исследовании рассматриваются в этом плане образы сосуда, воронки, дерева и крепости.', N'18.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (19, N'M642E5', N'Теория искусства. Краткий путеводитель', 1, 879, 10, 7, 3, 3, 2, N'', N'15.jpg')
INSERT [dbo].[Products] ([id], [articul], [name], [unitId], [price], [supllierId], [mackerId], [categoryId], [discount], [countInStock], [discription], [image]) VALUES (20, N'S432T5', N'Необыкновенное обыкновенное чудо. Школьные истории', 1, 549, 10, 9, 4, 15, 15, N'', N'4.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[RolesUser] ON

INSERT [dbo].[RolesUser] ([id], [name]) VALUES (1, N'Авторизированный клиент')
INSERT [dbo].[RolesUser] ([id], [name]) VALUES (2, N'Администратор')
INSERT [dbo].[RolesUser] ([id], [name]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[RolesUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON

INSERT [dbo].[Statuses] ([id], [name]) VALUES (1, N'Завершен')
INSERT [dbo].[Statuses] ([id], [name]) VALUES (2, N'Новый ')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Suplliers] ON

INSERT [dbo].[Suplliers] ([id], [name]) VALUES (1, N'Виктор Астафьев')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (2, N'Любовь Беликова, Инна Ерофеева, Татьяна Шутова')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (3, N'Шон Кэрролл')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (4, N'Кирилл Каланджи')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (5, N'Аркадий Гайдар')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (6, N'Юрий Родичев')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (7, N'Дмитрий Щербаков')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (8, N'Иосиф Бродский')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (9, N'Гилберт Кит Честертон')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (10, N'Екатерина Габарта, Ирина Игнатьева')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (11, N'Татьяна Лопаткина, Софья Маннапова')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (12, N'Дэниел Джей Барретт')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (13, N'Янь Чуннянь Янь Чуннянь')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (14, N'Яков Гордин')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (15, N'Дмитрий Мережковский')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (16, N'Сергей Моргачев')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (17, N'Роджер Осборн, Дэн Стерджис')
INSERT [dbo].[Suplliers] ([id], [name]) VALUES (18, N'Людмила Улицкая')
SET IDENTITY_INSERT [dbo].[Suplliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON

INSERT [dbo].[Units] ([id], [name]) VALUES (1, N'шт.')
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON

INSERT [dbo].[Users] ([id], [roleId], [lastname], [name], [patronimic], [login], [password]) VALUES (1, 1, N'Никифорова', N'Весения', N'Николаевна', N'yzls62@outlook.com', N'JlFRCZ')
INSERT [dbo].[Users] ([id], [roleId], [lastname], [name], [patronimic], [login], [password]) VALUES (2, 1, N'Сазонов', N'Руслан', N'Германович', N'1diph5e@tutanota.com', N'8ntwUp')
INSERT [dbo].[Users] ([id], [roleId], [lastname], [name], [patronimic], [login], [password]) VALUES (3, 1, N'Одинцов', N'Серафим', N'Артёмович', N'tjde7c@yahoo.com', N'YOyhfR')
INSERT [dbo].[Users] ([id], [roleId], [lastname], [name], [patronimic], [login], [password]) VALUES (4, 1, N'Степанов', N'Михаил', N'Артёмович', N'wpmrc3do@tutanota.com', N'RSbvHv')
INSERT [dbo].[Users] ([id], [roleId], [lastname], [name], [patronimic], [login], [password]) VALUES (5, 2, N'Никифорова', N'Анна', N'Семеновна', N'94d5ous@gmail.com', N'uzWC67')
INSERT [dbo].[Users] ([id], [roleId], [lastname], [name], [patronimic], [login], [password]) VALUES (6, 2, N'Стелина', N'Евгения', N'Петровна', N'uth4iz@mail.com', N'2L6KZG')
INSERT [dbo].[Users] ([id], [roleId], [lastname], [name], [patronimic], [login], [password]) VALUES (7, 2, N'Михайлюк', N'Анна', N'Вячеславовна', N'5d4zbu@tutanota.com', N'rwVDh9')
INSERT [dbo].[Users] ([id], [roleId], [lastname], [name], [patronimic], [login], [password]) VALUES (8, 3, N'Ситдикова', N'Елена', N'Анатольевна', N'ptec8ym@yahoo.com', N'LdNyos')
INSERT [dbo].[Users] ([id], [roleId], [lastname], [name], [patronimic], [login], [password]) VALUES (9, 3, N'Ворсин', N'Петр', N'Евгеньевич', N'1qz4kw@mail.com', N'gynQMT')
INSERT [dbo].[Users] ([id], [roleId], [lastname], [name], [patronimic], [login], [password]) VALUES (10, 3, N'Старикова', N'Елена', N'Павловна', N'4np6se@mail.com', N'AtnDjr')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AdressPVZ] FOREIGN KEY([PVZId])
REFERENCES [dbo].[AdressPVZ] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AdressPVZ]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([tovarId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Statuses] FOREIGN KEY([statusId])
REFERENCES [dbo].[Statuses] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Statuses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Mackers] FOREIGN KEY([mackerId])
REFERENCES [dbo].[Mackers] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Mackers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suplliers] FOREIGN KEY([supllierId])
REFERENCES [dbo].[Suplliers] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suplliers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Units] FOREIGN KEY([unitId])
REFERENCES [dbo].[Units] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Units]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_RolesUser] FOREIGN KEY([roleId])
REFERENCES [dbo].[RolesUser] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_RolesUser]
GO
