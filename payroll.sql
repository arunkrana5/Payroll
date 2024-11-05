USE [dev.Payroll]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSalaryBreakUp]    Script Date: 05-11-2024 05:36:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from GetSalaryBreakUp(1,25000)
CREATE  FUNCTION [dbo].[GetSalaryBreakUp] (@EMPID int,@gross decimal(18,2))
RETURNS
 @returnList TABLE (State varchar(50),FixedGross Decimal(18,2),Basic decimal(18,2),HRA decimal(18,2),OtherAllowance decimal(18,2),StatutoryBonus decimal(18,2),
 EarnGross decimal(18,2),EmpPF decimal(18,2),EmpEsic decimal(18,2),LWF decimal(18,2)


)
AS
BEGIN
	
 RETURN
END
GO
/****** Object:  Table [dbo].[AppRoles]    Script Date: 05-11-2024 05:36:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoles](
	[RoleID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](500) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AppRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUsers]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[LoginID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](500) NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[RoleID] [bigint] NOT NULL,
	[LastLogin] [datetime] NULL,
	[AttachID] [int] NOT NULL,
	[AllowLogin] [varchar](50) NOT NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AppUsers] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masters_Area]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masters_Area](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AreaCode] [varchar](2000) NOT NULL,
	[AreaName] [varchar](2000) NOT NULL,
	[Description] [varchar](2000) NOT NULL,
	[GroupID] [int] NOT NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masters_City]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masters_City](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CityCode] [varchar](2000) NOT NULL,
	[CityName] [varchar](2000) NOT NULL,
	[Description] [varchar](2000) NOT NULL,
	[GroupID] [int] NOT NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masters_Country]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masters_Country](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryCode] [varchar](2000) NOT NULL,
	[CountryName] [varchar](2000) NOT NULL,
	[Description] [varchar](2000) NOT NULL,
	[GroupID] [int] NOT NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masters_Region]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masters_Region](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RegionCode] [varchar](2000) NOT NULL,
	[RegionName] [varchar](2000) NOT NULL,
	[Description] [varchar](2000) NOT NULL,
	[GroupID] [int] NOT NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masters_State]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masters_State](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StateCode] [varchar](2000) NOT NULL,
	[StateName] [varchar](2000) NOT NULL,
	[Description] [varchar](2000) NOT NULL,
	[GroupID] [int] NOT NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary_Assignment]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_Assignment](
	[SAID] [bigint] IDENTITY(1,1) NOT NULL,
	[SalaryStructID] [bigint] NOT NULL,
	[EMPID] [bigint] NOT NULL,
	[StartDate] [date] NULL,
	[GrossSalary] [decimal](18, 2) NOT NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Salary_Assignment] PRIMARY KEY CLUSTERED 
(
	[SAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary_AssignmentBreakUp]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_AssignmentBreakUp](
	[SABreakID] [bigint] IDENTITY(1,1) NOT NULL,
	[SAID] [bigint] NOT NULL,
	[CompID] [bigint] NOT NULL,
	[BreakUpAmount] [decimal](18, 2) NOT NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Salary_AssignmentBreakUp] PRIMARY KEY CLUSTERED 
(
	[SABreakID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary_Component]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_Component](
	[CompID] [bigint] IDENTITY(1,1) NOT NULL,
	[CompCode] [nvarchar](50) NOT NULL,
	[CompName] [nvarchar](50) NOT NULL,
	[CompType] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[IsDepend_PD] [bit] NOT NULL,
	[IsTaxApplicable] [bit] NOT NULL,
	[IsStatisticalComp] [bit] NOT NULL,
	[IsRemoveZero] [bit] NOT NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Salary_Component] PRIMARY KEY CLUSTERED 
(
	[CompID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salary_components]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salary_components](
	[component_name] [varchar](50) NULL,
	[formula] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary_Structure]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_Structure](
	[StructID] [bigint] IDENTITY(1,1) NOT NULL,
	[StructCode] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Salary_Structure] PRIMARY KEY CLUSTERED 
(
	[StructID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary_StructureTran]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_StructureTran](
	[StructTranID] [bigint] IDENTITY(1,1) NOT NULL,
	[StructID] [bigint] NOT NULL,
	[Doctype] [varchar](50) NOT NULL,
	[CompID] [bigint] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Condition] [nvarchar](1000) NOT NULL,
	[Formula] [nvarchar](1000) NOT NULL,
	[EntrySource] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Isdeleted] [int] NOT NULL,
	[DeletedBy] [int] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Salary_StructureTran] PRIMARY KEY CLUSTERED 
(
	[StructTranID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AppRoles] ON 
GO
INSERT [dbo].[AppRoles] ([RoleID], [RoleName], [DisplayName], [Description], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, N'SuperAdmin', N'Super Admin', N'admin ', N'Web', 1, 1, 0, 0, NULL, 0, CAST(N'2024-09-04T11:05:21.497' AS DateTime), CAST(N'2024-09-04T11:05:21.497' AS DateTime), 0, N'')
GO
SET IDENTITY_INSERT [dbo].[AppRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[AppUsers] ON 
GO
INSERT [dbo].[AppUsers] ([LoginID], [UserID], [Password], [Name], [Phone], [Email], [RoleID], [LastLogin], [AttachID], [AllowLogin], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, N'Superadmin', N'12345', N'Super Admin', N'', N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, N'', N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-09-04T11:06:05.580' AS DateTime), CAST(N'2024-09-04T11:06:05.580' AS DateTime), 0, N'')
GO
INSERT [dbo].[AppUsers] ([LoginID], [UserID], [Password], [Name], [Phone], [Email], [RoleID], [LastLogin], [AttachID], [AllowLogin], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (2, N'Admin', N'12345', N'Arun', N'', N'', 1, CAST(N'2024-10-25T15:19:55.580' AS DateTime), 0, N'', N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-25T15:19:55.580' AS DateTime), CAST(N'2024-10-25T15:19:55.580' AS DateTime), 0, N'')
GO
SET IDENTITY_INSERT [dbo].[AppUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Masters_Area] ON 
GO
INSERT [dbo].[Masters_Area] ([ID], [AreaCode], [AreaName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, N'KCT', N'Kanhachatti', N'Kanha Chatti', 1, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-05T16:35:22.390' AS DateTime), CAST(N'2024-11-05T16:35:22.390' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_Area] ([ID], [AreaCode], [AreaName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (2, N'AKR', N'Arun Kumar Rana', N'Arun', 2, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-05T17:20:48.773' AS DateTime), CAST(N'2024-11-05T17:20:48.773' AS DateTime), 1, N'')
GO
SET IDENTITY_INSERT [dbo].[Masters_Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Masters_City] ON 
GO
INSERT [dbo].[Masters_City] ([ID], [CityCode], [CityName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, N'CH', N'Chatra', N'ok', 1, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-05T15:19:34.133' AS DateTime), CAST(N'2024-11-05T16:09:57.800' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_City] ([ID], [CityCode], [CityName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (2, N'SLP', N'Sultanpur', N'sul tan pur', 2, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-05T16:10:41.417' AS DateTime), CAST(N'2024-11-05T16:11:06.760' AS DateTime), 1, N'')
GO
SET IDENTITY_INSERT [dbo].[Masters_City] OFF
GO
SET IDENTITY_INSERT [dbo].[Masters_Country] ON 
GO
INSERT [dbo].[Masters_Country] ([ID], [CountryCode], [CountryName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, N'IND', N'INDIA', N'ok', 0, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-04T15:46:38.877' AS DateTime), CAST(N'2024-11-04T15:46:40.090' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_Country] ([ID], [CountryCode], [CountryName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (2, N'USA', N'America', N'usa', 0, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-04T15:48:27.043' AS DateTime), CAST(N'2024-11-04T15:48:27.043' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_Country] ([ID], [CountryCode], [CountryName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (3, N'PAK', N'Pakistan', N'pmkb', 0, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-04T16:11:58.500' AS DateTime), CAST(N'2024-11-04T16:11:58.500' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_Country] ([ID], [CountryCode], [CountryName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (4, N'NZ', N'New Zeeland', N'', 0, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-04T16:12:40.497' AS DateTime), CAST(N'2024-11-04T16:12:40.497' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_Country] ([ID], [CountryCode], [CountryName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (5, N'NEP', N'Nepal', N'', 0, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-04T16:15:09.623' AS DateTime), CAST(N'2024-11-04T16:15:09.623' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_Country] ([ID], [CountryCode], [CountryName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (6, N'CHINA', N'China', N'', 0, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-04T16:35:09.573' AS DateTime), CAST(N'2024-11-04T16:35:09.573' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_Country] ([ID], [CountryCode], [CountryName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (7, N'UAE', N'United Arab Emirats', N'', 0, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-04T16:35:40.653' AS DateTime), CAST(N'2024-11-04T16:35:40.653' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_Country] ([ID], [CountryCode], [CountryName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (8, N'AUS', N'Australia', N'australia', 0, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-05T16:25:19.893' AS DateTime), CAST(N'2024-11-05T16:25:19.893' AS DateTime), 1, N'')
GO
SET IDENTITY_INSERT [dbo].[Masters_Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Masters_Region] ON 
GO
INSERT [dbo].[Masters_Region] ([ID], [RegionCode], [RegionName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, N'E', N'East', N'east', 1, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-05T12:20:27.180' AS DateTime), CAST(N'2024-11-05T12:20:27.180' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_Region] ([ID], [RegionCode], [RegionName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (2, N'W', N'West', N'west', 1, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-05T12:29:18.627' AS DateTime), CAST(N'2024-11-05T12:29:18.627' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_Region] ([ID], [RegionCode], [RegionName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (3, N'E', N'East', N'ok', 2, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-05T13:19:25.197' AS DateTime), CAST(N'2024-11-05T13:19:25.197' AS DateTime), 1, N'')
GO
SET IDENTITY_INSERT [dbo].[Masters_Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Masters_State] ON 
GO
INSERT [dbo].[Masters_State] ([ID], [StateCode], [StateName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, N'JH', N'Jharkhand', N'jhar', 1, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-05T11:00:35.420' AS DateTime), CAST(N'2024-11-05T11:00:37.157' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_State] ([ID], [StateCode], [StateName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (2, N'DEL', N'Delhi', N'delhi', 1, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-05T12:38:51.153' AS DateTime), CAST(N'2024-11-05T12:38:51.153' AS DateTime), 1, N'')
GO
INSERT [dbo].[Masters_State] ([ID], [StateCode], [StateName], [Description], [GroupID], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (3, N'OD', N'Odisha', N'udisha', 2, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-05T12:43:12.853' AS DateTime), CAST(N'2024-11-05T12:43:12.853' AS DateTime), 1, N'')
GO
SET IDENTITY_INSERT [dbo].[Masters_State] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary_Assignment] ON 
GO
INSERT [dbo].[Salary_Assignment] ([SAID], [SalaryStructID], [EMPID], [StartDate], [GrossSalary], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (20, 1, 1, CAST(N'0001-01-01' AS Date), CAST(14000.00 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-24T17:09:04.593' AS DateTime), CAST(N'2024-10-24T17:09:04.823' AS DateTime), 0, N'')
GO
SET IDENTITY_INSERT [dbo].[Salary_Assignment] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary_AssignmentBreakUp] ON 
GO
INSERT [dbo].[Salary_AssignmentBreakUp] ([SABreakID], [SAID], [CompID], [BreakUpAmount], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, 20, 1, CAST(14000.00 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-24T17:09:12.630' AS DateTime), CAST(N'2024-10-29T15:53:17.430' AS DateTime), 1, N'')
GO
INSERT [dbo].[Salary_AssignmentBreakUp] ([SABreakID], [SAID], [CompID], [BreakUpAmount], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (2, 20, 2, CAST(0.00 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-24T17:09:18.553' AS DateTime), CAST(N'2024-10-29T15:53:17.430' AS DateTime), 1, N'')
GO
INSERT [dbo].[Salary_AssignmentBreakUp] ([SABreakID], [SAID], [CompID], [BreakUpAmount], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (3, 20, 3, CAST(0.00 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-24T17:09:23.600' AS DateTime), CAST(N'2024-10-29T15:53:17.430' AS DateTime), 1, N'')
GO
INSERT [dbo].[Salary_AssignmentBreakUp] ([SABreakID], [SAID], [CompID], [BreakUpAmount], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (4, 20, 7, CAST(1166.20 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-24T17:09:24.823' AS DateTime), CAST(N'2024-10-29T15:53:17.430' AS DateTime), 1, N'')
GO
INSERT [dbo].[Salary_AssignmentBreakUp] ([SABreakID], [SAID], [CompID], [BreakUpAmount], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (5, 20, 12, CAST(680.00 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-24T17:09:27.410' AS DateTime), CAST(N'2024-10-29T15:53:17.430' AS DateTime), 1, N'')
GO
INSERT [dbo].[Salary_AssignmentBreakUp] ([SABreakID], [SAID], [CompID], [BreakUpAmount], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (6, 20, 13, CAST(113.75 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-24T17:09:27.480' AS DateTime), CAST(N'2024-10-29T15:53:17.430' AS DateTime), 1, N'')
GO
INSERT [dbo].[Salary_AssignmentBreakUp] ([SABreakID], [SAID], [CompID], [BreakUpAmount], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (7, 20, 14, CAST(1.00 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-24T17:09:27.557' AS DateTime), CAST(N'2024-10-29T15:53:17.430' AS DateTime), 1, N'')
GO
INSERT [dbo].[Salary_AssignmentBreakUp] ([SABreakID], [SAID], [CompID], [BreakUpAmount], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (8, 20, 19, CAST(1680.00 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-24T17:09:27.627' AS DateTime), CAST(N'2024-10-29T15:53:17.430' AS DateTime), 1, N'')
GO
INSERT [dbo].[Salary_AssignmentBreakUp] ([SABreakID], [SAID], [CompID], [BreakUpAmount], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (9, 20, 20, CAST(1.00 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-24T17:09:27.697' AS DateTime), CAST(N'2024-10-29T15:53:17.430' AS DateTime), 1, N'')
GO
INSERT [dbo].[Salary_AssignmentBreakUp] ([SABreakID], [SAID], [CompID], [BreakUpAmount], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (10, 20, 21, CAST(492.90 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-24T17:09:27.773' AS DateTime), CAST(N'2024-10-29T15:53:17.430' AS DateTime), 1, N'')
GO
SET IDENTITY_INSERT [dbo].[Salary_AssignmentBreakUp] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary_Component] ON 
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, N'B', N'Basic', N'Earning', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-13T10:57:36.353' AS DateTime), CAST(N'2024-10-13T10:57:36.353' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (2, N'HRA', N'HRA', N'Earning', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-13T10:57:53.453' AS DateTime), CAST(N'2024-10-13T10:57:53.453' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (3, N'A', N'Allowances', N'Earning', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-13T10:58:14.913' AS DateTime), CAST(N'2024-10-13T10:58:14.913' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (7, N'SB', N'Statutory Bonus', N'Earning', N'', 0, 0, 0, 0, N'Web', 1, 0, 0, 1, NULL, 0, CAST(N'2024-10-15T16:03:21.083' AS DateTime), CAST(N'2024-10-15T16:03:21.203' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (12, N'EPF', N'EPF', N'Deduction', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-19T11:02:27.357' AS DateTime), CAST(N'2024-10-19T11:02:27.357' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (13, N'ESIC', N'ESIC', N'Deduction', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-19T11:02:38.970' AS DateTime), CAST(N'2024-10-19T11:02:38.970' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (14, N'LWF', N'LWF', N'Deduction', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-19T11:02:51.213' AS DateTime), CAST(N'2024-10-19T11:02:51.213' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (15, N'PT', N'PT', N'Deduction', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-19T11:03:01.440' AS DateTime), CAST(N'2024-10-19T11:03:01.440' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (16, N'IncomeTax', N'IncomeTax', N'Deduction', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-19T11:03:23.967' AS DateTime), CAST(N'2024-10-19T11:03:23.967' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (17, N'Insurance', N'Insurance', N'Deduction', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-19T11:03:56.803' AS DateTime), CAST(N'2024-10-19T11:03:56.803' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (18, N'Advance', N'Advance', N'Deduction', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-19T11:04:20.570' AS DateTime), CAST(N'2024-10-19T11:04:20.570' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (19, N'ERPF', N'Employer PF', N'Contribution', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-19T11:04:52.113' AS DateTime), CAST(N'2024-10-19T11:04:52.113' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (20, N'ERLWF', N'Employer LWF', N'Contribution', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-19T11:05:46.817' AS DateTime), CAST(N'2024-10-19T11:05:46.817' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (21, N'ERESIC', N'Employer ESIC', N'Contribution', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-19T11:06:06.973' AS DateTime), CAST(N'2024-10-19T11:06:06.973' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (25, N'OTH', N'Comp Name', N'Earning', N'Comp Description ', 1, 1, 1, 1, N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-28T16:14:07.087' AS DateTime), CAST(N'2024-10-28T16:14:07.087' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (26, N'my comp', N'jfrfjgiryuitg', N'Contribution', N'fdg', 1, 1, 1, 1, N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-11-04T16:36:15.987' AS DateTime), CAST(N'2024-11-04T16:36:15.987' AS DateTime), 1, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (27, N'MW', N'Minimum Wages', N'Earning', N'', 0, 0, 1, 0, N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T12:16:03.240' AS DateTime), CAST(N'2024-11-05T12:16:03.240' AS DateTime), 0, N'')
GO
SET IDENTITY_INSERT [dbo].[Salary_Component] OFF
GO
INSERT [dbo].[salary_components] ([component_name], [formula]) VALUES (N'Basic', N':Gross * 0.5')
GO
INSERT [dbo].[salary_components] ([component_name], [formula]) VALUES (N'HRA', N'(:Gross * 0.5) * 0.5')
GO
INSERT [dbo].[salary_components] ([component_name], [formula]) VALUES (N'Statutory Bonus', N'(:Gross * 0.5) * 0.0833')
GO
INSERT [dbo].[salary_components] ([component_name], [formula]) VALUES (N'Allowances', N':Gross * 0.20835')
GO
INSERT [dbo].[salary_components] ([component_name], [formula]) VALUES (N'Employee PF', N'CASE WHEN ((:Gross * 0.5) * 0.12) > 1800 THEN 1800 ELSE (:Gross * 0.5) * 0.12 END')
GO
INSERT [dbo].[salary_components] ([component_name], [formula]) VALUES (N'Employee ESIC', N'CASE WHEN :Gross  > 21000 THEN 0 ELSE :Gross  * 0.0075 END')
GO
INSERT [dbo].[salary_components] ([component_name], [formula]) VALUES (N'Employee LWF', N'CASE WHEN (:Gross *0.002 )> 25THEN 25 ELSE :Gross *0.002 END')
GO
INSERT [dbo].[salary_components] ([component_name], [formula]) VALUES (N'Employer PF', N'CASE WHEN ((:Gross * 0.5) * 0.12) > 1800 THEN 1800 ELSE (:Gross * 0.5) * 0.12 END')
GO
INSERT [dbo].[salary_components] ([component_name], [formula]) VALUES (N'Employer ESIC', N'CASE WHEN :Gross  > 21000 THEN 0 ELSE :Gross  * 0.0325 END')
GO
INSERT [dbo].[salary_components] ([component_name], [formula]) VALUES (N'Employer LWF', N'(CASE WHEN (:Gross *0.002 )> 25THEN 25 ELSE :Gross *0.002 END)*2')
GO
SET IDENTITY_INSERT [dbo].[Salary_Structure] ON 
GO
INSERT [dbo].[Salary_Structure] ([StructID], [StructCode], [Description], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (10009, N'SSHR', N'Haryana Structure', N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T10:58:40.070' AS DateTime), CAST(N'2024-11-05T10:58:40.070' AS DateTime), 0, N'')
GO
SET IDENTITY_INSERT [dbo].[Salary_Structure] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary_StructureTran] ON 
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (44, 10009, N'Earning', 1, CAST(0.00 AS Decimal(18, 2)), N'', N'CASE 
    WHEN #base <= 12000 THEN #base
  WHEN #base > 12000 AND 0.5 * #base < 12000 THEN 12000
    ELSE 0.5 * #base
END
', N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T11:00:12.500' AS DateTime), CAST(N'2024-11-05T11:00:12.500' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (45, 10009, N'Earning', 7, CAST(0.00 AS Decimal(18, 2)), N'', N'case when (#base-#B) > (#B*0.0833) then  (#B*0.0833) else  (#base-#B) end', N'Web', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T11:01:03.050' AS DateTime), CAST(N'2024-11-05T11:01:03.050' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (48, 10009, N'Earning', 2, CAST(0.00 AS Decimal(18, 2)), N'', N'CASE WHEN (#base-#B-#SB) > (#B*0.5) THEN  (#B*0.5) ELSE  (#base-#B-#SB) END', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T12:10:05.657' AS DateTime), CAST(N'2024-11-05T12:10:05.657' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (49, 10009, N'Earning', 3, CAST(0.00 AS Decimal(18, 2)), N'', N'#base-#B-#HRA-#SB', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T12:12:39.687' AS DateTime), CAST(N'2024-11-05T12:12:39.687' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (52, 10009, N'Earning', 27, CAST(12000.00 AS Decimal(18, 2)), N'', N'0', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T12:17:03.180' AS DateTime), CAST(N'2024-11-05T12:17:03.180' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (53, 10009, N'Deduction', 12, CAST(0.00 AS Decimal(18, 2)), N'', N'CASE WHEN (#B*0.12) > (1800) THEN 1800  ELSE  (#B*0.12) END', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T12:47:46.123' AS DateTime), CAST(N'2024-11-05T12:47:46.123' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (54, 10009, N'Deduction', 13, CAST(0.00 AS Decimal(18, 2)), N'', N'CASE WHEN (#base) <= (21000) THEN (#base*0.0075)ELSE 0 END', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T12:55:30.560' AS DateTime), CAST(N'2024-11-05T12:55:30.560' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (55, 10009, N'Deduction', 14, CAST(0.00 AS Decimal(18, 2)), N'', N'CASE WHEN (#base * 0.002) > 31 THEN 31 ELSE #base*0.002 END', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T13:09:24.580' AS DateTime), CAST(N'2024-11-05T13:09:24.580' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (56, 10009, N'Contribution', 19, CAST(0.00 AS Decimal(18, 2)), N'', N'CASE WHEN (#B*0.12) > (1800) THEN 1800  ELSE  (#B*0.12) END', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T13:23:29.000' AS DateTime), CAST(N'2024-11-05T13:23:29.000' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (57, 10009, N'Contribution', 20, CAST(0.00 AS Decimal(18, 2)), N'', N'#LWF * 2', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T13:23:29.000' AS DateTime), CAST(N'2024-11-05T13:23:29.000' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (58, 10009, N'Contribution', 21, CAST(0.00 AS Decimal(18, 2)), N'', N'CASE WHEN (#base) <= (21000) THEN (#base*0.0325)ELSE 0 END', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-11-05T13:23:29.000' AS DateTime), CAST(N'2024-11-05T13:23:29.000' AS DateTime), 0, N'')
GO
SET IDENTITY_INSERT [dbo].[Salary_StructureTran] OFF
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_RoleName]  DEFAULT ('') FOR [RoleName]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_DisplayName]  DEFAULT ('') FOR [DisplayName]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_DeletedBy]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[AppRoles] ADD  CONSTRAINT [DF_AppRoles_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_UserID]  DEFAULT ('') FOR [UserID]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_Password]  DEFAULT ('') FOR [Password]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_Phone]  DEFAULT ('') FOR [Phone]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_Email]  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_RoleID]  DEFAULT ((0)) FOR [RoleID]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_LastLogin]  DEFAULT (((1)/(1))/(1900)) FOR [LastLogin]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_AttachID]  DEFAULT ((0)) FOR [AttachID]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_AllowLogin]  DEFAULT ('') FOR [AllowLogin]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_DeletedBy]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_Code]  DEFAULT ('') FOR [AreaCode]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_Name]  DEFAULT ('') FOR [AreaName]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_GroupID]  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_Deleted_By]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_Created_By]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_Created_Date]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_Modified_Date]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_Modified_By]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Masters_Area] ADD  CONSTRAINT [DF_Area_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_Code]  DEFAULT ('') FOR [CityCode]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_Name]  DEFAULT ('') FOR [CityName]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_GroupID]  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_Deleted_By]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_Created_By]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_Created_Date]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_Modified_Date]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_Modified_By]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Masters_City] ADD  CONSTRAINT [DF_City_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_Code]  DEFAULT ('') FOR [CountryCode]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_Name]  DEFAULT ('') FOR [CountryName]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_GroupID]  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Masters_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_Deleted_By]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_Created_By]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_Created_Date]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_Modified_Date]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_Modified_By]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Masters_Country] ADD  CONSTRAINT [DF_Country_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_Code]  DEFAULT ('') FOR [RegionCode]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_Name]  DEFAULT ('') FOR [RegionName]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_GroupID]  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_Deleted_By]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_Created_By]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_Created_Date]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_Modified_Date]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_Modified_By]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Masters_Region] ADD  CONSTRAINT [DF_Region_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_Code]  DEFAULT ('') FOR [StateCode]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_Name]  DEFAULT ('') FOR [StateName]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_GroupID]  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_Deleted_By]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_Created_By]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_Created_Date]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_Modified_Date]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_Modified_By]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Masters_State] ADD  CONSTRAINT [DF_State_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_EMPID]  DEFAULT ((0)) FOR [EMPID]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_GrossSalary]  DEFAULT ((0)) FOR [GrossSalary]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_DeletedBy]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Salary_Assignment] ADD  CONSTRAINT [DF_Salary_Assignment_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[Salary_AssignmentBreakUp] ADD  CONSTRAINT [DF_Salary_AssignmentBreakUp_BreakUpAmount]  DEFAULT ((0)) FOR [BreakUpAmount]
GO
ALTER TABLE [dbo].[Salary_AssignmentBreakUp] ADD  CONSTRAINT [DF_Salary_AssignmentBreakUp_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[Salary_AssignmentBreakUp] ADD  CONSTRAINT [DF_Salary_AssignmentBreakUp_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Salary_AssignmentBreakUp] ADD  CONSTRAINT [DF_Salary_AssignmentBreakUp_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Salary_AssignmentBreakUp] ADD  CONSTRAINT [DF_Salary_AssignmentBreakUp_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[Salary_AssignmentBreakUp] ADD  CONSTRAINT [DF_Salary_AssignmentBreakUp_DeletedBy]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Salary_AssignmentBreakUp] ADD  CONSTRAINT [DF_Salary_AssignmentBreakUp_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Salary_AssignmentBreakUp] ADD  CONSTRAINT [DF_Salary_AssignmentBreakUp_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Salary_AssignmentBreakUp] ADD  CONSTRAINT [DF_Salary_AssignmentBreakUp_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Salary_AssignmentBreakUp] ADD  CONSTRAINT [DF_Salary_AssignmentBreakUp_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Salary_AssignmentBreakUp] ADD  CONSTRAINT [DF_Salary_AssignmentBreakUp_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Table_1_ComponentCode]  DEFAULT ('') FOR [CompCode]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Table_1_ComponentName]  DEFAULT ('') FOR [CompName]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_CompType]  DEFAULT ('') FOR [CompType]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_IsDepend_PD]  DEFAULT ((0)) FOR [IsDepend_PD]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_IsTaxApplicable]  DEFAULT ((0)) FOR [IsTaxApplicable]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_IsStatisticalComp]  DEFAULT ((0)) FOR [IsStatisticalComp]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Table_1_RemoveZero]  DEFAULT ((0)) FOR [IsRemoveZero]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_DeletedBy]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Salary_Component] ADD  CONSTRAINT [DF_Salary_Component_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_StructCode]  DEFAULT ('') FOR [StructCode]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_Decription]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_DeletedBy]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Salary_Structure] ADD  CONSTRAINT [DF_Salary_Structure_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_Doctype]  DEFAULT ('') FOR [Doctype]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_Condition]  DEFAULT ('') FOR [Condition]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_Formula]  DEFAULT ('') FOR [Formula]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_EntrySource]  DEFAULT ('') FOR [EntrySource]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_Priority]  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_DeletedBy]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Salary_StructureTran] ADD  CONSTRAINT [DF_Salary_StructureTran_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
/****** Object:  StoredProcedure [dbo].[calculate_salary_components]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[calculate_salary_components]
    @Gross DECIMAL(10, 2)
AS
BEGIN
    DECLARE @component_name VARCHAR(50);
    DECLARE @formula VARCHAR(255);
    DECLARE @dynamic_formula NVARCHAR(MAX);
    DECLARE @result DECIMAL(10, 2);

    -- Cursor for iterating over the salary components
    DECLARE component_cursor CURSOR FOR 
    SELECT component_name, formula FROM salary_components;
    
    OPEN component_cursor;

    FETCH NEXT FROM component_cursor INTO @component_name, @formula;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Replace :Gross in the formula with the actual Gross value
        SET @dynamic_formula = REPLACE(@formula, ':Gross', CAST(@Gross AS NVARCHAR));

        -- Construct dynamic SQL query and execute it
        SET @dynamic_formula = 'SELECT @result = ' + @dynamic_formula;
        
        -- Execute the dynamic SQL and store the result in @result
        EXEC sp_executesql @dynamic_formula, N'@result DECIMAL(10,2) OUTPUT', @result OUTPUT;

        -- Output the component name and its calculated value
        PRINT @component_name + ': ' + CAST(@result AS NVARCHAR(20));
        
        FETCH NEXT FROM component_cursor INTO @component_name, @formula;
    END;

    -- Close and deallocate the cursor
    CLOSE component_cursor;
    DEALLOCATE component_cursor;
END;
GO
/****** Object:  StoredProcedure [dbo].[spu_GetAreaList]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spu_GetAreaList](@LoginID int)
as
begin
SELECT a.[ID]
      ,a.[AreaCode]
      ,a.[AreaName]
      ,a.[Description]
      ,a.[GroupID]
	  ,c.CityName as City
      ,a.[EntrySource]
      ,a.[IsActive]
      ,a.[Priority]
      ,a.[Isdeleted]
      ,a.[DeletedBy]
      ,a.[DeletedDate]
      ,a.[CreatedBy]
      ,a.[CreatedDate]
      ,a.[ModifiedDate]
      ,a.[ModifiedBy]
      ,a.[IPAddress]
  FROM [dev.Payroll].[dbo].[Masters_Area] a
  left join [dbo].[Masters_City] c on c.ID=a.GroupID

end
GO
/****** Object:  StoredProcedure [dbo].[spu_GetCityList]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spu_GetCityList](@LoginID int)
as
begin
SELECT c.[ID]
      ,c.[CityCode]
      ,c.[CityName]
      ,c.[Description]
      ,c.[GroupID]
	  ,s.StateName as State
      ,c.[EntrySource]
      ,c.[IsActive]
      ,c.[Priority]
      ,c.[Isdeleted]
      ,c.[DeletedBy]
      ,c.[DeletedDate]
      ,c.[CreatedBy]
      ,c.[CreatedDate]
      ,c.[ModifiedDate]
      ,c.[ModifiedBy]
      ,c.[IPAddress]
  FROM [dev.Payroll].[dbo].[Masters_City] c
  left join [dbo].[Masters_State] s on s.ID=c.GroupID
end
GO
/****** Object:  StoredProcedure [dbo].[spu_GetCountryList]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spu_GetCountryList](@LoginID int)
as 
begin

SELECT [ID]
      ,[CountryCode]
      ,[CountryName]
      ,[Description]
      ,[GroupID]
      ,[EntrySource]
      ,[IsActive]
      ,[Priority]
      ,[Isdeleted]
      ,[DeletedBy]
      ,[DeletedDate]
      ,[CreatedBy]
      ,[CreatedDate]
      ,[ModifiedDate]
      ,[ModifiedBy]
      ,[IPAddress]
  FROM [dev.Payroll].[dbo].[Masters_Country]
  where isdeleted=0
  end
GO
/****** Object:  StoredProcedure [dbo].[spu_GetDropdownList]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spu_GetDropdownList](@LoginID int,@Doctype varchar(100),@ID int)
as 
BEGIN
	IF @Doctype='Structures'
	BEGIN
		SELECT 0 as Value,
		'-- Select --' as Text
		Union
		SELECT [StructID] as Value
	      ,[StructCode] as Text
	   FROM [dev.Payroll].[dbo].[Salary_Structure] where Isdeleted=0
	END
	IF @Doctype='Components'
	BEGIN
		SELECT 0 as Value,
		'-- Select --' as Text
		Union
		SELECT [CompID] as Value
      ,[CompCode] as Text
	   FROM [dev.Payroll].[dbo].[Salary_Component] where Isdeleted=0
	END
	
	IF @Doctype='Employees'
	BEGIN
		SELECT 0 as Value,
		'-- Select --' as Text
		Union
		SELECT [LoginID] as Value
	      ,[Name] as Text
	   FROM [dev.Payroll].[dbo].[AppUsers] where Isdeleted=0
	END

	IF @Doctype='Role'
	BEGIN
		SELECT 0 as Value,
		'-- Select --' as Text
		Union
		SELECT [RoleID] as Value
	      ,[RoleName] as Text
	   FROM [dev.Payroll].[dbo].[AppRoles] where Isdeleted=0
	END

	IF @Doctype='Country'
	BEGIN
		SELECT 0 as Value,
		'-- Select --' as Text
		Union
		SELECT ID as Value
	      ,CountryName as Text
	   FROM [dbo].[Masters_Country] where Isdeleted=0
	END

	IF @Doctype='Region'
	BEGIN
		SELECT 0 as Value,
		'-- Select --' as Text
		Union
		SELECT ID as Value
	      ,RegionName as Text
	   FROM [dbo].[Masters_Region] where Isdeleted=0
	END

	IF @Doctype='State'
	BEGIN
		SELECT 0 as Value,
		'-- Select --' as Text
		Union
		SELECT ID as Value
	      ,StateName as Text
	   FROM [dbo].[Masters_State] where Isdeleted=0
	END

	IF @Doctype='City'
	BEGIN
		SELECT 0 as Value,
		'-- Select --' as Text
		Union
		SELECT ID as Value
	      ,CityName as Text
	   FROM [dbo].[Masters_City] where Isdeleted=0
	END

END
GO
/****** Object:  StoredProcedure [dbo].[spu_GetLogin]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spu_GetLogin](@UserID nvarchar(100),@Password nvarchar(100),@EntrySource varchar(50))
as
begin
	SET NOCOUNT ON;  

	SELECT AP.LoginID,AP.UserID,AP.RoleID,AR.RoleName,AP.Email,AP.Name
	from AppUsers as AP
	inner join AppRoles as AR on AR.RoleID=AP.RoleID and AR.Isdeleted=0
	where AP.Isdeleted=0 and AP.IsActive=1 and AP.UserID= @UserID and AP.Password= @Password
end
GO
/****** Object:  StoredProcedure [dbo].[spu_GetRegionList]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spu_GetRegionList](@LoginID int)
as 
begin
SELECT r.[ID]
      ,r.[RegionCode]
      ,r.[RegionName]
      ,r.[Description]
      ,r.[GroupID]
	  ,c.CountryName as Country
      ,r.[EntrySource]
      ,r.[IsActive]
      ,r.[Priority]
      ,r.[Isdeleted]
      ,r.[DeletedBy]
      ,r.[DeletedDate]
      ,r.[CreatedBy]
      ,r.[CreatedDate]
      ,r.[ModifiedDate]
      ,r.[ModifiedBy]
      ,r.[IPAddress]
  FROM [dev.Payroll].[dbo].[Masters_Region] r
  left join [dbo].[Masters_Country] c on c.ID=r.GroupID
  where r.isdeleted=0
end
GO
/****** Object:  StoredProcedure [dbo].[spu_GetSalaryAssignment]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--spu_GetSalaryAssignment 10004,2,0
CREATE proc [dbo].[spu_GetSalaryAssignment](@SalaryStID INT, @EMPID INT, @Salary DECIMAL(18, 2))
as
begin
declare @SalaryAssignmentID int=0;
DECLARE @NetPay DECIMAL(18, 2),
                @TotalDeduction DECIMAL(18, 2),
                @TotalContribution DECIMAL(18, 2),
                @TotalEarning DECIMAL(18, 2),
                @CTC DECIMAL(18, 2),
                @GrossSalary DECIMAL(18, 2);

select @SalaryAssignmentID=isnull(SAID,0) from Salary_Assignment where Isdeleted=0 and SalaryStructID=@SalaryStID and EMPID=@EMPID
if @SalaryAssignmentID =0
	begin
		exec spu_GetSalaryCalculation @SalaryStID,@EMPID,@Salary
	end
else
	begin
		select distinct
		ass.GrossSalary as Amount,
		a.CompID,
		c.CompCode,
		c.CompName,
		c.CompType,
		s.StructCode,
		st.Formula,
		a.BreakUpAmount as CalculatedValue,
		st.Condition,
		a.BreakUpAmount as CalculatedValue
		from Salary_AssignmentBreakUp a
		Left join Salary_Component c on c.CompID=a.CompID
		left join Salary_Assignment ass on ass.SAID=a.SAID
		left join Salary_Structure s on s.StructID=ass.SalaryStructID
		left join Salary_StructureTran st on st.CompID=a.CompID and st.StructID=s.StructID
		where isnull(a.Isdeleted,0)=0 and ass.EMPID=@EMPID and s.StructID=@SalaryStID and a.CompID=st.CompID

		SELECT @TotalDeduction = SUM(b.BreakUpAmount) FROM Salary_AssignmentBreakUp b
		left join Salary_Component c on c.CompID=b.CompID
		WHERE b.SAID = @SalaryAssignmentID and c.CompType='Deduction' and b.Isdeleted=0;

		SELECT @TotalContribution = SUM(b.BreakUpAmount) FROM Salary_AssignmentBreakUp b
		left join Salary_Component c on c.CompID=b.CompID
		WHERE b.SAID = @SalaryAssignmentID and c.CompType='Contribution' and b.Isdeleted=0;

		SELECT @TotalEarning = SUM(b.BreakUpAmount) FROM Salary_AssignmentBreakUp b
		left join Salary_Component c on c.CompID=b.CompID
		WHERE b.SAID = @SalaryAssignmentID and c.CompType='Earning' and b.Isdeleted=0;

        SELECT @NetPay = @TotalEarning - @TotalDeduction;
        SELECT @CTC = @TotalEarning + @TotalContribution;
		SELECT @GrossSalary=GrossSalary from Salary_Assignment where Isdeleted=0 and SalaryStructID=@SalaryStID and EMPID=@EMPID

        SELECT @TotalEarning AS Earning,@TotalDeduction as Deduction,@TotalContribution as Contribution,
               @CTC AS CTC,
               @NetPay AS NetPay,
			   @GrossSalary as GrossSalary;
	end
 end
GO
/****** Object:  StoredProcedure [dbo].[spu_GetSalaryAssignmentList]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spu_GetSalaryAssignmentList](@LoginID int,@SAID int)
as
begin
SELECT a.[SAID]
      ,a.[SalaryStructID]
	  ,s.StructCode as SalaryStruct
      ,a.[EMPID]
	  ,u.Name as Employee
      ,a.[StartDate]
      ,a.[GrossSalary]
      ,a.[EntrySource]
      ,a.[IsActive]
      ,a.[Priority]
      ,a.[Isdeleted]
      ,a.[DeletedBy]
      ,a.[DeletedDate]
      ,a.[CreatedBy]
      ,a.[CreatedDate]
      ,a.[ModifiedDate]
      ,a.[ModifiedBy]
      ,a.[IPAddress]
  FROM [dev.Payroll].[dbo].[Salary_Assignment] a
  LEFT JOIN Salary_Structure s on s.StructID=a.SalaryStructID
  LEFT JOIN AppUsers u on u.LoginID=a.EMPID
  where a.Isdeleted=0
 end
GO
/****** Object:  StoredProcedure [dbo].[spu_GetSalaryCalculation]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--spu_GetSalaryCalculation 10009,1,30000
CREATE PROC [dbo].[spu_GetSalaryCalculation] 
    (@SalaryStID INT, @EMPID INT, @Salary DECIMAL(18, 2))
AS
BEGIN
    BEGIN TRY
        DECLARE @NetPay DECIMAL(18, 2), @TotalDeduction DECIMAL(18, 2),
                @TotalContribution DECIMAL(18, 2), @TotalEarning DECIMAL(18, 2), 
                @CTC DECIMAL(18, 2), @Result DECIMAL(18,2);

        IF OBJECT_ID('tempdb..#SalaryResult') IS NOT NULL DROP TABLE #SalaryResult;

        -- Create and populate #SalaryResult
        SELECT C.CompID, C.CompCode, C.CompName, C.CompType, S.StructCode, 
               ST.Formula, ST.Amount, ST.Condition
        INTO #SalaryResult
        FROM Salary_StructureTran AS ST
        INNER JOIN Salary_Structure AS S ON S.StructID = ST.StructID
        INNER JOIN Salary_Component AS C ON C.CompID = ST.CompID
        WHERE S.StructID = @SalaryStID AND S.IsDeleted = 0 AND S.IsActive = 1;

        -- Replace `#base` with `@Salary`
        UPDATE #SalaryResult
        SET Formula = REPLACE(Formula, '#base', CAST(@Salary AS NVARCHAR));

        -- Add a column to store the calculated value
        ALTER TABLE #SalaryResult ADD CalculatedValue DECIMAL(18, 2);

        DECLARE @Formula NVARCHAR(MAX), @CompID INT, @CalculatedValue DECIMAL(18, 2), @SQL NVARCHAR(MAX);

        -- First Cursor: Calculate initial values for non-dependent formulas
        DECLARE InitialCursor CURSOR FOR 
        SELECT CompID, Formula FROM #SalaryResult WHERE CHARINDEX('#', Formula) = 0;

        OPEN InitialCursor;
        FETCH NEXT FROM InitialCursor INTO @CompID, @Formula;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Build and execute SQL for formula evaluation
            SET @SQL = 'SELECT @Result = ' + @Formula;

            BEGIN TRY
                EXEC sp_executesql @SQL, N'@Result DECIMAL(18,2) OUTPUT', @Result = @CalculatedValue OUTPUT;
                -- Update calculated value in #SalaryResult
                UPDATE #SalaryResult SET CalculatedValue = @CalculatedValue WHERE CompID = @CompID;
            END TRY
            BEGIN CATCH
                PRINT 'Error evaluating formula for CompID ' + CAST(@CompID AS NVARCHAR) + ': ' + ERROR_MESSAGE();
            END CATCH;

            FETCH NEXT FROM InitialCursor INTO @CompID, @Formula;
        END;

        CLOSE InitialCursor;
        DEALLOCATE InitialCursor;

        -- Second Cursor: Replace remaining #CompCode references with calculated values
        DECLARE FinalCursor CURSOR FOR
        SELECT CompID, Formula FROM #SalaryResult WHERE CHARINDEX('#', Formula) > 0;

        OPEN FinalCursor;
        FETCH NEXT FROM FinalCursor INTO @CompID, @Formula;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Replace any remaining #CompCode placeholders with CalculatedValue
            DECLARE CodeCursor CURSOR LOCAL FOR 
            SELECT CompCode, CalculatedValue FROM #SalaryResult WHERE CalculatedValue IS NOT NULL;

            OPEN CodeCursor;
            DECLARE @ReplaceCode NVARCHAR(50), @ReplaceValue NVARCHAR(50);
            FETCH NEXT FROM CodeCursor INTO @ReplaceCode, @ReplaceValue;

            WHILE @@FETCH_STATUS = 0
            BEGIN
                SET @Formula = REPLACE(@Formula, CONCAT('#', @ReplaceCode), CAST(@ReplaceValue AS NVARCHAR));
                FETCH NEXT FROM CodeCursor INTO @ReplaceCode, @ReplaceValue;
            END;

            CLOSE CodeCursor;
            DEALLOCATE CodeCursor;

            -- Evaluate the final formula after replacements
            SET @SQL = 'SELECT @Result = ' + @Formula;

            BEGIN TRY
                EXEC sp_executesql @SQL, N'@Result DECIMAL(18,2) OUTPUT', @Result = @CalculatedValue OUTPUT;
                -- Update the calculated value in #SalaryResult
                UPDATE #SalaryResult SET CalculatedValue = @CalculatedValue WHERE CompID = @CompID;
            END TRY
            BEGIN CATCH
                PRINT 'Error evaluating formula for CompID ' + CAST(@CompID AS NVARCHAR) + ': ' + ERROR_MESSAGE();
            END CATCH;

            FETCH NEXT FROM FinalCursor INTO @CompID, @Formula;
        END;

        CLOSE FinalCursor;
        DEALLOCATE FinalCursor;

        -- Aggregate totals for each component type
        SELECT @TotalDeduction = SUM(CalculatedValue) FROM #SalaryResult WHERE CompType = 'Deduction';
        SELECT @TotalContribution = SUM(CalculatedValue) FROM #SalaryResult WHERE CompType = 'Contribution';
        SELECT @TotalEarning = SUM(CalculatedValue) FROM #SalaryResult WHERE CompType = 'Earning';

        SET @NetPay = @TotalEarning - @TotalDeduction;
        SET @CTC = @TotalEarning + @TotalContribution;

        -- Final result set
        SELECT * FROM #SalaryResult;

        SELECT @TotalEarning AS Earning, @TotalDeduction AS Deduction, 
               @TotalContribution AS Contribution, @CTC AS CTC, 
               @NetPay AS NetPay, @Salary AS GrossSalary;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR('Error in spu_GetSalaryCalculation: %s', 16, 1, @ErrorMessage);
    END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[spu_GetSalaryCalculation_test]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--spu_GetSalaryCalculation 1,1,11391
create PROC [dbo].[spu_GetSalaryCalculation_test] (@SalaryStID INT, @EMPID INT, @Salary DECIMAL(18, 2))
AS
BEGIN
    BEGIN TRY
        DECLARE @NetPay DECIMAL(18, 2), @TotalDeduction DECIMAL(18, 2),@TotalContribution DECIMAL(18, 2), @TotalEarning DECIMAL(18, 2),@CTC DECIMAL(18, 2);

        IF OBJECT_ID('tempdb..#SalaryResult') IS NOT NULL
        BEGIN
            DROP TABLE #SalaryResult;
        END

        SELECT C.CompID, C.CompCode, C.CompName, C.CompType, S.StructCode, ST.Formula, ST.Amount, ST.Condition
        INTO #SalaryResult
        FROM Salary_StructureTran AS ST
        INNER JOIN Salary_Structure AS S ON S.StructID = ST.StructID
        INNER JOIN Salary_Component AS C ON C.CompID = ST.CompID
        WHERE S.StructID = @SalaryStID AND S.IsDeleted = 0 AND S.IsActive = 1;

		select * from #SalaryResult
        UPDATE #SalaryResult
        SET Formula = REPLACE(Formula, '#base', CAST(@Salary AS NVARCHAR));

        ALTER TABLE #SalaryResult 
        ADD CalculatedValue DECIMAL(18, 2);

		
        DECLARE @Formula VARCHAR(MAX),@CompID INT,@CalculatedValue DECIMAL(18, 2),@CompCode varchar(50)
		DECLARE Cur CURSOR FOR
        SELECT CompID, Formula FROM #SalaryResult;
        OPEN Cur;
        FETCH NEXT FROM Cur INTO @CompID, @Formula;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Execute the formula and calculate the value
            DECLARE @SQL NVARCHAR(MAX) = 'SELECT @Result = ' + @Formula;
            EXEC sp_executesql @SQL, N'@Result DECIMAL(18,2) OUTPUT', @Result = @CalculatedValue OUTPUT;

            -- Update the calculated value in the temp table
            UPDATE #SalaryResult 
            SET CalculatedValue = @CalculatedValue 
            WHERE CompID = @CompID;

            FETCH NEXT FROM Cur INTO @CompID, @Formula;
        END;
        CLOSE Cur;
        DEALLOCATE Cur;

		select * from #SalaryResult
		-- rechecking formula has the code exits then replace
		--UPDATE #SalaryResult
		--SET Formula = REPLACE(Formula, CONCAT('#', CompCode), CalculatedValue)
		--WHERE CHARINDEX(CONCAT('#', CompCode), Formula) > 0;

		DECLARE FinalCur CURSOR FOR
        SELECT CompID,Formula FROM #SalaryResult;
        OPEN FinalCur;
        FETCH NEXT FROM FinalCur INTO @CompID,@Formula;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Execute the formula and calculate the value
            set @SQL= 'SELECT @Result = ' + @Formula;
            EXEC sp_executesql @SQL, N'@Result DECIMAL(18,2) OUTPUT', @Result = @CalculatedValue OUTPUT;

            -- Update the calculated value in the temp table
            UPDATE #SalaryResult 
            SET CalculatedValue = @CalculatedValue 
            WHERE CompID = @CompID;

            FETCH NEXT FROM FinalCur INTO @CompID, @Formula;
        END;

        CLOSE FinalCur;
        DEALLOCATE FinalCur;

        SELECT @TotalDeduction = SUM(CalculatedValue) FROM #SalaryResult WHERE CompType = 'Deduction';
        SELECT @TotalContribution = SUM(CalculatedValue) FROM #SalaryResult WHERE CompType = 'Contribution';
        SELECT @TotalEarning = SUM(CalculatedValue) FROM #SalaryResult WHERE CompType = 'Earning';

        SELECT @NetPay = @TotalEarning - @TotalDeduction;
        SELECT @CTC = @TotalEarning + @TotalContribution;

        SELECT * FROM #SalaryResult;

        SELECT @TotalEarning AS Earning,@TotalDeduction as Deduction,@TotalContribution as Contribution,
               @CTC AS CTC,
               @NetPay AS NetPay,
			   @Salary as GrossSalary;
    END TRY
    BEGIN CATCH
        -- Capture error details
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;
        DECLARE @ErrorLine INT;
        DECLARE @ErrorProcedure NVARCHAR(128);
        DECLARE @ErrorNumber INT;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE(),
               @ErrorLine = ERROR_LINE(),
               @ErrorProcedure = ERROR_PROCEDURE(),
               @ErrorNumber = ERROR_NUMBER();

        -- Print error details
        RAISERROR('Error Number: %d, Severity: %d, State: %d, Procedure: %s, Line: %d, Message: %s',
                   16, 1, @ErrorNumber, @ErrorSeverity, @ErrorState, @ErrorProcedure, @ErrorLine, @ErrorMessage);

        -- Optionally, you can log the error into a table for further analysis
        -- INSERT INTO ErrorLog (ErrorNumber, ErrorMessage, ErrorSeverity, ErrorState, ErrorProcedure, ErrorLine, CreatedAt)
        -- VALUES (@ErrorNumber, @ErrorMessage, @ErrorSeverity, @ErrorState, @ErrorProcedure, @ErrorLine, GETDATE());
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spu_GetSalaryComponentList]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spu_GetSalaryComponentList](@LoginID int, @CompID int)
as
begin
SELECT [CompID]
      ,[CompCode]
      ,[CompName]
      ,[CompType]
      ,[Description]
      ,[IsDepend_PD]
      ,[IsTaxApplicable]
      ,[IsStatisticalComp]
      ,[IsRemoveZero]
      ,[EntrySource]
      ,[IsActive]
      ,[Priority]
      ,[Isdeleted]
      ,[DeletedBy]
      ,[DeletedDate]
      ,[CreatedBy]
      ,[CreatedDate]
      ,[ModifiedDate]
      ,[ModifiedBy]
      ,[IPAddress]
  FROM [dev.Payroll].[dbo].[Salary_Component]
  where Isdeleted=0
end
GO
/****** Object:  StoredProcedure [dbo].[spu_GetSalaryStructuresList]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spu_GetSalaryStructuresList](@LoginID int, @StructID int)
as
begin
SELECT [StructID]
      ,[StructCode]
      ,[Description]
      ,[EntrySource]
      ,[IsActive]
      ,[Priority]
      ,[Isdeleted]
      ,[DeletedBy]
      ,[DeletedDate]
      ,[CreatedBy]
      ,[CreatedDate]
      ,[ModifiedDate]
      ,[ModifiedBy]
      ,[IPAddress]
  FROM [dev.Payroll].[dbo].[Salary_Structure]
  where Isdeleted=0
end
GO
/****** Object:  StoredProcedure [dbo].[spu_GetSalaryStructureTranList]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--spu_GetSalaryStructureTranList 1,0,1,'Earning'
CREATE proc [dbo].[spu_GetSalaryStructureTranList](@LoginID int, @StructTranID int,@StructID int,@DocType varchar(20))
as
begin
SELECT  t.[StructTranID]
      ,t.[StructID]
      ,t.[Doctype]
      ,t.[CompID]
      ,t.[Amount]
      ,t.[Condition]
      ,t.[Formula]
      ,t.[EntrySource]
      ,t.[IsActive]
      ,t.[Priority]
      ,t.[Isdeleted]
      ,t.[DeletedBy]
      ,t.[DeletedDate]
      ,t.[CreatedBy]
      ,t.[CreatedDate]
      ,t.[ModifiedDate]
      ,t.[ModifiedBy]
      ,t.[IPAddress]
	  ,c.CompName as Component
	  ,s.StructCode as Structure
  FROM [dev.Payroll].[dbo].[Salary_StructureTran] t
  left join [dbo].[Salary_Component] c on c.CompID=t.CompID
  left join [dbo].[Salary_Structure] s on s.StructID=t.StructID
  where t.Doctype=@DocType and t.StructID=@StructID and t.Isdeleted=0
end
GO
/****** Object:  StoredProcedure [dbo].[spu_GetStateList]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spu_GetStateList](@LoginID int)
as
begin
SELECT s.[ID]
      ,s.[StateCode]
      ,s.[StateName]
      ,s.[Description]
      ,s.[GroupID]
	  ,r.RegionName as Region
      ,s.[EntrySource]
      ,s.[IsActive]
      ,s.[Priority]
      ,s.[Isdeleted]
      ,s.[DeletedBy]
      ,s.[DeletedDate]
      ,s.[CreatedBy]
      ,s.[CreatedDate]
      ,s.[ModifiedDate]
      ,s.[ModifiedBy]
      ,s.[IPAddress]
  FROM [dev.Payroll].[dbo].[Masters_State] s
  LEFT JOIN [dbo].[Masters_Region] r on r.ID=s.GroupID
  where s.isdeleted=0
  end
GO
/****** Object:  StoredProcedure [dbo].[spu_SetSalaryAssignment]    Script Date: 05-11-2024 05:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--spu_SetSalaryAssignment 1,1,'01-01-2024',18000,'Web',1,''
CREATE proc [dbo].[spu_SetSalaryAssignment](@SalaryStructID int,@EMPID int,@StartDate varchar(50),@GrossSalary decimal(18,2), @EntrySource varchar(50),@CreatedBy int,@IPAddress varchar(50))
as
begin
declare @RET_ID int=0,@Status int,@Message varchar(500)
BEGIN TRY	
	--if exists(select SAID from Salary_Assignment where Isdeleted=0 and EMPID=@EMPID)
	--throw 51000,'Record already exists',1

	--insert into Salary_Assignment(SalaryStructID, EMPID, StartDate, GrossSalary, EntrySource, CreatedBy, ModifiedBy, IPAddress)
	--values(@SalaryStructID,@EMPID,@StartDate,@GrossSalary,@EntrySource,@CreatedBy,@CreatedBy,@IPAddress)

	--select @RET_ID= SCOPE_IDENTITY();

	Declare @structureTable table(CompID int,Doctype varchar(50),Amount decimal(18,2),Condition varchar(500),Formula varchar(500),CalulativeAmount decimal(18,2))

	insert into @structureTable(CompID,Doctype,Amount,Condition,Formula)
	select st.CompID,st.Doctype,st.Amount,st.Condition,st.Formula from Salary_Structure as s
	inner join Salary_StructureTran as st on st.StructID=s.StructID and st.Isdeleted=0
	where s.Isdeleted=0 and s.StructID=@SalaryStructID

	update @structureTable set CalulativeAmount=(@GrossSalary*0.5)
	where Formula='Gross*0.5'

	update @structureTable set CalulativeAmount=((@GrossSalary*0.5)*0.5)
	where Formula='Basic*0.5'

	update @structureTable set CalulativeAmount=((@GrossSalary*0.5)*0.0833)
	where Formula='Basic*8.33'

	update @structureTable set CalulativeAmount=(@GrossSalary*0.20835)
	where Formula='Gross*0.25'

	--insert into Salary_AssignmentBreakUp(SAID,CompID,BreakUpAmount,EntrySource, CreatedBy, ModifiedBy, IPAddress)
	--select @RET_ID,a.CompID,a.CalulativeAmount,@EntrySource,@CreatedBy,@CreatedBy,@IPAddress 
	--from @structureTable as a
	--inner join Salary_Component as c on c.CompID=a.CompID and c.Isdeleted=0


	select c.CompCode,c.CompName,a.Formula,a.CalulativeAmount 
	from @structureTable as a
	inner join Salary_Component as c on c.CompID=a.CompID and c.Isdeleted=0
	union all
	select '' as CompCode,'' as CompName,'Total' as Formula,sum(CalulativeAmount) as CalulativeAmount
	from @structureTable

END TRY
BEGIN CATCH
			set @Status=-1
			set @Message= ERROR_MESSAGE()
END CATCH

select @RET_ID as RET_ID,@Status as [Status],@Message as [Message]

end
GO
