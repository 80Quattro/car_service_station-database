CREATE PROCEDURE p_add_customer
	@first_name VARCHAR(50),
	@family_name VARCHAR(50),
	@phone VARCHAR(30) = NULL,
	@email VARCHAR(50) = NULL,
	@country VARCHAR(30) = NULL,
	@zip_code VARCHAR(7) = NULL,
	@city VARCHAR(50) = NULL,
	@street VARCHAR(30) = NULL,
	@house_number VARCHAR(10) = NULL
AS
BEGIN
	IF @first_name IS NULL OR @family_name IS NULL
	BEGIN
		RAISERROR ('first name and family name cannot be null', 16, 1);
		RETURN
	END
	IF @phone IS NULL AND @email IS NULL
	BEGIN
		RAISERROR('you have to give at least one contact data (phone no. or email address)', 16, 1);
		RETURN
	END
	INSERT INTO customers (first_name, family_name, phone, email, join_date, country, zip_code, city, street, house_number)
		VALUES(@first_name, @family_name, @phone, @email, GETDATE(), @country, @zip_code, @city, @street, @house_number);
END
GO