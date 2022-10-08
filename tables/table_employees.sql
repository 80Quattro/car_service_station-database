CREATE TABLE employees (
	[employee_id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[position] [varchar](50) NULL,
	[first_name] [varchar](50) NULL,
	[family_name] [varchar](50) NULL,
	[phone] [varchar](30) NULL,
)
GO