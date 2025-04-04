CREATE DATABASE Sunrise;
USE Sunrise;

-- Tabla Persona
CREATE TABLE Persona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT NOT NULL,
    genero ENUM('Masculino', 'Femenino',) NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL
);

CREATE TABLE Empleado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    numero_telefono VARCHAR(20) NOT NULL,
    persona_id INT NOT NULL,
    FOREIGN KEY (persona_id) REFERENCES Persona(id) ON DELETE CASCADE
);

CREATE TABLE Banco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nombre_formal VARCHAR(100) NOT NULL
);

CREATE TABLE Cuenta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    saldo DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    empleado_id INT NOT NULL,
    banco_id INT NOT NULL,
    FOREIGN KEY (empleado_id) REFERENCES Empleado(id) ON DELETE CASCADE,
    FOREIGN KEY (banco_id) REFERENCES Banco(id) ON DELETE CASCADE
);






CREATE TABLE Transacciones (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tipo_transaccion VARCHAR(10) CHECK (tipo_transaccion IN ('Deposito', 'Retiro')),
    monto DECIMAL(18,2) CHECK (monto > 0),
    fecha DATETIME DEFAULT GETDATE(),
    saldo_actual DECIMAL(18,2)
);

GO

CREATE PROCEDURE RealizarTransaccion
    @tipo_transaccion VARCHAR(10),
    @monto DECIMAL(18,2)
AS
BEGIN
    DECLARE @saldo_actual DECIMAL(18,2);
    
    SELECT @saldo_actual = COALESCE(SUM(CASE WHEN tipo_transaccion = 'Deposito' THEN monto ELSE -monto END), 0)
    FROM Transacciones;
    
    IF @tipo_transaccion = 'Retiro' AND @monto > @saldo_actual
    BEGIN
        RAISERROR ('Saldo insuficiente', 16, 1);
        RETURN;
    END
    
    INSERT INTO Transacciones (tipo_transaccion, monto, saldo_actual)
    VALUES (@tipo_transaccion, @monto, @saldo_actual + CASE WHEN @tipo_transaccion = 'Deposito' THEN @monto ELSE -@monto END);
END;

create procedure update_valance_process
(
@quantity int,
@id int,
@action varchar(max)
)
as
IF @action = 'retiro'
update Person set age =
(select age from person where id =@id) - @quantity
where id = @id
ELSE IF @action = 'deposito'
update Person set age =

(select age from person where id =@id) + quantity
where id = @id

PRINT N' Saldo insuficiente 

555