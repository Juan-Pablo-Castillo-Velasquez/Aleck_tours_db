CREATE DATABASE alekTours_db;
USE alekTours_db;

CREATE TABLE paises (
    id_pais INT AUTO_INCREMENT PRIMARY KEY,
    nombre_pais VARCHAR(100) NOT NULL,
    codigo_iso CHAR(2)
);

CREATE TABLE ciudades (
    id_ciudad INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ciudad VARCHAR(100) NOT NULL,
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
);

CREATE TABLE direcciones (
    id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    direccion_linea VARCHAR(255),
    id_ciudad INT,
    codigo_postal VARCHAR(20),
    FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad)
);

CREATE TABLE hotel (
    id_hotel INT AUTO_INCREMENT PRIMARY KEY,
    nombre_hotel VARCHAR(100),
    calificacion INT,
    id_direccion INT,
    correo_electronico VARCHAR(100),
    telefono VARCHAR(20),
    FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
);

CREATE TABLE caracteristicas_hotel (
    id_caracteristica INT AUTO_INCREMENT PRIMARY KEY,
    nombre_caracteristica VARCHAR(100)
);

CREATE TABLE hotel_caracteristicas (
    id_hotel INT,
    id_caracteristica INT,
    disponible TINYINT(1),
    PRIMARY KEY (id_hotel, id_caracteristica),
    FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel),
    FOREIGN KEY (id_caracteristica) REFERENCES caracteristicas_hotel(id_caracteristica)
);


CREATE TABLE tipo_habitacion (
    id_tipo_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(50),
    descripcion VARCHAR(200),
    capacidad_personas INT
);

CREATE TABLE habitaciones (
    id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    id_hotel INT,
    id_tipo_habitacion INT,
    numero_habitacion VARCHAR(20),
    precio_noche DECIMAL(10,2),
    estado ENUM('disponible','ocupada','mantenimiento'),
    FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel),
    FOREIGN KEY (id_tipo_habitacion) REFERENCES tipo_habitacion(id_tipo_habitacion)
);
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    cedula VARCHAR(20) UNIQUE,
    correo VARCHAR(100),
    celular VARCHAR(20),
    id_direccion INT,
    fecha_nacimiento DATE,
    fecha_registro DATETIME,
    FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
);

CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50)
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    cedula VARCHAR(20),
    correo_electronico VARCHAR(100),
    celular VARCHAR(20),
    id_direccion INT,
    fecha_nacimiento DATE,
    fecha_contratacion DATE,
    activo TINYINT(1),
    FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
);

CREATE TABLE empleados_roles (
    id_empleado INT,
    id_rol INT,
    fecha_asignacion DATE,
    PRIMARY KEY (id_empleado, id_rol),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

CREATE TABLE destinos (
    id_destino INT AUTO_INCREMENT PRIMARY KEY,
    nombre_destino VARCHAR(100),
    descripcion TEXT,
    id_ciudad INT,
    temporada_alta_inicio DATE,
    temporada_alta_fin DATE,
    FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad)
);


CREATE TABLE categoria_servicio (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100)
);

CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100),
    descripcion TEXT,
    id_categoria INT,
    id_destino INT,
    duracion_horas DECIMAL(4,1),
    precio_base DECIMAL(10,2),
    capacidad_maxima INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria_servicio(id_categoria),
    FOREIGN KEY (id_destino) REFERENCES destinos(id_destino)
);

CREATE TABLE proveedores_servicios (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(100),
    tipo_proveedor VARCHAR(50),
    contacto VARCHAR(100),
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100),
    id_direccion INT,
    comision_porcentaje DECIMAL(5,2),
    FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
);

CREATE TABLE servicio_proveedor (
    id_servicio INT,
    id_proveedor INT,
    precio_proveedor DECIMAL(10,2),
    es_proveedor_principal TINYINT(1),
    PRIMARY KEY (id_servicio, id_proveedor),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores_servicios(id_proveedor)
);


