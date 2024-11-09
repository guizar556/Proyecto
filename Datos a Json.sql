
USE Cremeria15;
-----------------------------------------------------------------------
-------------------CLIENTES--------------------------------------------
-----------------------------------------------------------------------
SELECT TOP (1000) 
    codigo,
    correo,
    Telefono,
    Genero,
    CodigoPostal,
    CONCAT(PrimerNombre, ' ', SegundoNombre) AS Nombres,
    CONCAT(ApellidoPaterno, ' ', ApellidoMaterno) AS Apellidos,
    Edad,
    Localidad as [Address.Localidad],
    Estado as [Address.Estado], 
    Colonia as [Address.Colonia],
    Avenida as [Address.Avenida],
    NumeroDeVivienda as [Address.NumeroVivienda],
    CONCAT(dia, '/', mes, '/', año) AS Fecha
FROM Cremeria1.dbo.Clientes
for json path

-----------------------------------------------------------------------
-------------------EMPLEADOS-------------------------------------------
-----------------------------------------------------------------------
SELECT TOP (5) 
    codigo,
    correo,
    CONCAT(PrimerNombre, ' ', SegundoNombre) AS Nombres,
    CONCAT(ApellidoPaterno, ' ', ApellidoMaterno) AS Apellidos,
    Edad,
    Localidad as [Address.Localidad],
    Estado as [Address.Estado],
    Colonia as [Address.Colonia],
    Avenida as [Address.Avenida],
    NumeroDeVivienda as [Address.NumeroVivienda],
    CodigoPostal as [Address.CodigoPostal],
    Telefono,
    CONCAT(DiaNacimiento, '/', MesNacimiento, '/', AnioNacimiento) AS FechaNacimiento,
    recomendaciones,
    CONCAT(DiaContratacion, '/', MesContratacion, '/', AnioContratacion) AS FechaContratacion,
    Genero,
    foto_del_empleado
FROM Empleados
for json path

-----------------------------------------------------------------------
-------------------SUBCATEGORIAS---------------------------------------
-----------------------------------------------------------------------
SELECT TOP (1000) s.codigo,
      s.NombreDeSubcategoria,
      s.DescripcionDeSubcategoria,
      s.tipoDeRotacion,
      s.marca_de_la_subcategoria,
	  s.foto,
      c.NombreDeCategoria as [Categorias.NombreCategoria],
      c.codigo as [Categorias.codigo],
	  c.foto as [Categorias.foto]
FROM Subcategorias s
JOIN Categorias c ON s.codigo_Categoria = c.codigo
for json path


-----------------------------------------------------------------------
-------------------CATEGORIAS------------------------------------------
-----------------------------------------------------------------------
SELECT TOP (1000) codigo,
      NombreDeCategoria,
      DescripccionDeCategoria,
      estado_de_categoria_A_o_I,
      CONCAT(dia_de_creacion, '/', mes_de_creacion, '/', año_de_creacion) AS fecha_creacion
FROM Cremeria15.dbo.Categorias
for json path

-----------------------------------------------------------------------
-------------------PRODUCTOS-------------------------------------------
-----------------------------------------------------------------------
SELECT p.codigo,
       p.NombreDelProducto,
       CONCAT(p.dia_de_caducidad, '-', p.mes_de_caducidad, '-', p.año_de_caducidad) AS fecha_de_caducidad,
       p.precioPorKilogramo,
       p.condiciones_de_almacenamiento,
       p.nutrientes_que_Aporta,
       p.Numero_De_lote_del_producto,
       p.stack_disponible,
       p.margen_de_ganancia,
       p.unidad_de_medida,
       p.stock_minimo,
       p.stock_maximo,
       p.punto_de_reorden,
	   p.foto,
       c.NombreDeCategoria as [Categoria.NombreCategoria],
       c.codigo as [Categoria.codigo],
	   c.foto as [Categoria.foto]
FROM Productos p
JOIN Categorias c ON p.codigo_Categoria = c.codigo
FOR JSON PATH;


-----------------------------------------------------------------------
-------------------TRANSPORTES Y PROVEDORES----------------------------
-----------------------------------------------------------------------
SELECT t.codigo,
       t.NumeroDePlaca,
       t.Marca,
       t.Modelo,
       t.DescripccionDelVehiculo,
       CONCAT(p.PrimerNombre, ' ', p.SegundoNombre) AS NombreCompleto,
       CONCAT(p.ApellidoPaterno, ' ', p.ApellidoMaterno) AS ApellidoCompleto,
       p.codigo AS codigo_proveedor,
	   t.foto
FROM Transportes t
JOIN Provedores p ON t.codigo_Provedore = p.codigo;


