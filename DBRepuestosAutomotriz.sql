Drop database if exists DBRepuestosAutomotriz_in5cm; 
create database DBRepuestosAutomotriz_in5cm; 

use DBRepuestosAutomotriz_in5cm;

create table Proveedores( 
id_proveedor int auto_increment not null, 
nombre_proveedor varchar(60) not null, 
telefono_proveedor int not null, 
direccion varchar(100) not null, 
email_proveedor varchar(100) not null, 
primary key PK_id_proveedor(id_proveedor) 
); 

create table Empleados( 
id_empleado int auto_increment not null, 
nombre_empleado varchar(60) not null, 
apellido_empleado varchar(60) not null, 
puesto_empleado varchar(20) not null, 
email_empleado varchar(100) not null, 
primary key PK_id_empleado(id_empleado) 
); 

create table Repuestos( 
id_repuesto int auto_increment not null, 
nombre_repuesto varchar(60) not null, 
categoria_repuesto varchar(60) not null, 
precio_compra double not null, 
precio_venta double not null, 
id_proveedor int not null, 
primary key PK_id_repuesto(id_repuesto), 
constraint FK_repuesto_proveedor foreign key (id_proveedor)  
references proveedores(id_proveedor) on delete cascade 
); 

create table Ventas( 
id_venta int auto_increment not null, 
fecha_venta date not null, 
cantidad int not null, 
total double not null, 
id_empleado int not null, 
id_repuesto int not null, 
primary key PK_id_venta(id_venta), 
constraint FK_ventas_empleado foreign key (id_empleado)  
references Empleados(id_empleado) on delete cascade, 
constraint FK_ventas_repuestos foreign key (id_repuesto)  
references Repuestos(id_repuesto) on delete cascade 
); 

--=======================================================================================================================================================--

		-- CREATE --
Delimiter $$
	create procedure sp_Proveedor_create (p_nombre_proveedor varchar(60), p_telefono_proveedor int, p_direccion varchar(100), p_email_proveedor varchar (100))
	begin
    insert into Proveedores(nombre_proveedor,telefono_proveedor, direccion, email_proveedor) 
    values (p_nombre_proveedor, p_telefono_proveedor, p_direccion, p_email_proveedor);
    select last_insert_id() as id_proveedor;
    end$$
Delimiter ;

		-- READ -- 
Delimiter $$
	create procedure sp_Proveedor_read_all ()
	begin 
		select * from Proveedores order by id_proveedor;
    end $$
Delimiter ;

		-- DELETE --
Delimiter $$
	create procedure sp_Proveedor_delete(in p_idPe int )
    begin
    delete from Proveedores where id_proveedor = p_idPe;
    select row_count() as filas_afectadas;
	end $$
Delimiter ;

		-- UPDATE --
Delimiter $$
	create procedure sp_Proveedor_update(in p_id_proveedor int , in p_nombre_proveedor varchar(60), in p_telefono_proveedor int, in p_direccion varchar(100), in p_email_proveedor varchar (100))
    begin
    update Proveedores 
    set id_proveedor = p_id_proveedor,
		nombre_proveedor  = p_nombre_proveedor,
        telefono_proveedor = p_telefono_proveedor,
        direccion = p_direccion, 
        email_proveedor = email_proveedor
        where id_proveedor = p_id_proveedor;
        select row_count() as filas_afectadas;
    end $$
Delimiter ;