CREATE TABLE paquetes (
    id_paquete INT AUTO_INCREMENT PRIMARY KEY,
    nombre_paquete VARCHAR(100),
    descripcion TEXT,
    duracion_dias INT,
    precio_base DECIMAL(10,2),
    activo TINYINT(1)
);

CREATE TABLE paquete_servicios (
    id_paquete INT,
    id_servicio INT,
    dia_actividad INT,
    incluido TINYINT(1),
    PRIMARY KEY (id_paquete, id_servicio),
    FOREIGN KEY (id_paquete) REFERENCES paquetes(id_paquete),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

CREATE TABLE paquete_hotel (
    id_paquete INT,
    id_hotel INT,
    noches_incluidas INT,
    PRIMARY KEY (id_paquete, id_hotel),
    FOREIGN KEY (id_paquete) REFERENCES paquetes(id_paquete),
    FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel)
);

CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_empleado INT,
    id_paquete INT,
    fecha_reserva DATETIME,
    fecha_inicio DATE,
    fecha_fin DATE,
    numero_personas INT,
    estado ENUM('pendiente','confirmada','cancelada','finalizada'),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_paquete) REFERENCES paquetes(id_paquete)
);

CREATE TABLE reserva_habitaciones (
    id_reserva INT,
    id_habitacion INT,
    fecha_checkin DATE,
    fecha_checkout DATE,
    precio_acordado DECIMAL(10,2),
    PRIMARY KEY (id_reserva, id_habitacion),
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva),
    FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion)
);
CREATE TABLE reserva_servicios (
    id_reserva INT,
    id_servicio INT,
    fecha_servicio DATE,
    numero_personas INT,
    precio_acordado DECIMAL(10,2),
    PRIMARY KEY (id_reserva, id_servicio),
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

CREATE TABLE metodos_pago (
    id_metodo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_metodo VARCHAR(50)
);

CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    id_metodo_pago INT,
    monto DECIMAL(10,2),
    fecha_pago DATETIME,
    referencia VARCHAR(100),
    estado ENUM('pendiente','pagado','rechazado'),
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva),
    FOREIGN KEY (id_metodo_pago) REFERENCES metodos_pago(id_metodo)
);


 CREATE TABLE historial_reservas (
id_historial INT AUTO_INCREMENT PRIMARY KEY,
id_reserva INT NOT NULL,
id_reserva_vinculada INT NULL,
estado_anterior ENUM('pendiente','confirmada','cancelada','finalizada'),
estado_nuevo ENUM('pendiente','confirmada','cancelada','finalizada'),
fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
id_empleado_responsable INT,
comentarios TEXT,

FOREIGN KEY (id_reserva)
REFERENCES reservas(id_reserva)
ON DELETE CASCADE
ON UPDATE CASCADE,

FOREIGN KEY (id_empleado_responsable)
REFERENCES empleados(id_empleado)
ON DELETE SET NULL
ON UPDATE CASCADE
);



 INSERT INTO paises (nombre_pais,codigo_iso) VALUES
('España','ES'),
('Francia','FR'),
('Italia','IT'),
('Alemania','DE'),
('Países Bajos','NL'),
('Portugal','PT'),
('Suiza','CH');



INSERT INTO ciudades (nombre_ciudad,id_pais) VALUES
('Madrid',1),
('Barcelona',1),
('París',2),
('Marsella',2),
('Roma',3),
('Milán',3),
('Berlín',4),
('Múnich',4),
('Ámsterdam',5),
('Lisboa',6);



INSERT INTO direcciones (direccion_linea,id_ciudad,codigo_postal) VALUES
('Gran Vía 45',1,'28013'),
('Calle Balmes 100',2,'08008'),
('Champs-Élysées 50',3,'75008'),
('Rue de la République 20',4,'13001'),
('Via del Corso 10',5,'00186'),
('Via Montenapoleone 8',6,'20121'),
('Alexanderplatz 1',7,'10178'),
('Marienplatz 5',8,'80331'),
('Damrak 70',9,'1012LM'),
('Av da Liberdade 200',10,'1250-147');



