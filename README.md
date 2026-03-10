# Base de Datos – # Aleck_tours_db
## Descripción

Esta base de datos fue diseñada para gestionar la información de un sistema de administración hotelera. Permite almacenar y relacionar información sobre hoteles, habitaciones, clientes, reservas, empleados, servicios y proveedores.

El modelo busca mantener la integridad de los datos y reducir redundancias mediante la normalización de las tablas.

---

## Objetivo

El objetivo de esta base de datos es centralizar la información necesaria para la administración de un hotel, permitiendo:

- Registrar clientes.
- Gestionar habitaciones.
- Administrar reservas.
- Controlar servicios adicionales.
- Gestionar empleados y roles.
- Organizar destinos y ubicaciones.

---

## Estructura de la Base de Datos

La base de datos está compuesta por varias tablas principales que representan las entidades del sistema.

### Tablas principales

| Tabla | Descripción |
|------|-------------|
| `hotel` | Información general de los hoteles registrados |
| `habitaciones` | Habitaciones disponibles dentro de cada hotel |
| `clientes` | Datos de los clientes que realizan reservas |
| `reservas` | Registro de las reservas realizadas |
| `empleados` | Información de los empleados del hotel |
| `roles` | Roles asignados a los empleados |
| `servicios` | Servicios que ofrece el hotel |
| `pagos` | Información sobre los pagos realizados |
| `destinos` | Ubicaciones o destinos donde se encuentran los hoteles |

---

## Tablas de relación

Algunas tablas sirven para manejar relaciones entre entidades.

| Tabla | Descripción |
|------|-------------|
| `hotel_caracteristicas` | Relación entre hoteles y sus características |
| `empleados_roles` | Relación entre empleados y roles |
| `reserva_habitaciones` | Relación entre reservas y habitaciones |
| `reserva_servicios` | Relación entre reservas y servicios |
| `proveedores_servicios` | Relación entre proveedores y servicios |

---

## Características del Modelo

- Uso de claves primarias (`PRIMARY KEY`) para identificar registros.
- Uso de claves foráneas (`FOREIGN KEY`) para mantener relaciones entre tablas.
- Tablas intermedias para resolver relaciones muchos a muchos.
- Organización modular para facilitar el mantenimiento del sistema.

---

## Tecnologías Utilizadas

- MySQL / MariaDB
- phpMyAdmin
- SQL estándar para definición y manipulación de datos

---

## Autor

Proyecto académico de desarrollo de base de datos para un sistema de gestión hotelera.
