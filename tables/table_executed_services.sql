CREATE TABLE executed_services (
	[id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[appointment_id] [int] NULL,
	[service_name] [varchar](100) NULL,
	[price] [decimal](12, 2) NULL,
	[quantity] [int] NULL,
	[description] [text] NULL,
)
GO