INSERT INTO hotel (nombre_hotel,calificacion,id_direccion,correo_electronico,telefono) VALUES
('Hotel Caribe',5,3,'caribe@hotel.com','3001111111'),
('Hotel Capital',4,1,'capital@hotel.com','3002222222'),
('Hotel Montaña',4,2,'montana@hotel.com','3003333333'),
('Hotel Playa',5,3,'playa@hotel.com','3004444444'),
('Hotel Imperial',5,4,'imperial@hotel.com','3005555555'),
('Hotel Colonial',4,7,'colonial@hotel.com','3006666666'),
('Hotel Central',3,8,'central@hotel.com','3007777777');



INSERT INTO caracteristicas_hotel (nombre_caracteristica) VALUES
('WiFi'),
('Piscina'),
('Spa'),
('Gimnasio'),
('Restaurante'),
('Bar'),
('Parqueadero');




INSERT INTO hotel_caracteristicas VALUES
(1,1,1),
(1,2,1),
(1,5,1),
(2,1,1),
(2,4,1),
(3,1,1),
(3,2,0),
(4,2,1),
(5,3,1),
(6,7,1);



INSERT INTO tipo_habitacion (nombre_tipo,descripcion,capacidad_personas) VALUES
('Simple','Habitación individual',1),
('Doble','Habitación doble',2),
('Triple','Habitación triple',3),
('Suite','Suite de lujo',2),
('Familiar','Habitación familiar',4),
('Deluxe','Habitación deluxe',2),
('Presidencial','Suite presidencial',2);



INSERT INTO habitaciones (id_hotel,id_tipo_habitacion,numero_habitacion,precio_noche,estado) VALUES
(1,1,'101',120000,'disponible'),
(1,2,'102',180000,'disponible'),
(2,2,'201',170000,'ocupada'),
(2,3,'202',200000,'disponible'),
(3,4,'301',350000,'disponible'),
(4,5,'401',220000,'disponible'),
(5,6,'501',260000,'ocupada'),
(6,1,'601',100000,'disponible'),
(7,2,'701',150000,'disponible'),
(3,3,'302',210000,'mantenimiento');


INSERT INTO clientes (nombre,apellido,cedula,correo,celular,id_direccion,fecha_nacimiento,fecha_registro) VALUES
('Juan','Pérez','1001','juan@mail.com','3100000001',1,'1995-05-10',NOW()),
('Ana','García','1002','ana@mail.com','3100000002',2,'1998-03-12',NOW()),
('Carlos','López','1003','carlos@mail.com','3100000003',3,'1990-07-01',NOW()),
('Laura','Martínez','1004','laura@mail.com','3100000004',4,'1997-02-14',NOW()),
('Pedro','Ramírez','1005','pedro@mail.com','3100000005',5,'1992-09-22',NOW()),
('Sofía','Torres','1006','sofia@mail.com','3100000006',6,'1999-11-30',NOW()),
('Luis','Hernández','1007','luis@mail.com','3100000007',7,'1989-04-10',NOW()),
('Marta','Castro','1008','marta@mail.com','3100000008',8,'1993-06-15',NOW()),
('Diego','Morales','1009','diego@mail.com','3100000009',9,'1996-08-20',NOW()),
('Paula','Rojas','1010','paula@mail.com','3100000010',10,'2000-01-01',NOW());


INSERT INTO roles (nombre_rol) VALUES
('Administrador'),
('Recepcionista'),
('Gerente'),
('Contador'),
('Limpieza'),
('Seguridad'),
('Soporte');


INSERT INTO empleados (nombre,apellido,cedula,correo_electronico,celular,id_direccion,fecha_nacimiento,fecha_contratacion,activo) VALUES
('Mario','Lopez','2001','mario@mail.com','3200000001',1,'1985-05-10','2022-01-01',1),
('Lucia','Perez','2002','lucia@mail.com','3200000002',2,'1990-03-15','2021-02-10',1),
('Jorge','Ramos','2003','jorge@mail.com','3200000003',3,'1988-06-20','2020-03-01',1),
('Diana','Castillo','2004','diana@mail.com','3200000004',4,'1992-09-10','2022-05-12',1),
('Andres','Vega','2005','andres@mail.com','3200000005',5,'1987-11-11','2019-07-01',1),
('Carla','Suarez','2006','carla@mail.com','3200000006',6,'1994-01-22','2023-01-15',1),
('Oscar','Medina','2007','oscar@mail.com','3200000007',7,'1986-12-05','2018-04-30',1);