call sp_Proveedor_create('AutoPartes GT', 5551001, 'Zona 1, Ciudad de Guatemala', 'autopartesgt@gmail.com');
call sp_Proveedor_create('Motores Express', 5551002, 'Zona 5, Ciudad de Guatemala', 'motoresexpress@gmail.com');
call sp_Proveedor_create('Repuestos Centro', 5551003, 'Zona 10, Ciudad de Guatemala', 'repuestoscentro@gmail.com');
call sp_Proveedor_create('Distribuidora El Motor', 5551004, 'Zona 12, Ciudad de Guatemala', 'elmotor@gmail.com');
call sp_Proveedor_create('Importadora Técnica', 5551005, 'Zona 7, Ciudad de Guatemala', 'importadoratec@gmail.com');
call sp_Proveedor_create('AutoRepuestos del Sur', 5551006, 'Villa Nueva', 'autorepuestossur@gmail.com');
call sp_Proveedor_create('Suministros Mecánicos', 5551007, 'Mixco', 'suministrosmec@gmail.com');
call sp_Proveedor_create('Repuestos Premium', 5551008, 'Zona 14, Ciudad de Guatemala', 'premium@gmail.com');
call sp_Proveedor_create('Motores y Más', 5551009, 'Zona 6, Ciudad de Guatemala', 'motoresymas@gmail.com');
call sp_Proveedor_create('Distribuidora Automotriz GT', 5551010, 'Zona 18, Ciudad de Guatemala', 'automotrizgt@gmail.com');

--=======================================================================================================================================================--

		-- CREATE --
Delimiter $$
	create procedure sp_Empleado_create (p_nombre_empleado varchar(60), p_apellido_empleado varchar (60), p_puesto_empleado varchar(20), p_email_empleado varchar (100))
	begin
    insert into Empleados(nombre_empleado,apellido_empleado, puesto_empleado, email_empleado) 
    values (p_nombre_empleado, p_apellido_empleado, p_puesto_empleado, p_email_empleado);
    select last_insert_id() as id_empleado;
    end$$
Delimiter ;

		-- READ -- 
Delimiter $$
	create procedure sp_Empleado_read_all ()
	begin 
		select * from Empleados order by id_empleado;
    end $$
Delimiter ;

		-- DELETE --
Delimiter $$
	create procedure sp_Empleado_delete(in p_idEm int )
    begin
    delete from Empleados where id_empleado = p_idEm;
    select row_count() as filas_afectadas;
	end $$
Delimiter ;

		-- UPDATE --
Delimiter $$
	create procedure sp_Empleado_update(in p_id_empleado int , in p_nombre_empleado varchar(60), in p_apellido_empleado varchar(60), in p_puesto_empleado varchar(20), in p_email_empleado varchar (100))
    begin
    update Empleados 
    set id_empleado = p_id_empleado,
		nombre_empleado  = p_nombre_empleado,
        apellido_empleado = p_apellido_empleado,
        puesto_empleado = p_puesto_empleado, 
        email_empleado = p_email_empleado
        where id_empleado = p_id_empleado;
        select row_count() as filas_afectadas;
    end $$
Delimiter ;

call sp_Empleado_create('Carlos', 'Pérez', 'Administrador', 'carlos.perez@empresa.com');
call sp_Empleado_create('María', 'López', 'Secretaria', 'maria.lopez@empresa.com');
call sp_Empleado_create('José', 'Ramírez', 'Contador', 'jose.ramirez@empresa.com');
call sp_Empleado_create('Ana', 'Gómez', 'RecursosHumanos', 'ana.gomez@empresa.com');
call sp_Empleado_create('Luis', 'Martínez', 'Supervisor', 'luis.martinez@empresa.com');
call sp_Empleado_create('Daniela', 'Hernández', 'Asistente', 'daniela.hernandez@empresa.com');
call sp_Empleado_create('Pedro', 'Castillo', 'Tesorero', 'pedro.castillo@empresa.com');
call sp_Empleado_create('Sofía', 'Morales', 'Auditor', 'sofia.morales@empresa.com');
call sp_Empleado_create('Miguel', 'Ruiz', 'Tecnico', 'miguel.ruiz@empresa.com');
call sp_Empleado_create('Valeria', 'Mendoza', 'Coordinador', 'valeria.mendoza@empresa.com');

-- =======================================================================================================================================================--

delimiter $$
create procedure sp_Repuestos_create (
	p_nombre_repuesto varchar(60),
    p_categoria_repuesto varchar(60),
    p_precio_compra double,
    p_precio_venta double,
    p_id_proveedor int
)
begin
	insert into Repuestos(nombre_repuesto, categoria_repuesto, precio_compra, precio_venta, id_proveedor)
    values (p_nombre_repuesto, p_categoria_repuesto, p_precio_compra, p_precio_venta, p_id_proveedor);
    select last_insert_id() as id_repuesto;
