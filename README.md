# 🗄️ SysEsc – Sistema de Calificaciones Escolares

Este repositorio contiene la **estructura**, **carga inicial** y **consultas SQL** de una base de datos relacional orientada al control académico de alumnos, materias y calificaciones.
Nota: Este ejercicio nace de una entrevista
---

## 📌 Descripción

La base de datos fue diseñada con el propósito de reforzar y retroalimentar un ejercicio realizado, sobre consultas, durante una entrevista técnica **alumnos, materias y sus calificaciones**. 
Incluye relaciones bien definidas entre las tablas, control de integridad mediante claves primarias y foráneas, así como consultas orientadas a **escenarios de entrevista técnica en SQL**.

---

## 🧱 Estructura de Tablas

- **Alumno**: información personal de los alumnos (estos invetados).  
- **Materia**: lista de materias disponibles.  
- **Calificación**: notas de cada alumno por materia, con integridad referencial.

---

## 🧪 Tecnologías

- **SQL Server / T-SQL (nuevo para mi)**  
- Instrucciones DDL (`CREATE`, `ALTER`, `INSERT`)  
- Claves foráneas (**FOREIGN KEYS**)  
- Consultas con filtros, joins, agrupaciones y funciones de agregación

---

## 📂 Ejemplo de Tabla

```
CREATE TABLE Calificacion (
    IdCalificacion INT NOT NULL IDENTITY(1,1),
    IdAlumno INT FOREIGN KEY REFERENCES Alumno(IdAlumno),
    IdMateria INT FOREIGN KEY REFERENCES Materia(IdMateria),
    Calificacion DECIMAL(4,2) NULL,
    PRIMARY KEY (IdCalificacion)
);
```
---
## 🧾 Contenido del Repositorio
##📁 script_sysesc.sql
Contiene la estructura de las tablas y datos de prueba de la base de datos:
-Tablas relacionales con integridad referencial.
-Inserción de alumnos, materias y calificaciones.

📄 [Ver archivo SysEsc.sql](./SysEsc.sql)

---
📁 Consultas_SysEsc.sql
-Incluye un conjunto de consultas SQL prácticas para preparte en:
-Listar alumnos con sus materias y calificaciones.
-Calcular promedios de calificación por alumno (ranking de alumnos).
-Identificar materias con menor promedio (materias más difíciles).

🧾 [Ver archivo Consultas_BD_Venta.sql](./ConsultasSysEsc.sql)

---
### 📁 Consultas con Errores (para práctica)
Este archivo contiene errores intencionales de sintaxis y lógica para que puedas practiquer su corrección.

📄 [Ver archivo Consultas_SysEsc_Errores.sql](./Consultas_SysEsc_Errores.sql)

## 📄 Licencia

Este script se distribuye con fines educativos y está bajo licencia MIT. 
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)


##
@ srg.info | Proyecto personal para fines educativos con SQL.
