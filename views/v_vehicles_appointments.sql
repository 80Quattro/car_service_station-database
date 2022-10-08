CREATE VIEW v_vehicles_appointments
AS
	SELECT vehicles.vehicle_id, customer_id, brand, model, appointment_id, appointment_reason, appointment_date, description
	FROM vehicles
	INNER JOIN appointments ON appointments.vehicle_id = vehicles.vehicle_id
GO