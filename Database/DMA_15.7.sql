USE [master]
GO
/****** Object:  Database [DocumentManagement]    Script Date: 7/15/2022 2:35:38 PM ******/
CREATE DATABASE [DocumentManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DocumentManagement', FILENAME = N'D:\Setup\zProgram Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DocumentManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DocumentManagement_log', FILENAME = N'D:\Setup\zProgram Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DocumentManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DocumentManagement] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DocumentManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DocumentManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DocumentManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DocumentManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DocumentManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DocumentManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [DocumentManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DocumentManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DocumentManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DocumentManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DocumentManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DocumentManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DocumentManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DocumentManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DocumentManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DocumentManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DocumentManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DocumentManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DocumentManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DocumentManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DocumentManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DocumentManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DocumentManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DocumentManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [DocumentManagement] SET  MULTI_USER 
GO
ALTER DATABASE [DocumentManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DocumentManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DocumentManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DocumentManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DocumentManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DocumentManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DocumentManagement', N'ON'
GO
ALTER DATABASE [DocumentManagement] SET QUERY_STORE = OFF
GO
USE [DocumentManagement]
GO
/****** Object:  Table [dbo].[FileInFolder]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileInFolder](
	[projectId] [int] NOT NULL,
	[parentFolderId] [nvarchar](50) NOT NULL,
	[childFileName] [nvarchar](50) NOT NULL,
	[childFileId] [nvarchar](50) NULL,
 CONSTRAINT [PK_FileInFolder] PRIMARY KEY CLUSTERED 
(
	[projectId] ASC,
	[parentFolderId] ASC,
	[childFileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileInFolderUser]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileInFolderUser](
	[userId] [nvarchar](50) NOT NULL,
	[parentFolderId] [nvarchar](50) NOT NULL,
	[childFileName] [nvarchar](50) NOT NULL,
	[childFileId] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[fileId] [nvarchar](50) NULL,
	[webViewLink] [nvarchar](max) NULL,
	[modifiedTime] [nvarchar](50) NULL,
	[size] [int] NULL,
	[trashed] [bit] NULL,
	[starred] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FolderInFolder]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FolderInFolder](
	[projectId] [int] NOT NULL,
	[parentFolderId] [nvarchar](50) NOT NULL,
	[childFolderName] [nvarchar](50) NOT NULL,
	[childFolderId] [nvarchar](50) NULL,
	[parentsFolderName] [nvarchar](max) NULL,
	[parentsFolderId] [nvarchar](max) NULL,
 CONSTRAINT [PK_FolderInFolder] PRIMARY KEY CLUSTERED 
(
	[projectId] ASC,
	[parentFolderId] ASC,
	[childFolderName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FolderInFolderUser]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FolderInFolderUser](
	[userId] [nvarchar](50) NOT NULL,
	[parentFolderId] [nvarchar](50) NOT NULL,
	[childFolderName] [nvarchar](50) NOT NULL,
	[childFolderId] [nvarchar](50) NULL,
	[parentsFolderName] [nvarchar](max) NULL,
	[parentsFolderId] [nvarchar](max) NULL,
 CONSTRAINT [PK_FolderInFolderUser] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[parentFolderId] ASC,
	[childFolderName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Folders]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Folders](
	[folderId] [nvarchar](50) NOT NULL,
	[trashed] [bit] NULL,
	[starred] [bit] NULL,
 CONSTRAINT [PK_Folders] PRIMARY KEY CLUSTERED 
(
	[folderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[permissionId] [int] IDENTITY(1,1) NOT NULL,
	[fileId] [nvarchar](50) NULL,
	[userId] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[permissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedbacks]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedbacks](
	[feedback_id] [int] NULL,
	[user_id] [nvarchar](50) NULL,
	[subject] [nvarchar](50) NULL,
	[details] [nvarchar](max) NULL,
	[option] [nvarchar](50) NULL,
	[created_date] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMembership]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMembership](
	[membershipID] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NULL,
	[user_id] [nvarchar](50) NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
 CONSTRAINT [PK_tblMembership] PRIMARY KEY CLUSTERED 
(
	[membershipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjects]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjects](
	[project_id] [int] IDENTITY(1,1) NOT NULL,
	[projectName] [nvarchar](50) NULL,
	[projectDesc] [nvarchar](250) NULL,
	[manager_id] [nvarchar](50) NULL,
	[createdDate] [date] NULL,
	[isDeleted] [bit] NULL,
	[startProjectDate] [date] NULL,
	[endProjectDate] [date] NULL,
 CONSTRAINT [PK_tblProjects] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](2) NOT NULL,
	[roleName] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/15/2022 2:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[roleID] [varchar](2) NOT NULL,
	[password] [nvarchar](15) NOT NULL,
	[address] [nvarchar](50) NULL,
	[birthday] [date] NULL,
	[phoneNumber] [nvarchar](12) NULL,
	[email] [nvarchar](50) NOT NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__tblUsers__CB9A1CDF03317E3D] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[FileInFolder] ([projectId], [parentFolderId], [childFileName], [childFileId]) VALUES (1, N'null', N'nature-scene.png', N'1C9O2Iirn7dFYVAaH_vKRHNcVlbhrVATH')
INSERT [dbo].[FileInFolder] ([projectId], [parentFolderId], [childFileName], [childFileId]) VALUES (1, N'null', N'New Microsoft PowerPoint Presentation.pptx', N'124GBkqFXVJ6CJMSTZH9Q0S4CXOdKW0mC')
INSERT [dbo].[FileInFolder] ([projectId], [parentFolderId], [childFileName], [childFileId]) VALUES (1, N'null', N'New Microsoft Word Document.docx', N'19KK3uFLrYvo7fZFA0AILLPp0pY-l5BbH')
INSERT [dbo].[FileInFolder] ([projectId], [parentFolderId], [childFileName], [childFileId]) VALUES (1, N'null', N'test1.txt', N'1rIjd-fAHoTDoD5HXSSXnorHnxlg0nelI')
INSERT [dbo].[FileInFolder] ([projectId], [parentFolderId], [childFileName], [childFileId]) VALUES (1, N'null', N'tumnulit.jpg', N'1w8E-6vX7DtCmLNuW6aDW7EuqiOYf8LtS')
GO
INSERT [dbo].[FileInFolderUser] ([userId], [parentFolderId], [childFileName], [childFileId]) VALUES (N'nhantt', N'null', N'avatar.jpg', N'1TWdQ1rgWpHIUIvFLrSUHDL1EVjCV4InH')
INSERT [dbo].[FileInFolderUser] ([userId], [parentFolderId], [childFileName], [childFileId]) VALUES (N'nhantt', N'1zfOJ5xU9Q-fyGoywovuzMObEoS7lkrFR', N'avatar.jpg', N'1Wyog1PEqHjIChxLeSCoue7bPeVUzH3O_')
INSERT [dbo].[FileInFolderUser] ([userId], [parentFolderId], [childFileName], [childFileId]) VALUES (N'nhantt', N'null', N'Copy of avatar.jpg', N'1AdyVe8upIJObIoMUZDTBZk_uLaRjKcuZ')
GO
INSERT [dbo].[Files] ([fileId], [webViewLink], [modifiedTime], [size], [trashed], [starred]) VALUES (N'1TWdQ1rgWpHIUIvFLrSUHDL1EVjCV4InH', NULL, NULL, NULL, 0, 0)
INSERT [dbo].[Files] ([fileId], [webViewLink], [modifiedTime], [size], [trashed], [starred]) VALUES (N'1rIjd-fAHoTDoD5HXSSXnorHnxlg0nelI', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Files] ([fileId], [webViewLink], [modifiedTime], [size], [trashed], [starred]) VALUES (N'1C9O2Iirn7dFYVAaH_vKRHNcVlbhrVATH', NULL, NULL, NULL, 0, 0)
INSERT [dbo].[Files] ([fileId], [webViewLink], [modifiedTime], [size], [trashed], [starred]) VALUES (N'1Wyog1PEqHjIChxLeSCoue7bPeVUzH3O_', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Files] ([fileId], [webViewLink], [modifiedTime], [size], [trashed], [starred]) VALUES (N'1w8E-6vX7DtCmLNuW6aDW7EuqiOYf8LtS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Files] ([fileId], [webViewLink], [modifiedTime], [size], [trashed], [starred]) VALUES (N'19KK3uFLrYvo7fZFA0AILLPp0pY-l5BbH', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Files] ([fileId], [webViewLink], [modifiedTime], [size], [trashed], [starred]) VALUES (N'124GBkqFXVJ6CJMSTZH9Q0S4CXOdKW0mC', NULL, NULL, NULL, 0, 0)
INSERT [dbo].[Files] ([fileId], [webViewLink], [modifiedTime], [size], [trashed], [starred]) VALUES (N'1AdyVe8upIJObIoMUZDTBZk_uLaRjKcuZ', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FolderInFolder] ([projectId], [parentFolderId], [childFolderName], [childFolderId], [parentsFolderName], [parentsFolderId]) VALUES (1, N'1-Ub2Ny7fG98ax4lwO1he4X6GcpA8r7qS', N'b', N'1gJfsK-16iMOBPV09Kf1XCAGZvdATHNmp', N'null/a', N'null/1-Ub2Ny7fG98ax4lwO1he4X6GcpA8r7qS')
INSERT [dbo].[FolderInFolder] ([projectId], [parentFolderId], [childFolderName], [childFolderId], [parentsFolderName], [parentsFolderId]) VALUES (1, N'1-Ub2Ny7fG98ax4lwO1he4X6GcpA8r7qS', N'c', N'1GbmiJKjvRRlRAJJFVmGYPWslUczLPY0A', N'null/a', N'null/1-Ub2Ny7fG98ax4lwO1he4X6GcpA8r7qS')
INSERT [dbo].[FolderInFolder] ([projectId], [parentFolderId], [childFolderName], [childFolderId], [parentsFolderName], [parentsFolderId]) VALUES (1, N'null', N'a', N'1-Ub2Ny7fG98ax4lwO1he4X6GcpA8r7qS', N'null', N'null')
GO
INSERT [dbo].[FolderInFolderUser] ([userId], [parentFolderId], [childFolderName], [childFolderId], [parentsFolderName], [parentsFolderId]) VALUES (N'nhantt', N'1zfOJ5xU9Q-fyGoywovuzMObEoS7lkrFR', N'b', N'1gM8BImCmGjSGjxsJMpbHhQm67GNMWeI0', N'null/a', N'null/1zfOJ5xU9Q-fyGoywovuzMObEoS7lkrFR')
INSERT [dbo].[FolderInFolderUser] ([userId], [parentFolderId], [childFolderName], [childFolderId], [parentsFolderName], [parentsFolderId]) VALUES (N'nhantt', N'1zfOJ5xU9Q-fyGoywovuzMObEoS7lkrFR', N'c', N'1xe_ZoIRzWtZZoV41LuG87G-ttUhMI3DU', N'null/a', N'null/1zfOJ5xU9Q-fyGoywovuzMObEoS7lkrFR')
INSERT [dbo].[FolderInFolderUser] ([userId], [parentFolderId], [childFolderName], [childFolderId], [parentsFolderName], [parentsFolderId]) VALUES (N'nhantt', N'null', N'a', N'1zfOJ5xU9Q-fyGoywovuzMObEoS7lkrFR', N'null', N'null')
GO
INSERT [dbo].[Folders] ([folderId], [trashed], [starred]) VALUES (N'1A9LF4-gpYfBb3gpx_g7Ij49d6k1J3-q1', NULL, NULL)
INSERT [dbo].[Folders] ([folderId], [trashed], [starred]) VALUES (N'1dkDJiOzMfxKMsiNPzLJEE59paq0_KHJX', NULL, NULL)
INSERT [dbo].[Folders] ([folderId], [trashed], [starred]) VALUES (N'1GbmiJKjvRRlRAJJFVmGYPWslUczLPY0A', NULL, NULL)
INSERT [dbo].[Folders] ([folderId], [trashed], [starred]) VALUES (N'1gJfsK-16iMOBPV09Kf1XCAGZvdATHNmp', NULL, NULL)
INSERT [dbo].[Folders] ([folderId], [trashed], [starred]) VALUES (N'1jWaHVfWHD_j3iDwZXaOk2XMcazIOQ1N9', NULL, NULL)
INSERT [dbo].[Folders] ([folderId], [trashed], [starred]) VALUES (N'1nWOQrR9g5f_B6FzCGPQDQtDFT6u3ubiy', NULL, NULL)
INSERT [dbo].[Folders] ([folderId], [trashed], [starred]) VALUES (N'1-Ub2Ny7fG98ax4lwO1he4X6GcpA8r7qS', NULL, NULL)
INSERT [dbo].[Folders] ([folderId], [trashed], [starred]) VALUES (N'1xe_ZoIRzWtZZoV41LuG87G-ttUhMI3DU', NULL, NULL)
INSERT [dbo].[Folders] ([folderId], [trashed], [starred]) VALUES (N'1zfOJ5xU9Q-fyGoywovuzMObEoS7lkrFR', NULL, NULL)
GO
INSERT [dbo].[tblFeedbacks] ([feedback_id], [user_id], [subject], [details], [option], [created_date]) VALUES (20, N'nhantt', N'1', N'1', N'2', NULL)
INSERT [dbo].[tblFeedbacks] ([feedback_id], [user_id], [subject], [details], [option], [created_date]) VALUES (22, N'nhantt', N'123', N'123', N'3', NULL)
INSERT [dbo].[tblFeedbacks] ([feedback_id], [user_id], [subject], [details], [option], [created_date]) VALUES (24, N'nhantt', N'dsadsa', N'dsadsa', N'', NULL)
INSERT [dbo].[tblFeedbacks] ([feedback_id], [user_id], [subject], [details], [option], [created_date]) VALUES (25, N'nhantt', N'dsadasd', N'dsasdsdbgh', N'', NULL)
INSERT [dbo].[tblFeedbacks] ([feedback_id], [user_id], [subject], [details], [option], [created_date]) VALUES (27, N'nhantt', N'1', N'dsadsaasd', N'', NULL)
INSERT [dbo].[tblFeedbacks] ([feedback_id], [user_id], [subject], [details], [option], [created_date]) VALUES (29, N'nhantt', N'dsadsddhrhth', N'gfhhgvhfgh', N'', NULL)
INSERT [dbo].[tblFeedbacks] ([feedback_id], [user_id], [subject], [details], [option], [created_date]) VALUES (30, N'nhantt', N'dsadsddhrhth', N'', N'', NULL)
GO
SET IDENTITY_INSERT [dbo].[tblMembership] ON 

INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (1, 1, N'nhantt', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (3, 2, N'nhantt', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (4, 3, N'nhantt', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (5, 4, N'nhantt', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (6, 4, N'Nam180501', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-06' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (7, 5, N'nhantt', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (8, 6, N'Nam180501', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (9, 7, N'Nam180501', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (10, 8, N'Nam180501', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (11, 9, N'Nam180501', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (12, 2, N'Nam180501', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (13, 8, N'Nam180501', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (14, 10, N'Nam180501', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[tblMembership] ([membershipID], [project_id], [user_id], [startDate], [endDate]) VALUES (15, 11, N'Nam180501', CAST(N'2022-07-01' AS Date), CAST(N'2022-07-07' AS Date))
SET IDENTITY_INSERT [dbo].[tblMembership] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProjects] ON 

INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (1, N'CPD Platform', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-06-30' AS Date), 0, CAST(N'2022-06-30' AS Date), CAST(N'2022-07-01' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (2, N'CentOS 7 EOL', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-06-30' AS Date), 0, CAST(N'2022-06-30' AS Date), CAST(N'2022-07-01' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (3, N'E-Parking Challan', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-06-30' AS Date), 0, CAST(N'2022-06-30' AS Date), CAST(N'2022-07-01' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (4, N'Personality Analysis', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-06-30' AS Date), 0, CAST(N'2022-07-08' AS Date), CAST(N'2022-07-23' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (5, N'A Liar Robot', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-06-30' AS Date), 0, CAST(N'2022-07-09' AS Date), CAST(N'2022-07-23' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (6, N'Virtual Class Room', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-06-30' AS Date), 0, CAST(N'2022-06-30' AS Date), CAST(N'2022-07-09' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (7, N'Daily Route Planner', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-07-01' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-01' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (8, N'Train Ticketing', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-07-01' AS Date), 0, CAST(N'2022-07-01' AS Date), CAST(N'2022-07-01' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (9, N'E-Learning Platform', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-07-01' AS Date), 0, CAST(N'2022-07-01' AS Date), CAST(N'2022-07-16' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (10, N'Grow Smartly ', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-07-01' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-09' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (11, N'Revenue Recovery', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-07-01' AS Date), 0, CAST(N'2022-07-01' AS Date), CAST(N'2022-07-16' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (12, N'Task Monitoring', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-07-01' AS Date), 0, CAST(N'2022-07-16' AS Date), CAST(N'2022-08-07' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (13, N'Doctors on Hand', N'This project will develop a module offered to level 2 Undergraduate students and will seek to 
develop student’s skills in collaborative working and information literacy while still advancing 
their discipline knowledge', N'nhantt', CAST(N'2022-07-06' AS Date), 0, CAST(N'2022-07-09' AS Date), CAST(N'2022-07-16' AS Date))
INSERT [dbo].[tblProjects] ([project_id], [projectName], [projectDesc], [manager_id], [createdDate], [isDeleted], [startProjectDate], [endProjectDate]) VALUES (14, N'a', N'abc', N'nhantt', CAST(N'2022-07-11' AS Date), 0, CAST(N'2022-07-13' AS Date), CAST(N'2022-07-22' AS Date))
SET IDENTITY_INSERT [dbo].[tblProjects] OFF
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Administrator')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password], [address], [birthday], [phoneNumber], [email], [isDeleted]) VALUES (N'admin', N'Administrator', N'AD', N'1', N'Ho Chi Minh', CAST(N'2001-01-15' AS Date), N'0939410359', N'truongthanhnhan4561@gmail.com', 0)
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password], [address], [birthday], [phoneNumber], [email], [isDeleted]) VALUES (N'Nam180501', N'Dao Duy Nam', N'US', N'1', N'Ho Chi Minh', CAST(N'2001-05-18' AS Date), N'0939410359', N'duynam151@gmail.com', 0)
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password], [address], [birthday], [phoneNumber], [email], [isDeleted]) VALUES (N'Nhantt', N'Truong Thanh Nhan', N'US', N'1', N'Ho Chi Minh', CAST(N'2001-02-14' AS Date), N'0903348731', N'administrator@fe.edu.vn', 0)
GO
ALTER TABLE [dbo].[tblMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblMembership_tblProjects] FOREIGN KEY([project_id])
REFERENCES [dbo].[tblProjects] ([project_id])
GO
ALTER TABLE [dbo].[tblMembership] CHECK CONSTRAINT [FK_tblMembership_tblProjects]
GO
ALTER TABLE [dbo].[tblMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblMembership_tblUsers] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblMembership] CHECK CONSTRAINT [FK_tblMembership_tblUsers]
GO
USE [master]
GO
ALTER DATABASE [DocumentManagement] SET  READ_WRITE 
GO
