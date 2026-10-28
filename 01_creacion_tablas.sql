DROP TABLE LOG_MODERACION CASCADE CONSTRAINTS;
DROP TABLE CALIFICACIONES CASCADE CONSTRAINTS;
DROP TABLE PAGOS CASCADE CONSTRAINTS;
DROP TABLE RESERVAS CASCADE CONSTRAINTS;
DROP TABLE TOURS CASCADE CONSTRAINTS;
DROP TABLE OPERADORES CASCADE CONSTRAINTS;
DROP TABLE USUARIOS CASCADE CONSTRAINTS;
DROP TABLE ROLES CASCADE CONSTRAINTS;

CREATE TABLE ROLES (
    id_rol       NUMBER          GENERATED ALWAYS AS IDENTITY,
    nombre_rol   VARCHAR2(50)
);

CREATE TABLE USUARIOS (
    id_usuario      NUMBER          GENERATED ALWAYS AS IDENTITY,
    nombre          VARCHAR2(100),
    email           VARCHAR2(150),
    password_hash   VARCHAR2(255),
    id_rol          NUMBER,
    estado          VARCHAR2(20)    DEFAULT 'ACTIVO',
    fecha_registro  DATE            DEFAULT SYSDATE
);

CREATE TABLE OPERADORES (
    id_operador         NUMBER          GENERATED ALWAYS AS IDENTITY,
    id_usuario          NUMBER,
    nombre_empresa      VARCHAR2(150),
    rut_empresa         VARCHAR2(20),
    estado_aprobacion   VARCHAR2(20)    DEFAULT 'PENDIENTE'
);

CREATE TABLE TOURS (
    id_tour             NUMBER          GENERATED ALWAYS AS IDENTITY,
    id_operador         NUMBER,
    nombre              VARCHAR2(150),
    destino             VARCHAR2(150),
    descripcion         VARCHAR2(1000),
    precio              NUMBER(10,2),
    cupos_totales       NUMBER,
    cupos_disponibles   NUMBER,
    fecha_tour          DATE,
    estado              VARCHAR2(20)    DEFAULT 'ACTIVO'
);

CREATE TABLE RESERVAS (
    id_reserva          NUMBER          GENERATED ALWAYS AS IDENTITY,
    id_usuario          NUMBER,
    id_tour             NUMBER,
    cantidad_personas   NUMBER,
    monto_total         NUMBER(10,2),
    estado_reserva      VARCHAR2(20)    DEFAULT 'PENDIENTE',
    fecha_reserva       DATE            DEFAULT SYSDATE
);

CREATE TABLE PAGOS (
    id_pago        NUMBER          GENERATED ALWAYS AS IDENTITY,
    id_resena      NUMBER,
    metodo_pago    VARCHAR2(50),
    monto          NUMBER(10,2),
    estado_pago    VARCHAR2(20)    DEFAULT 'PENDIENTE',
    fecha_pago     DATE            DEFAULT SYSDATE
);

CREATE TABLE CALIFICACIONES (
    id_calificacion      NUMBER          GENERATED ALWAYS AS IDENTITY,
    id_usuario           NUMBER,
    id_tour              NUMBER,
    puntaje              NUMBER(2),
    comentario           VARCHAR2(1000),
    fecha_calificacion   DATE            DEFAULT SYSDATE
);

CREATE TABLE LOG_MODERACION (
    id_log                NUMBER          GENERATED ALWAYS AS IDENTITY,
    id_moderador          NUMBER,
    id_usuario_afectado   NUMBER,
    accion                VARCHAR2(100),
    motivo                VARCHAR2(500),
    fecha_accion          DATE            DEFAULT SYSDATE
);

COMMIT;

-- ROLES
INSERT INTO ROLES (nombre_rol) VALUES ('Administrador');
INSERT INTO ROLES (nombre_rol) VALUES ('Moderador');
INSERT INTO ROLES (nombre_rol) VALUES ('Operador');
INSERT INTO ROLES (nombre_rol) VALUES ('Turista');

