use tienda;


CREATE TABLE  tb_carrito (
  id_carrito INT NOT NULL,
  id_usuario INT NOT NULL,
  estado BIT NULL,
  PRIMARY KEY (id_carrito),
  FOREIGN KEY (id_usuario) REFERENCES  tb_usuarios (id_usuario)
   );
   ALTER TABLE tb_carrito
MODIFY estado VARCHAR(5) NOT NULL;

 
INSERT INTO tb_carrito (id_carrito, id_usuario, estado)
VALUES
(1, 1, 0),
(2, 2, 1),
(3, 3, 2),
(4, 4, 3),
(5, 5, 4),
(6, 6, 5);

 
   

CREATE TABLE  tb_categorias (
  id_categoria INT NOT NULL,
  nombre_categoria VARCHAR(45) NULL,
  descrpcion VARCHAR(100) NULL,
  estado BIT NULL,
  PRIMARY KEY (id_categoria));
  
INSERT INTO tb_categorias (id_categoria, nombre_categoria, estado)
VALUES
(1, 'Ropa', 1),
(2, 'Zapatos', 1),
(3, 'Tecnología', 1),
(4, 'Hogar y jardín', 1),
(5, 'Belleza y cuidado personal', 1);



CREATE TABLE  tb_ciudad (
  id_ciudad INT NOT NULL auto_increment,
  nombre VARCHAR(45) NOT NULL,
  cobertura BIT(1) NULL,
  PRIMARY KEY (id_ciudad));
  
  INSERT INTO tb_ciudad (id_ciudad, nombre, cobertura)
VALUES
(1, 'Bogotá', 1),
(2, 'Medellín', 1),
(3, 'Cali', 1),
(4, 'Barranquilla', 1),
(5, 'Bucaramanga', 1),
(6, 'Cartagena', 1);


  
  
  CREATE TABLE  tb_ofertas (
  id_oferta INT NOT NULL,
  nombre_oferta VARCHAR(45) NULL,
  descripcion VARCHAR(45) NULL,
  estado BIT NULL,
  fecha_inicio DATE NULL,
  fecha_fin DATE NULL,
  tb_productos_id_productos INT NOT NULL,
  PRIMARY KEY (id_oferta),
  FOREIGN KEY (tb_productos_id_productos) REFERENCES tb_productos (id_productos)
);


INSERT INTO tb_ofertas (id_oferta, nombre_oferta, descripcion, estado, fecha_inicio, fecha_fin, tb_productos_id_productos)
VALUES
(1, 'Oferta de verano', 'Verano', 1, '2023-06-21', '2023-07-31', 1),
(2, 'Oferta de regreso a clases', 'Regreso a clases', 1, '2023-08-01', '2023-08-31', 2),
(3, 'Oferta de Black Friday', 'Black Friday', 1, '2023-11-24', '2023-11-26', 3),
(4, 'Oferta de Navidad', 'Navidad', 1, '2023-12-01', '2023-12-25', 4),
(5, 'Oferta de fin de año', 'Fin de año', 1, '2023-12-26', '2023-12-31', 5);





CREATE TABLE  tb_pedido (
  id_pedido INT NOT NULL,
  id_carrito INT NOT NULL,
  fecha_pago DATE NULL,
  metodo_pago VARCHAR(45) NULL,
  estado VARCHAR(40) NULL,
  PRIMARY KEY (id_pedido)
 );
 
 INSERT INTO tb_pedido (id_pedido, id_carrito, fecha_pago, metodo_pago, estado)
VALUES
(1, 1, '2023-11-14', 'Tarjeta de crédito', 'Pendiente de envío'),
(2, 2, '2023-11-15', 'Efectivo', 'Enviado'),
(3, 3, '2023-11-16', 'Transferencia bancaria', 'Recibido');

 
 
 CREATE TABLE  tb_productos (
    id_productos INT NOT NULL,
    id_categoria INT NOT NULL,
    descripcion_producto VARCHAR(45) NULL,
    precio INT NULL,
    cantidad INT NULL,
    id_oferta INT NULL,
    PRIMARY KEY (id_productos),
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias (id_categoria)
);

INSERT INTO tb_productos (id_productos, id_categoria, descripcion_producto, precio, cantidad, id_oferta)
VALUES
(1, 1, 'Camiseta de hombre', 20000, 10, 1),
(2, 1, 'Vestido de mujer', 30000, 5, 2),
(3, 2, 'Zapatos de hombre', 40000, 15, 3),
(4, 2, 'Zapatos de mujer', 50000, 10, 4),
(5, 3, 'Televisor', 1000000, 20, 5);

  

