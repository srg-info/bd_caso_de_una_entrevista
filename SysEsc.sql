-- ======================================================
--  Proyecto: SysEsc - Sistema de Calificaciones Escolares
--  Autor: [srg-info]
--  Licencia: [MIT]
--  Descripción: Modelo relacional de ejemplo para 
--  entrevistas técnicas SQL. Incluye inserciones y consultas.
-- ======================================================

-- Crear Base de Datos
CREATE DATABASE SysEsc;

USE SysEsc;
-- ========================
-- Tablas
-- ========================

-- Tabla Alumno
CREATE TABLE Alumno (
    IdAlumno INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Edad VARCHAR(2),
    Correo NVARCHAR(100));

-- Tabla Materia
CREATE TABLE Materia (
    IdMateria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL);

-- Tabla Calificación
CREATE TABLE Calificacion (
    IdCalificacion INT IDENTITY(1,1) PRIMARY KEY,
    IdAlumno INT FOREIGN KEY REFERENCES Alumno(IdAlumno),
    IdMateria INT FOREIGN KEY REFERENCES Materia(IdMateria),
    Calificacion DECIMAL(4,2) NULL);

-- ========================
-- Modificar Datos
-- ========================
/* -- Aqui te agrego la syntaxis para modificar o;
-- (-)Tabla
ALTER TABLE Calificacion
ALTER COLUMN Calificacion DECIMAL(4,2) NULL;

--(-)Actualizar campos (datos) de tabla Calificacion
UPDATE Calificacion
SET Calificacion = 9.0, IdMateria = 2
WHERE IdCalificacion = 33;
-- Recuerda siempre especificar el campo con WHRE, evitando remplasar todos los campos*/


-- ========================
-- Insertar Datos
-- ========================

-- Alumnos
INSERT INTO Alumno (Nombre, Edad, Correo) VALUES
    ('Raul Pérez','19','info@.com'),
    ('Sergio Álamos','29','srg@.com'),
    ('Esteban Gárcia','19','info@.com'),
    ('Raul Rairez','19','info@.com'),
    ('Saul Reyes','19','info@.com'),
    ('Ana López', '18', 'ana.lopez@mail.com'),
    ('Carlos Ruiz', '19', 'carlos.ruiz@mail.com');

-- Materias
INSERT INTO Materia (Nombre) VALUES
    ('Matemáticas'),
    ('Biología'),
    ('Español'),
    ('Ciencias Naturales'),
    ('Ciencias Sociales');

-- Calificaciones
INSERT INTO Calificacion (IdAlumno, IdMateria, Calificacion) VALUES
    -- Raul
    (1,1,9.8),(1,2,8.5),(1,3,7.1),(1,4,7.8),(1,5,8.8),
    -- Sergio
    (2,1,8.8),(2,2,7.5),(2,3,8.1),(2,4,5.8),(2,5,9.8),
    -- Esteban
    (3,1,6.8),(3,2,7.5),(3,3,6.5),(3,4,9.0),(3,5,NULL),
    -- Raul Rairez
    (4,1,9.8),(4,2,8.5),(4,3,7.1),(4,4,7.8),(4,5,8.8),
    -- Ana
    (6,1,9.0),(6,2,NULL),(6,3,9.1),(6,4,6.5),(6,5,3.4),
    -- Carlos
    (7,1,10.0),(7,2,7.5),(7,3,7.1),(7,4,NULL),(7,5,8.5);

-- ========================
-- 1. Ejercicio dado por entrevistador: 
-- ========================
-- Consulta que arroje n.alumno, edad, n.materia y calificaciones
SELECT 
    A.Nombre AS Alumno,
    A.Edad,
    M.Nombre AS Materia,
    C.Calificacion
FROM 
    Calificacion C
LEFT JOIN Alumno A ON C.IdAlumno = A.IdAlumno
LEFT JOIN Materia M ON C.IdMateria = M.IdMateria;