INSERT INTO empleados_roles VALUES
(1,1,'2022-01-01'),
(2,2,'2021-02-10'),
(3,3,'2020-03-01'),
(4,2,'2022-05-12'),
(5,4,'2019-07-01'),
(6,5,'2023-01-15'),
(7,6,'2018-04-30');


INSERT INTO metodos_pago (nombre_metodo) VALUES
('Tarjeta Crédito'),
('Tarjeta Débito'),
('Efectivo'),
('Transferencia'),
('PayPal'),
('Nequi'),
('Daviplata');


INSERT INTO reservas (id_cliente,id_empleado,id_paquete,fecha_reserva,fecha_inicio,fecha_fin,numero_personas,estado) VALUES
(1,1,NULL,NOW(),'2025-07-01','2025-07-05',2,'confirmada'),
(2,2,NULL,NOW(),'2025-07-10','2025-07-12',1,'pendiente'),
(3,3,NULL,NOW(),'2025-07-15','2025-07-18',3,'confirmada'),
(4,4,NULL,NOW(),'2025-08-01','2025-08-04',2,'cancelada'),
(5,5,NULL,NOW(),'2025-08-10','2025-08-12',2,'confirmada'),
(6,6,NULL,NOW(),'2025-09-01','2025-09-05',4,'pendiente'),
(7,7,NULL,NOW(),'2025-09-10','2025-09-15',2,'confirmada'),
(8,1,NULL,NOW(),'2025-10-01','2025-10-03',1,'confirmada'),
(9,2,NULL,NOW(),'2025-10-05','2025-10-09',2,'pendiente'),
(10,3,NULL,NOW(),'2025-11-01','2025-11-06',3,'confirmada');


INSERT INTO pagos (id_reserva,id_metodo_pago,monto,fecha_pago,referencia,estado) VALUES
(1,1,500000,NOW(),'REF001','pagado'),
(2,2,200000,NOW(),'REF002','pendiente'),
(3,3,700000,NOW(),'REF003','pagado'),
(4,4,300000,NOW(),'REF004','rechazado'),
(5,1,450000,NOW(),'REF005','pagado'),
(6,5,600000,NOW(),'REF006','pendiente'),
(7,6,250000,NOW(),'REF007','pagado');



INSERT INTO destinos (nombre_destino,descripcion,id_ciudad,temporada_alta_inicio,temporada_alta_fin) VALUES
('Cartagena Playa','Destino turístico de playa',3,'2025-12-01','2026-01-15'),
('Bogotá Cultural','Tour cultural por Bogotá',1,'2025-06-01','2025-08-30'),
('Medellín Innovación','Tour tecnológico',2,'2025-07-01','2025-08-15'),
('Cusco Histórico','Destino arqueológico',7,'2025-06-10','2025-09-10'),
('Lima Gastronómico','Tour gastronómico',6,'2025-05-01','2025-07-30'),
('Santiago Andes','Turismo de montaña',8,'2025-07-01','2025-09-01'),
('Madrid Histórico','Tour europeo cultural',10,'2025-04-01','2025-06-30');


INSERT INTO categoria_servicio (nombre_categoria) VALUES
('Tour'),
('Transporte'),
('Gastronomía'),
('Aventura'),
('Cultura'),
('Deporte'),
('Relajación');

