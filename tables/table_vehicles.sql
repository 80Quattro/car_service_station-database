CREATE TABLE vehicles (
	[vehicle_id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[customer_id] [int] NULL,
	[brand] [varchar](50) NULL,
	[model] [varchar](100) NULL,
	[production_year] [int] NULL,
	[fuel] [varchar](50) NULL,
	[engine] [varchar](50) NULL,
	[vin] [varchar](50) NULL,
	[registration_no] [varchar](10) NULL,
)
GO
