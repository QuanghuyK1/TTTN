USE [master]
GO
/****** Object:  Database [HospitalDatabase]    Script Date: 9/26/2023 8:45:11 PM ******/
CREATE DATABASE [HospitalDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HospitalDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HospitalDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HospitalDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [HospitalDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HospitalDatabase', N'ON'
GO
ALTER DATABASE [HospitalDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [HospitalDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HospitalDatabase]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Roleid] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NULL,
	[Description] [nvarchar](2000) NULL,
	[Date] [date] NULL,
	[Username] [nvarchar](200) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Personid] [int] NULL,
	[CertificateName] [nvarchar](500) NULL,
	[Description] [nvarchar](2000) NULL,
	[Usedate] [date] NULL,
	[Img] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](100) NULL,
	[Img] [nvarchar](3000) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Date] [date] NULL,
	[Blogid] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[PhoneNumber] [nchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Classid] [int] NULL,
	[Username] [nvarchar](200) NULL,
	[Birthday] [date] NULL,
	[Description] [nvarchar](2000) NULL,
	[Identification] [nchar](10) NULL,
	[SalaryBasic] [int] NULL,
	[Img] [nvarchar](2000) NULL,
	[EmployeeRoleId] [int] NULL,
	[Address] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeRole]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](400) NULL,
 CONSTRAINT [PK_EmployeeRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospital health insurance]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital health insurance](
	[InsuranceID] [varchar](50) NOT NULL,
	[HospitalName] [nvarchar](500) NULL,
	[Fee] [int] NULL,
	[Usedate] [date] NULL,
	[Startus] [int] NULL,
	[Img] [nvarchar](2000) NULL,
	[Firstname] [nvarchar](500) NULL,
	[Lastname] [nvarchar](500) NULL,
	[Birthday] [date] NULL,
	[Createday] [date] NULL,
 CONSTRAINT [PK_Hospital health insurance] PRIMARY KEY CLUSTERED 
(
	[InsuranceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NULL,
	[Usedate] [date] NULL,
	[Description] [nvarchar](2000) NULL,
	[Nationid] [int] NULL,
	[Price] [int] NULL,
	[Getdate] [date] NULL,
	[HandlePrice] [int] NULL,
	[Startus] [int] NULL,
	[Img] [nvarchar](2000) NULL,
	[Count] [int] NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineBill]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineBill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BillCode] [nchar](10) NULL,
	[Medicineid] [int] NULL,
	[Serviceid] [int] NULL,
	[Count] [int] NULL,
	[TotalPrice] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_MedicineBill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_MedicineBill] UNIQUE NONCLUSTERED 
(
	[BillCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nation]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NULL,
 CONSTRAINT [PK_Nation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NULL,
	[PhoneNumber] [nchar](10) NULL,
	[Email] [varchar](50) NULL,
	[InsuranceId] [varchar](50) NULL,
	[Username] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[Img] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](400) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Eventname] [nvarchar](500) NULL,
	[Starttime] [datetime] NULL,
	[Endtime] [datetime] NULL,
	[Locationid] [int] NULL,
	[Description] [nvarchar](2000) NULL,
	[Patientid] [int] NULL,
	[Employeeid] [int] NULL,
	[Status] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[PhoneNumber] [nchar](10) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[EmployeeId] [int] NULL,
	[TypeServiceId] [int] NULL,
	[Decription] [nvarchar](2000) NULL,
	[GetDate] [date] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeService]    Script Date: 9/26/2023 8:45:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](500) NULL,
	[Price] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_TypeService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([Roleid])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Account]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_Employee] FOREIGN KEY([ID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_Employee]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Blog] FOREIGN KEY([Blogid])
REFERENCES [dbo].[Blog] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Blog]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Account]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Class] FOREIGN KEY([Classid])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Class]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeRole] FOREIGN KEY([EmployeeRoleId])
REFERENCES [dbo].[EmployeeRole] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeRole]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Nation] FOREIGN KEY([Nationid])
REFERENCES [dbo].[Nation] ([ID])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_Nation]
GO
ALTER TABLE [dbo].[MedicineBill]  WITH CHECK ADD  CONSTRAINT [FK_MedicineBill_Medicine] FOREIGN KEY([Medicineid])
REFERENCES [dbo].[Medicine] ([ID])
GO
ALTER TABLE [dbo].[MedicineBill] CHECK CONSTRAINT [FK_MedicineBill_Medicine]
GO
ALTER TABLE [dbo].[MedicineBill]  WITH CHECK ADD  CONSTRAINT [FK_MedicineBill_Service] FOREIGN KEY([Serviceid])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[MedicineBill] CHECK CONSTRAINT [FK_MedicineBill_Service]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Account]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Hospital health insurance] FOREIGN KEY([InsuranceId])
REFERENCES [dbo].[Hospital health insurance] ([InsuranceID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Hospital health insurance]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Employee] FOREIGN KEY([Employeeid])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Employee]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Location] FOREIGN KEY([Locationid])
REFERENCES [dbo].[Location] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Location]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Patient] FOREIGN KEY([Patientid])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Patient]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Employee]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Patient]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_TypeService] FOREIGN KEY([TypeServiceId])
REFERENCES [dbo].[TypeService] ([ID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_TypeService]
GO
USE [master]
GO
ALTER DATABASE [HospitalDatabase] SET  READ_WRITE 
GO