INSERT INTO servicios (nombre_servicio,descripcion,id_categoria,id_destino,duracion_horas,precio_base,capacidad_maxima) VALUES
('Tour Centro Histórico','Recorrido por el centro',1,2,4,80000,20),
('Transporte Aeropuerto','Traslado aeropuerto hotel',2,1,1,50000,10),
('Cena Gourmet','Cena típica local',3,5,2,120000,30),
('Caminata Andes','Excursión de montaña',4,6,6,150000,15),
('Museos Bogotá','Visita guiada a museos',5,2,5,90000,20),
('Ciclismo Urbano','Tour en bicicleta',6,3,3,60000,12),
('Spa Relax','Sesión de spa',7,1,2,140000,8),
('Tour Playa','Excursión playa',1,1,5,110000,25),
('Ruta Gastronómica','Tour comida local',3,5,4,95000,20),
('Excursión Cusco','Tour arqueológico',5,4,6,200000,18);

INSERT INTO proveedores_servicios 
(nombre_proveedor,tipo_proveedor,contacto,telefono,correo_electronico,id_direccion,comision_porcentaje) VALUES
('Tours Caribe','Turismo','Carlos Ruiz','3011111111','tour1@mail.com',3,10),
('Transportes Rápidos','Transporte','Luis Mora','3022222222','trans@mail.com',1,8),
('Restaurante Lima','Gastronomía','Ana Vega','3033333333','rest@mail.com',6,12),
('Aventura Andes','Aventura','Pedro Castro','3044444444','avent@mail.com',8,15),
('Cultura Bogotá','Cultura','Laura Díaz','3055555555','cult@mail.com',1,9),
('BiciTour Medellín','Deporte','Mario Soto','3066666666','bici@mail.com',2,10),
('Spa Caribe','Relajación','Sofia Luna','3077777777','spa@mail.com',3,11);



INSERT INTO servicio_proveedor VALUES
(1,1,60000,1),
(2,2,30000,1),
(3,3,80000,1),
(4,4,100000,1),
(5,5,50000,1),
(6,6,40000,1),
(7,7,90000,1),
(8,1,70000,0),
(9,3,65000,0),
(10,4,120000,0);

INSERT INTO paquetes (nombre_paquete,descripcion,duracion_dias,precio_base,activo) VALUES
('Caribe Vacaciones','Paquete turístico en Cartagena',5,1200000,1),
('Bogotá Cultural','Experiencia cultural',3,600000,1),
('Medellín Aventura','Paquete aventura',4,800000,1),
('Cusco Histórico','Turismo arqueológico',5,1500000,1),
('Lima Gourmet','Experiencia gastronómica',3,700000,1),
('Andes Trek','Excursión montaña',4,900000,1),
('Madrid Cultura','Paquete europeo',6,2000000,1);

INSERT INTO paquete_servicios VALUES
(1,8,1,1),
(1,7,2,1),
(2,5,1,1),
(2,1,2,1),
(3,6,1,1),
(3,4,2,1),
(4,10,1,1),
(5,9,1,1),
(6,4,1,1),
(7,1,1,1);

INSERT INTO paquete_hotel VALUES
(1,1,4),
(2,2,2),
(3,3,3),
(4,5,4),
(5,6,2),
(6,4,3),
(7,7,5);


INSERT INTO reserva_habitaciones VALUES
(1,1,'2025-07-01','2025-07-05',120000),
(2,2,'2025-07-10','2025-07-12',180000),
(3,3,'2025-07-15','2025-07-18',170000),
(4,4,'2025-08-01','2025-08-04',200000),
(5,5,'2025-08-10','2025-08-12',350000),
(6,6,'2025-09-01','2025-09-05',220000),
(7,7,'2025-09-10','2025-09-15',260000),
(8,8,'2025-10-01','2025-10-03',100000),
(9,9,'2025-10-05','2025-10-09',150000),
(10,10,'2025-11-01','2025-11-06',210000);


INSERT INTO reserva_servicios VALUES
(1,1,'2025-07-02',2,80000),
(2,2,'2025-07-10',1,50000),
(3,3,'2025-07-16',3,120000),
(4,4,'2025-08-02',2,150000),
(5,5,'2025-08-11',2,90000),
(6,6,'2025-09-02',4,60000),
(7,7,'2025-09-11',2,140000),
(8,8,'2025-10-02',1,110000),
(9,9,'2025-10-06',2,95000),
(10,10,'2025-11-02',3,200000);


