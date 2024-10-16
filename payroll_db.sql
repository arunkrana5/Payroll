USE [dev.Payroll]
GO
/****** Object:  Table [dbo].[AppRoles]    Script Date: 16-10-2024 12:22:00 PM ******/
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
/****** Object:  Table [dbo].[AppUsers]    Script Date: 16-10-2024 12:22:00 PM ******/
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
/****** Object:  Table [dbo].[Salary_Assignment]    Script Date: 16-10-2024 12:22:00 PM ******/
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
/****** Object:  Table [dbo].[Salary_AssignmentBreakUp]    Script Date: 16-10-2024 12:22:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary_AssignmentBreakUp](
	[SABreakID] [bigint] NOT NULL,
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
/****** Object:  Table [dbo].[Salary_Component]    Script Date: 16-10-2024 12:22:00 PM ******/
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
/****** Object:  Table [dbo].[Salary_Structure]    Script Date: 16-10-2024 12:22:00 PM ******/
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
/****** Object:  Table [dbo].[Salary_StructureTran]    Script Date: 16-10-2024 12:22:00 PM ******/
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
SET IDENTITY_INSERT [dbo].[AppUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary_Assignment] ON 
GO
INSERT [dbo].[Salary_Assignment] ([SAID], [SalaryStructID], [EMPID], [StartDate], [GrossSalary], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, 1, 1, CAST(N'2024-01-01' AS Date), CAST(25000.00 AS Decimal(18, 2)), N'Web', 1, 0, 0, 0, NULL, 1, CAST(N'2024-10-16T10:09:34.960' AS DateTime), CAST(N'2024-10-16T10:09:34.960' AS DateTime), 1, N'')
GO
SET IDENTITY_INSERT [dbo].[Salary_Assignment] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary_Component] ON 
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, N'Basic', N'Basic', N'Earning', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-13T10:57:36.353' AS DateTime), CAST(N'2024-10-13T10:57:36.353' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (2, N'HRA', N'HRA', N'Earning', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-13T10:57:53.453' AS DateTime), CAST(N'2024-10-13T10:57:53.453' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (3, N'Allowances', N'Allowances', N'Earning', N'', 0, 0, 0, 0, N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-13T10:58:14.913' AS DateTime), CAST(N'2024-10-13T10:58:14.913' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Component] ([CompID], [CompCode], [CompName], [CompType], [Description], [IsDepend_PD], [IsTaxApplicable], [IsStatisticalComp], [IsRemoveZero], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (7, N'Statutory Bonus', N'Statutory Bonus', N'Earning', N'', 0, 0, 0, 0, N'Web', 1, 0, 0, 1, NULL, 0, CAST(N'2024-10-15T16:03:21.083' AS DateTime), CAST(N'2024-10-15T16:03:21.203' AS DateTime), 0, N'')
GO
SET IDENTITY_INSERT [dbo].[Salary_Component] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary_Structure] ON 
GO
INSERT [dbo].[Salary_Structure] ([StructID], [StructCode], [Description], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, N'Thrivera', N'It will calculate salary', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-13T10:58:46.737' AS DateTime), CAST(N'2024-10-13T10:58:46.737' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_Structure] ([StructID], [StructCode], [Description], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (2, N'dfgyhghgfyhgfh', N'ghjhjktyuuyi', N'Web', 1, 0, 0, 1, NULL, 0, CAST(N'2024-10-16T11:48:25.327' AS DateTime), CAST(N'2024-10-16T11:48:25.533' AS DateTime), 0, N'')
GO
SET IDENTITY_INSERT [dbo].[Salary_Structure] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary_StructureTran] ON 
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (1, 1, N'Earning', 1, CAST(0.00 AS Decimal(18, 2)), N'', N'Gross*0.5', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-13T11:02:07.400' AS DateTime), CAST(N'2024-10-13T11:02:07.400' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (2, 1, N'Earning', 2, CAST(0.00 AS Decimal(18, 2)), N'', N'Basic*0.5', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-13T11:02:35.827' AS DateTime), CAST(N'2024-10-13T11:02:35.827' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (5, 1, N'Earning', 3, CAST(0.00 AS Decimal(18, 2)), N'', N'Gross*0.25', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-13T11:03:43.253' AS DateTime), CAST(N'2024-10-13T11:03:43.253' AS DateTime), 0, N'')
GO
INSERT [dbo].[Salary_StructureTran] ([StructTranID], [StructID], [Doctype], [CompID], [Amount], [Condition], [Formula], [EntrySource], [IsActive], [Priority], [Isdeleted], [DeletedBy], [DeletedDate], [CreatedBy], [CreatedDate], [ModifiedDate], [ModifiedBy], [IPAddress]) VALUES (6, 1, N'Earning', 7, CAST(0.00 AS Decimal(18, 2)), N'', N'Basic*8.33', N'', 1, 0, 0, 0, NULL, 0, CAST(N'2024-10-16T10:43:52.713' AS DateTime), CAST(N'2024-10-16T10:43:52.713' AS DateTime), 0, N'')
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
/****** Object:  StoredProcedure [dbo].[spu_GetLogin]    Script Date: 16-10-2024 12:22:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spu_SetSalaryAssignment]    Script Date: 16-10-2024 12:22:00 PM ******/
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
