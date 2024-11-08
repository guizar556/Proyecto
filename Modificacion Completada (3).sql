-------------------------------------
--Autores:---------------------------
/*Jonathan Guizar Morales,-----------
Juan Diego Lomeli Collazo,-----------
Osvaldo Guierres Sanchez*/-----------
--Tema: Proyecto---------------------
--Fecha: 19 de Septiembre del 2024---
-------------------------------------
--Crear la base de datos Cremeria

CREATE DATABASE Cremeria1;
Go
--Usar la base de datos Cremeria 
USE Cremeria1;
Go
--Crear la tabla de Clientes
create table Clientes(
	codigo integer not null identity(1,1),
	correo varchar(90),
	Telefono varchar(20),
	Genero varchar(10),
	CodigoPostal varchar(10),
	PrimerNombre varchar(90),
	SegundoNombre varchar(90),
	ApellidoPaterno varchar(30),
	ApellidoMaterno varchar(30),
	Edad integer,
	Localidad varchar(40),
	Estado varchar(40),
	Colonia varchar(45),
	Avenida varchar(50),
	NumeroDeVivienda integer,
	dia integer,
	mes varchar(20),
	año integer,
);

--Crear la tabla de empleados
create table Empleados(
	codigo integer not null identity(1,1),
	correo varchar(90),
	PrimerNombre varchar(90),
	SegundoNombre varchar(90),
	ApellidoPaterno varchar(30),
	ApellidoMaterno varchar(30),
	Edad integer,
	Localidad varchar(40),
	Estado varchar(40),
	Colonia varchar(45),
	Avenida varchar(50),
	NumeroDeVivienda integer,
	Telefono varchar(10),
	CodigoPostal integer,
	DiaNacimiento integer,   -- Día de nacimiento del empleado
	MesNacimiento varchar(20), -- Mes de nacimiento del empleado
	AnioNacimiento integer,  -- Año de nacimiento del empleado
	recomendaciones text,
	DiaContratacion integer, -- Día de contratación del empleado
	MesContratacion varchar(20), -- Mes de contratación del empleado
	AnioContratacion integer, -- Año de contratación del empleado
	Genero varchar(10),       -- Género del empleado
	foto_del_empleado varchar(90)--para guardar la imagen del Empelado
);

--Crear la tabla de Productos
create table Productos(
	codigo integer not null identity(1,1),
	NombreDelProducto varchar(60),
	dia_de_caducidad integer,
	mes_de_caducidad varchar(20),
	año_de_caducidad integer,
	precioPorKilogramo decimal(20,3),
	condiciones_de_almacenamiento varchar(30),
	nutrientes_que_Aporta varchar(3),
	Numero_De_lote_del_producto integer,
	stack_disponible integer,
	foto varchar(max),
	margen_de_ganancia decimal(5,2),         -- Margen de ganancia en porcentaje
    unidad_de_medida varchar(20),            -- Unidad de medida (kilogramos, litros, unidades)
    stock_minimo integer,                    -- Stock mínimo antes de reorden
    stock_maximo integer,                    -- Stock máximo permitido
    punto_de_reorden integer,                -- Nivel de inventario para reordenar
	codigo_Categoria integer not null
);

--Tabla de Proveedores
create table Provedores(
	codigo integer not null identity(1,1),
	PrimerNombre varchar(90),
	SegundoNombre varchar(90),
	ApellidoPaterno varchar(30),
	ApellidoMaterno varchar(30),
	Localidad varchar(40),
	Estado varchar(40),
	foto text,
	Colonia varchar(45),
	Avenida varchar(50),
	CodigoPostal integer,
	dia_inicio_relacion integer,             -- Día en que se comenzó a trabajar con el proveedor
    mes_inicio_relacion integer,             -- Mes en que se comenzó a trabajar con el proveedor
    año_inicio_relacion integer,             -- Año en que se comenzó a trabajar con el proveedor
    RFC varchar(13),                         -- RFC del proveedor
    correo_electronico varchar(90),          -- Correo electrónico para contacto
    telefono varchar(15),                    -- Teléfono de contacto
);


create table DetProductos_y_Provedores(
	codigo integer not null identity(1,1),
	precio decimal (10,3),
	caracteristicas text,
	codigo_Producto integer not null,
	codigo_Proveedor integer not null,

)

--Crear la tabla ventas
create table Ventas(
	codigo integer not null identity(1,1),
	dia integer,
	mes varchar(20),
	año integer,
	descuento_aplicado decimal(5,2),         -- Descuento aplicado a la venta
	tipo_pago varchar(30),                   -- Tipo de pago (contado, crédito, tarjeta, etc.)
	codigo_Pedido integer not null
);

--Crear tabla de Devoluciones
create table Devoluciones(			
	codigo integer not null identity(1,1),
	CantidadDeProductosDevueltos integer,
	DescripccionDeDevolucion text,
	diaDevolucion integer,
	montoDeRembolso decimal(20,2),
	mes varchar(20),
	año integer,
	hora time,
	DescripccionDeMedidasTomadas text,
	foto_Devolucion varchar(max),
	codigo_Cliente integer not null,
)

--Crear tabla de categorias
create table Categorias(
	codigo integer not null identity(1,1),
	NombreDeCategoria varchar(50),
	DescripccionDeCategoria text,
	dia_de_creacion integer,
	mes_de_creacion varchar(20),
	año_de_creacion integer,
	estado_de_categoria_A_o_I varchar(20),
	foto varchar(max),
)

--Crear tabla de Transportes
create table Transportes(
	codigo integer not null identity(1,1),
	NumeroDePlaca varchar(30),
	Marca varchar(20),
	Modelo varchar(40),
	foto text,
	DescripccionDelVehiculo text,
	codigo_Provedore integer
)

--Creacion de la tabla subcategorias
create table Subcategorias(
	codigo integer not null identity(1,1),
	NombreDeSubcategoria varchar(50),
	DescripcionDeSubcategoria text,
	tipoDeRotacion varchar(50),
	foto text,
	marca_de_la_subcategoria varchar(50),
	codigo_Categoria integer not null,
)

--crear tabla Pedidos
create table Pedidios(
	codigo integer not null identity(1,1),
	dia_de_pedido integer,
	mes_de_pedido varchar(20),
	año_de_pedido integer,
    descripccion_Pedido text,
	codigo_Cliente integer,
	codigo_Empleado integer
)

--Crear la tabla de Compras
create table Compras(
	codigo integer not null identity(1,1),
	tipoDeCompra varchar(30),
	Total_de_Compra integer,
	dia_de_compra integer,
	mes_de_compra varchar(20),				
	año_de_compra integer,
	estado_compra varchar(20),              -- Estado de la compra (pendiente, completada, cancelada)
	codigo_Proveedor integer,
)

--Crear la tabla de detalle Ventas y Productos
create table Ventas_y_Productos(
	codigo integer not null identity(1,1),
	descripccion text,
	precioUnitario decimal(10,5),
	cantidad integer,
	codigo_Venta integer,
	codigo_Producto integer
)

--Crear la tabla de detalle Compras y Productos
create table Compras_y_Productos(
	Cantidad_De_Productos_Comprados integer,
	precioUnitario decimal(10,2),
	codigo integer not null identity(1,1),
	descripccion text,
	codigo_Compra integer,
	codigo_Producto integer
)

--tabla de productos devueltos
create table ProductosDevueltos(
	codigo integer not null  identity(1,1),
	codigo_Devolucion integer not null,
	codigo_VP integer not null,
	Observaciones text,
)

create table Pedidos_y_Productos(
	codigo integer not null  identity(1,1),
	cantidad integer,
	precioUnitario decimal (10,5),
	codigoProductos integer not null,
	CodigoPedidios integer not null
)

--Alterar la tabla para agregar llave primaria
alter table Clientes
	add constraint pk_Clientes_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Empleados
alter table Empleados
	add constraint pk_Empleados_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Productos
alter table Productos
	add constraint pk_Productos_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Proveedores
alter table Provedores
	add constraint pk_Provedores_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Ventas
alter table Ventas
	add constraint pk_Ventas_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Devoluciones
alter table Devoluciones
	add constraint pk_Devoluciones_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Categorias
alter table Categorias
	add constraint pk_Categorias_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Transportes
alter table Transportes
	add constraint pk_Transportes_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Subcategorias
alter table Subcategorias
	add constraint pk_Subcategorias_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Pedidos
alter table Pedidios
	add constraint pk_Pedidios_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Compras
alter table Compras
	add constraint pk_Compras_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Ventas_y_Productos
alter table Ventas_y_Productos
	add constraint pk_Ventas_y_Productos_codigo PRIMARY KEY (codigo);

-- Alterar la tabla para agregar llave primaria a Compras_y_Productos
alter table Compras_y_Productos
	add constraint pk_Compras_y_Productos_codigo PRIMARY KEY (codigo);

--Alterar la tabla para agregar una llave primaria 
alter table DetProductos_y_Provedores
    add constraint pk_DetProductos_y_Provedores_codigo PRIMARY KEY (codigo);

--Alterar la tabla para agregar la llave primaria de 
alter table ProductosDevueltos
    add constraint pk_ProductosDevueltos_codigo PRIMARY KEY (codigo);

alter table Pedidos_y_Productos
	add constraint pk_Pedidos_y_Productos_codigo PRIMARY KEY (codigo);

--Agregar todas las llaves foraneas
--Llaves foraneas de Clientes con constrains
-- Luego agregar las restricciones de clave foránea
alter table Ventas
    add constraint fk_Ventas_codigo_Pedido
	FOREIGN KEY (codigo_Pedido) REFERENCES Pedidios(codigo);

alter table Productos
    add constraint fk_Productos_codigo_Categoria
    FOREIGN KEY (codigo_Categoria) REFERENCES Categorias(codigo);

alter table Subcategorias
    add constraint fk_Subcategorias_codigo_Categoria
    FOREIGN KEY (codigo_Categoria) REFERENCES Categorias(codigo);

