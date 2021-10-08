create database tienda;

use tienda;

create table usuarios(
				id_usuario int auto_increment,
				nombreUsuario varchar(50),
				email varchar(50),
				password text(50),
				primary key(id_usuario)
					);

create table categorias (
				id_categoria int auto_increment,
				id_usuario int not null,
				nombreCategoria varchar(50),
				primary key(id_categoria),
				FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
						);

create table productos(
				id_producto int auto_increment,
				id_usuario int not null,
				id_categoria int not null,
				nombreProducto varchar(50),
				cantidad int,
				precio double,
				estado varchar(15),
				primary key(id_producto),
				FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
				FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
						);

create table clientes(
				id_cliente int auto_increment,
				id_usuario int not null,
				documento varchar(15),
				nombreCliente varchar(50),
				primary key(id_cliente),
				FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
					);

create table ventas(
				id_venta int auto_increment,
				id_usuario int,
				id_cliente int,
				id_producto int,
				codigoVenta int,
				precio double,
				cantidad int,
				estado varchar(15),
				fechaVenta date,
				primary key(id_venta),
				FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
				FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
				FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
					);