end$$
delimiter ;

delimiter $$
create procedure sp_Repuestos_read_all ()
begin
	select * from Repuestos order by id_repuesto;
end$$
delimiter ;

delimiter $$
create procedure sp_Repuestos_delete(in p_idRe int)
begin
	delete from Repuestos where id_repuesto = p_idRe;
    select row_count() as filas_afectadas;
end$$
delimiter ;

delimiter $$
create procedure sp_Repuestos_update(
	in p_id_repuesto int,
    in p_nombre_repuesto varchar(60),
    in p_categoria_repuesto varchar(60),
    in p_precio_compra double,
    in p_precio_venta double,
    in p_id_proveedor int
)
begin
	update Repuestos
    set id_repuesto = p_id_repuesto,
		nombre_repuesto = p_nombre_repuesto,
        categoria_repuesto = p_categoria_repuesto,
        precio_compra = p_precio_compra,
        precio_venta = p_precio_venta,
        id_proveedor = p_id_proveedor
	where id_repuesto = p_id_repuesto;
    select row_count() as filas_afectadas;
end$$
delimiter ;
        
-- =======================================================================================================================================================--
        
        delimiter $$
create procedure sp_Ventas_create (
	p_fecha_venta date,
    p_cantidad int,
    p_total double,
    p_id_empleado int,
    p_id_repuesto int
)
begin
	insert into Ventas(fecha_venta, cantidad, total, id_empleado, id_repuesto)
    values (p_fecha_venta, p_cantidad, p_total, p_id_empleado, p_id_repuesto);
    select last_insert_id() as id_venta;
end$$
delimiter ;

delimiter $$
create procedure sp_Ventas_read_all ()
begin
	select * from Ventas order by id_venta;
end$$
delimiter ;

delimiter $$
create procedure sp_Ventas_delete(in p_idVe int)
begin
	delete from Ventas where id_venta = p_idVe;
    select row_count() as filas_afectadas;
end$$
delimiter ;

delimiter $$
create procedure sp_Ventas_update(
	in p_id_venta int,
    in p_fecha_venta date,
    in p_cantidad int,
    in p_total double,
    in p_id_empleado int,
    in p_id_repuesto int
)
begin
	update Ventas
    set id_venta = p_id_venta,
		fecha_venta = p_fecha_venta,
        cantidad = p_cantidad,
        total = p_total,
        id_empleado = p_id_empleado,
        id_repuesto = p_id_repuesto
	where id_venta = p_id_venta;
    select row_count() as filas_afectadas;
end$$
delimiter ;

call sp_Repuestos_create('Filtro de aceite','Motor',50,75,1);
call sp_Repuestos_create('Pastillas de freno','Frenos',120,180,2);
call sp_Repuestos_create('Bujía NGK','Encendido',25,40,1);
call sp_Repuestos_create('Radiador','Refrigeración',600,850,3);
call sp_Repuestos_create('Batería 12V','Eléctrico',450,600,2);
call sp_Repuestos_create('Amortiguador','Suspensión',300,450,3);
call sp_Repuestos_create('Correa de distribución','Motor',200,320,1);
call sp_Repuestos_create('Disco de freno','Frenos',220,350,2);
call sp_Repuestos_create('Alternador','Eléctrico',900,1200,3);
call sp_Repuestos_create('Filtro de aire','Motor',40,65,1);

call sp_Ventas_create('2026-02-01',2,150,1,1);
call sp_Ventas_create('2026-02-02',1,180,2,2);
call sp_Ventas_create('2026-02-03',4,160,1,3);
call sp_Ventas_create('2026-02-04',1,850,3,4);
call sp_Ventas_create('2026-02-05',1,600,2,5);
call sp_Ventas_create('2026-02-06',2,900,1,6);
call sp_Ventas_create('2026-02-07',1,320,3,7);
call sp_Ventas_create('2026-02-08',3,1050,2,8);
call sp_Ventas_create('2026-02-09',1,1200,1,9);
call sp_Ventas_create('2026-02-10',2,130,3,10);