alter table Transportes
    add constraint fk_Transportes_codigo_Proveedor
    FOREIGN KEY (codigo_Provedore) REFERENCES Provedores(codigo);

alter table Ventas_y_Productos
    add constraint fk_Ventas_y_Productos_codigo_Venta
    FOREIGN KEY (codigo_Venta) REFERENCES Ventas(codigo);

alter table Ventas_y_Productos
    add constraint fk_Ventas_y_Productos_codigo_Producto
    FOREIGN KEY (codigo_Producto) REFERENCES Productos(codigo);

alter table Compras_y_Productos
    add constraint fk_Compras_y_Productos_codigo_Compras
    FOREIGN KEY (codigo_Compra) REFERENCES Compras(codigo);

alter table Compras_y_Productos
    add constraint fk_Compras_y_Productos_codigo_Producto
    FOREIGN KEY (codigo_Producto) REFERENCES Productos(codigo);

alter table Devoluciones
    add constraint fk_Devoluciones_codigo_Devolucion
    FOREIGN KEY (codigo_Cliente) REFERENCES Clientes(codigo);

alter table Compras
    add constraint fk_Compras_codigo_Compra
    FOREIGN KEY (codigo_Proveedor) REFERENCES Provedores(codigo);

alter table Pedidios
add constraint fk_Pedidios_codigo_Cliente
FOREIGN KEY (codigo_Cliente) REFERENCES Clientes(codigo);

alter table Pedidios
add constraint fk_Pedidios_codigo_Empleado
FOREIGN KEY (codigo_Empleado) REFERENCES Empleados(codigo);

alter table DetProductos_y_Provedores
    add constraint fk_DetProductos_y_Provedores_codigo_Producto
    FOREIGN KEY (codigo_Producto) REFERENCES Productos(codigo);

alter table DetProductos_y_Provedores
    add constraint fk_DetProductos_y_Provedores_codigo_Proveedor
    FOREIGN KEY (codigo_Proveedor) REFERENCES Provedores(codigo);

alter table ProductosDevueltos
    add constraint fk_ProductosDevueltos_codigo_Devolucion
    FOREIGN KEY (codigo_Devolucion) REFERENCES Devoluciones(codigo);

alter table ProductosDevueltos
    add constraint fk_ProductosDevueltos_codigo_VP
    FOREIGN KEY (codigo_VP) REFERENCES Ventas_y_Productos(codigo);




-- Agregando la clave foránea para la columna CodigoPedidos que referencia a la tabla Pedidos
ALTER TABLE Pedidos_y_Productos
ADD CONSTRAINT fk_Pedidos_y_Productos_codigoPedidios
FOREIGN KEY (CodigoPedidios) REFERENCES Pedidios(codigo);

-- Agregando la clave foránea para la columna codigoProductos que referencia a la tabla Productos
ALTER TABLE Pedidos_y_Productos
ADD CONSTRAINT fk_Pedidos_y_Productos_codigoProductos
FOREIGN KEY (codigoProductos) REFERENCES Productos(codigo);









--------------------------------------------------------------------
--Agregar constrins
-- Restricción de unicidad para el código del cliente
alter table Clientes
add constraint uq_clientes_codigo unique (codigo);

-- Restricción para que la edad sea mayor o igual a 18
alter table Clientes
add constraint chk_clientes_edad check (Edad >= 18);

-- Restricción para que el día esté entre 1 y 31
alter table Clientes
add constraint chk_clientes_dia check (dia between 1 and 31);

-- Restricción para que el año sea mayor o igual a 1900
alter table Clientes
add constraint chk_clientes_año check (año >= 1900);

-- Establecer un valor predeterminado para el mes como 'Enero'
alter table Clientes
add constraint df_clientes_mes default 'Enero' for mes;

-- Restricción de unicidad para el correo
alter table Clientes
add constraint uq_clientes_correo unique (correo);

-- Asegurar que el código postal tenga una longitud de 5 caracteres
alter table Clientes
add constraint chk_clientes_CodigoPostal check (len(CodigoPostal) = 5);

-- Asegurar que el número de vivienda sea mayor o igual a 1
alter table Clientes
add constraint chk_clientes_NumeroDeVivienda check (NumeroDeVivienda >= 1);

-- Restricción de valores permitidos para el género
alter table Clientes
add constraint chk_clientes_Genero check (Genero in ('Masculino', 'Femenino', 'Otro'));
-- Agregar restricciones (constraints)

-- Restringir la unicidad del código del empleado
alter table Empleados
add constraint uq_empleados_codigo unique (codigo);

-- Asegurar que la edad sea mayor o igual a 18
alter table Empleados
add constraint chk_empleados_edad check (Edad >= 18);

-- Asegurar que el código postal tenga exactamente 5 dígitos
alter table Empleados
add constraint chk_empleados_CodigoPostal check (len(CodigoPostal) = 5);

-- Asegurar que el teléfono tenga exactamente 10 dígitos
alter table Empleados
add constraint chk_empleados_Telefono check (len(Telefono) = 10);

-- Verificar que el día de nacimiento esté entre 1 y 31
alter table Empleados
add constraint chk_empleados_DiaNacimiento check (DiaNacimiento between 1 and 31);

-- Verificar que el año de nacimiento sea mayor o igual a 1900
alter table Empleados
add constraint chk_empleados_AnioNacimiento check (AnioNacimiento >= 1900);

-- Verificar que el día de contratación esté entre 1 y 31
alter table Empleados
add constraint chk_empleados_DiaContratacion check (DiaContratacion between 1 and 31);

-- Verificar que el año de contratación sea mayor o igual a 1990
alter table Empleados
add constraint chk_empleados_AnioContratacion check (AnioContratacion >= 1990);

-- Definir un valor predeterminado para el mes de contratación como 'Enero'
alter table Empleados
add constraint df_empleados_MesContratacion default 'Enero' for MesContratacion;

-- Asegurar que los valores permitidos para el género sean 'Masculino', 'Femenino', 'Otro'
alter table Empleados
add constraint chk_empleados_Genero check (Genero in ('Masculino', 'Femenino', 'Otro'));

-- Restringir la unicidad del correo del empleado
alter table Empleados
add constraint uq_empleados_correo unique (correo);

-- Restringir la unicidad del código del producto
alter table Productos
add constraint uq_productos_codigo unique (codigo);

-- Asegurar que el día de caducidad esté entre 1 y 31
alter table Productos
add constraint chk_productos_dia_de_caducidad
check (dia_de_caducidad between 1 and 31);

-- Asegurar que el año de caducidad sea mayor o igual a 2023
alter table Productos
add constraint chk_productos_año_de_caducidad
check (año_de_caducidad >= 2023);

-- Asegurar que el precio por kilogramo sea positivo
alter table Productos
add constraint chk_productos_precioPorKilogramo
check (precioPorKilogramo > 0);

-- Asegurar que el margen de ganancia sea mayor o igual a 0 y menor o igual a 100 (porcentaje)
alter table Productos
add constraint chk_productos_margen_de_ganancia
check (margen_de_ganancia between 0 and 100);

-- Asegurar que la unidad de medida sea 'kilogramos', 'litros' o 'unidades'
alter table Productos
add constraint chk_productos_unidad_de_medida
check (unidad_de_medida in ('kilogramos', 'litros', 'unidades'));

-- Asegurar que el stock mínimo sea mayor o igual a 0
alter table Productos
add constraint chk_productos_stock_minimo
check (stock_minimo >= 0);

-- Asegurar que el stock máximo sea mayor que el stock mínimo
alter table Productos
add constraint chk_productos_stock_maximo
check (stock_maximo > stock_minimo);

-- Asegurar que el punto de reorden esté entre el stock mínimo y el stock máximo
alter table Productos
add constraint chk_productos_punto_de_reorden
check (punto_de_reorden between stock_minimo and stock_maximo);

-- Restringir la unicidad del código del proveedor
alter table Provedores
add constraint uq_proveedores_codigo unique (codigo);

-- Asegurar que el RFC tenga exactamente 13 caracteres
alter table Provedores
add constraint chk_proveedores_rfc
check (len(RFC) = 13);

-- Asegurar que el correo electrónico sea único para cada proveedor
alter table Provedores
add constraint uq_proveedores_correo
unique (correo_electronico);

-- Asegurar que el teléfono sea de 10 a 15 caracteres
alter table Provedores
add constraint chk_proveedores_telefono
check (len(telefono) between 10 and 15);

-- Asegurar que el día de inicio de relación esté entre 1 y 31
alter table Provedores
add constraint chk_proveedores_dia_inicio
check (dia_inicio_relacion between 1 and 31);

-- Asegurar que el mes de inicio de relación esté entre 1 y 12
alter table Provedores
add constraint chk_proveedores_mes_inicio
check (mes_inicio_relacion between 1 and 12);

-- Asegurar que el año de inicio de relación sea mayor o igual a 1900
alter table Provedores
add constraint chk_proveedores_año_inicio
check (año_inicio_relacion >= 1900);

-- Asegurar que el código postal sea mayor que 0
alter table Provedores
add constraint chk_proveedores_codigo_postal
check (CodigoPostal > 0);

-- Restringir la unicidad del código de la tabla
alter table DetProductos_y_Provedores
add constraint uq_detproductos_proveedores_codigo
unique (codigo);

-- Asegurar que el precio sea mayor o igual a 0
alter table DetProductos_y_Provedores
add constraint chk_detproductos_proveedores_precio
check (precio >= 0);

-- Asegurar que el código del producto sea mayor que 0
alter table DetProductos_y_Provedores
add constraint chk_detproductos_proveedores_codigo_producto
check (codigo_Producto > 0);

-- Asegurar que el código del proveedor sea mayor que 0
alter table DetProductos_y_Provedores
add constraint chk_detproductos_proveedores_codigo_proveedor
check (codigo_Proveedor > 0);

-- Restringir la unicidad del código de la venta
alter table Ventas
add constraint uq_ventas_codigo
unique (codigo);

