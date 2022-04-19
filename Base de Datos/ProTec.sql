--Nombre de la Base de datos
create database protec
--Usar la BD
use protec

--Tablas Auxiliares 
create table estado_usuario(
	id_eu int not null primary key,
	nombre varchar(15)
);
create table estado_proyector(
	id_ep int not null primary key,
	nombre varchar(15)
);
create table departamentos(
	id_dep  int not null primary key,
	nombre varchar(15),
);
create table salones(
	id_ubi int not null primary key,
	nombre varchar(30),
);
create table tipo_cable(
	id_tipocable int not null primary key,
	nombre varchar(15)
);
create table rol(
	id_rol int not null primary key,
	nombre varchar(20)
);

--Tablas principales
create table proyectores(
	id_pro int not null primary key,
	modelo varchar(50),
	marca varchar(50),
	/*
		El cable de encendido, table y regleta se va a indicar si lo tienen o no lo tienen
		SI - 1
		NO - 0
	*/
	cable_encendido bit,
	tableta bit,
	regleta bit, 
	--Estado del proyector
	id_ep int,
	--Tipo de Cable
	id_tipocable int,
	foreign key (id_tipocable) references tipo_cable(id_tipocable),  
	foreign key (id_ep) references estado_proyector(id_ep)
);
--Usuarios
create table usuarios(
	--Matricula
	id_usuario int not null primary key,
	nombre varchar(20),
	--Apellido paterno
	ape_p varchar(20),
	--Apellido materno
	ape_m varchar(20),
	--Genero 
	/*
		Masculino - 1
		Femenino - 0
	*/
	genero bit,
	--Rol
	id_rol int,
	--Estado del Usuario
	id_eu int,
	--Departamento
	id_dep int,
	--Contraseña
	clave varchar(11),
	--Correo Electronico
	correo varchar(50),
	foreign key (id_rol) references rol(id_rol),
	foreign key (id_dep) references departamentos(id_dep),
	foreign key (id_eu) references estado_usuario (id_eu)
);
--Formatos de Registros
--Reservacion de Proyectores
--En esta tabla no se encuentra conectada al inventario.
create table reservaciones(
	id_encargado int not null,
	nombre_encargado varchar(100),
	id_maestro int not null,
	nombre_maestro varchar(100),
	ubicacion varchar(50),
	hora_entrada time,
	hora_salida time,
	id_pro int not null primary key,
	modelo varchar(50),
	marca varchar(50),
	/*
		El cable de encendido, table y regleta se va a indicar si lo tienen o no lo tienen
		SI - 1
		NO - 0
	*/
	cable_encendido bit,
	tableta bit,
	regleta bit, 
	--Estado del Proyector
	id_ep int,
	--Tipo de Cable
	id_tipocable varchar(30),
	--Esta seccion es para indicar que el encargo anote las fallas que tenga el proyector al momento de entregarlo
	comentarios varchar(200)
);