CREATE VIEW v_parts_services
AS
	SELECT * FROM exchanged_parts
	UNION
	SELECT * FROM executed_services
GO