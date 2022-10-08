CREATE TABLE appointments (
	[appointment_id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[vehicle_id] [int] NULL,
	[employee_id] [int] NULL,
	[appointment_reason] [text] NULL,
	[appointment_date] [date] NULL,
	[admission_date] [datetime] NULL,
	[mileage_admission] [int] NULL,
	[fuel_amount_admission] [varchar](50) NULL,
	[hand_over_date] [datetime] NULL,
	[mileage_hand_over] [int] NULL,
	[fuel_amount_hand_over] [varchar](50) NULL,
	[description] [text] NULL,
)
GO