-- USUARIOS
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Patricia Hernandez', 'patricia.hernandez@3mtours.cl', '$2a$10$xo9xptnjFnF7DiFlzGz92mhashsimulado', 1, 'ACTIVO', DATE '2025-01-06');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Marcelo Ortega', 'marcelo.ortega@3mtours.cl', '$2a$10$pmEfbcm7BGeamuo8k4ecvyhashsimulado', 2, 'ACTIVO', DATE '2025-01-13');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Daniela Paredes', 'daniela.paredes@3mtours.cl', '$2a$10$Dg17dkxrzA0q6mzsyc8eGAhashsimulado', 2, 'ACTIVO', DATE '2025-01-21');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Ricardo Alvarado', 'ricardo.alvarado@chiloeaventura.cl', '$2a$10$ldkxgrDubmm3dkl1z1iejghashsimulado', 3, 'ACTIVO', DATE '2025-05-05');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Soledad Barria', 'soledad.barria@rutaspatagonicas.cl', '$2a$10$lgc1z26sunrlxsz5FzbjC4hashsimulado', 3, 'ACTIVO', DATE '2025-02-05');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Hugo Oyarzun', 'hugo.oyarzun@lagosytermas.cl', '$2a$10$zaG2yGhwtl9s28urnegrvChashsimulado', 3, 'ACTIVO', DATE '2025-10-19');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Carla Vidal', 'carla.vidal@fiordosur.cl', '$2a$10$rGbdke042a4tcwAvtclfm4hashsimulado', 3, 'ACTIVO', DATE '2025-09-18');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Esteban Yanez', 'esteban.yanez@volcanesactivos.cl', '$2a$10$ubB1Enarj3e7Bg7mEruutghashsimulado', 3, 'ACTIVO', DATE '2025-08-27');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Paula Cardenas', 'paula.cardenas@rutalacustre.cl', '$2a$10$izGfd03o0laF3yC4tuoGq7hashsimulado', 3, 'ACTIVO', DATE '2025-06-02');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Ignacio Vera', 'ignacio.vera@surtravel.cl', '$2a$10$49kq3rnu6q91Cg8f8oe3e6hashsimulado', 3, 'ACTIVO', DATE '2025-04-25');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Agustin Aguilar', 'agustin.aguilar0@gmail.com', '$2a$10$ag48d0lArdoCw8A5uxAkDmhashsimulado', 4, 'SUSPENDIDO', DATE '2025-04-01');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Martina Barria', 'martina.barria1@gmail.com', '$2a$10$jd9GEehmbncpskrDhhAqDvhashsimulado', 4, 'ACTIVO', DATE '2025-04-07');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Fernanda Silva', 'fernanda.silva2@gmail.com', '$2a$10$zjBtC5umxd79m8Dtm93eqphashsimulado', 4, 'ACTIVO', DATE '2025-01-29');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Felipe Contreras', 'felipe.contreras3@gmail.com', '$2a$10$mEa2ra4086G250j1jikG0Dhashsimulado', 4, 'INACTIVO', DATE '2026-07-14');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Vicente Silva', 'vicente.silva4@gmail.com', '$2a$10$feAb0bpf6ori04pvlh678mhashsimulado', 4, 'ACTIVO', DATE '2025-10-13');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Gaspar Ruiz', 'gaspar.ruiz5@gmail.com', '$2a$10$41udGjDCr3xdqlfpGlqBpDhashsimulado', 4, 'ACTIVO', DATE '2025-06-14');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Emilia Barria', 'emilia.barria6@gmail.com', '$2a$10$uA7oABBtEBfbb9ekxqp7Dxhashsimulado', 4, 'ACTIVO', DATE '2025-06-10');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Fernanda Lagos', 'fernanda.lagos7@gmail.com', '$2a$10$zF5C2A7mDjtkp9p5Bcl872hashsimulado', 4, 'ACTIVO', DATE '2025-04-06');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Catalina Diaz', 'catalina.diaz8@gmail.com', '$2a$10$djB8co90i2xz1k00zl99x1hashsimulado', 4, 'ACTIVO', DATE '2025-12-20');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Nicolas Vera', 'nicolas.vera9@gmail.com', '$2a$10$e4fp0zalfsectpztjAF6Cmhashsimulado', 4, 'SUSPENDIDO', DATE '2026-04-17');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Felipe Diaz', 'felipe.diaz10@gmail.com', '$2a$10$Bb93seEt5ngfAzEqzmvs1ehashsimulado', 4, 'SUSPENDIDO', DATE '2026-01-24');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Camila Cardenas', 'camila.cardenas11@gmail.com', '$2a$10$C4x4s5r2rFnnk8DuddsGqfhashsimulado', 4, 'ACTIVO', DATE '2026-01-07');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Martina Contreras', 'martina.contreras12@gmail.com', '$2a$10$c8yCr47s6cmnevgu3pxeljhashsimulado', 4, 'INACTIVO', DATE '2025-02-17');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Agustin Silva', 'agustin.silva13@gmail.com', '$2a$10$syGADxACDblG6phgCcF8dwhashsimulado', 4, 'INACTIVO', DATE '2025-03-24');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Maximiliano Silva', 'maximiliano.silva14@gmail.com', '$2a$10$qtgnn7z4gGcdtsArjwoeDzhashsimulado', 4, 'SUSPENDIDO', DATE '2026-01-26');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Antonia Oyarzun', 'antonia.oyarzun15@gmail.com', '$2a$10$wnj9ci7GGmfvsfwjyCprFshashsimulado', 4, 'INACTIVO', DATE '2026-01-10');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Diego Bravo', 'diego.bravo16@gmail.com', '$2a$10$tdnsrBmr8h7tDpsesrd4Gjhashsimulado', 4, 'ACTIVO', DATE '2025-10-02');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Emilia Espinoza', 'emilia.espinoza17@gmail.com', '$2a$10$0dBwi0p8BgelhgGd7BtyyDhashsimulado', 4, 'INACTIVO', DATE '2025-03-16');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Nicolas Sandoval', 'nicolas.sandoval18@gmail.com', '$2a$10$4B9n8nsuB1zpdtbpmB9dzqhashsimulado', 4, 'ACTIVO', DATE '2025-09-09');
INSERT INTO USUARIOS (nombre, email, password_hash, id_rol, estado, fecha_registro) VALUES ('Diego Oyarzun', 'diego.oyarzun19@gmail.com', '$2a$10$y8Fb6yiAv8t139dBbE9wAphashsimulado', 4, 'ACTIVO', DATE '2026-07-26');

