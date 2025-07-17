-- ======================================================
--  Proyecto: SysEsc - Consultas para Práctica a Entrevista
--  Autor: [srg-info]
--  Licencia: [MIT]
--  Descripción: Colección de ejercicios SQL (básicos e intermedios y avanzados)
--  basados en el modelo relacional SysEsc.
-- ======================================================

-- ========================
--  BÁSICO
-- ========================

/* Ejercicio 1:
Muéstrame todos los alumnos registrados, ordenados por nombre.
(Opcional: descomentar la línea WHERE para filtrar por edad distinta de 19) */
SELECT *
FROM Alumno
-- WHERE Edad <> '19'
ORDER BY Nombre;


/* Ejercicio 2:
Quiero saber qué materias existen actualmente en el sistema. */
SELECT Nombre AS MateriasExistentes
FROM Materia;


/* Ejercicio 3:
Dame los nombres y correos de los alumnos que tienen 18 años. */
SELECT a.Nombre, a.Correo, a.Edad
FROM Alumno a
WHERE Edad = 18;

-- ========================
--  INTERMEDIO
-- ========================

/* Ejercicio 4:
Lista las calificaciones que tiene Ana López en todas sus materias. */
SELECT a.Nombre, m.Nombre AS Materia, c.Calificacion
FROM Calificacion c
INNER JOIN Alumno a ON c.IdAlumno = a.IdAlumno
INNER JOIN Materia m ON c.IdMateria = m.IdMateria
WHERE a.Nombre = 'Ana López';


/* Ejercicio 5:
Consulta que muestra alumno, materia y calificación,
uniendo correctamente las tres tablas. */
SELECT a.Nombre, m.Nombre AS Materia, c.Calificacion
FROM Calificacion c
INNER JOIN Alumno a ON c.IdAlumno = a.IdAlumno
INNER JOIN Materia m ON c.IdMateria = m.IdMateria
ORDER BY a.Nombre;


/* Ejercicio 6:
Promedio general de calificaciones por alumno. */
SELECT a.Nombre,
       FORMAT(AVG(c.Calificacion), 'N2') AS Promedio_General
FROM Calificacion c
INNER JOIN Alumno a ON c.IdAlumno = a.IdAlumno
GROUP BY a.Nombre;

-- ========================
--  AVANZADO
-- ========================

/* Ejercicio 7:
Listado de alumnos que tienen al menos una calificación menor a 6.0 (reprobados). */
SELECT DISTINCT a.Nombre, m.Nombre AS Materia, c.Calificacion
FROM Calificacion c
INNER JOIN Alumno a ON c.IdAlumno = a.IdAlumno
INNER JOIN Materia m ON c.IdMateria = m.IdMateria
WHERE c.Calificacion < 6.0;


/* Ejercicio 8:
Muéstrame los 5 alumnos con mejor promedio, ordenados de mayor a menor. */
SELECT a.Nombre,
       FORMAT(AVG(c.Calificacion), 'N1') AS Mejor_Promedio
FROM Calificacion c
INNER JOIN Alumno a ON c.IdAlumno = a.IdAlumno
GROUP BY a.Nombre
ORDER BY Mejor_Promedio DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;


/* Ejercicio 9:
Por cada materia:
- Cuántos alumnos están inscritos
- El promedio de calificación
- La calificación más alta */
SELECT m.Nombre AS Materia,
       COUNT(c.IdAlumno) AS Total_Alumnos,
       FORMAT(AVG(c.Calificacion),'N2') AS Promedio,
       MAX(c.Calificacion) AS MayorNota
FROM Calificacion c
JOIN Materia m ON c.IdMateria = m.IdMateria
GROUP BY m.Nombre;

-- Versión por alumno:
SELECT a.Nombre AS Alumno,
       COUNT(*) AS Total_Materias,
       FORMAT(AVG(c.Calificacion),'N2') AS Promedio,
       MAX(c.Calificacion) AS MayorNota
FROM Calificacion c
JOIN Alumno a ON c.IdAlumno = a.IdAlumno
GROUP BY a.Nombre;

-- ========================
--  ADICIONAL (USANDO MÁS COMANDOS)
-- ========================

/* Ejercicio 10:
Devuelve una lista con este formato:
Alumno | Calificaciones Reprobadas | Calificaciones Aprobadas | Promedio */
SELECT a.Nombre AS Alumno,
       SUM(CASE WHEN c.Calificacion < 6.0 THEN 1 ELSE 0 END) AS Reprobadas,
       SUM(CASE WHEN c.Calificacion >= 6.0 THEN 1 ELSE 0 END) AS Aprobadas,
       FORMAT(AVG(c.Calificacion), 'N2') AS Promedio
FROM Calificacion c
JOIN Alumno a ON c.IdAlumno = a.IdAlumno
GROUP BY a.Nombre
ORDER BY Promedio DESC;


/* Ejercicio 11:
Reporte completo solicitado por el director:
- Nombre del alumno y su edad.
- Cantidad total de materias evaluadas.
- Número de materias reprobadas (calificación < 6).
- Promedio final.
- Solo incluir alumnos mayores de 17 años.
- Listado ordenado por promedio de mayor a menor. */
SELECT a.Nombre, a.Edad,
       COUNT(*) AS TotalMaterias,
       SUM(CASE WHEN c.Calificacion < 6 THEN 1 ELSE 0 END) AS Reprobadas,
       FORMAT(AVG(c.Calificacion), 'N2') AS PromedioFinal
FROM Calificacion c
JOIN Alumno a ON c.IdAlumno = a.IdAlumno
WHERE a.Edad > 17
GROUP BY a.Nombre, a.Edad
ORDER BY PromedioFinal DESC;


-- ========================
--  SUBCONSULTAS
-- ========================

/* Ejercicio 12:
Mostrar los nombres de alumnos que tengan al menos una materia reprobada (<6). */
SELECT Nombre
FROM Alumno
WHERE IdAlumno IN (
    SELECT IdAlumno
    FROM Calificacion
    WHERE Calificacion < 6
);
