CREATE TABLE customers (
	[customer_id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[first_name] [varchar](50) NULL,
	[family_name] [varchar](50) NULL,
	[phone] [varchar](30) NULL,
	[email] [varchar](50) NULL,
	[join_date] [date] NULL,
	[country] [varchar](50) NULL,
	[zip_code] [varchar](10) NULL,
	[city] [varchar](50) NULL,
	[street] [varchar](50) NULL,
	[house_number] [varchar](10) NULL,
)
GO