-- OPERADORES (id_usuario 4 al 10 corresponden a los 7 usuarios con rol Operador)
INSERT INTO OPERADORES (id_usuario, nombre_empresa, rut_empresa, estado_aprobacion) VALUES (4, 'Chiloe Aventura SpA', '76123001-4', 'APROBADO');
INSERT INTO OPERADORES (id_usuario, nombre_empresa, rut_empresa, estado_aprobacion) VALUES (5, 'Rutas Patagonicas Ltda', '76233112-5', 'APROBADO');
INSERT INTO OPERADORES (id_usuario, nombre_empresa, rut_empresa, estado_aprobacion) VALUES (6, 'Lagos y Termas Turismo', '76344223-6', 'APROBADO');
INSERT INTO OPERADORES (id_usuario, nombre_empresa, rut_empresa, estado_aprobacion) VALUES (7, 'Fiordo Sur Expediciones', '76455334-7', 'APROBADO');
INSERT INTO OPERADORES (id_usuario, nombre_empresa, rut_empresa, estado_aprobacion) VALUES (8, 'Volcanes Activos Tours', '76566445-8', 'APROBADO');
INSERT INTO OPERADORES (id_usuario, nombre_empresa, rut_empresa, estado_aprobacion) VALUES (9, 'Ruta Lacustre SpA', '76677556-9', 'PENDIENTE');
INSERT INTO OPERADORES (id_usuario, nombre_empresa, rut_empresa, estado_aprobacion) VALUES (10, 'Sur Travel Experience', '76788667-0', 'APROBADO');

