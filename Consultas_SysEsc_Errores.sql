-- ======================================================
--  Proyecto: SysEsc - Consultas con Errores para Práctica
--  Autor: [srg-info]
--  Licencia: [MIT]
--  Descripción: Archivo con errores de sintaxis o lógicos
--  para que los puedas identificar y correjir.
-- ======================================================

-- ========================
--  BÁSICO (CON ERRORES)
-- ========================

/* Ejercicio 1
Muéstrame todos los alumnos registrados, ordenados por nombre. */
SELECT *
FROM Alumnos
ORDER Nombre ASC;


/* Ejercicio 2
Quiero saber qué materias existen actualmente en el sistema. */
SELCT Nombre AS MateriasExistentes
FROM Materias;


/* Ejercicio 3
Dame los nombres y correos de los alumnos que tienen 18 años. */
SELECT Nombre, Correos, Edad
FROM Alumno
WHERE Edad = 'dieciocho';

-- ========================
--  INTERMEDIO (CON ERRORES)
-- ========================

/* Ejercicio 4
Lista las calificaciones que tiene Ana López en todas sus materias. */
SELECT a.Nombre, Materia.Nombre, c.Calificacion
FROM Calificacion c
INNER JOIN Alumno aa ON c.IdAlumno = a.IdAlumno
INNER Materia m ON c.IdMateria = m.IdMateria
WHERE Nombre = Ana López;


/* Ejercicio 5
Consulta que muestra alumno, materia y calificación. */
SELECT a.Nombre, m.Nombre AS Materia, c.Calificacion
FROM Calificacion c
INNER JOIN Alumno a ON c.IdAlumno = a.IdAlumno
INNER JOIN Materia m ON c.IdMateria = m.IdMateria
ORDER BY NombreAlumno;


/* Ejercicio 6
Promedio general de calificaciones por alumno. */
SELECT a.Nombre, FRMAT((AVG(c.Calificacion), 'N2')) AS Promedio_General
FROM Calificacion c
INNER JOIN Alumno a ON c.IdAlumno = a.IdAlumno
GROUP bY a.Nombre;


/* Ejercicio 7
Listado de alumnos con al menos una calificación menor a 6.0 */
SELECT a.Nombre, m.Nombre As Materia, c.Calificacion
FROM Calificacion c
INNER JOIN Alumno a ON c.IdAlumno = a.IdAlumno
INNER JOIN Materia m ON c.IdMateria = m.IdMateria
WHERE c.Calificacion => 6.0;


-- ========================
--  AVANZADO (CON ERRORES)
-- ========================

/* Ejercicio 8
Muéstrame los 5 alumnos con mejor promedio. */
SELECT a.Nombre, FORMAT(AVG(c.Calificacion) "N1") AS Mejor_Promedio
FROM Calificacion c
INNER JOIN Alumno a ON c.IdAlumno = a.IdAlumno
GROUP BY a.Nombre
ORDER BY Mejor_Promedio DESC
OFFSET 5 ROWS NEXT FETCH ONLY;


/* Ejercicio 9
Por cada materia:
- Cuántos alumnos están inscritos
- Promedio de calificación
- Calificación más alta */
SELECT m.Nombre AS Materia,
       COUNTT(c.IdAlumno) Total_Alumnos,
       FORMAT(AVG(c.Calificacion),'N2') AS Promedio,
       MAX c.Calificacion AS MayorNota
FROM Calificacion c
JOIN Materia m ON c.IdMateria = m.IdMateria;


/* Ejercicio 10
Lista con Alumno | Reprobadas | Aprobadas | Promedio */
SELECT a.Nombre AS Alumno,
    SUM(CASE WHEN Calificacion <6 THEN +1 ELSE END) AS Reprobadas,
    SUM(CASE WHEN Calificacion >=6 THEN 1 ELSE 0 ) AS Aprobadas,
    FORMAT AVG(c.Calificacion, 'N2') AS Promedio
FROM Calificacion c
JOIN Alumno a ON c.IdAlumno = a.IdAlumno
GROUP BY Nombre
ORDER BY Promedio DESSC;