---------------------------------------------------------------------------
-------------------------COMPRAS-------------------------------------------
---------------------------------------------------------------------------
SELECT 
    C.codigo ,              
    C.tipoDeCompra,                        
    C.Total_de_Compra,                     
	CONCAT(C.dia_de_compra, '/', C.mes_de_compra, '/', C.año_de_compra) AS FechaCompra,
    C.estado_compra,                       
    P.codigo AS [Provedores.codigo],          
    CONCAT(P.PrimerNombre, ' ', P.SegundoNombre) AS [Provedores.Nombres], 
    CONCAT(P.ApellidoPaterno, ' ', P.ApellidoMaterno) AS [Provedores.Apellidos],  
	(select 
	D.Cantidad_De_Productos_Comprados ,     
    D.precioUnitario ,                      
    D.codigo ,           
    D.descripccion ,                        
    D.codigo_Producto,
	pp.NombreDelProducto
from 
	Compras_y_Productos D
join  
	Productos pp on pp.codigo =D.codigo_Producto
	for json path) as [Dt]
FROM 
    Compras C
JOIN 
    Provedores P ON C.codigo_Proveedor = P.codigo
FOR JSON PATH;


-----------------------------------------------------------------------------
------------------------VENTAS-----------------------------------------------
-----------------------------------------------------------------------------
SELECT 
    V.codigo,
    CONCAT(V.dia, '/', V.mes, '/', V.año),
    V.descuento_aplicado,
    V.tipo_pago,
    P.codigo,
    P.descripccion_Pedido,
	(select 
	VP.codigo,
    VP.descripccion,
    VP.precioUnitario,
    VP.cantidad,
	pp.NombreDelProducto
from Ventas_y_Productos Vp
join Productos pp on pp.codigo =VP.codigo_Producto
where  Vp.codigo_Venta = V.codigo
for json path)
FROM 
    Ventas V
JOIN 
    Ventas_y_Productos VP ON VP.codigo_Venta = V.codigo
JOIN 
    Pedidios P ON V.codigo_Pedido = P.codigo
FOR JSON PATH;

-----------------------------------------------------------------------------------
--------------------------DEVOLCUIONES--------------------------------------------
----------------------------------------------------------------------------------
    SELECT 
       D.codigo AS Devolucion_codigo,
       D.DescripccionDeDevolucion,
       CONCAT(D.diaDevolucion, '/', D.mes, '/', D.año) AS FechaDevolucion,
       cast( D.montoDeRembolso as int) as montoDeRembolso,
       D.hora,
       D.DescripccionDeMedidasTomadas,
       D.foto_Devolucion,
       C.codigo AS [Cliente.codigo],
       CONCAT(C.PrimerNombre, ' ', C.SegundoNombre) AS [Cliente.Nombres],
       CONCAT(C.ApellidoPaterno, ' ', C.ApellidoMaterno) AS [Cliente.Apellidos],
       ( SELECT 
            PD.codigo AS ProductoDevolucion_codigo,
            PD.codigo_Devolucion,
            PD.Observaciones,
            PD.codigo as codigoVentaDt,
            CAST(VP.precioUnitario AS INT) AS precioUnitario,
            VP.cantidad
        FROM ProductosDevueltos PD
        JOIN Ventas_y_Productos VP ON VP.codigo = PD.codigo_VP
        WHERE D.codigo = PD.codigo_Devolucion
        FOR JSON PATH
       ) AS ProductosDevueltos
FROM Devoluciones D 
JOIN Clientes C ON C.codigo = D.codigo_Cliente
FOR JSON PATH;
----------------------------------------------------------------------------------------
----------------------------------CONSULTAS-----------------------------------------
--------------------------------------------------------------------------------------

SELECT 
    p.codigo AS codigo,
    CONCAT(p.dia_de_pedido, '/', p.mes_de_pedido, '/', p.año_de_pedido) AS fecha_pedido,
    -- Nombres del empleado
	e.codigo as [Empleados.CodigoEmpleado],
    CONCAT(e.PrimerNombre, ' ', e.SegundoNombre) AS [Empleados.Nombres],
    CONCAT(e.ApellidoPaterno, ' ', e.ApellidoMaterno) AS [Empleados.Apellidos],

    -- Nombres del cliente
	c.codigo as [Clientes.CodigoCliente],
    CONCAT(c.PrimerNombre, ' ', c.SegundoNombre) AS [Clientes.Nombres],
    CONCAT(c.ApellidoPaterno, ' ', c.ApellidoMaterno) AS [Clientes.Apellidos],
    (
        select
            pi.codigo,
            pi.cantidad ,
            cast(pi.precioUnitario as int) as precioUnitario,
            pi.codigoProductos,
            Pr.NombreDelProducto
        from Pedidos_y_Productos pi
        join 
            Productos Pr on pi.codigoProductos = Pr.codigo
            where  pi.CodigoPedidios = p.codigo
        for json path
    ) as [Dt],
    p.descripccion_Pedido
FROM 
    Pedidios p
JOIN 
    Empleados e ON p.codigo_Empleado = e.codigo
JOIN 
    Clientes c ON p.codigo_Cliente = c.codigo

for json path
-------------------------------------------------------------------------------------------------
-----------------PROVEDORES---------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

