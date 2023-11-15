create database prueba32;
use prueba32;
create table rol (
id tinyint (1) primary key,
nombreRol varchar (12) not null
);
create table idioma (
nombre varchar (20),
id tinyint (1) primary key
);
create table usuario (
Ci int (8) primary key,
id_rol tinyint (1) not null,
celular varchar (9) not null,
apellido varchar (15) not null,
nombre varchar (15) not null,
id_idioma TINYINT (1) NOT NULL,
nombreUsuario varchar (30) unique,
longitud float (25) not null,
latitud float (25) not null,
FOREIGN KEY (id_idioma) REFERENCES idioma (id),
FOREIGN KEY (id_rol) REFERENCES rol (id)
);
create table backoffice (
Ci int (8) primary key,
FOREIGN KEY (ci) REFERENCES usuario (ci)
);
create table camionero (
Ci int (8) primary key,
FOREIGN KEY (ci) REFERENCES usuario (ci)
);
create table almacenero (
Ci int (8) primary key,
FOREIGN KEY (ci) REFERENCES usuario (ci)
);
create table cliente (
Ci int (8) primary key,
longitud float (25) not null,
latitud float (25) not null,
FOREIGN KEY (Ci) REFERENCES usuario (Ci)
);
create table camion (
matricula varchar (7) primary key,
capacidadKg float (8) not null,
capacidadM3 float (8) not null
);
create table empresa (
rut bigint (12) primary key
);
create table almacen (
id mediumint (6) primary key,
longitud float (25) not null,
latitud float (25) not null,
rut_empresa bigint (12) not null,
ci_almacenero int (8) not null ,
capacidadKg float (8) not null,
capacidadM3 float (8) not null,
FOREIGN KEY (rut_empresa) REFERENCES empresa (rut),
FOREIGN KEY (ci_almacenero) REFERENCES almacenero (ci)
);
CREATE TABLE manejar (
matricula VARCHAR (7) ,
Ci_camionero int (8) primary KEY ,
FOREIGN KEY (matricula) REFERENCES camion (matricula),
FOREIGN KEY (Ci_camionero) REFERENCES camionero (Ci)
);
create table lote (
id mediumint (6) primary key,
id_almacen mediumint (6) not null,
FOREIGN KEY (id_almacen) REFERENCES almacen (id)
);
create table camion_lote(
id_lote mediumint (6) primary key,
matricula varchar (7),
fecha datetime ,
FOREIGN KEY (id_lote) REFERENCES lote (id),
FOREIGN KEY (matricula) REFERENCES camion (matricula)
);




create table estado (
estadoDeEnvio varchar (20) primary key
);
create table bulto (
id mediumint (6) primary key,
nombre varchar (15) not null,
pesoKg float (8) not null,
volumenM3 float (8) not null,
ci_cliente int (8) not null,
estadoDeEnvio varchar (20) not null,
FOREIGN KEY (ci_cliente) REFERENCES cliente (ci),
FOREIGN KEY (estadoDeEnvio) REFERENCES estado (estadoDeEnvio)
);
create table paquete(
id mediumint (6) primary key,
FOREIGN KEY (id) REFERENCES bulto (id)
);
create table producto(
id mediumint (8) primary key,
nombre_producto varchar (25) not null
);
CREATE TABLE articulo(
id MEDIUMINT (8) PRIMARY KEY,
id_producto MEDIUMINT (8) NOT NULL,
FOREIGN KEY (id) REFERENCES bulto (id),
FOREIGN KEY (id_producto) REFERENCES producto (id)
);
CREATE TABLE bulto_lote(
id_lote MEDIUMINT (6),
id_bulto MEDIUMINT (6) primary key,
FOREIGN KEY (id_lote) REFERENCES lote (id),
FOREIGN KEY (id_bulto) REFERENCES bulto (id)
);



INSERT INTO rol (id, nombreRol) VALUES
(1, 'almacenero'),
(2, 'camionero'),
(4, 'cliente'),
(3, 'backoffice');


INSERT INTO idioma (nombre, id) VALUES
('EspaÃ±ol', 1),
('InglÃ©s', 2);
INSERT INTO usuario (Ci, id_rol, celular, apellido, nombre, id_idioma,
nombreUsuario, longitud, latitud) VALUES
(12345678, 3, '123456789', 'GarcÃa', 'Juan', 1, 'juan', -56.164532, -34.901112),
(23456789, 2, '234567890', 'PÃ©rez', 'MarÃa', 2, 'maria', -56.164532, -34.901112),
(34567890, 3, '345678901', 'RodrÃguez', 'Carlos', 1, 'carlosrodri', -56.164532, -34.901112),
(45678901, 1, '456789012', 'FernÃ¡ndez', 'Ana', 2, 'anafernandez', -56.164532, -34.901112),
(56789012, 4, '567890123', 'GonzÃ¡lez', 'Pedro', 1, 'pedrogonzalez', -56.164532, -34.901112);


INSERT INTO usuario (Ci, id_rol, celular, apellido, nombre, id_idioma,
nombreUsuario, longitud, latitud) VALUES
(1899, 4, '567890123', 'chalar', 'antonio', 1, 'minuanobrr', -55.2377, -34.3759);

INSERT INTO usuario (Ci, id_rol, celular, apellido, nombre, id_idioma,
nombreUsuario, longitud, latitud) VALUES
(7777777, 3, '567890123', 'papa', 'papa', 1, 'papa', -56.164532, -34.901112);

