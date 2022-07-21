/****** CREANDO LA BASE DE DATOS ******/
create DataBase bd_ronal_xavi;

/****** USANDO LA BASE DE DATOS ******/
Use bd_ronal_xavi;

/****** CREANDO UNA TABLA CON UN CODIGO AUTOINCEMENTABLE CON LETRAS ******/
Create Table tb_pruebas
(
codigo varchar(8) not null primary key,
descripcion varchar(20) not null
);
/*DROP TABLE tb_pruebas;*/

/****** CREANDO TRIGGER PARA AUTOGENERAL EL CODIGO ******/
delimiter $
create trigger Generar_codigo before insert on tb_pruebas for each row
begin
    declare siguiente_codigo int;
   set siguiente_codigo = (Select ifnull(max(convert(substring(codigo, 5), signed integer)), 0) from tb_pruebas) + 1;
   set new.Codigo = concat('P', LPAD (siguiente_codigo,5,'0'));
end $

/****** ELIMINANDO  TRIGGER DE SER NECESARIO ******/
Drop trigger If Exists Generar_codigo;

/****** INSERTANDO DATOS A LA TABLA PRUEBAS******/
Insert Into tb_pruebas (descripcion)
	Values ('descripcion 00001');

/****** SELECT SIMPLE DE LA TABLA PRUEBAS ******/
select * 
From tb_pruebas;