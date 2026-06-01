CREATE DATABASE alektours_db;
-- Conectarse a la base de datos desde psql:
-- \c alektours_db
CREATE TABLE hoteles (
id_hotel SERIAL PRIMARY KEY,
nombre_hotel VARCHAR(100) NOT NULL,
calificacion INTEGER CHECK (calificacion BETWEEN 1 AND 5),
direccion VARCHAR(255),
ciudad VARCHAR(100),
pais VARCHAR(100),
codigo_postal VARCHAR(20),
correo_electronico VARCHAR(100),
telefono VARCHAR(20)
);
CREATE TABLE caracteristicas_hotel (
id_caracteristica SERIAL PRIMARY KEY,
nombre_caracteristica VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE hotel_caracteristicas (
id_hotel INTEGER NOT NULL,
id_caracteristica INTEGER NOT NULL,
disponible BOOLEAN DEFAULT TRUE,
PRIMARY KEY (id_hotel, id_caracteristica),

FOREIGN KEY (id_hotel)
    REFERENCES hoteles(id_hotel)
    ON DELETE CASCADE,

FOREIGN KEY (id_caracteristica)
    REFERENCES caracteristicas_hotel(id_caracteristica)
    ON DELETE CASCADE

);
CREATE TABLE tipo_habitacion (
id_tipo_habitacion SERIAL PRIMARY KEY,
nombre_tipo VARCHAR(50) NOT NULL,
descripcion VARCHAR(200),
capacidad_personas INTEGER NOT NULL
);
CREATE TABLE habitaciones (
id_habitacion SERIAL PRIMARY KEY,
id_hotel INTEGER NOT NULL,
id_tipo_habitacion INTEGER NOT NULL,
numero_habitacion VARCHAR(20),
precio_noche NUMERIC(10,2),

estado VARCHAR(20)
    CHECK (estado IN ('disponible','ocupada','mantenimiento')),

FOREIGN KEY (id_hotel)
    REFERENCES hoteles(id_hotel)
    ON DELETE CASCADE,

FOREIGN KEY (id_tipo_habitacion)
    REFERENCES tipo_habitacion(id_tipo_habitacion)

);
CREATE TABLE clientes (
id_cliente SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,

cedula VARCHAR(20) UNIQUE NOT NULL,
correo VARCHAR(100),
celular VARCHAR(20),

direccion VARCHAR(255),
ciudad VARCHAR(100),
pais VARCHAR(100),

fecha_nacimiento DATE,
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);
CREATE TABLE roles (
id_rol SERIAL PRIMARY KEY,
nombre_rol VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE empleados (
id_empleado SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,

cedula VARCHAR(20) UNIQUE,
correo_electronico VARCHAR(100),
celular VARCHAR(20),

direccion VARCHAR(255),
ciudad VARCHAR(100),
pais VARCHAR(100),

fecha_nacimiento DATE,
fecha_contratacion DATE,

activo BOOLEAN DEFAULT TRUE

);
CREATE TABLE empleados_roles (
id_empleado INTEGER NOT NULL,
id_rol INTEGER NOT NULL,
fecha_asignacion DATE,
PRIMARY KEY (id_empleado, id_rol),

FOREIGN KEY (id_empleado)
    REFERENCES empleados(id_empleado)
    ON DELETE CASCADE,

FOREIGN KEY (id_rol)
    REFERENCES roles(id_rol)
    ON DELETE CASCADE

);
CREATE TABLE destinos (
id_destino SERIAL PRIMARY KEY,
nombre_destino VARCHAR(100) NOT NULL,
descripcion TEXT,

ciudad VARCHAR(100),
pais VARCHAR(100),

temporada_alta_inicio DATE,
temporada_alta_fin DATE

);
CREATE TABLE categoria_servicio (
id_categoria SERIAL PRIMARY KEY,
nombre_categoria VARCHAR(100) NOT NULL
);
CREATE TABLE servicios (
id_servicio SERIAL PRIMARY KEY,
nombre_servicio VARCHAR(100) NOT NULL,
descripcion TEXT,

id_categoria INTEGER,
id_destino INTEGER,

duracion_horas NUMERIC(4,1),
precio_base NUMERIC(10,2),

capacidad_maxima INTEGER,

FOREIGN KEY (id_categoria)
    REFERENCES categoria_servicio(id_categoria),

FOREIGN KEY (id_destino)
    REFERENCES destinos(id_destino)

);
CREATE TABLE proveedores (
id_proveedor SERIAL PRIMARY KEY,
nombre_proveedor VARCHAR(100),
tipo_proveedor VARCHAR(50),

contacto VARCHAR(100),

telefono VARCHAR(20),
correo_electronico VARCHAR(100),

direccion VARCHAR(255),
ciudad VARCHAR(100),
pais VARCHAR(100),

comision_porcentaje NUMERIC(5,2)

);
CREATE TABLE servicio_proveedor (
id_servicio INTEGER NOT NULL,
id_proveedor INTEGER NOT NULL,
precio_proveedor NUMERIC(10,2),
es_proveedor_principal BOOLEAN DEFAULT FALSE,

PRIMARY KEY (id_servicio, id_proveedor),

FOREIGN KEY (id_servicio)
    REFERENCES servicios(id_servicio)
    ON DELETE CASCADE,

FOREIGN KEY (id_proveedor)
    REFERENCES proveedores(id_proveedor)
    ON DELETE CASCADE

);
CREATE TABLE paquetes (
id_paquete SERIAL PRIMARY KEY,
nombre_paquete VARCHAR(100) NOT NULL,
descripcion TEXT,

duracion_dias INTEGER,
precio_base NUMERIC(10,2),

activo BOOLEAN DEFAULT TRUE

);
CREATE TABLE paquete_servicios (
id_paquete INTEGER NOT NULL,
id_servicio INTEGER NOT NULL,
dia_actividad INTEGER,
incluido BOOLEAN DEFAULT TRUE,

PRIMARY KEY (id_paquete, id_servicio),

FOREIGN KEY (id_paquete)
    REFERENCES paquetes(id_paquete)
    ON DELETE CASCADE,

FOREIGN KEY (id_servicio)
    REFERENCES servicios(id_servicio)
    ON DELETE CASCADE

);
CREATE TABLE paquete_hotel (
id_paquete INTEGER NOT NULL,
id_hotel INTEGER NOT NULL,
noches_incluidas INTEGER,

PRIMARY KEY (id_paquete, id_hotel),

FOREIGN KEY (id_paquete)
    REFERENCES paquetes(id_paquete)
    ON DELETE CASCADE,

FOREIGN KEY (id_hotel)
    REFERENCES hoteles(id_hotel)
    ON DELETE CASCADE

);
CREATE TABLE reservas (
id_reserva SERIAL PRIMARY KEY,
id_cliente INTEGER NOT NULL,
id_empleado INTEGER,
id_paquete INTEGER,

fecha_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

fecha_inicio DATE,
fecha_fin DATE,

numero_personas INTEGER,

estado VARCHAR(20)
    CHECK (
        estado IN (
            'pendiente',
            'confirmada',
            'cancelada',
            'finalizada'
        )
    ),

FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente),

FOREIGN KEY (id_empleado)
    REFERENCES empleados(id_empleado)
    ON DELETE SET NULL,

FOREIGN KEY (id_paquete)
    REFERENCES paquetes(id_paquete)
    ON DELETE SET NULL

);
CREATE TABLE reserva_habitaciones (
id_reserva INTEGER NOT NULL,
id_habitacion INTEGER NOT NULL,
fecha_checkin DATE,
fecha_checkout DATE,

precio_acordado NUMERIC(10,2),

PRIMARY KEY (id_reserva, id_habitacion),

FOREIGN KEY (id_reserva)
    REFERENCES reservas(id_reserva)
    ON DELETE CASCADE,

FOREIGN KEY (id_habitacion)
    REFERENCES habitaciones(id_habitacion)

);
CREATE TABLE reserva_servicios (
id_reserva INTEGER NOT NULL,
id_servicio INTEGER NOT NULL,
fecha_servicio DATE,
numero_personas INTEGER,

precio_acordado NUMERIC(10,2),

PRIMARY KEY (id_reserva, id_servicio),

FOREIGN KEY (id_reserva)
    REFERENCES reservas(id_reserva)
    ON DELETE CASCADE,

FOREIGN KEY (id_servicio)
    REFERENCES servicios(id_servicio)

);
CREATE TABLE metodos_pago (
id_metodo SERIAL PRIMARY KEY,
nombre_metodo VARCHAR(50) NOT NULL
);
CREATE TABLE pagos (
id_pago SERIAL PRIMARY KEY,
id_reserva INTEGER NOT NULL,
id_metodo_pago INTEGER NOT NULL,

monto NUMERIC(10,2),

fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

referencia VARCHAR(100),

estado VARCHAR(20)
    CHECK (
        estado IN (
            'pendiente',
            'pagado',
            'rechazado'
        )
    ),

FOREIGN KEY (id_reserva)
    REFERENCES reservas(id_reserva),

FOREIGN KEY (id_metodo_pago)
    REFERENCES metodos_pago(id_metodo)

);
CREATE TABLE historial_reservas (
id_historial SERIAL PRIMARY KEY,
id_reserva INTEGER NOT NULL,

id_reserva_vinculada INTEGER,

estado_anterior VARCHAR(20),
estado_nuevo VARCHAR(20),

fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

id_empleado_responsable INTEGER,

comentarios TEXT,

FOREIGN KEY (id_reserva)
    REFERENCES reservas(id_reserva)
    ON DELETE CASCADE,

FOREIGN KEY (id_empleado_responsable)
    REFERENCES empleados(id_empleado)
    ON DELETE SET NULL

);


