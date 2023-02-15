CREATE  SCHEMA PROYECTO_FINAL;

USE PROYECTO_FINAL;

CREATE TABLE if not exists Clientes (
  id_cliente int,
  nombre varchar(50),
  direccion varchar(50),
  telefono varchar(15),
  email varchar(50),
  CONSTRAINT PK_Clientes PRIMARY KEY (id_cliente)
);

CREATE TABLE if not exists Productos ( 
  id_producto varchar(50),
  tipo_producto varchar(50),
  deposito varchar(50),
  stock int,
  precio_por_unidad float,
  CONSTRAINT PK_Productos PRIMARY KEY (id_producto)
);

CREATE TABLE if not exists Proveedores ( 
  id_proveedor varchar(50),
  empresa varchar(50),
  rut varchar(50),
  direccion varchar(50),
  telefono varchar(15),
  mail varchar(50),
  id_producto varchar(50),
  CONSTRAINT PK_Proveedores PRIMARY KEY (id_proveedor),
  FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE if not exists Vendedores ( 
  id_vendedor varchar(50),
  nombre varchar(50),
  direccion varchar(50),
  telefono varchar(15),
  mail varchar(50),
  CONSTRAINT PK_Vendedores PRIMARY KEY (id_vendedor)
);

CREATE TABLE if not exists Ventas ( 
  id_venta varchar(50),
  cantidad int,
  comision int,
  fecha_venta date,
  id_vendedor varchar(50),
  id_producto varchar(50),
  CONSTRAINT PK_Ventas PRIMARY KEY (id_venta),
  FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id_vendedor),
  FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE if not exists Reparaciones ( 
  id_reparacion varchar(50),
  tipo_de_reparacion varchar(50),
  costo_Reparacion int,
  tecnico varchar(50),
  id_producto varchar(50),
  id_cliente int,
  CONSTRAINT PK_Reparaciones PRIMARY KEY (id_reparacion),
  FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE if not exists Balance ( 
  id_balance varchar(50),
  id_cliente int,
  id_producto varchar(50),
  id_vendedor varchar(50),
  id_venta varchar(50),
  id_reparacion varchar(50),
  CONSTRAINT PK_Balance PRIMARY KEY (id_balance),
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
  FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
  FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id_vendedor),
  FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
  FOREIGN KEY (id_reparacion) REFERENCES reparaciones(id_reparacion)
  
);