-- TOURS
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (2, 'Palafitos de Castro', 'Chiloe', 'Tour guiado por Chiloe, incluye transporte y guia bilingue. Cupos limitados.', 72000, 15, 14, DATE '2025-05-28', 'CANCELADO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (7, 'Iglesias Patrimoniales de Chiloe', 'Chiloe', 'Tour guiado por Chiloe, incluye transporte y guia bilingue. Cupos limitados.', 35000, 18, 10, DATE '2025-03-05', 'ACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (5, 'Curanto y Cultura Chilota', 'Chiloe', 'Tour guiado por Chiloe, incluye transporte y guia bilingue. Cupos limitados.', 85000, 15, 9, DATE '2025-10-13', 'ACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (6, 'Parque Tantauco Full Day', 'Chiloe', 'Tour guiado por Chiloe, incluye transporte y guia bilingue. Cupos limitados.', 48000, 12, 8, DATE '2025-04-12', 'ACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (5, 'Carretera Austral Norte', 'Patagonia', 'Tour guiado por Patagonia, incluye transporte y guia bilingue. Cupos limitados.', 55000, 15, 2, DATE '2025-08-23', 'ACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (2, 'Glaciar Queulat', 'Patagonia', 'Tour guiado por Patagonia, incluye transporte y guia bilingue. Cupos limitados.', 55000, 18, 16, DATE '2025-02-24', 'CANCELADO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (2, 'Fiordos de Patagonia', 'Patagonia', 'Tour guiado por Patagonia, incluye transporte y guia bilingue. Cupos limitados.', 72000, 12, 0, DATE '2025-09-04', 'ACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (4, 'Trekking Patagonia Salvaje', 'Patagonia', 'Tour guiado por Patagonia, incluye transporte y guia bilingue. Cupos limitados.', 42000, 20, 6, DATE '2025-10-28', 'ACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (5, 'Costanera y Teatro del Lago', 'Frutillar', 'Tour guiado por Frutillar, incluye transporte y guia bilingue. Cupos limitados.', 110000, 10, 0, DATE '2025-03-30', 'INACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (5, 'Museo Colonial Aleman', 'Frutillar', 'Tour guiado por Frutillar, incluye transporte y guia bilingue. Cupos limitados.', 95000, 15, 5, DATE '2025-03-29', 'ACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (2, 'Frutillar Bajo al Atardecer', 'Frutillar', 'Tour guiado por Frutillar, incluye transporte y guia bilingue. Cupos limitados.', 48000, 10, 6, DATE '2025-10-14', 'INACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (5, 'Volcan Osorno Base', 'Puerto Varas', 'Tour guiado por Puerto Varas, incluye transporte y guia bilingue. Cupos limitados.', 22000, 30, 10, DATE '2025-07-02', 'CANCELADO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (5, 'Saltos del Petrohue', 'Puerto Varas', 'Tour guiado por Puerto Varas, incluye transporte y guia bilingue. Cupos limitados.', 65000, 12, 10, DATE '2025-08-10', 'INACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (5, 'Kayak Lago Llanquihue', 'Puerto Varas', 'Tour guiado por Puerto Varas, incluye transporte y guia bilingue. Cupos limitados.', 95000, 20, 20, DATE '2025-07-15', 'ACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (1, 'Ciudad de las Rosas', 'Puerto Varas', 'Tour guiado por Puerto Varas, incluye transporte y guia bilingue. Cupos limitados.', 35000, 30, 5, DATE '2025-07-07', 'ACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (2, 'Termas de Puyehue', 'Osorno', 'Tour guiado por Osorno, incluye transporte y guia bilingue. Cupos limitados.', 65000, 10, 9, DATE '2025-10-06', 'CANCELADO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (7, 'Parque Nacional Puyehue', 'Osorno', 'Tour guiado por Osorno, incluye transporte y guia bilingue. Cupos limitados.', 55000, 30, 26, DATE '2025-04-06', 'INACTIVO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (5, 'Cascadas Ocultas de Osorno', 'Osorno', 'Tour guiado por Osorno, incluye transporte y guia bilingue. Cupos limitados.', 25000, 15, 2, DATE '2025-05-19', 'CANCELADO');
INSERT INTO TOURS (id_operador, nombre, destino, descripcion, precio, cupos_totales, cupos_disponibles, fecha_tour, estado) VALUES (7, 'Ruta de los Lagos', 'Osorno', 'Tour guiado por Osorno, incluye transporte y guia bilingue. Cupos limitados.', 85000, 25, 19, DATE '2025-07-09', 'ACTIVO');

-- RESERVAS
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (22, 15, 5, 175000, 'CONFIRMADA', DATE '2025-05-08');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (18, 3, 3, 255000, 'CONFIRMADA', DATE '2025-04-29');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (29, 8, 1, 42000, 'CONFIRMADA', DATE '2025-02-01');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (18, 3, 1, 85000, 'CANCELADA', DATE '2025-02-07');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (27, 8, 3, 126000, 'PENDIENTE', DATE '2025-04-21');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (28, 5, 6, 330000, 'CANCELADA', DATE '2025-09-01');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (18, 16, 4, 260000, 'CONFIRMADA', DATE '2025-02-20');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (24, 12, 4, 88000, 'CONFIRMADA', DATE '2025-01-29');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (14, 2, 4, 140000, 'PENDIENTE', DATE '2025-02-26');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (18, 7, 2, 144000, 'CONFIRMADA', DATE '2025-03-14');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (24, 6, 3, 165000, 'CONFIRMADA', DATE '2025-02-09');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (25, 18, 1, 25000, 'CONFIRMADA', DATE '2025-10-05');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (11, 3, 2, 170000, 'CONFIRMADA', DATE '2025-09-07');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (26, 7, 4, 288000, 'CANCELADA', DATE '2025-03-27');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (23, 1, 4, 288000, 'CONFIRMADA', DATE '2025-08-22');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (20, 14, 6, 570000, 'CANCELADA', DATE '2025-09-08');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (15, 7, 3, 216000, 'CONFIRMADA', DATE '2025-01-31');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (29, 18, 1, 25000, 'PENDIENTE', DATE '2025-01-31');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (12, 19, 4, 340000, 'CONFIRMADA', DATE '2025-09-30');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (16, 2, 5, 175000, 'CONFIRMADA', DATE '2025-04-07');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (13, 3, 6, 510000, 'CANCELADA', DATE '2025-07-27');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (14, 19, 2, 170000, 'CONFIRMADA', DATE '2025-01-22');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (30, 3, 4, 340000, 'PENDIENTE', DATE '2025-09-26');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (21, 9, 2, 220000, 'PENDIENTE', DATE '2025-06-11');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (18, 9, 4, 440000, 'CONFIRMADA', DATE '2025-06-04');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (25, 11, 1, 48000, 'CONFIRMADA', DATE '2025-02-22');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (13, 18, 2, 50000, 'CONFIRMADA', DATE '2025-03-10');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (22, 3, 2, 170000, 'CONFIRMADA', DATE '2025-03-23');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (25, 18, 6, 150000, 'CONFIRMADA', DATE '2025-09-29');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (11, 18, 3, 75000, 'CANCELADA', DATE '2025-02-24');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (15, 9, 1, 110000, 'CANCELADA', DATE '2025-03-22');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (19, 10, 5, 475000, 'CONFIRMADA', DATE '2025-06-26');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (17, 9, 5, 550000, 'CONFIRMADA', DATE '2025-01-28');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (13, 14, 3, 285000, 'CONFIRMADA', DATE '2025-06-21');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (15, 9, 2, 220000, 'PENDIENTE', DATE '2025-08-08');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (28, 1, 1, 72000, 'CONFIRMADA', DATE '2025-03-19');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (28, 2, 3, 105000, 'CONFIRMADA', DATE '2025-03-18');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (24, 5, 1, 55000, 'CONFIRMADA', DATE '2025-01-22');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (22, 7, 6, 432000, 'CONFIRMADA', DATE '2025-02-23');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (22, 18, 4, 100000, 'CANCELADA', DATE '2025-03-22');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (18, 6, 2, 110000, 'CANCELADA', DATE '2025-01-14');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (16, 11, 4, 192000, 'CANCELADA', DATE '2025-05-09');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (19, 6, 6, 330000, 'CONFIRMADA', DATE '2025-01-21');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (26, 8, 2, 84000, 'CANCELADA', DATE '2025-08-25');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (22, 10, 2, 190000, 'CONFIRMADA', DATE '2025-04-10');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (23, 11, 3, 144000, 'CANCELADA', DATE '2025-05-24');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (22, 17, 4, 220000, 'PENDIENTE', DATE '2025-10-03');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (21, 1, 1, 72000, 'CANCELADA', DATE '2025-05-15');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (16, 19, 3, 255000, 'CONFIRMADA', DATE '2025-08-12');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (22, 11, 4, 192000, 'PENDIENTE', DATE '2025-09-20');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (14, 13, 5, 325000, 'CONFIRMADA', DATE '2025-01-24');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (24, 1, 5, 360000, 'CANCELADA', DATE '2025-10-04');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (17, 12, 4, 88000, 'CONFIRMADA', DATE '2025-06-20');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (30, 11, 6, 288000, 'CANCELADA', DATE '2025-06-04');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (27, 10, 6, 570000, 'CONFIRMADA', DATE '2025-07-27');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (20, 18, 2, 50000, 'CONFIRMADA', DATE '2025-07-15');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (16, 19, 3, 255000, 'CONFIRMADA', DATE '2025-01-02');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (20, 10, 2, 190000, 'CONFIRMADA', DATE '2025-06-15');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (25, 15, 4, 140000, 'PENDIENTE', DATE '2025-09-20');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (26, 6, 6, 330000, 'CONFIRMADA', DATE '2025-09-22');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (30, 11, 1, 48000, 'CANCELADA', DATE '2025-05-02');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (20, 8, 2, 84000, 'CONFIRMADA', DATE '2025-01-25');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (18, 16, 5, 325000, 'CANCELADA', DATE '2025-02-08');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (25, 14, 6, 570000, 'CONFIRMADA', DATE '2025-07-17');
INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva) VALUES (26, 13, 2, 130000, 'CONFIRMADA', DATE '2025-01-04');

-- PAGOS
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (1, 'TARJETA_CREDITO', 175000, 'PAGADO', DATE '2025-05-08');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (2, 'WEBPAY', 255000, 'PAGADO', DATE '2025-04-29');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (3, 'TARJETA_DEBITO', 42000, 'PAGADO', DATE '2025-02-01');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (5, 'PAYPAL', 126000, 'PENDIENTE', DATE '2025-04-21');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (7, 'WEBPAY', 260000, 'PAGADO', DATE '2025-02-20');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (8, 'TARJETA_CREDITO', 88000, 'PAGADO', DATE '2025-01-29');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (10, 'TARJETA_CREDITO', 144000, 'PAGADO', DATE '2025-03-14');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (11, 'WEBPAY', 165000, 'PAGADO', DATE '2025-02-09');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (12, 'TARJETA_DEBITO', 25000, 'PAGADO', DATE '2025-10-05');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (13, 'WEBPAY', 170000, 'PAGADO', DATE '2025-09-07');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (15, 'PAYPAL', 288000, 'PAGADO', DATE '2025-08-22');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (17, 'PAYPAL', 216000, 'PAGADO', DATE '2025-01-31');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (19, 'WEBPAY', 340000, 'PAGADO', DATE '2025-09-30');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (20, 'PAYPAL', 175000, 'PAGADO', DATE '2025-04-07');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (22, 'PAYPAL', 170000, 'PAGADO', DATE '2025-01-22');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (23, 'PAYPAL', 340000, 'PENDIENTE', DATE '2025-09-26');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (24, 'TARJETA_DEBITO', 220000, 'PENDIENTE', DATE '2025-06-11');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (25, 'WEBPAY', 440000, 'PAGADO', DATE '2025-06-04');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (26, 'WEBPAY', 48000, 'PAGADO', DATE '2025-02-22');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (27, 'TRANSFERENCIA', 50000, 'PAGADO', DATE '2025-03-10');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (28, 'TARJETA_DEBITO', 170000, 'PAGADO', DATE '2025-03-23');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (29, 'TRANSFERENCIA', 150000, 'PAGADO', DATE '2025-09-29');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (32, 'PAYPAL', 475000, 'PAGADO', DATE '2025-06-26');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (33, 'WEBPAY', 550000, 'PAGADO', DATE '2025-01-28');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (34, 'TARJETA_DEBITO', 285000, 'PAGADO', DATE '2025-06-21');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (35, 'TARJETA_CREDITO', 220000, 'PENDIENTE', DATE '2025-08-08');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (36, 'TRANSFERENCIA', 72000, 'PAGADO', DATE '2025-03-19');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (37, 'TARJETA_DEBITO', 105000, 'PAGADO', DATE '2025-03-18');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (38, 'TRANSFERENCIA', 55000, 'PAGADO', DATE '2025-01-22');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (39, 'TRANSFERENCIA', 432000, 'PAGADO', DATE '2025-02-23');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (43, 'TRANSFERENCIA', 330000, 'PAGADO', DATE '2025-01-21');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (45, 'PAYPAL', 190000, 'PAGADO', DATE '2025-04-10');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (47, 'TARJETA_DEBITO', 220000, 'PENDIENTE', DATE '2025-10-03');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (49, 'TARJETA_DEBITO', 255000, 'PAGADO', DATE '2025-08-12');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (50, 'TARJETA_DEBITO', 192000, 'PENDIENTE', DATE '2025-09-20');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (51, 'TARJETA_DEBITO', 325000, 'PAGADO', DATE '2025-01-24');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (53, 'TARJETA_CREDITO', 88000, 'PAGADO', DATE '2025-06-20');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (55, 'WEBPAY', 570000, 'PAGADO', DATE '2025-07-27');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (56, 'WEBPAY', 50000, 'PAGADO', DATE '2025-07-15');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (57, 'TRANSFERENCIA', 255000, 'PAGADO', DATE '2025-01-02');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (58, 'PAYPAL', 190000, 'PAGADO', DATE '2025-06-15');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (59, 'TARJETA_CREDITO', 140000, 'PENDIENTE', DATE '2025-09-20');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (60, 'TARJETA_DEBITO', 330000, 'PAGADO', DATE '2025-09-22');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (62, 'WEBPAY', 84000, 'PAGADO', DATE '2025-01-25');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (64, 'WEBPAY', 570000, 'PAGADO', DATE '2025-07-17');
INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago) VALUES (65, 'PAYPAL', 130000, 'PAGADO', DATE '2025-01-04');

-- CALIFICACIONES
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (18, 3, 2, 'Buena relacion precio calidad.', DATE '2025-07-15');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (29, 8, 2, 'Faltó organizacion en los horarios.', DATE '2025-07-20');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (18, 7, 5, 'Una de las mejores actividades del viaje.', DATE '2025-04-24');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (24, 6, 4, 'Grupo muy numeroso, se sintio apretado.', DATE '2025-01-16');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (25, 18, 5, 'Guia con mucho conocimiento de la zona.', DATE '2025-03-27');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (12, 19, 2, 'Buena relacion precio calidad.', DATE '2025-10-17');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (14, 19, 5, 'Grupo muy numeroso, se sintio apretado.', DATE '2025-04-05');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (18, 9, 4, 'El precio vale la pena, volveria a repetir.', DATE '2025-08-22');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (25, 11, 5, 'Guia con mucho conocimiento de la zona.', DATE '2025-05-24');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (25, 18, 3, 'Excelente experiencia, el guia muy profesional.', DATE '2025-10-05');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (19, 10, 2, 'El precio vale la pena, volveria a repetir.', DATE '2025-02-06');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (24, 5, 3, 'Paisajes increibles, totalmente recomendado.', DATE '2025-05-04');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (22, 7, 5, 'Buena relacion precio calidad.', DATE '2025-04-23');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (19, 6, 4, 'Superó mis expectativas, muy bien organizado.', DATE '2025-03-28');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (22, 10, 2, 'Buen tour pero el transporte se atraso.', DATE '2025-03-26');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (14, 13, 3, 'Faltó organizacion en los horarios.', DATE '2025-10-23');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (20, 18, 5, 'Buen tour pero el transporte se atraso.', DATE '2025-05-06');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (16, 19, 5, 'Buena relacion precio calidad.', DATE '2025-03-04');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (26, 6, 3, 'Una de las mejores actividades del viaje.', DATE '2025-08-09');
INSERT INTO CALIFICACIONES (id_usuario, id_tour, puntaje, comentario, fecha_calificacion) VALUES (25, 14, 5, 'Excelente experiencia, el guia muy profesional.', DATE '2025-08-05');

-- LOG_MODERACION
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (2, 17, 'REACTIVACION_CUENTA', 'Incumplimiento de terminos y condiciones.', DATE '2025-03-21');
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (3, 9, 'RECHAZO_OPERADOR', 'Cuenta reactivada tras revision manual.', DATE '2025-10-04');
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (3, 18, 'ELIMINACION_COMENTARIO', 'Documentacion de operador incompleta.', DATE '2025-05-19');
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (3, 11, 'SUSPENSION_CUENTA', 'Cuenta reactivada tras revision manual.', DATE '2025-08-20');
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (2, 28, 'ELIMINACION_COMENTARIO', 'Documentacion de operador incompleta.', DATE '2025-07-15');
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (3, 4, 'ELIMINACION_COMENTARIO', 'Cuenta reactivada tras revision manual.', DATE '2025-04-05');
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (3, 10, 'REACTIVACION_CUENTA', 'Cuenta reactivada tras revision manual.', DATE '2025-06-25');
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (3, 23, 'REACTIVACION_CUENTA', 'Documentacion de operador incompleta.', DATE '2025-01-07');
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (2, 6, 'ADVERTENCIA', 'Incumplimiento de terminos y condiciones.', DATE '2025-09-09');
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (2, 26, 'ELIMINACION_COMENTARIO', 'Incumplimiento de terminos y condiciones.', DATE '2025-08-19');
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (2, 6, 'REACTIVACION_CUENTA', 'Comentario con lenguaje inapropiado.', DATE '2025-07-28');
INSERT INTO LOG_MODERACION (id_moderador, id_usuario_afectado, accion, motivo, fecha_accion) VALUES (2, 13, 'RECHAZO_OPERADOR', 'Cuenta reactivada tras revision manual.', DATE '2025-09-01');

COMMIT;




DECLARE
    TYPE r_tour IS RECORD (
        id_tour             tours.id_tour%TYPE,
        nombre              tours.nombre%TYPE,
        precio              tours.precio%TYPE,
        cupos_disponibles   tours.cupos_disponibles%TYPE
    );
 
    v_tour   r_tour;
 
    TYPE t_destinos IS VARRAY(5) OF VARCHAR2(100);
    v_destinos   t_destinos := t_destinos('Chiloe', 'Patagonia', 'Frutillar', 'Puerto Varas', 'Osorno');
 
BEGIN
    SELECT id_tour, nombre, precio, cupos_disponibles
      INTO v_tour
      FROM tours
     WHERE id_tour = 1;
 
    DBMS_OUTPUT.PUT_LINE('Tour: ' || v_tour.nombre || ' - Precio: ' || v_tour.precio || ' - Cupos: ' || v_tour.cupos_disponibles);
 
    FOR i IN 1 .. v_destinos.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Destino ' || i || ': ' || v_destinos(i));
    END LOOP;
END;
/
 
 
DECLARE
    CURSOR c_tours IS
        SELECT id_tour, nombre, destino
          FROM tours;
 
    CURSOR c_reservas_por_tour (p_id_tour tours.id_tour%TYPE) IS
        SELECT r.id_reserva, u.nombre, r.cantidad_personas
          FROM reservas r
          JOIN usuarios u ON u.id_usuario = r.id_usuario
         WHERE r.id_tour = p_id_tour;
 
    v_total_pasajeros   NUMBER;
BEGIN
    FOR t_rec IN c_tours LOOP
        DBMS_OUTPUT.PUT_LINE('Tour ' || t_rec.id_tour || ' - ' || t_rec.nombre || ' (' || t_rec.destino || ')');
        v_total_pasajeros := 0;
 
        FOR r_rec IN c_reservas_por_tour(t_rec.id_tour) LOOP
            DBMS_OUTPUT.PUT_LINE('   Reserva ' || r_rec.id_reserva || ' - ' || r_rec.nombre || ' - ' || r_rec.cantidad_personas || ' pax');
            v_total_pasajeros := v_total_pasajeros + r_rec.cantidad_personas;
        END LOOP;
 
        DBMS_OUTPUT.PUT_LINE('   Total pasajeros: ' || v_total_pasajeros);
    END LOOP;
END;
/
 
 
DECLARE
    v_cupos           tours.cupos_disponibles%TYPE;
    v_precio          tours.precio%TYPE;
    v_cantidad        NUMBER := 3;
    v_id_tour         tours.id_tour%TYPE := 3;
    v_costo_por_pax   NUMBER;
 
    ex_cupos_insuficientes   EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_cupos_insuficientes, -20001);
 
BEGIN
    SELECT cupos_disponibles, precio
      INTO v_cupos, v_precio
      FROM tours
     WHERE id_tour = v_id_tour;
 
    IF v_cupos < v_cantidad THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cupos insuficientes para el tour ' || v_id_tour);
    END IF;
 
    v_costo_por_pax := ROUND(v_precio / v_cantidad, 2);
    DBMS_OUTPUT.PUT_LINE('Costo por pasajero: ' || v_costo_por_pax);
 
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe un tour con el id indicado.');
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('La cantidad de pasajeros no puede ser cero.');
    WHEN ex_cupos_insuficientes THEN
        DBMS_OUTPUT.PUT_LINE('Reserva rechazada: no hay cupos disponibles suficientes.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;
/


DECLARE

    TYPE r_reserva IS RECORD (
        id_usuario          RESERVAS.id_usuario%TYPE,
        id_tour             RESERVAS.id_tour%TYPE,
        cantidad_personas   RESERVAS.cantidad_personas%TYPE,
        monto_total         RESERVAS.monto_total%TYPE,
        metodo_pago         PAGOS.metodo_pago%TYPE
    );
    v_nueva   r_reserva;

    TYPE t_metodos_pago IS VARRAY(5) OF VARCHAR2(30);
    v_metodos_validos   t_metodos_pago := t_metodos_pago(
        'TARJETA_CREDITO', 'TARJETA_DEBITO', 'TRANSFERENCIA', 'WEBPAY', 'PAYPAL'
    );
    v_metodo_valido     BOOLEAN;

    CURSOR c_tour_info (p_id_tour TOURS.id_tour%TYPE) IS
        SELECT precio, cupos_disponibles, estado
          FROM TOURS
         WHERE id_tour = p_id_tour;

    v_precio              TOURS.precio%TYPE;
    v_cupos_disponibles   TOURS.cupos_disponibles%TYPE;
    v_estado_tour         TOURS.estado%TYPE;
    v_costo_por_persona   NUMBER;
    
    v_id_reserva_generado RESERVAS.id_reserva%TYPE;

    ex_cupos_insuficientes    EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_cupos_insuficientes, -20001);

    ex_metodo_pago_invalido   EXCEPTION;
    ex_tour_no_disponible     EXCEPTION;

BEGIN

    v_nueva.id_usuario         := 15;
    v_nueva.id_tour            := 4;
    v_nueva.cantidad_personas  := 3;
    v_nueva.metodo_pago        := 'WEBPAY';

    v_metodo_valido := FALSE;
    FOR i IN 1 .. v_metodos_validos.COUNT LOOP
        IF v_metodos_validos(i) = v_nueva.metodo_pago THEN
            v_metodo_valido := TRUE;
            EXIT;
        END IF;
    END LOOP;

    IF NOT v_metodo_valido THEN
        RAISE ex_metodo_pago_invalido;
    END IF;

    OPEN c_tour_info(v_nueva.id_tour);
    FETCH c_tour_info INTO v_precio, v_cupos_disponibles, v_estado_tour;

    IF c_tour_info%NOTFOUND THEN
        CLOSE c_tour_info;
        RAISE NO_DATA_FOUND;
    END IF;
    CLOSE c_tour_info;

    IF v_estado_tour != 'ACTIVO' THEN
        RAISE ex_tour_no_disponible;
    END IF;

    IF v_cupos_disponibles < v_nueva.cantidad_personas THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cupos insuficientes para el tour ' || v_nueva.id_tour);
    END IF;

    v_nueva.monto_total   := v_precio * v_nueva.cantidad_personas;
    v_costo_por_persona   := ROUND(v_nueva.monto_total / v_nueva.cantidad_personas, 2);

    INSERT INTO RESERVAS (id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva, fecha_reserva)
    VALUES (v_nueva.id_usuario, v_nueva.id_tour, v_nueva.cantidad_personas, v_nueva.monto_total, 'CONFIRMADA', SYSDATE)
    RETURNING id_reserva INTO v_id_reserva_generado;

    INSERT INTO PAGOS (id_resena, metodo_pago, monto, estado_pago, fecha_pago)
    VALUES (v_id_reserva_generado, v_nueva.metodo_pago, v_nueva.monto_total, 'PAGADO', SYSDATE);

    UPDATE TOURS
       SET cupos_disponibles = cupos_disponibles - v_nueva.cantidad_personas
     WHERE id_tour = v_nueva.id_tour;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Reserva ' || v_id_reserva_generado || ' confirmada.');
    DBMS_OUTPUT.PUT_LINE('Monto total: $' || v_nueva.monto_total || ' | Costo por persona: $' || v_costo_por_persona);

EXCEPTION
    WHEN ex_cupos_insuficientes THEN
        DBMS_OUTPUT.PUT_LINE('Reserva rechazada: no hay cupos disponibles suficientes.');
    WHEN ex_metodo_pago_invalido THEN
        DBMS_OUTPUT.PUT_LINE('Reserva rechazada: metodo de pago no valido.');
    WHEN ex_tour_no_disponible THEN
        DBMS_OUTPUT.PUT_LINE('Reserva rechazada: el tour no esta activo.');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe un tour con el id indicado.');
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('La cantidad de pasajeros no puede ser cero.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;
/