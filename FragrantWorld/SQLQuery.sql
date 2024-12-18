GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [smallint] NOT NULL,
	[OrderUserId] [int] NULL,
	[OrderPickupCode] [smallint] NOT NULL,
 CONSTRAINT [PK__ExamOrde__C3905BAFB5D46591] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 18.12.2024 8:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductAmount] [tinyint] NOT NULL,
 CONSTRAINT [PK__ExamOrde__817A26628805FBC8] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 18.12.2024 8:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointId] [smallint] IDENTITY(1,1) NOT NULL,
	[PickupPointAddress] [nvarchar](200) NOT NULL,
	[PickupPointMailIndex] [int] NOT NULL,
 CONSTRAINT [PK_ExamPickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.12.2024 8:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 2) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__ExamProd__2EA7DCD574DE71DE] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 18.12.2024 8:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 18.12.2024 8:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK__ExamUser__1788CCACFA3D9E98] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderUserId], [OrderPickupCode]) VALUES (1, N'Новый ', CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 24, 1, 201)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderUserId], [OrderPickupCode]) VALUES (2, N'Новый ', CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 25, 5, 202)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderUserId], [OrderPickupCode]) VALUES (3, N'Новый ', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 26, 2, 203)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderUserId], [OrderPickupCode]) VALUES (4, N'Новый ', CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 27, 6, 204)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderUserId], [OrderPickupCode]) VALUES (5, N'Новый ', CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 28, 3, 205)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderUserId], [OrderPickupCode]) VALUES (6, N'Новый', CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), 28, 7, 206)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderUserId], [OrderPickupCode]) VALUES (7, N'Новый ', CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 30, 8, 207)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderUserId], [OrderPickupCode]) VALUES (8, N'Новый ', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 31, 9, 208)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderUserId], [OrderPickupCode]) VALUES (9, N'Новый ', CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 32, 4, 209)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderUserId], [OrderPickupCode]) VALUES (10, N'Завершен', CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 33, 10, 210)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (1, N'E542S1', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (2, N'E573G6', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (3, N'F344S4', 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (4, N'H732R5', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (5, N'H732R5', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (6, N'J432E4', 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (7, N'K535G6', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (8, N'K535G6', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (9, N'S753T5', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (10, N'V472S3', 4)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductAmount]) VALUES (10, N'А112Т4', 5)
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (1, N'г. Ангарск, ул. Чехова, 1', 344288)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (2, N'г.Ангарск,  ул. Степная, 30', 614164)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (3, N'г. Ангарск, ул. Коммунистическая, 43', 394242)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (4, N'г. Ангарск, ул. Солнечная, 25', 660540)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (5, N'г. Ангарск, ул. Шоссейная, 40', 125837)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (6, N'г. Ангарск, ул. Партизанская, 49', 125703)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (7, N' г. Ангарск, ул. Победы, 46', 625283)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (8, N'г. Ангарск, ул. Молодежная, 50', 614611)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (9, N'г.Ангарск, ул. Новая, 19', 454311)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (10, N'г.Ангарск, ул. Октябрьская, 19', 660007)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (11, N'г. Ангарск, ул. Садовая, 4', 603036)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (12, N'г.Ангарск, ул. Комсомольская, 26', 450983)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (13, N'г. Ангарск, ул. Чехова, 3', 394782)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (14, N'г. Ангарск, ул. Дзержинского, 28', 603002)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (15, N'г. Ангарск, ул. Набережная, 30', 450558)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (16, N'г.Ангарск, ул. Фрунзе, 43', 394060)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (17, N'г. Ангарск, ул. Школьная, 50', 410661)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (18, N'г. Ангарск, ул. Коммунистическая, 20', 625590)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (19, N'г. Ангарск, ул. 8 Марта', 625683)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (20, N'г. Ангарск, ул. Зеленая, 32', 400562)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (21, N'г. Ангарск, ул. Маяковского, 47', 614510)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (22, N'г. Ангарск, ул. Светлая, 46', 410542)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (23, N'г. Ангарск, ул. Цветочная, 8', 620839)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (24, N'г. Ангарск, ул. Коммунистическая, 1', 443890)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (25, N'г. Ангарск, ул. Спортивная, 46', 603379)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (26, N'г. Ангарск, ул. Гоголя, 41', 603721)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (27, N'г. Ангарск, ул. Северная, 13', 410172)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (28, N'г. Ангарск, ул. Вишневая, 32', 420151)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (29, N'г. Ангарск, ул. Подгорная, 8', 125061)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (30, N'г. Ангарск, ул. Шоссейная, 24', 630370)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (31, N'г. Ангарск, ул. Полевая, 35', 614753)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (32, N'г. Ангарск, ул. Маяковского, 44', 426030)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (33, N'г. Ангарск, ул. Клубная, 44', 450375)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (34, N'г. Ангарск, ул. Некрасова, 12', 625560)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (35, N'г. Ангарск, ул. Комсомольская, 17', 630201)
GO
INSERT [dbo].[PickupPoint] ([PickupPointId], [PickupPointAddress], [PickupPointMailIndex]) VALUES (36, N'г. Ангарск, ул. Мичурина, 26', 190949)
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E542S1', N'Серьги', N'Серьги из серебра с позолотой', N'2', NULL, N'2', CAST(8000.00 AS Decimal(19, 2)), 3, 1, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E573G6', N'Серьги', N'Серьги из золота 029038', N'1', NULL, N'2', CAST(7000.00 AS Decimal(19, 2)), 15, 6, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F344S4', N'Ожерелье', N'Ожерелье Lace (муассанит, круг, BS Regular, 6,5мм, 2 муассанит Кр-57 6мм)', N'3', NULL, N'1', CAST(590000.00 AS Decimal(19, 2)), 30, 1, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F346G5', N'Серьги', N'Серьги из золота с эмалью', N'1', NULL, N'2', CAST(12000.00 AS Decimal(19, 2)), 25, 5, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F893T5', N'Серьги', N'Серьги с 4 фианитами из серебра с позолотой', N'1', NULL, N'2', CAST(2300.00 AS Decimal(19, 2)), 10, 2, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G532R5', N'Подвеска', N'Подвеска из золочёного серебра с фианитами', N'3', NULL, N'1', CAST(695.00 AS Decimal(19, 2)), 5, 0, N'Нет в наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H732R5', N'Подвеска', N'Подвеска из красного золота П142-4547', N'2', NULL, N'2', CAST(5195.00 AS Decimal(19, 2)), 30, 6, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'J432E4', N'Серьги', N'Серебряные серьги c ювелирной керамикой', N'1', NULL, N'1', CAST(2900.00 AS Decimal(19, 2)), 15, 16, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K535G6', N'Серьги', N'Серьги-продевки из золота с фианитами', N'1', NULL, N'2', CAST(6200.00 AS Decimal(19, 2)), 4, 5, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'O875F6', N'Серьги', N'Серьги из золота с эмалью', N'1', NULL, N'2', CAST(11545.00 AS Decimal(19, 2)), 3, 2, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'R464G6', N'Подвеска', N'Подвеска из серебра с позолотой', N'2', NULL, N'1', CAST(2100.00 AS Decimal(19, 2)), 3, 6, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S753T5', N'Браслет', N'Браслет из золота ', N'4', NULL, N'2', CAST(5900.00 AS Decimal(19, 2)), 3, 6, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V472S3', N'Серьги', N'Серьги из красного золота', N'1', NULL, N'2', CAST(7000.00 AS Decimal(19, 2)), 2, 16, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'А112Т4', N'Серьги', N'Серьги из серебра с позолотой', N'2', NULL, N'1', CAST(2400.00 AS Decimal(19, 2)), 3, 5, N'В наличии')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Меркушев', N'Мартын', N'Федотович', N'888', N'888', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Казаков', N'Федот', N'Кондратович', N'321', N'321', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Карпов', N'Улеб', N'Леонидович', N'123', N'123', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Королёв', N'Матвей', N'Вадимович', N'loginDEgco2018', N'nMr|ss', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Юдин', N'Герман', N'Кондратович', N'loginDEwjg2018', N'9UfqWQ', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Беляева', N'Анна', N'Вячеславовна', N'loginDEjbz2018', N'xIAWNI', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Беляев', N'Валентин', N'Артёмович', N'loginDEmgu2018', N'0gC3bk', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Семёнов', N'Герман', N'Дмитрьевич', N'loginDErdg2018', N'ni0ue0', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Шестаков', N'Илья', N'Антонинович', N'loginDEjtv2018', N'f2ZaN6', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Власов', N'Вадим', N'Васильевич', N'loginDEtfj2018', N'{{ksPn', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Савельев', N'Арсений', N'Авксентьевич', N'loginDEpnb2018', N'{ADBdc', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Ефимов', N'Руслан', N'Якунович', N'loginDEsnq2018', N'S}SAD3a', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Бурова', N'Марфа', N'Федотовна', N'loginDEiin2018', N'y9l*b}', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Селезнёв', N'Александр', N'Никитевич', N'loginDEqda2018', N'|h+r}I', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Кулакова', N'Виктория', N'Георгьевна', N'loginDEbnj2018', N'SASD12|1&', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Дорофеева', N'Кира', N'Демьяновна', N'loginDEqte2018', N'dC8bDI', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Сафонова', N'Нинель', N'Якововна', N'loginDEfeo2018', N'8cI7vq', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Ситникова', N'София', N'Лукьевна', N'loginDEvni2018', N'e4pVIv', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Медведев', N'Ириней', N'Геннадьевич', N'loginDEjis2018', N'A9K++2', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Суханова', N'Евгения', N'Улебовна', N'loginDExvv2018', N'R1zh}|', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Игнатьев', N'Владлен', N'Дамирович', N'loginDEadl2018', N'F&IWf4', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Ефремов', N'Христофор', N'Владиславович', N'loginDEyzn2018', N'P1v24R', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Кошелев', N'Ростислав', N'Куприянович', N'loginDEphn2018', N'F}jGsJ', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Галкина', N'Тамара', N'Авксентьевна', N'loginDEdvk2018', N'NKNkup', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Журавлёва', N'Вера', N'Арсеньевна', N'loginDEtld2018', N'c+CECK', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Савина', N'Таисия', N'Глебовна', N'loginDEima2018', N'XK3sOA', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Иванов', N'Яков', N'Мэлорович', N'loginDEyfe2018', N'4Bbzpa', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Лыткин', N'Ким', N'Алексеевич', N'loginDEwqc2018', N'vRtAP*', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Логинов', N'Федот', N'Святославович', N'loginDEgtt2018', N'7YD|BR', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Русакова', N'Марина', N'Юлиановна', N'loginDEiwl2018', N'LhlmIl', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Константинов', N'Пётр', N'Кондратович', N'loginDEyvi2018', N'22beR}', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Поляков', N'Анатолий', N'Игоревич', N'loginDEtfz2018', N'uQY0ZQ', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Панфилова', N'Василиса', N'Григорьевна', N'loginDEikb2018', N'*QkUxc', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Воробьёв', N'Герман', N'Романович', N'loginDEdmi2018', N'HOGFbU', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Андреев', N'Ростислав', N'Федосеевич', N'loginDEtlo2018', N'58Jxrg', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Бобров', N'Агафон', N'Владимирович', N'loginDEsnd2018', N'lLHqZf', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Лапин', N'Алексей', N'Витальевич', N'loginDEgno2018', N'4fqLiO', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Шестаков', N'Авдей', N'Иванович', N'loginDEgnl2018', N'wdio{u', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Гаврилова', N'Алина', N'Эдуардовна', N'loginDEzna2018', N'yz1iMB', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Жуков', N'Юлиан', N'Валерьянович', N'loginDEsyh2018', N'&4jYGs', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Пономарёв', N'Максим', N'Альвианович', N'loginDExex2018', N'rnh36{', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Зиновьева', N'Мария', N'Лаврентьевна', N'loginDEdjm2018', N'KjI1JR', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Осипов', N'Артём', N'Мэлорович', N'loginDEgup2018', N'36|KhF', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Лапин', N'Вячеслав', N'Геласьевич', N'loginDEdat2018', N'ussd8Q', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Зуев', N'Ириней', N'Вадимович', N'loginDEffj2018', N'cJP+HC', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Коновалова', N'Агафья', N'Митрофановна', N'loginDEisp2018', N'dfz5Ii', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Исаев', N'Дмитрий', N'Аристархович', N'loginDEfrp2018', N'6dcR|9', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Белозёрова', N'Алевтина', N'Лаврентьевна', N'loginDEaee2018', N'5&qONH', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Самсонов', N'Агафон', N'Максимович', N'loginDEthu2018', N'|0xWzV', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (51, N'Константинова', N'Вероника', N'Агафоновна', N'loginDEsgg2018', N'qhgYnW', 2)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamPickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([PickupPointId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ExamOrder_ExamPickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamUser] FOREIGN KEY([OrderUserId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ExamOrder_ExamUser]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__ExamOrder__Order__4AB81AF0] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__ExamOrder__Order__4AB81AF0]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__ExamOrder__Produ__4BAC3F29] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__ExamOrder__Produ__4BAC3F29]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__ExamUser__UserRo__367C1819] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__ExamUser__UserRo__367C1819]
GO
