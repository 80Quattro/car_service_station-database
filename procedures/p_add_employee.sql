CREATE PROCEDURE p_add_employee
	@position VARCHAR(50),
	@first_name VARCHAR(50),
	@family_name VARCHAR(50),
	@phone VARCHAR(30) = NULL
AS
BEGIN
	IF @position IS NULL OR @first_name IS NULL OR @family_name IS NULL
	BEGIN
		RAISERROR ('argument cannot be null', 16, 1);
		RETURN
	END
	INSERT INTO employees (position, first_name, family_name, phone)
		VALUES(@position, @first_name, @family_name, @phone);
END
GO