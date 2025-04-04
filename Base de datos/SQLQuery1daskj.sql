
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Historial')
BEGIN
    DROP TABLE Historial;
END;
GO


IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Prestamos')
BEGIN
    DROP TABLE Prestamos;
END;
GO


CREATE TABLE Prestamos (
    id INT IDENTITY(1,1) PRIMARY KEY,   
    cantidad FLOAT,                     
    concepto VARCHAR(255),              
    banco_id INT,                        
    cuenta_id INT,                   
    status BIT,                          
    FOREIGN KEY (banco_id) REFERENCES Banco(id),  
    FOREIGN KEY (cuenta_id) REFERENCES Cuenta(id) 
);
GO

CREATE TABLE Historial (
    id INT IDENTITY(1,1) PRIMARY KEY,   
    prestamo_id INT,                    
    estado VARCHAR(50),               
    FOREIGN KEY (prestamo_id) REFERENCES Prestamos(id)  
);
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertarPrestamo')
BEGIN
    DROP PROCEDURE InsertarPrestamo;
END;
GO

CREATE PROCEDURE InsertarPrestamo
    @cantidad FLOAT,       
    @concepto VARCHAR(255), 
    @banco_id INT,          
    @cuenta_id INT,         
    @status BIT             
AS
BEGIN
    SET NOCOUNT ON; 

    INSERT INTO Prestamos (cantidad, concepto, banco_id, cuenta_id, status)
    VALUES (@cantidad, @concepto, @banco_id, @cuenta_id, @status);
END;
GO



..