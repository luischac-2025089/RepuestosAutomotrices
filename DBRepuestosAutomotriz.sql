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
puesto_empleado varchar(20) null, 
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

--=======================================================================================================================================================--

		-- CREATE --
Delimiter $$
	create procedure sp_Proveedor_create (p_nombre_empleado varchar(60), p_telefono_proveedor int, p_direccion varchar(100), p_email_proveedor varchar (100))
	begin
    insert into Proveedores(nombre_empleado,telefono_proveedor, direccion, email_proveedor) 
    values (p_nombre_empleado, p_telefono_proveedor, p_direccion, p_email_proveedor);
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
        