CREATE TABLE  tb_rol (
  id_rol INT NOT NULL,
  descripcion VARCHAR(45) NULL,
  nombre VARCHAR(45) NULL,
  PRIMARY KEY (id_rol)
  );
INSERT INTO tb_rol (id_rol, descripcion, nombre)
VALUES
(1, 'Administrador', 'Kliuvert Garcia'),
(2, 'Cliente', 'Edwin Asprilla'),
(3, 'Invitado', 'Fernanda Quiñonez');
  
  

  



CREATE TABLE  tb_usuarios (
  id_usuario INT NOT NULL,
  id_ciudad INT NOT NULL,
  id_rol INT NOT NULL,
  id_refiere INT NOT NULL,
  nombre_usuario VARCHAR(60) NOT NULL,
  direccion VARCHAR(50) NULL,
  estado BIT NULL,
  contrasena_usuario VARCHAR(10) NULL,
  correo_usuario VARCHAR(45) NULL,
  telefono_usuario INT NULL,
  PRIMARY KEY (id_usuario),
  FOREIGN KEY (id_ciudad)REFERENCES tb_ciudad (id_ciudad),
  FOREIGN KEY (id_refiere)REFERENCES tb_refiere (id_refiere),
  FOREIGN KEY (id_rol)REFERENCES tb_rol (id_rol)
  );

INSERT INTO tb_usuarios (id_usuario, id_ciudad, id_rol, id_refiere, nombre_usuario, direccion, estado, contrasena_usuario, correo_usuario, telefono_usuario)
VALUES
(1, 1, 1, 1, 'Juan Pérez', 'Calle 123 # 456', 1, '12345678', 'juan.perez@example.com', 123456789),
(2, 1, 2, 2, 'María López', 'Calle 456 # 789', 1, '87654321', 'maria.lopez@example.com', 987654321),
(3, 2, 1, 3, 'Pedro González', 'Calle 789 # 123', 1, '98765432', 'pedro.gonzalez@example.com', 287654321),
(4, 2, 2, 4, 'Ana Sánchez', 'Calle 123 # 789', 1, '32165498', 'ana.sanchez@example.com', 321654987),
(5, 3, 1, 5, 'Carlos Rodríguez', 'Calle 456 # 123', 1, '45698712', 'carlos.rodriguez@example.com', 456987123),
(6, 3, 2, 6, 'Diana Martínez', 'Calle 789 # 456', 1, '78912345', 'diana.martinez@example.com', 789123456);





  

  
  
DROP TABLE tb_carrito_pedido;

CREATE TABLE tb_carrito_pedido (
  id_carrito INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  estado BIT NULL,
  fecha_pedido DATETIME NOT NULL,
  total_pedido DECIMAL(10,2) NOT NULL,
  fecha_pago DATE NULL,
  metodo_pago VARCHAR(45) NULL,
  estado_pedido VARCHAR(40) NULL,
  PRIMARY KEY (id_carrito),
  FOREIGN KEY (id_usuario) REFERENCES tb_usuarios (id_usuario)
);

INSERT INTO tb_carrito_pedido (id_carrito, id_usuario, estado, fecha_pedido, total_pedido, fecha_pago, metodo_pago, estado_pedido)
VALUES
(1, 1, 1, '2023-11-14 10:41:00', 100.00, NULL, 'Efectivo', 'En proceso'),
(2, 2, 1, '2023-11-15 10:41:00', 200.00, NULL, 'Tarjeta de crédito', 'Enviado'),
(3, 3, 1, '2023-11-16 10:41:00', 300.00, '2023-11-17', 'Tarjeta de débito', 'Entregado'),
(4, 4, 1, '2023-11-17 10:41:00', 400.00, NULL, 'PayPal', 'Cancelado'),
(5, 5, 1, '2023-11-18 10:41:00', 500.00, NULL, 'Payoneer', 'Pendiente de pago'),
(6, 6, 1, '2023-11-19 10:41:00', 600.00, '2023-11-20', 'Transferencia bancaria', 'Reembolsado');


















CREATE TABLE tb_refiere (
  id_refiere INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha_referencia DATE NOT NULL,
  PRIMARY KEY (id_refiere)
);
INSERT INTO tb_refiere (id_usuario, fecha_referencia)
VALUES
(1, '2023-11-14'),
(2, '2023-11-15'),
(3, '2023-11-16'),
(4, '2023-11-17'),
(5, '2023-11-18'),
(6, '2023-11-19');




CREATE TABLE tb_productos_tb_carrito (
  id_productos INT NOT NULL,
  PRIMARY KEY (id_productos),
  FOREIGN KEY (id_productos) REFERENCES tb_productos (id_productos)
);


