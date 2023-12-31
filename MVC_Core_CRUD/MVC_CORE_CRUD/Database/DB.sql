USE [DB_Restaurant]
GO
/****** Object:  StoredProcedure [dbo].[sp_category_AddToDB]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_category_AddToDB]
@CategoryName nvarchar(25),@Status varchar(10),@ImageName varchar(250)=null
As
begin
insert into[dbo].[Category]([CategoryName],[Status],[ImageName])
values(@CategoryName,@Status,@ImageName)
  
end

GO
/****** Object:  StoredProcedure [dbo].[sp_category_GetALL]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_category_GetALL] 
As
begin
select * from [dbo].[Category]  where Status='Active'
  
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Category_GetFromDB]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_Category_GetFromDB]
@CategoryID int
As
begin

select * from [dbo].[Category] where [CategoryID]=@CategoryID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_category_UpdateToDB]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_category_UpdateToDB]
@CategoryName nvarchar(25),@Status varchar(10),@ImageName varchar(250)=null,
@CategoryID int
As
begin

 IF @ImageName IS NOT NULL
 begin
Update [dbo].[Category]  set  CategoryName=@CategoryName
 ,Status=@Status,
 
 ImageName =@ImageName 
 where CategoryID=@CategoryID;
 end

 else begin

 Update [dbo].[Category]  set  CategoryName=@CategoryName
 ,Status=@Status
 
 where CategoryID=@CategoryID;
 end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_Units_AddToDB]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Units_AddToDB]
@Unit_Name nvarchar(100),@Status varchar(10),@Id int out
as
begin 

insert into Units (Unit_Name,Status)values(@Unit_Name,@Status);
select @Id= @@IDENTITY
end 

GO
/****** Object:  StoredProcedure [dbo].[sp_Units_Delete_FromDB]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_Units_Delete_FromDB]
@UnitID int
as

begin
Update  [dbo].[Units] set Status='InActive'

where UnitID=@UnitID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Units_GetAll]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[sp_Units_GetAll]
as

begin
select * from Units Where Status='Active';

end

GO
/****** Object:  StoredProcedure [dbo].[sp_Units_GetfromDB]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[sp_Units_GetfromDB]
@UnitID int
as

begin
select * from Units Where UnitID=@UnitID

end

GO
/****** Object:  StoredProcedure [dbo].[sp_Units_UpdateToDB]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_Units_UpdateToDB]
@Unit_Name nvarchar(100),@Status varchar(10),@UnitID int
as
begin 

update  Units set Unit_Name=@Unit_Name,Status=@Status 
where UnitID=@UnitID
end 

GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](25) NULL,
	[Status] [varchar](10) NULL,
	[ImageName] [varchar](250) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Code] [nvarchar](100) NULL,
	[Employee_Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeAddress]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeAddress](
	[AddressID] [int] NOT NULL,
	[Employee_ID] [int] NULL,
	[Address] [varchar](100) NULL,
 CONSTRAINT [PK_EmployeeAddress] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeContacts]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeContacts](
	[EmployeeContact_ID] [int] IDENTITY(1,1) NOT NULL,
	[Employee_D] [int] NULL,
	[Contact_No] [varchar](100) NULL,
	[Phone_No] [varchar](100) NULL,
 CONSTRAINT [PK_EmployeeContacts] PRIMARY KEY CLUSTERED 
(
	[EmployeeContact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[SubCategoryName] [nvarchar](50) NULL,
	[Status] [varchar](10) NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Units]    Script Date: 11/30/2023 12:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Units](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[Unit_Name] [varchar](100) NULL,
	[Status] [varchar](10) NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (1, N'ABC CAT_1', N'Select Sta', N'a6427a98-c862-4948-a107-b92312d77eac_close_day.png')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (2, N'ABC2', N'Active', N'6af62a97-1d1f-48c4-891c-42fc0006e864_icon.ico')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (3, N'ABC Sr', N'Active', N'63de7188-1108-42d9-92fd-776473f1e45f_Dine_IN_G.png')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (4, N'HOT DRINKS', N'Active', N'4db75e74-8977-428c-b009-ed5145b4f34e_home.png')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (5, N'TEA AND SNAKS', N'Active', N'88a01110-3300-45f2-8991-467b551d2c26_DELIVERYN.png')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (6, N'COFFE', N'Active', N'0e14bb5e-488d-4b01-b1c2-4a6590a7c5af_home.png')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (7, N'DESERT', N'Active', N'42325a69-6f54-4696-bb67-4ad54818cf63_logout.png')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (8, N'DESERT-8', N'Active', N'497cbe96-4a00-4e89-aad2-ecdfb606fdb8_PrintPending_1.png')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (9, N'ABC CAT_1', N'Active', N'8d3d0865-604f-4df5-8e23-8c29eac7d9e0_Rush1.jpg')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (10, N'ABC CAT_1_2dsd', N'Active', N'3899485b-85fa-4380-b5c6-47a712186ff6_info-excel.png')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (11, N'DESERT', N'Active', N'd7d5d07d-28cf-4a29-b001-54a926711558_Home.png')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (12, N'DESERT23232', N'Active', N'c29b6335-bee0-4576-80bf-07f72e57bf07_chef-hat.ico')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (13, N'ABC CAT_1_2_7896', N'Active', N'90c1237a-39e0-45f4-a82a-c5251d2504a3_IMG_20230816_153046.jpg')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (14, N'TEST', N'Active', N'5a5acea6-0be8-4481-bc4c-917e00e3a874_App_Icon.ico')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status], [ImageName]) VALUES (15, N'TEST 56', N'Active', N'5032f828-2a31-4348-b7fa-06b8dd502677_add_circular_64x64.png')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName], [Status]) VALUES (1, 4, N'Fresh Juice', N'Active')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName], [Status]) VALUES (2, 5, N'COFFE', N'Active')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName], [Status]) VALUES (3, 5, N'SULAIMANI', N'Active')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName], [Status]) VALUES (4, 5, N'BLACK COFFE -2', N'Active')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName], [Status]) VALUES (5, 5, N'WHITE COFEE', N'Active')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[Units] ON 

INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (1, N'NOS-(N-1)', N'Active')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (2, N'PCS-p', N'Active')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (3, N'NOS2', N'Active')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (5, N'MTR', N'Active')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (6, N'INC"', N'Active')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (7, N'CTN', N'Active')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (8, N'ANAN', N'InActive')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (9, N'ANNA', N'InActive')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (10, N'ANAN', N'InActive')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (11, N'ANAN', N'InActive')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (12, N'SHEF', N'InActive')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (13, N'ANAND1', N'InActive')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (14, N'ABC', N'Active')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (15, N'ANAN', N'InActive')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (16, N'AHEF', N'InActive')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (17, N'PCS-2', N'InActive')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (18, N'PCS-2', N'InActive')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (19, N'MSQ', N'InActive')
INSERT [dbo].[Units] ([UnitID], [Unit_Name], [Status]) VALUES (20, N'PCS', N'Active')
SET IDENTITY_INSERT [dbo].[Units] OFF
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