SELECT TOP (1000) 
    P.codigo,
    CONCAT(P.PrimerNombre, ' ', P.SegundoNombre) AS Nombres,
    CONCAT(P.ApellidoPaterno, ' ', P.ApellidoMaterno) AS Apellidos,
    P.Localidad as [Direccion.Localidad],
    P.Estado as [Direccion.Estado],
    P.Colonia as [Direccion.Colonia],
    P.Avenida as [Direccion.Avenida],
    P.CodigoPostal as [Direccion.CodigoPostal],
    CONCAT(P.dia_inicio_relacion, '/', P.mes_inicio_relacion, '/', P.año_inicio_relacion) AS FechaInicioRelacion,
    P.RFC,
    P.correo_electronico,
    P.telefono,
    P.foto,
	(select
			Dt.codigo,
			cast(Dt.precio as int) as precio,
			Dt.caracteristicas,
			Dt.codigo_Producto,
            pp.NombreDelProducto
			from DetProductos_y_Provedores Dt
			join Productos pp on pp.codigo = Dt.codigo_Producto
			where p.codigo = Dt.codigo_Proveedor
			for json path
		)as [Dt]
FROM Provedores P 
FOR JSON PATH;

--------------------------------------------------------------------------------------------------------
--------------------------------COMPRAS---------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

SELECT 
    C.codigo ,              
    C.tipoDeCompra,                        
    C.Total_de_Compra,                     
	CONCAT(C.dia_de_compra, '/', C.mes_de_compra, '/', C.año_de_compra) AS FechaCompra,
    C.estado_compra,                       
    P.codigo AS [Provedores.codigo],          
    CONCAT(P.PrimerNombre, ' ', P.SegundoNombre) AS [Provedores.Nombres], 
    CONCAT(P.ApellidoPaterno, ' ', P.ApellidoMaterno) AS [Provedores.Apellidos],  
	(select 
        D.Cantidad_De_Productos_Comprados ,     
        cast( D.precioUnitario as int) as precioUnitario,                      
        D.codigo ,           
        D.descripccion ,                        
        D.codigo_Producto,
        pp.NombreDelProducto
    from 
        Compras_y_Productos D
    join  
        Productos pp on pp.codigo = D.codigo_Producto
        WHERE C.codigo =D.codigo_Compra
        for json path
    ) as [Dt]
FROM 
    Compras C
JOIN 
    Provedores P ON C.codigo_Proveedor = P.codigo
FOR JSON PATH;



-------------------------------------------------------------------------------
------------------------VENTAS-----------------------------------------------
------------------------------------------------------------------------------
SELECT 
    V.codigo AS venta_codigo,
    CONCAT(V.dia, '/', V.mes, '/', V.año) AS fecha_venta,
    cast(  V.descuento_aplicado as int)as descuento_aplicado,
    V.tipo_pago,
    P.codigo AS [Pedidos.codigo],
    P.descripccion_Pedido AS [Pedidos.descripccion_Pedido],
    (
        SELECT 
            VP.codigo AS producto_codigo,
            VP.descripccion AS producto_descripcion,
            cast( VP.precioUnitario as int) AS producto_precio_unitario,
            VP.cantidad AS producto_cantidad,
            pp.NombreDelProducto AS producto_nombre
        FROM 
            Ventas_y_Productos VP
        JOIN 
            Productos pp ON pp.codigo = VP.codigo_Producto
        WHERE  
            VP.codigo_Venta = V.codigo
        FOR JSON PATH
    ) AS productos
FROM 
    Ventas V
JOIN 
    Pedidios P ON V.codigo_Pedido = P.codigo
FOR JSON PATH;




---------------------------------------------------------------------------------
---------------------------------DEVOLUCIONES------------------------------------
--------------------------------------------------------------------------------
    SELECT 
       D.codigo AS Devolucion_codigo,
       D.DescripccionDeDevolucion,
       CONCAT(D.diaDevolucion, '/', D.mes, '/', D.año) AS FechaDevolucion,
       cast( D.montoDeRembolso as int) as montoDeRembolso,
       D.hora,
       D.DescripccionDeMedidasTomadas,
       D.foto_Devolucion,
       C.codigo AS [Cliente.codigo],
       CONCAT(C.PrimerNombre, ' ', C.SegundoNombre) AS [Cliente.Nombres],
       CONCAT(C.ApellidoPaterno, ' ', C.ApellidoMaterno) AS [Cliente.Apellidos],
       ( SELECT 
            PD.codigo AS ProductoDevolucion_codigo,
            PD.codigo_Devolucion,
            PD.Observaciones,
            PD.codigo as codigoVentaDt,
            CAST(VP.precioUnitario AS INT) AS precioUnitario,
            VP.cantidad
        FROM ProductosDevueltos PD
        JOIN Ventas_y_Productos VP ON VP.codigo = PD.codigo_VP
        WHERE D.codigo = PD.codigo_Devolucion
        FOR JSON PATH
       ) AS ProductosDevueltos
FROM Devoluciones D 
JOIN Clientes C ON C.codigo = D.codigo_Cliente
FOR JSON PATH;

  