-- Asegurar que el día esté entre 1 y 31
alter table Ventas
add constraint chk_ventas_dia
check (dia between 1 and 31);

-- Asegurar que el año sea mayor o igual a 1900
alter table Ventas
add constraint chk_ventas_año
check (año >= 1900);

-- Asegurar que el descuento aplicado sea entre 0% y 100%
alter table Ventas
add constraint chk_ventas_descuento
check (descuento_aplicado between 0 and 100);

-- Asegurar que el código del pedido sea mayor que 0
alter table Ventas
add constraint chk_ventas_codigo_pedido
check (codigo_Pedido > 0);

-- Restringir la unicidad del código de la devolución
alter table Devoluciones
add constraint uq_devoluciones_codigo
unique (codigo);

-- Asegurar que la cantidad de productos devueltos sea mayor o igual a 0
alter table Devoluciones
add constraint chk_devoluciones_cantidad
check (CantidadDeProductosDevueltos >= 0);

-- Asegurar que el día de devolución esté entre 1 y 31
alter table Devoluciones
add constraint chk_devoluciones_dia
check (diaDevolucion between 1 and 31);

-- Asegurar que el año sea mayor o igual a 1900
alter table Devoluciones
add constraint chk_devoluciones_año
check (año >= 1900);

-- Asegurar que el monto de reembolso sea mayor o igual a 0
alter table Devoluciones
add constraint chk_devoluciones_monto
check (montoDeRembolso >= 0);

alter table Categorias
add constraint uq_categorias_codigo
unique (codigo);

-- Asegurar que el nombre de la categoría no esté vacío
alter table Categorias
add constraint chk_categorias_nombre
check (NombreDeCategoria <> '');

-- Asegurar que el día de creación esté entre 1 y 31
alter table Categorias
add constraint chk_categorias_dia
check (dia_de_creacion between 1 and 31);

-- Asegurar que el año de creación sea mayor o igual a 1900
alter table Categorias
add constraint chk_categorias_año
check (año_de_creacion >= 1900);

-- Restringir la unicidad del número de placa
alter table Transportes
add constraint uq_transportes_numero_placa
unique (NumeroDePlaca);

-- Asegurar que el nombre de la subcategoría no sea nulo
alter table Subcategorias
add constraint uq_subcategorias_nombre
unique (NombreDeSubcategoria);

-- Comprobaciones para los días y años del pedido
alter table Pedidios
add constraint chk_pedidos_dia
check (dia_de_pedido between 1 and 31);

alter table Pedidios
add constraint chk_pedidos_año
check (año_de_pedido >= 1900);

-- Comprobaciones para los días y años de la compra
alter table Compras
add constraint chk_compras_dia
check (dia_de_compra between 1 and 31);

alter table Compras
add constraint chk_compras_año
check (año_de_compra >= 1900);

-- Comprobación para asegurar que la cantidad sea mayor que cero
alter table Ventas_y_Productos
add constraint chk_vp_cantidad
check (cantidad > 0);

-- Comprobación para asegurar que el precio unitario no sea negativo
alter table Ventas_y_Productos
add constraint chk_vp_precioUnitario
check (precioUnitario >= 0);

-- Comprobación para asegurar que la cantidad de productos comprados sea mayor que cero
alter table Compras_y_Productos
add constraint chk_cp_cantidad
check (Cantidad_De_Productos_Comprados > 0);

-- Tabla Transportes
alter table Transportes
add constraint uq_transportes_codigo unique (codigo);

-- Tabla Subcategorias
alter table Subcategorias
add constraint uq_subcategorias_codigo unique (codigo);

-- Tabla Pedidos
alter table Pedidios
add constraint uq_pedidos_codigo unique (codigo);

-- Tabla Compras
alter table Compras
add constraint uq_compras_codigo unique (codigo);

-- Tabla Ventas_y_Productos
alter table Ventas_y_Productos
add constraint uq_ventas_y_productos_codigo unique (codigo);

-- Tabla Compras_y_Productos
alter table Compras_y_Productos
add constraint uq_compras_y_productos_codigo unique (codigo);

-- Tabla ProductosDevueltos
alter table ProductosDevueltos
add constraint uq_productos_devueltos_codigo unique (codigo);

-----------------------------------
--Reguistros
--Tabla de Cliententes 
INSERT INTO Clientes (correo, Telefono, Genero, CodigoPostal, PrimerNombre, SegundoNombre, ApellidoPaterno, ApellidoMaterno, Edad, Localidad, Estado, Colonia, Avenida, NumeroDeVivienda, dia, mes, año)
VALUES
('juan.gomez@gmail.com', '5551231234', 'Masculino', '12345', 'Juan', 'Carlos', 'Gómez', 'Pérez', 30, 'Sahuayo', 'Michoacán', 'Centro', 'Avenida Reforma', 123, 15, 'enero', 1994),
('maria.lopez@gmail.com', '5555435678', 'Femenino', '67890', 'María', 'Luisa', 'López', 'Ramírez', 25, 'Zamora', 'Michoacán', 'San José', 'Calle Hidalgo', 456, 23, 'marzo', 1999),
('pedro.martinez@gmail.com', '5555438765', 'Masculino', '54321', 'Pedro', 'Antonio', 'Martínez', 'Díaz', 28, 'Morelia', 'Michoacán', 'Vista Hermosa', 'Calle Allende', 789, 12, 'abril', 1996),
('ana.hernandez@gmail.com', '5553452345', 'Femenino', '09876', 'Ana', 'Sofía', 'Hernández', 'Sánchez', 35, 'Uruapan', 'Michoacán', 'Los Pinos', 'Avenida Madero', 321, 6, 'mayo', 1989),
('luis.castro@gmail.com', '5553423456', 'Masculino', '65432', 'Luis', 'Fernando', 'Castro', 'Ortiz', 40, 'Pátzcuaro', 'Michoacán', 'La Estancia', 'Calle Benito Juárez', 654, 18, 'julio', 1984);
ALTER TABLE Empleados
ALTER COLUMN foto_del_empleado VARCHAR(MAX);