INSERT INTO backoffice (Ci) VALUES
(34567890);
INSERT INTO camionero (Ci) VALUES
(23456789),
(56789012);
INSERT INTO almacenero (Ci) VALUES
(12345678),
(45678901);
INSERT INTO cliente (Ci, longitud, latitud) VALUES
(23456789, -56.164532, -34.901112),
(45678901, -56.165432, -34.902112);
INSERT INTO cliente (Ci, longitud, latitud) VALUES
(1899, -55.2377, -34.3759);
INSERT INTO camion (matricula, capacidadKg, capacidadM3) VALUES
('ABC1234', 1000.0, 10.0),
('XYZ5678', 2000.0, 20.0);
INSERT INTO empresa (rut) VALUES
(123456789012);
INSERT INTO almacen (id, longitud, latitud, rut_empresa,
ci_almacenero,capacidadKg,capacidadM3) VALUES
(1,-56.164532,-34.901112 ,123456789012 ,12345678 ,10000 ,100 ),
(2,-56.165432,-34.902112 ,123456789012 ,45678901 ,20000 ,200 );
INSERT INTO manejar (matricula,Ci_camionero) VALUES
('ABC1234' ,23456789 ),
('XYZ5678' ,56789012 );
INSERT INTO lote (id,id_almacen) VALUES
(1 ,1 ),
(2 ,2 );
INSERT INTO camion_lote (id_lote, matricula, fecha)
VALUES 
(1, 'ABC1234', '2023-11-06 13:36:29'),
(2, 'XYZ5678', '2023-11-07 14:37:30');

INSERT INTO estado (estadoDeEnvio) VALUES
('recibido en centro de logistica '),
('en caminio'),
('recibido por el cliente');
INSERT INTO bulto (id,pesoKg,volumenM3 ,ci_cliente ,estadoDeEnvio, nombre) values
(1 ,10 ,1 ,23456789 ,'recibido en centro de logistica', 'fono' ),
(2 ,20 ,2 ,45678901 ,'en caminio','compu' );
INSERT INTO paquete(id ) VALUES
(1 ),
(2 );
INSERT INTO producto(id,nombre_producto ) VALUES
(1 ,'Producto A' ),
(2 ,'Producto B' );
INSERT INTO articulo(id,id_producto ) VALUES
(1 ,1 ),
(2 ,2 );
INSERT INTO bulto_lote(id_lote,id_bulto ) VALUES
(1 ,1 ),
(2 ,2 );






create user 'papa' identified by 'papa';
create user 'maria' identified by 'rodriguez';
create user 'cliente' identified by 'cliente';
create user 'anafernandez' identified by 'anafernandez';
/**/

/*permisos para maria(camionero)*/
GRANT SELECT ON usuario TO maria;
GRANT INSERT ON camion_lote TO maria;
GRANT UPDATE ON lote TO maria;
GRANT SELECT ON camion_lote TO maria;
GRANT SELECT ON bulto TO maria;
GRANT DELETE ON bulto_lote TO maria;
GRANT DELETE ON articulo TO maria;
GRANT UPDATE ON bulto TO maria;
GRANT SELECT ON bulto_lote TO maria;
GRANT SELECT ON camion TO maria;
GRANT SELECT ON bulto TO maria;
GRANT SELECT ON bulto TO maria;
GRANT SELECT ON bulto_lote TO maria;
GRANT SELECT ON camion_lote TO maria;
GRANT SELECT ON lote TO maria;
GRANT SELECT ON almacen TO maria;
GRANT SELECT ON cliente TO maria;

/*permisos para cliente(cliente)*/
GRANT SELECT ON usuario TO cliente;
GRANT SELECT ON manejar TO cliente;
GRANT SELECT ON lote TO cliente;
GRANT SELECT ON cliente TO cliente;
GRANT SELECT ON camion_lote TO cliente;
GRANT SELECT ON bulto TO cliente;
GRANT SELECT ON bulto_lote TO cliente;
GRANT SELECT ON almacen TO cliente;


/*permisos para anafernandez (almacenero)*/
GRANT SELECT ON usuario TO anafernandez;
GRANT SELECT ON almacen TO anafernandez;
GRANT SELECT ON bulto_lote TO anafernandez;
GRANT SELECT ON lote TO anafernandez;
GRANT SELECT ON bulto_lote TO anafernandez;
GRANT SELECT ON camion_lote TO anafernandez;
GRANT SELECT ON lote TO anafernandez;
GRANT INSERT ON camion_lote TO anafernandez;
GRANT INSERT ON lote TO anafernandez;
GRANT UPDATE ON lote TO anafernandez;
GRANT SELECT ON camion_lote TO anafernandez;

/*permisos para papa (backoffice)*/
GRANT ALL PRIVILEGES ON rol TO papa;
GRANT ALL PRIVILEGES ON idioma TO papa;
GRANT ALL PRIVILEGES ON usuario TO papa;
GRANT ALL PRIVILEGES ON backoffice TO papa;
GRANT ALL PRIVILEGES ON camionero TO papa;
GRANT ALL PRIVILEGES ON almacenero TO papa;
GRANT ALL PRIVILEGES ON cliente TO papa;
GRANT ALL PRIVILEGES ON camion TO papa;
GRANT ALL PRIVILEGES ON empresa TO papa;
GRANT ALL PRIVILEGES ON almacen TO papa;
GRANT ALL PRIVILEGES ON manejar TO papa;
GRANT ALL PRIVILEGES ON lote TO papa;
GRANT ALL PRIVILEGES ON camion_lote TO papa;
GRANT ALL PRIVILEGES ON estado TO papa;
GRANT ALL PRIVILEGES ON bulto TO papa;
GRANT ALL PRIVILEGES ON paquete TO papa;
GRANT ALL PRIVILEGES ON producto TO papa;
GRANT ALL PRIVILEGES ON articulo TO papa;
GRANT ALL PRIVILEGES ON bulto_lote TO papa;