--Tabla de Empleados
INSERT INTO Empleados (correo, PrimerNombre, SegundoNombre, ApellidoPaterno, ApellidoMaterno, Edad, Localidad, Estado, Colonia, Avenida, NumeroDeVivienda, Telefono, CodigoPostal, DiaNacimiento, MesNacimiento, AnioNacimiento, recomendaciones, DiaContratacion, MesContratacion, AnioContratacion, Genero, foto_del_empleado)
VALUES
('juan.martinez@gmail.com', 'Juan', 'Carlos', 'Martínez', 'Pérez', 32, 'Sahuayo', 'Michoacán', 'Centro', 'Avenida Reforma', 123, '5551234567', 12345, 12, 'enero', 1992, 'Excelente en trabajo en equipo', 5, 'febrero', 2020, 'Masculino', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fes%2Ffotos%2Fpersona-de-frente&psig=AOvVaw3kzP3YnfjVXknQ3cPanzM7&ust=1727909507983000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCOiXrdWi7ogDFQAAAAAdAAAAABAE'),
('ana.lopez@gmail.com', 'Ana', 'María', 'López', 'González', 28, 'Zamora', 'Michoacán', 'San José', 'Calle Hidalgo', 456, '5557654321', 67890, 25, 'marzo', 1996, 'Altamente recomendada por su anterior empleador', 10, 'marzo', 2019, 'Femenino', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fes%2Ffotos%2Fpersona-de-frente&psig=AOvVaw3kzP3YnfjVXknQ3cPanzM7&ust=1727909507983000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCOiXrdWi7ogDFQAAAAAdAAAAABAY'),
('pedro.hernandez@gmail.com', 'Pedro', 'Antonio', 'Hernández', 'Sánchez', 40, 'Morelia', 'Michoacán', 'Vista Hermosa', 'Calle Allende', 789, '5559876543', 54321, 30, 'abril', 1984, 'Trabajador dedicado y eficiente', 15, 'junio', 2018, 'Masculino', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.es%2Ffotos-vectores-gratis%2Fpersona-frente&psig=AOvVaw2jvWTM02E7BrdjGHOI7TSY&ust=1727909548036000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKCVzemi7ogDFQAAAAAdAAAAABAE'),
('sofia.gomez@gmail.com', 'Sofía', 'Elena', 'Gómez', 'Rodríguez', 35, 'Uruapan', 'Michoacán', 'Los Pinos', 'Avenida Madero', 321, '5552345678', 98765, 10, 'mayo', 1989, 'Liderazgo excelente en proyectos', 1, 'julio', 2021, 'Femenino', 'https://www.google.com/imgres?q=imagenes%20de%20personas%20de%20frente&imgurl=https%3A%2F%2Fmedia.istockphoto.com%2Fid%2F1171169099%2Fes%2Ffoto%2Fhombre-con-brazos-cruzados-aislados-sobre-fondo-gris.jpg%3Fs%3D612x612%26w%3D0%26k%3D20%26c%3D8qDLKdLMm2i8DHXY6crX6a5omVh2IxqrOxJV2QGzgFg%3D&imgrefurl=https%3A%2F%2Fwww.istockphoto.com%2Fes%2Ffotos%2Fhombre-de-frente&docid=2UVXt9iC7kW5NM&tbnid=m-0hmZYfKS8ERM&vet=12ahUKEwjVzezmou6IAxVmle4BHZ3FKsEQM3oECCoQAA..i&w=612&h=408&hcb=2&ved=2ahUKEwjVzezmou6IAxVmle4BHZ3FKsEQM3oECCoQAA'),
('luis.castro@gmail.com', 'Luis', 'Fernando', 'Castro', 'Ortiz', 45, 'Pátzcuaro', 'Michoacán', 'La Estancia', 'Calle Benito Juárez', 654, '5553456789', 65432, 18, 'julio', 1979, 'Puntual y confiable', 20, 'agosto', 2015, 'Masculino', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.crushpixel.com%2Fes%2Fstock-photo%2Fsmiling-young-woman-front-group-676121.html&psig=AOvVaw2jvWTM02E7BrdjGHOI7TSY&ust=1727909548036000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKCVzemi7ogDFQAAAAAdAAAAABAP');

-- Tabla de pedidos
INSERT INTO Pedidios (dia_de_pedido, mes_de_pedido, año_de_pedido, descripccion_Pedido, codigo_Cliente, codigo_Empleado)
VALUES
(15, 'enero', 2023, 'Compra de 50 productos lácteos', 1, 2),
(20, 'febrero', 2023, 'Pedido de 30 yogures naturales', 2, 3),
(10, 'marzo', 2023, 'Compra de 100 litros de leche', 3, 1),
(5, 'abril', 2023, 'Pedido de 20 quesos artesanales', 4, 5),
(25, 'mayo', 2023, 'Compra de 50 cajas de crema', 5, 4),
(17, 'junio', 2023, 'Pedido de 10 litros de leche descremada', 1, 1),
(9, 'julio', 2023, 'Pedido de 25 quesos frescos', 2, 2),
(12, 'agosto', 2023, 'Compra de 200 yogures saborizados', 3, 3),
(28, 'septiembre', 2023, 'Pedido de 50 litros de leche entera', 4, 4),
(30, 'octubre', 2023, 'Pedido de 80 cajas de crema agria', 5, 5),
(3, 'noviembre', 2023, 'Pedido de 40 litros de leche de cabra', 1, 2),
(22, 'diciembre', 2023, 'Compra de 150 yogures de frutas', 2, 3),
(7, 'enero', 2024, 'Pedido de 60 litros de leche sin lactosa', 3, 1),
(14, 'febrero', 2024, 'Pedido de 20 quesos maduros', 4, 5),
(19, 'marzo', 2024, 'Compra de 90 yogures bajos en grasa', 5, 4),
(27, 'abril', 2024, 'Pedido de 70 litros de leche semidescremada', 1, 1),
(16, 'mayo', 2024, 'Compra de 35 quesos oaxaqueños', 2, 2),
(29, 'junio', 2024, 'Pedido de 100 litros de leche', 3, 3),
(11, 'julio', 2024, 'Pedido de 50 cajas de mantequilla', 4, 4),
(21, 'agosto', 2024, 'Compra de 200 litros de leche de almendra', 5, 5);

--Tabla de Ventas
INSERT INTO Ventas (dia, mes, año, descuento_aplicado, tipo_pago, codigo_Pedido)
VALUES
(15, 'enero', 2023, 10.50, 'tarjeta', 1),
(18, 'febrero', 2023, 5.00, 'contado', 2),
(22, 'marzo', 2023, 0.00, 'crédito', 3),
(30, 'abril', 2023, 7.25, 'tarjeta', 4),
(12, 'mayo', 2023, 15.00, 'contado', 5),
(5, 'junio', 2023, 8.75, 'tarjeta', 6),
(17, 'julio', 2023, 0.00, 'crédito', 7),
(21, 'agosto', 2023, 10.00, 'contado', 8),
(29, 'septiembre', 2023, 12.50, 'tarjeta', 9),
(9, 'octubre', 2023, 5.00, 'contado', 10),
(3, 'noviembre', 2023, 0.00, 'crédito', 11),
(15, 'diciembre', 2023, 10.00, 'tarjeta', 12),
(26, 'enero', 2024, 7.00, 'contado', 13),
(6, 'febrero', 2024, 0.00, 'tarjeta', 14),
(19, 'marzo', 2024, 12.75, 'crédito', 15),
(8, 'abril', 2024, 9.00, 'contado', 16),
(13, 'mayo', 2024, 6.50, 'tarjeta', 17),
(27, 'junio', 2024, 0.00, 'crédito', 18),
(31, 'julio', 2024, 8.25, 'contado', 19),
(20, 'agosto', 2024, 10.00, 'tarjeta', 20);





-- Insertar 5 registros en la tabla Categorias
INSERT INTO Categorias (NombreDeCategoria, DescripccionDeCategoria, dia_de_creacion, mes_de_creacion, año_de_creacion, estado_de_categoria_A_o_I, foto)
VALUES
('Lácteos', 'Productos derivados de la leche, como leche, queso y yogur.', 15, 'Enero', 2024, 'Activa', 'https://www.google.com/imgres?q=lacteos&imgurl=https%3A%2F%2Fthefoodtech.com%2Fwp-content%2Fuploads%2F2021%2F08%2Flacteos-828x548.jpg&imgrefurl=https%3A%2F%2Fthefoodtech.com%2Fnutricion-y-salud%2Fla-importancia-de-los-lacteos-en-la-nutricion-humana%2F&docid=Gq1drcGC6J5vHM&tbnid=5sfT8_mCDX3AyM&vet=12ahUKEwjwyL-Zpu6IAxVHMzQIHTiaGPYQM3oECBwQAA..i&w=828&h=548&hcb=2&ved=2ahUKEwjwyL-Zpu6IAxVHMzQIHTiaGPYQM3oECBwQAA'),
('Bebidas', 'Diversas bebidas como jugos, refrescos y aguas saborizadas.', 20, 'Febrero', 2024, 'Activa', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fcms.wingstopmexico.com%2Fbebidas&psig=AOvVaw0qLKUwaUugYgPDGzUW11gk&ust=1727910484113000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPD3g6em7ogDFQAAAAAdAAAAABAE'),
('Aperitivos', 'Snacks y bocadillos, ideales para picar entre comidas.', 10, 'Marzo', 2024, 'Activa', 'https://www.google.com/imgres?q=aperitivos%7B&imgurl=https%3A%2F%2Fi.blogs.es%2F7f7b5d%2Ftartaletas_salmon%2F450_1000.jpg&imgrefurl=https%3A%2F%2Fwww.directoalpaladar.com%2Frecetas-de-aperitivos%2F57-aperitivos-y-canapes-sencillos-y-baratos&docid=fR-W_UU_UiH9_M&tbnid=yq4YW3PZvusexM&vet=12ahUKEwiC3p6xpu6IAxVICTQIHZStI7gQM3oECBwQAA..i&w=450&h=300&hcb=2&ved=2ahUKEwiC3p6xpu6IAxVICTQIHZStI7gQM3oECBwQAA'),
('Cereales', 'Productos como avena, arroz y pastas, fundamentales en la dieta.', 25, 'Abril', 2024, 'Activa', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ97O8lHydDQbbAnRp1Q1IaCroVWr73qWGGuA&s'),
('Congelados', 'Alimentos congelados para facilitar su conservación y preparación.', 5, 'Mayo', 2024, 'Activa', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbecogalia.com%2Fcongelados-la-alternativa-rapida-saludable-una-buena-alimentacion-siglo-xxi%2F&psig=AOvVaw3UfUe4clGIdqDiLyL9uAX-&ust=1727910573856000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMDb4dKm7ogDFQAAAAAdAAAAABAE');

ALTER TABLE Subcategorias
ALTER COLUMN foto VARCHAR(MAX);
-- Insertar 5 registros en la tabla Subcategorias
INSERT INTO Subcategorias (NombreDeSubcategoria, DescripcionDeSubcategoria, tipoDeRotacion, foto, marca_de_la_subcategoria, codigo_Categoria)
VALUES
('Yogures', 'Productos lácteos fermentados, ideales para el desayuno.', 'Rápida', 'https://www.google.com/imgres?q=yogures&imgurl=https%3A%2F%2Fwww.webconsultas.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2Fwch_image_schema%2Fpublic%2Ftemas%2Fyogures.jpg&imgrefurl=https%3A%2F%2Fwww.webconsultas.com%2Fdieta-y-nutricion%2Falimentos-saludables%2Fque-es-el-yogur&docid=rtu6WT4XdNtfTM&tbnid=1_ZUB2qrvr1W5M&vet=12ahUKEwi3-JnZpu6IAxWFOjQIHbCLCcgQM3oECHEQAA..i&w=1200&h=675&hcb=2&ved=2ahUKEwi3-JnZpu6IAxWFOjQIHbCLCcgQM3oECHEQAA', 'La Lechera', 1),
('Refrescos', 'Bebidas carbonatadas de diferentes sabores.', 'Rápida', 'https://www.google.com/imgres?q=refrescos&imgurl=http%3A%2F%2Fblog.feebbomexico.com%2Fwp-content%2Fuploads%2F2013%2F11%2FRefrescosssss.jpg&imgrefurl=http%3A%2F%2Fblog.feebbomexico.com%2Festudio-de-mercado-sobre-consumo-de-refresco-en-mexico%2F&docid=JlyH3myqdpO6uM&tbnid=jeMJuVSbgypS6M&vet=12ahUKEwijmO_hpu6IAxX8MzQIHYm_FgcQM3oECBcQAA..i&w=1386&h=727&hcb=2&ved=2ahUKEwijmO_hpu6IAxX8MzQIHYm_FgcQM3oECBcQAA', 'Coca-Cola', 2),
('Frutos Secos', 'Aperitivos saludables como almendras y nueces.', 'Lenta', 'https://www.google.com/imgres?q=frutos%20secos&imgurl=https%3A%2F%2Fwww.atida.com%2Fes-es%2Fblog%2Fwp-content%2Fuploads%2F2021%2F12%2F31-blog-rrss-fb.jpg&imgrefurl=https%3A%2F%2Fwww.atida.com%2Fes-es%2Fblog%2F2021%2F12%2Ffrutos-secos-engordan-beneficios-y-tipos%2F&docid=yt3lzLF0-99kuM&tbnid=amgkpCg4v6PYVM&vet=12ahUKEwjK1tXtpu6IAxWUGjQIHVcPJi8QM3oECBoQAA..i&w=1200&h=630&hcb=2&ved=2ahUKEwjK1tXtpu6IAxWUGjQIHVcPJi8QM3oECBoQAA', 'NutriSnack', 3),
('Pasta', 'Alimento básico en la dieta, disponible en varias formas.', 'Rápida', 'https://www.google.com/imgres?q=pastas&imgurl=https%3A%2F%2Feditorial.foodandwineespanol.com%2Fwp-content%2Fuploads%2F2019%2F10%2Fdectada-pasta.webp&imgrefurl=https%3A%2F%2Ffoodandwineespanol.com%2Fsecciones%2Factualidad%2Festos-tipos-de-pasta-se-cuecen-mas-rapido%2F&docid=o6CALxMOodKQUM&tbnid=h-GWOvi0i9VjuM&vet=12ahUKEwjCx5r2pu6IAxXtIjQIHaMHKxQQM3oECFcQAA..i&w=2560&h=1440&hcb=2&ved=2ahUKEwjCx5r2pu6IAxXtIjQIHaMHKxQQM3oECFcQAA', 'Barilla', 4),
('Verduras Congeladas', 'Vegetales congelados para una rápida preparación.', 'Lenta', 'https://www.google.com/imgres?q=verduras&imgurl=https%3A%2F%2Fs2.abcstatics.com%2Fabc%2Fwww%2Fmultimedia%2Fbienestar%2F2024%2F04%2F30%2Fverduras-pocas-calorias-R3Vfbjx9Nok0nxp9QObH7xH-1200x840%40diario_abc.jpg&imgrefurl=https%3A%2F%2Fwww.abc.es%2Fbienestar%2Falimentacion%2Fverduras-calorias-repletas-nutrientes-20240430172000-nt.html&docid=X2-CAxKUzPACCM&tbnid=gPdYlVQtdPz5sM&vet=12ahUKEwjXoqD-pu6IAxWAKzQIHeCtEqAQM3oECGsQAA..i&w=1200&h=840&hcb=2&ved=2ahUKEwjXoqD-pu6IAxWAKzQIHeCtEqAQM3oECGsQAA', 'Green Garden', 5);



INSERT INTO Productos (NombreDelProducto, dia_de_caducidad, mes_de_caducidad, año_de_caducidad, precioPorKilogramo, condiciones_de_almacenamiento, nutrientes_que_Aporta, Numero_De_lote_del_producto, stack_disponible, foto, margen_de_ganancia, unidad_de_medida, stock_minimo, stock_maximo, punto_de_reorden,codigo_Categoria)
VALUES
('Queso Fresco', 12, 'junio', 2024, 150.250, 'Refrigeración', 'P,C', 1023, 100, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.bonviveur.es%2Frecetas%2Fqueso-fresco-casero&psig=AOvVaw2ZzZaOG8Tehs9IApUfQOLo&ust=1727909625102000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCICu-Iyj7ogDFQAAAAAdAAAAABAI', 25.50, 'kilogramos', 10, 200, 20,1),
('Leche Deslactosada', 30, 'julio', 2024, 50.500, 'Refrigeración', 'P,C', 2045, 200, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.abc.es%2Fbienestar%2Falimentacion%2Fabci-leche-202007090823_noticia.html&psig=AOvVaw1DWfAZatoH_M3f6Ql-Fxyt&ust=1727909655883000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKiPw5uj7ogDFQAAAAAdAAAAABAI', 18.00, 'litros', 20, 300, 30,2),
('Yogur Natural', 18, 'mayo', 2024, 75.600, 'Refrigeración', 'P,C', 3050, 150, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fclickabasto.com%2Fproducts%2Fyogurt-yoplait-natural-1-lt&psig=AOvVaw3G4CYZYvKiIwmgVcuQ9R4M&ust=1727909696457000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCICd666j7ogDFQAAAAAdAAAAABAE', 20.75, 'kilogramos', 15, 250, 25,3),
('Crema Agria', 22, 'septiembre', 2024, 85.750, 'Refrigeración', 'C', 4067, 120, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.directoalpaladar.com%2Frecetario%2Fcomo-hacer-sour-cream-crema-nata-agria-casera-receta-facilisima-lactosa&psig=AOvVaw2uaKObC02dBenGIYXPzDCG&ust=1727909714954000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJDi07ej7ogDFQAAAAAdAAAAABAE', 22.50, 'kilogramos', 10, 220, 15,4),
('Mantequilla', 14, 'octubre', 2024, 180.450, 'Refrigeración', 'C', 5073, 80, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fjordibordas.com%2Fblog%2Fcomo-reemplazar-la-mantequilla-por-ingredientes-de-origen-vegetal%2F&psig=AOvVaw0Fn8azuEQ_oFkLVVjmKetZ&ust=1727909738101000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCOim2MKj7ogDFQAAAAAdAAAAABAE', 30.00, 'kilogramos', 8, 150, 10,5);

--Ventas y Productos
INSERT INTO Ventas_y_Productos (descripccion, precioUnitario, cantidad, codigo_Venta, codigo_Producto)
VALUES
('Queso Fresco - Venta al detalle', 150.25000, 2, 1, 1),
('Leche Deslactosada - Pack familiar', 50.50000, 5, 1, 2),
('Yogur Natural - Tarro grande', 75.60000, 3, 2, 3),
('Crema Agria - Presentación pequeña', 85.75000, 1, 2, 4),
('Mantequilla - Barra', 180.45000, 4, 3, 5),
('Queso Fresco - Venta al detalle', 150.25000, 1, 4, 1),
('Leche Deslactosada - Pack familiar', 50.50000, 6, 5, 2),
('Yogur Natural - Tarro grande', 75.60000, 2, 5, 3),
('Crema Agria - Presentación pequeña', 85.75000, 3, 6, 4),
('Mantequilla - Barra', 180.45000, 2, 6, 5),
('Queso Fresco - Venta al detalle', 150.25000, 4, 7, 1),
('Leche Deslactosada - Pack familiar', 50.50000, 3, 8, 2),
('Yogur Natural - Tarro grande', 75.60000, 5, 9, 3),
('Crema Agria - Presentación pequeña', 85.75000, 2, 10, 4),
('Mantequilla - Barra', 180.45000, 6, 10, 5),
('Queso Fresco - Venta al detalle', 150.25000, 2, 11, 1),
('Leche Deslactosada - Pack familiar', 50.50000, 4, 12, 2),
('Yogur Natural - Tarro grande', 75.60000, 6, 13, 3),
('Crema Agria - Presentación pequeña', 85.75000, 1, 14, 4),
('Mantequilla - Barra', 180.45000, 3, 15, 5);


-- Insertar 5 registros en la tabla Devoluciones
INSERT INTO Devoluciones (
    CantidadDeProductosDevueltos, DescripccionDeDevolucion, diaDevolucion, 
    montoDeRembolso, mes, año, hora, DescripccionDeMedidasTomadas, foto_Devolucion, codigo_Cliente
)
VALUES
(2, 'Producto con fecha de caducidad vencida', 12, 300.50, 'Septiembre', 2024, '14:30', 
 'Reembolso completo y entrega de productos nuevos', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fjordibordas.com%2Fblog%2Fcomo-reemplazar-la-mantequilla-por-ingredientes-de-origen-vegetal%2F&psig=AOvVaw0Fn8azuEQ_oFkLVVjmKetZ&ust=1727909738101000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCOim2MKj7ogDFQAAAAAdAAAAABAE', 1),
(1, 'Envase dañado en el transporte', 15, 150.75, 'Septiembre', 2024, '10:45', 
 'Se reemplazó el producto dañado por uno en buen estado', 'https://www.google.com/imgres?q=mantequilla&imgurl=https%3A%2F%2Fd1zc67o3u1epb0.cloudfront.net%2Fmedia%2Fcatalog%2Fproduct%2F6%2F4%2F6417-a.jpg%3Fwidth%3D265%26height%3D390%26store%3Ddefault%26image-type%3Dimage&imgrefurl=https%3A%2F%2Fwww.scorpion.com.mx%2Fmargarina-iberia-90-gramos.html&docid=LVs8zMrGW6mB-M&tbnid=Z17zD_mQ_3WTtM&vet=12ahUKEwiaydTBo-6IAxVcGTQIHWkjGB4QM3oECBUQAA..i&w=1200&h=1200&hcb=2&ved=2ahUKEwiaydTBo-6IAxVcGTQIHWkjGB4QM3oECBUQAA', 2),
(3, 'Pedido incorrecto, cliente recibió otro producto', 18, 450.00, 'Agosto', 2024, '16:20', 
 'Se corrigió el pedido y se devolvieron los productos correctos', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.directoalpaladar.com%2Frecetario%2Fcomo-hacer-sour-cream-crema-nata-agria-casera-receta-facilisima-lactosa&psig=AOvVaw2uaKObC02dBenGIYXPzDCG&ust=1727909714954000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJDi07ej7ogDFQAAAAAdAAAAABAE', 3),
(1, 'Producto en mal estado, mala refrigeración', 22, 200.00, 'Julio', 2024, '09:10', 
 'Se ofreció reembolso parcial y productos en buen estado', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fclickabasto.com%2Fproducts%2Fyogurt-yoplait-natural-1-lt&psig=AOvVaw3G4CYZYvKiIwmgVcuQ9R4M&ust=1727909696457000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCICd666j7ogDFQAAAAAdAAAAABAE', 4),
(4, 'Cliente insatisfecho con la calidad del producto', 25, 500.00, 'Junio', 2024, '13:55', 
 'Reembolso completo y revisión del lote de productos', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.recetasnestlecam.com%2Fescuela-de-sabor%2Fingredientes%2Fproductos-lacteos&psig=AOvVaw1DWfAZatoH_M3f6Ql-Fxyt&ust=1727909655883000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKiPw5uj7ogDFQAAAAAdAAAAABAO', 5);

 -- Insertar 20 registros en la tabla ProductosDevueltos
INSERT INTO ProductosDevueltos (codigo_Devolucion, codigo_VP, Observaciones)
VALUES
(1, 1, 'Producto con fecha de caducidad vencida, debe ser retirado.'),
(1, 2, 'Envase dañado, necesita reemplazo.'),
(2, 3, 'Producto incorrecto, el cliente recibió un sabor diferente.'),
(2, 4, 'El producto estaba en mal estado al recibirlo.'),
(3, 5, 'Falta el etiquetado, se debe corregir.'),
(3, 1, 'Producto devuelto debido a insatisfacción del cliente.'),
(4, 2, 'El producto presenta mal olor, no apto para consumo.'),
(4, 3, 'Requiere revisión de calidad, cliente insatisfecho.'),
(5, 4, 'Envase roto, necesita un nuevo embalaje.'),
(5, 5, 'No coincide con la descripción del pedido.'),
(1, 1, 'Producto fue devuelto por problemas de calidad.'),
(1, 2, 'Se debe mejorar el proceso de embalaje.'),
(2, 3, 'Se solicita el reembolso por el estado del producto.'),
(2, 4, 'Faltan instrucciones en el empaque.'),
(3, 5, 'Devolver producto defectuoso al proveedor.'),
(3, 1, 'El producto debe ser reemplazado por otro nuevo.'),
(4, 2, 'Se encuentra en condiciones no adecuadas para la venta.'),
(4, 3, 'Mal manejo en el transporte, producto dañado.'),
(5, 4, 'Devolución por insatisfacción, producto no cumple expectativas.'),
(5, 5, 'Solicitar revisión de lote de productos devueltos.');


ALTER TABLE Provedores
ALTER COLUMN foto VARCHAR(MAX);
-- Insertar 5 registros en la tabla Provedores
INSERT INTO Provedores (PrimerNombre, SegundoNombre, ApellidoPaterno, ApellidoMaterno, Localidad, Estado, foto, Colonia, Avenida, CodigoPostal, dia_inicio_relacion, mes_inicio_relacion, año_inicio_relacion, RFC, correo_electronico, telefono)
VALUES
('Juan', 'Pablo', 'González', 'Hernández', 'Sahuayo', 'Michoacán', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpxhere.com%2Fes%2Fphoto%2F1412284&psig=AOvVaw3RJSPmiJcEUazRjuEKzo_Q&ust=1727910369560000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCNjR5--l7ogDFQAAAAAdAAAAABAE', 'San Onofre', 'Santa Inés', 59035, 1, 5, 2020, 'GONJ800501XYZ', 'juan.gonzalez@gmail.com', '1234567890'),
('María', 'José', 'López', 'Pérez', 'Jiquilpan', 'Michoacán', 'https://www.google.com/imgres?q=imagenes%20de%20poersonas%20de%20frente&imgurl=https%3A%2F%2Fst4.depositphotos.com%2F1049680%2F20734%2Fi%2F450%2Fdepositphotos_207343968-stock-photo-young-hipster-man-happy-face.jpg&imgrefurl=https%3A%2F%2Fdepositphotos.com%2Fes%2Fphotos%2Fpersona-de-frente.html&docid=UrziSsfShHjyXM&tbnid=m-aEXQSQKmkwQM&vet=12ahUKEwjopMzupe6IAxVyHDQIHX1HCRkQM3oECCcQAA..i&w=600&h=283&hcb=2&ved=2ahUKEwjopMzupe6IAxVyHDQIHX1HCRkQM3oECCcQAA', 'Centro', 'Morelos', 59050, 15, 3, 2021, 'LOPM900214ABC', 'maria.lopez@gmail.com', '2345678901'),
('Carlos', NULL, 'Ramírez', 'Soto', 'Morelia', 'Michoacán', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.freepik.com%2Ffotos-premium%2Ffeliz-alegre-joven-empresario-morena-brazos-cruzados-mirando-al-frente-sonrisa-alegre-encantadora_132358-1597.jpg&tbnid=69ZCTI2h7CvJEM&vet=10CA4QxiAoAWoXChMI2NHn76XuiAMVAAAAAB0AAAAAEBM..i&imgrefurl=https%3A%2F%2Fwww.freepik.es%2Ffotos-vectores-gratis%2Fpersona-blanca&docid=Ki12db4Gk05wEM&w=626&h=452&itg=1&q=imagenes%20de%20poersonas%20de%20frente&client=opera-gx&ved=0CA4QxiAoAWoXChMI2NHn76XuiAMVAAAAAB0AAAAAEBM', 'Juárez', 'Zaragoza', 58000, 20, 8, 2019, 'RAMC801230DEF', 'carlos.ramirez@gmail.com', '3456789012'),
('Sofía', 'Elizabeth', 'Martínez', 'García', 'Pátzcuaro', 'Michoacán', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.freepik.com%2Ffoto-gratis%2Fapuesto-joven-brazos-cruzados-sobre-fondo-blanco_23-2148222620.jpg&tbnid=ME2oeLjA87TSQM&vet=10CAQQxiAoAmoXChMI2NHn76XuiAMVAAAAAB0AAAAAEBM..i&imgrefurl=https%3A%2F%2Fwww.freepik.es%2Ffotos%2Fpersonas&docid=m1WZGxwi5jT5WM&w=626&h=626&itg=1&q=imagenes%20de%20poersonas%20de%20frente&client=opera-gx&ved=0CAQQxiAoAmoXChMI2NHn76XuiAMVAAAAAB0AAAAAEBM', 'La Estación', 'López Mateos', 61600, 10, 7, 2022, 'MARG910312GHI', 'sofia.martinez@gmail.com', '4567890123'),
('Luis', 'Antonio', 'Fernández', 'Díaz', 'Uruapan', 'Michoacán', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fus.123rf.com%2F450wm%2Ff8studio%2Ff8studio2112%2Ff8studio211200496%2F179339580-retrato-de-un-joven-cauc%25C3%25A1sico-sonriente-con-los-brazos-cruzados-usando-un-reloj-inteligente-y-una.jpg%3Fver%3D6&tbnid=bHhhoxKbRkRYBM&vet=10CBIQxiAoBGoXChMI2NHn76XuiAMVAAAAAB0AAAAAEBM..i&imgrefurl=https%3A%2F%2Fes.123rf.com%2Fimagenes-de-archivo%2Fretrato_profesional_fondo_blanco_cuerpo_entero.html&docid=mEbWpx9XS08b-M&w=450&h=300&itg=1&q=imagenes%20de%20poersonas%20de%20frente&client=opera-gx&ved=0CBIQxiAoBGoXChMI2NHn76XuiAMVAAAAAB0AAAAAEBM', 'San Juan', 'Hidalgo', 60150, 5, 11, 2018, 'FELU850405JKL', 'luis.fernandez@gmail.com', '5678901234');


ALTER TABLE Transportes
ALTER COLUMN foto VARCHAR(MAX);
-- Insertar 20 registros en la tabla Transportes
INSERT INTO Transportes (NumeroDePlaca, Marca, Modelo, foto, DescripccionDelVehiculo, codigo_Provedore)
VALUES
('ABC-123', 'Chevrolet', 'Sonic', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fqueserialaantigua.com%2Fel-transporte-de-leche-en-camiones-cisterna%2F&psig=AOvVaw3F_OwkqLP586tcWSNY2_KV&ust=1727909882948000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJjnj4mk7ogDFQAAAAAdAAAAABAE', 'Vehículo compacto ideal para ciudad.', 1),
('DEF-456', 'Nissan', 'Versa', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.es%2Fvector-premium%2Fcamion-lleno-productos-lacteos_24663565.htm&psig=AOvVaw3F_OwkqLP586tcWSNY2_KV&ust=1727909882948000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJjnj4mk7ogDFQAAAAAdAAAAABAJ', 'Sedán eficiente y cómodo para viajes largos.', 2),
('GHI-789', 'Ford', 'Fiesta', 'https://www.google.com/imgres?q=transportes%20de%20lacteos&imgurl=https%3A%2F%2Finfo-transportes.com.mx%2Fimages%2FLALATransportex8.webp&imgrefurl=https%3A%2F%2Finfo-transportes.com.mx%2Findex.php%2Fhome-page%2Fseccion-3%2Fsubseccion-3-4%2F1525-pese-a-entorno-inflacionario-en-lacteos-avanza-grupo-lala&docid=hG2wPZcIQ8_hlM&tbnid=wv15Q36natuuwM&vet=12ahUKEwiEkMaGpO6IAxVJLTQIHVGFDLgQM3oECBcQAA..i&w=800&h=600&hcb=2&ved=2ahUKEwiEkMaGpO6IAxVJLTQIHVGFDLgQM3oECBcQAA', 'Vehículo ágil y económico para el uso diario.', 3),
('JKL-012', 'Volkswagen', 'Jetta', 'https://www.google.com/imgres?q=transportes%20de%20lacteos%20imagenes%20de%20presentacion&imgurl=https%3A%2F%2Fenalimentos.lat%2Fimages%2Fnoticias%2F2023-11%2Fgrupo-lala-implementa.jpg&imgrefurl=https%3A%2F%2Fenalimentos.lat%2Fnoticias%2F8278-grupo-lala-implementa-tecnologia-avanzada-y-es-reconocida-por-su-transporte-limpio.html&docid=Qn7a05O9BIUOlM&tbnid=hBWVQYF9BYWUrM&vet=12ahUKEwjbpdGnpO6IAxWwLTQIHffXDXcQM3oECDQQAA..i&w=920&h=700&hcb=2&ved=2ahUKEwjbpdGnpO6IAxWwLTQIHffXDXcQM3oECDQQAA', 'Sedán de alta eficiencia y confort.', 4),
('MNO-345', 'Toyota', 'Corolla', 'https://www.google.com/imgres?q=transportes%20de%20lacteos%20imagenes%20de%20presentacion&imgurl=https%3A%2F%2Fwww.il-latam.com%2Fwp-content%2Fuploads%2F2018%2F09%2F140_De_la_granja.jpg&imgrefurl=https%3A%2F%2Fwww.il-latam.com%2Fblog%2Farticulos-centrales%2Fde-la-granja-al-refrigeradorr%2F&docid=TpDjSQZEmTczqM&tbnid=qzQ7taiU3zPmJM&vet=12ahUKEwjbpdGnpO6IAxWwLTQIHffXDXcQM3oECGYQAA..i&w=567&h=395&hcb=2&ved=2ahUKEwjbpdGnpO6IAxWwLTQIHffXDXcQM3oECGYQAA', 'Confiable y duradero, ideal para familias.', 5),
('PQR-678', 'Hyundai', 'Elantra', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Flalechera12.wordpress.com%2Ftransporte-de-los-productos-lacteos%2F&psig=AOvVaw3PkSfpROciaVHKhZzzbIeG&ust=1727909952111000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPCF0smk7ogDFQAAAAAdAAAAABAE', 'Ofrece tecnología avanzada y seguridad.', 1),
('STU-901', 'Kia', 'Rio', 'https://www.google.com/imgres?q=transportes%20de%20lacteos%20imagenes%20de%20presentacion&imgurl=https%3A%2F%2Fdiariopresenterm.blob.core.windows.net.optimalcdn.com%2Fimages%2F2019%2F11%2F19%2Fesol3carlala2.jpg&imgrefurl=https%3A%2F%2Fwww.diariopresente.mx%2Felsoldelsureste%2Fle-querian-beber-la-leche-al-camion-lechero%2F245720&docid=QwDt7EpVmEZ9_M&tbnid=1ZWH57n-O_vRdM&vet=12ahUKEwjbpdGnpO6IAxWwLTQIHffXDXcQM3oECD0QAA..i&w=564&h=752&hcb=2&ved=2ahUKEwjbpdGnpO6IAxWwLTQIHffXDXcQM3oECD0QAA', 'Compacto y divertido de conducir.', 2),
('VWX-234', 'Mazda', '3', 'https://www.google.com/imgres?q=transportes%20de%20lacteos%20imagenes%20de%20presentacion&imgurl=https%3A%2F%2Fwww.legiscomex.com%2Fpresentaciones%2FModuloLogistico%2Fimages%2Fguia-de-logistica-y-transporte.jpg&imgrefurl=https%3A%2F%2Fwww.legiscomex.com%2Finformacion-modulo-logistico%2Fguia-de-logistica-y-transporte&docid=-ke2GRRA9HOtbM&tbnid=lpLDOs-884RokM&vet=12ahUKEwi4mvHjpO6IAxXwPTQIHfOSIfs4ChAzegQIbxAA..i&w=1200&h=424&hcb=2&ved=2ahUKEwi4mvHjpO6IAxXwPTQIHfOSIfs4ChAzegQIbxAA', 'Estilo deportivo y excelente manejo.', 3),
('YZA-567', 'Subaru', 'Impreza', 'https://www.google.com/imgres?q=camionetas%20de%20entrega%20jonda&imgurl=https%3A%2F%2Fwww.honda.mx%2Fweb%2Fimg%2Fcars%2Fmodels%2Fbrv%2F2024%2Fgalleries%2Fgallery_1%2F1.jpg&imgrefurl=https%3A%2F%2Fwww.honda.mx%2Fautos%2Fbr-v&docid=Mz0_pt3yr5F_-M&tbnid=Cs0zBFRq2Ge0xM&vet=12ahUKEwjdvaTxpO6IAxWaGDQIHVcmJeoQM3oECBwQAA..i&w=1428&h=715&hcb=2&ved=2ahUKEwjdvaTxpO6IAxWaGDQIHVcmJeoQM3oECBwQAA', 'Vehículo con tracción en las cuatro ruedas.', 4),
('BCD-890', 'Honda', 'Civic', 'https://www.google.com/imgres?q=transportes%20de%20lacteos%20imagenes%20de%20presentacion&imgurl=https%3A%2F%2Fanugafoodtec.krones.com%2Fmedia%2Fimages%2F1280_01_201911KO04_0113_Preview_Layout.jpg&imgrefurl=https%3A%2F%2Fanugafoodtec.krones.com%2Fes%2Fempresa%2Fprensa%2Fmagazine%2Freferencia%2Fnueva-fabrica-de-lacteos-para-tine.php&docid=r1-GIEogWek7tM&tbnid=W244dCt7Og9zbM&vet=12ahUKEwi4mvHjpO6IAxXwPTQIHfOSIfs4ChAzegQIKxAA..i&w=1280&h=853&hcb=2&ved=2ahUKEwi4mvHjpO6IAxXwPTQIHfOSIfs4ChAzegQIKxAA', 'Confiable y eficiente en consumo de combustible.', 5),
('EFG-123', 'Chevrolet', 'Malibu', 'https://www.google.com/imgres?q=transportes%20de%20lacteos%20imagenes%20de%20presentacion&imgurl=https%3A%2F%2Fwww.elsoldepuebla.com.mx%2Flocal%2Festado%2F8t6huf-trailer-recuperado-tepeaca.jpg%2FALTERNATES%2FLANDSCAPE_400%2FTr%25C3%25A1iler%2520recuperado%2520Tepeaca.jpg&imgrefurl=https%3A%2F%2Fwww.elsoldepuebla.com.mx%2Flocal%2Festado%2Frecuperan-trailer-cargado-de-leche-tras-operativo-en-tepeaca-puebla-kedworth-trasportes-easo-lala-autopista-puebla-orizab-6386009.html&docid=BoUtCpAPeE3CzM&tbnid=yUuGR0ka07vUrM&vet=12ahUKEwi4mvHjpO6IAxXwPTQIHfOSIfs4ChAzegQIbBAA..i&w=400&h=250&hcb=2&ved=2ahUKEwi4mvHjpO6IAxXwPTQIHfOSIfs4ChAzegQIbBAA', 'Sedán espacioso y cómodo para viajes familiares.', 1),
('HIJ-456', 'Nissan', 'Altima', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.lanacion.com.py%2Fnegocios%2F2021%2F08%2F11%2Fenlentecimiento-en-distribucion-de-productos-genera-sobrecostos-refiere-capainlac%2F&psig=AOvVaw3PkSfpROciaVHKhZzzbIeG&ust=1727909952111000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPCF0smk7ogDFQAAAAAdAAAAABAK', 'Diseño elegante y potente motor.', 2),
('KLM-789', 'Ford', 'Fusion', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fagronotas.wordpress.com%2F2008%2F06%2F02%2Ftransporte-no-refrigerado-deteriora-leche-pasteurizada%2F&psig=AOvVaw3PkSfpROciaVHKhZzzbIeG&ust=1727909952111000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPCF0smk7ogDFQAAAAAdAAAAABAV', 'Combina estilo y tecnología en un solo vehículo.', 3),
('NOP-012', 'Volkswagen', 'Tiguan', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fportalechero.com%2Fwp-content%2Fuploads%2F2023%2F01%2FquesosFabrica-Rocalac-camion-trabajadores-quesos.jpg&tbnid=vaPx7b5nETDiGM&vet=10CAQQxiAoA2oXChMI8IXSyaTuiAMVAAAAAB0AAAAAEB0..i&imgrefurl=https%3A%2F%2Fportalechero.com%2Fargentina-los-precios-de-quesos-en-fabrica-aumentaron-un-10-en-lo-que-va-de-enero%2F&docid=DIHBu3XbouEbAM&w=1020&h=580&itg=1&q=transportes%20de%20lacteos%20imagenes%20de%20presentacion&client=opera-gx&ved=0CAQQxiAoA2oXChMI8IXSyaTuiAMVAAAAAB0AAAAAEB0', 'SUV espacioso y versátil para aventuras.', 4),
('QRS-345', 'Toyota', 'RAV4', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.joviar.mx%2Fwp-content%2Fuploads%2F2020%2F12%2Fjoviar-treansportes-2-min.jpg&tbnid=-JgWGdWUg6G5tM&vet=10CAoQxiAoCWoXChMI8IXSyaTuiAMVAAAAAB0AAAAAEB0..i&imgrefurl=https%3A%2F%2Fwww.joviar.mx%2Fcriterios-de-la-fao-para-el-manejo-y-transporte-de-leche-y-productos-lacteos%2F&docid=cjgPJyPeYY8-TM&w=1459&h=1294&itg=1&q=transportes%20de%20lacteos%20imagenes%20de%20presentacion&client=opera-gx&ved=0CAoQxiAoCWoXChMI8IXSyaTuiAMVAAAAAB0AAAAAEB0', 'Ideal para el campo y la ciudad.', 5),
('TUV-678', 'Hyundai', 'Tucson', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.forbes.com.mx%2F2015%2F05%2FBimbo1-e1650975567491.jpg&tbnid=igF5VChXJ_v9-M&vet=10CBQQxiAoBmoXChMI8IXSyaTuiAMVAAAAAB0AAAAAEB0..i&imgrefurl=https%3A%2F%2Fwww.forbes.com.mx%2Fnegocios-industria-corregir-imprecisiones-productos-lacteos-vetados%2F&docid=MO7Ju61jKVJ8ZM&w=1280&h=720&itg=1&q=transportes%20de%20lacteos%20imagenes%20de%20presentacion&client=opera-gx&ved=0CBQQxiAoBmoXChMI8IXSyaTuiAMVAAAAAB0AAAAAEB0', 'SUV con alta eficiencia y tecnología avanzada.', 1),
('WXY-901', 'Kia', 'Sportage', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmundolacteo.es%2Fwp-content%2Fuploads%2F2021%2F12%2Fcamiones-circulando-carretera.jpg&tbnid=kewFGtdi0V-TyM&vet=10CBAQxiAoAmoXChMI8IXSyaTuiAMVAAAAAB0AAAAAEB0..i&imgrefurl=https%3A%2F%2Fmundolacteo.es%2Fleche%2Fconservacion-transporte-productos-lacteos&docid=h_SKg7dlzyZ0NM&w=1400&h=600&itg=1&q=transportes%20de%20lacteos%20imagenes%20de%20presentacion&client=opera-gx&ved=0CBAQxiAoAmoXChMI8IXSyaTuiAMVAAAAAB0AAAAAEB0', 'Espacioso y cómodo para toda la familia.', 2),
('ZAB-234', 'Mazda', 'CX-5', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tyt.com.mx%2Fnota%2Flala-electrifica-su-flota-de-reparto-con-30-camiones-byd&psig=AOvVaw3PkSfpROciaVHKhZzzbIeG&ust=1727909952111000&source=images&cd=vfe&opi=89978449&ved=0CBgQ3YkBahcKEwjwhdLJpO6IAxUAAAAAHQAAAAAQJg', 'Estilo y rendimiento en un solo vehículo.', 3),
('CDE-567', 'Subaru', 'Forester', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ft21.com.mx%2Fterrestre-2022-12-07-grupo-lala-adquiere-30-vehiculos-100-electricos-refrigerados%2F&psig=AOvVaw3PkSfpROciaVHKhZzzbIeG&ust=1727909952111000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPCF0smk7ogDFQAAAAAdAAAAABAs', 'SUV con capacidad todoterreno y seguridad.', 4),
('FGH-890', 'Honda', 'CR-V', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Flatamobility.com%2Fwp-content%2Fuploads%2F2022%2F12%2FLALA-1.jpg&tbnid=LnClumSXoo1M0M&vet=10CA4QxiAoAWoXChMI8IXSyaTuiAMVAAAAAB0AAAAAEDA..i&imgrefurl=https%3A%2F%2Flatamobility.com%2Fmexico-grupo-lala-adquiere-30-unidades-100-electricas-para-operaciones-de-reparto%2F&docid=BysfwaX0_TJBLM&w=1472&h=828&itg=1&q=transportes%20de%20lacteos%20imagenes%20de%20presentacion&client=opera-gx&ved=0CA4QxiAoAWoXChMI8IXSyaTuiAMVAAAAAB0AAAAAEDA', 'SUV confiable y espacioso para el día a día.', 5);

-- Insertar 5 registros en la tabla Compras
INSERT INTO Compras (tipoDeCompra, Total_de_Compra, dia_de_compra, mes_de_compra, año_de_compra, estado_compra, codigo_Proveedor)
VALUES
('Contado', 15000, 5, 'Octubre', 2023, 'Completada', 1),
('Crédito', 20000, 12, 'Septiembre', 2023, 'Pendiente', 2),
('Contado', 12000, 25, 'Agosto', 2023, 'Cancelada', 3),
('Crédito', 25000, 18, 'Julio', 2023, 'Completada', 4),
('Contado', 18000, 30, 'Junio', 2023, 'Pendiente', 5);

-- Insertar 20 registros en la tabla Compras_y_Productos ____________________________________________________________________________________________

INSERT INTO Compras_y_Productos (Cantidad_De_Productos_Comprados, precioUnitario, descripccion, codigo_Compra, codigo_Producto)
VALUES
(50, 10.00, 'Compra de manzanas frescas', 1, 1),
(100, 12.00, 'Compra de naranjas de alta calidad', 1, 2),
(150, 8.00, 'Compra de plátanos maduros', 1, 3),
(75, 15.00, 'Compra de queso fresco', 1, 4),
(60, 20.00, 'Compra de yogur natural', 1, 5),
(120, 18.00, 'Compra de leche entera', 2, 1),
(180, 25.00, 'Compra de huevos orgánicos', 2, 2),
(95, 22.00, 'Compra de mantequilla sin sal', 2, 3),
(70, 21.00, 'Compra de crema ácida', 2, 4),
(130, 19.00, 'Compra de pan integral', 2, 5),
(90, 15.00, 'Compra de arroz integral', 3, 1),
(50, 9.00, 'Compra de avena en hojuelas', 3, 2),
(110, 12.00, 'Compra de pasta integral', 3, 3),
(200, 30.00, 'Compra de aceite de oliva', 3, 4),
(100, 24.00, 'Compra de miel orgánica', 3, 5),
(140, 28.00, 'Compra de café en grano', 4, 1),
(160, 10.00, 'Compra de galletas de avena', 4, 2),
(75, 15.50, 'Compra de chocolate amargo', 4, 3),
(110, 14.00, 'Compra de salsa de tomate', 4, 4),
(140, 5.00, 'Compra de agua mineral', 4, 5);

SELECT codigo FROM Compras;
SELECT * FROM Productos;

-- Insertar 20 registros en la tabla DetProductos_y_Provedores 
INSERT INTO DetProductos_y_Provedores (precio, caracteristicas, codigo_Producto, codigo_Proveedor)
VALUES
(15.250, 'Manzanas rojas frescas de alta calidad', 1, 1),
(20.500, 'Naranjas jugosas, variedad Valencia', 2, 2),
(12.750, 'Plátanos maduros, sin manchas', 3, 3),
(8.900, 'Queso fresco artesanal', 4, 4),
(7.500, 'Yogur natural sin azúcar', 5, 5),
(16.300, 'Leche entera pasteurizada', 1, 2),
(22.450, 'Huevos orgánicos, tamaño grande', 2, 3),
(10.500, 'Mantequilla sin sal, alta calidad', 3, 4),
(9.800, 'Crema ácida artesanal', 4, 5),
(6.900, 'Pan integral horneado', 5, 1),
(14.750, 'Arroz integral, bajo en calorías', 1, 3),
(11.200, 'Avena en hojuelas, sin gluten', 2, 4),
(13.950, 'Pasta integral, libre de transgénicos', 3, 5),
(25.700, 'Aceite de oliva virgen extra', 4, 1),
(18.600, 'Miel orgánica pura', 5, 2),
(19.250, 'Café en grano tostado', 1, 4),
(9.950, 'Galletas de avena con chispas de chocolate', 2, 5),
(30.500, 'Chocolate amargo, 85% cacao', 3, 1),
(7.600, 'Salsa de tomate natural', 4, 2),
(12.850, 'Agua mineral con gas', 5, 3);

-- Insertando 20 registros con códigos de productos y pedidos aleatorios
INSERT INTO Pedidos_y_Productos (cantidad, precioUnitario, codigoProductos, CodigoPedidios)
VALUES 
(5, 120.99, 3, 10),
(2, 50.50, 1, 4),
(10, 20.99, 5, 8),
(7, 75.75, 2, 15),
(1, 500.00, 4, 6),
(12, 30.00, 3, 2),
(6, 60.50, 5, 14),
(4, 45.99, 1, 7),
(8, 80.80, 2, 9),
(3, 15.99, 4, 11),
(9, 25.99, 3, 5),
(11, 35.00, 1, 12),
(14, 95.75, 5, 13),
(2, 18.99, 2, 3),
(7, 150.00, 4, 1),
(6, 55.75, 3, 6),
(4, 45.60, 1, 14),
(13, 99.99, 2, 10),
(9, 120.50, 5, 4),
(15, 200.75, 4, 8);

-- Seleccionar todos los registros de la tabla Clientes
SELECT * FROM Clientes;

-- Seleccionar todos los registros de la tabla Empleados
SELECT * FROM Empleados;

-- Seleccionar todos los registros de la tabla Productos
SELECT * FROM Productos;

-- Seleccionar todos los registros de la tabla Provedores
SELECT * FROM Provedores;

-- Seleccionar todos los registros de la tabla DetProductos_y_Provedores
SELECT * FROM DetProductos_y_Provedores;

-- Seleccionar todos los registros de la tabla Ventas
SELECT * FROM Ventas;

-- Seleccionar todos los registros de la tabla Devoluciones
SELECT * FROM Devoluciones;

-- Seleccionar todos los registros de la tabla Categorias
SELECT * FROM Categorias;

-- Seleccionar todos los registros de la tabla Transportes
SELECT * FROM Transportes;

-- Seleccionar todos los registros de la tabla Subcategorias
SELECT * FROM Subcategorias;

-- Seleccionar todos los registros de la tabla Pedidios
SELECT * FROM Pedidios;

-- Seleccionar todos los registros de la tabla Compras
SELECT * FROM Compras;

-- Seleccionar todos los registros de la tabla Ventas_y_Productos
SELECT * FROM Ventas_y_Productos;

-- Seleccionar todos los registros de la tabla Compras_y_Productos
SELECT * FROM Compras_y_Productos;

-- Seleccionar todos los registros de la tabla ProductosDevueltos
SELECT * FROM ProductosDevueltos;

select * from Pedidos_y_Productos
--Ver las restricciones 
-- Ver restricciones de la tabla Clientes
EXEC sp_helpconstraint 'Clientes';

-- Ver restricciones de la tabla Empleados
EXEC sp_helpconstraint 'Empleados';

-- Ver restricciones de la tabla Productos
EXEC sp_helpconstraint 'Productos';

-- Ver restricciones de la tabla Provedores
EXEC sp_helpconstraint 'Provedores';

-- Ver restricciones de la tabla DetProductos_y_Provedores
EXEC sp_helpconstraint 'DetProductos_y_Provedores';

-- Ver restricciones de la tabla Ventas
EXEC sp_helpconstraint 'Ventas';

-- Ver restricciones de la tabla Devoluciones
EXEC sp_helpconstraint 'Devoluciones';

-- Ver restricciones de la tabla Categorias
EXEC sp_helpconstraint 'Categorias';

-- Ver restricciones de la tabla Transportes
EXEC sp_helpconstraint 'Transportes';

-- Ver restricciones de la tabla Subcategorias
EXEC sp_helpconstraint 'Subcategorias';

-- Ver restricciones de la tabla Pedidios
EXEC sp_helpconstraint 'Pedidios';

-- Ver restricciones de la tabla Compras
EXEC sp_helpconstraint 'Compras';

-- Ver restricciones de la tabla Ventas_y_Productos
EXEC sp_helpconstraint 'Ventas_y_Productos';

-- Ver restricciones de la tabla Compras_y_Productos
EXEC sp_helpconstraint 'Compras_y_Productos';

-- Ver restricciones de la tabla ProductosDevueltos
EXEC sp_helpconstraint 'ProductosDevueltos';
