/*Se crea la base de datos */
drop schema if exists kourtneyshop;
drop user if exists administrador;
CREATE SCHEMA kourtneyshop ;

/*Se crea un usuario para la base de datos llamado "usuario_prueba" y tiene la contraseña "Usuario_Clave."*/
create user 'administrador'@'%' identified by 'Admin123.';

/*Se asignan los prvilegios sobr ela base de datos TechShop al usuario creado */
grant all privileges on kourtneyshop.* to 'administrador'@'%';
flush privileges;

/* la tabla de categoria contiene categorias de productos*/
create table kourtneyshop.categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table kourtneyshop.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(30) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio double,
  existencias int,  
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_caregoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se crea la tabla de clientes llamada cliente... igual que la clase Cliente */
CREATE TABLE kourtneyshop.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table kourtneyshop.factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha date,  
  total double,
  estado int,
  PRIMARY KEY (id_factura),
  foreign key fk_factura_usuario (id_usuario) references usuario(id_usuario)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table kourtneyshop.venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  precio double, 
  cantidad int,
  PRIMARY KEY (id_venta),
  foreign key fk_ventas_factura (id_factura) references factura(id_factura),
  foreign key fk_ventas_producto (id_producto) references producto(id_producto) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se insertan 3 registros en la tabla cliente como ejemplo */
INSERT INTO kourtneyshop.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'kourtney','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Kourtney', 'Fernandez Zuñiga', 'Kourtfz16@gmail.com',  '7079-7573', 'https://i0.wp.com/www.diarlu.com/wp-content/uploads/2019/09/cara-mujer-joven.jpg?resize=500%2C500&ssl=1/500px-cara-mujer-joven.jpg',true),
(2,'jose','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Jose',  'Castillo Orozco', 'jose1695_@hotmail.es', '6097-6077','https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg',true),
(3,'jerson','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Jerson', 'Hernandez Carvajal', 'hejohc@gmail.com', '6358-5318','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854',true);

/*Se insertan 3 categorias de productos como ejemplo */
INSERT INTO kourtneyshop.categoria (id_categoria,descripcion,ruta_imagen,activo) VALUES 
('1','Cuidado Personal', 'https://upload.wikimedia.org/wikipedia/commons/b/bc/Cosmetics.JPG',   true), 
('2','Tecnologia', 'https://grupotodoadollar.com/media/mageplaza/blog/post/1/_/1.png',   true),
('3','Articulos de Fiesta','https://www.namesnack.com/images/namesnack-party-supply-business-names-4699x3136-2020087.jpeg?crop=21:16,smart&width=420&dpr=2',true);

/*Se insertan 3 productos por categoria */
INSERT INTO kourtneyshop.producto (id_producto,id_categoria,descripcion,detalle,precio,existencias,ruta_imagen,activo) VALUES
(1,1,'Mascara de Pestañas','Realza tus ojos con nuestra variedad de máscaras de pestañas. Desde un aspecto natural hasta un impacto audaz, nuestras fórmulas de alta calidad añaden longitud, volumen y color. Encuentra el estilo perfecto para resaltar tu belleza única con opciones a prueba de agua y una gama de tonos cautivadores.',8700,12,'https://firebasestorage.googleapis.com/v0/b/proyectodesarrolloweb-f0ecd.appspot.com/o/WhatsApp%20Image%202023-08-23%20at%2015.08.58.jpeg?alt=media&token=6b33cf86-fc79-43d4-a71f-944132af318e',true),
(2,1,'Juego de Brochas','Descubre nuestra colección de juegos de brochas, tu aliado esencial para un maquillaje impecable. Nuestras brochas de alta calidad están diseñadas para ofrecer una aplicación suave y precisa. Ya sea que necesites difuminar, contornear o resaltar, nuestros juegos de brochas te brindan las herramientas adecuadas para lograr un aspecto profesional. Eleva tu rutina de maquillaje con estas brochas versátiles y consigue un acabado perfecto en cada aplicación.',15000,7,'https://firebasestorage.googleapis.com/v0/b/proyectodesarrolloweb-f0ecd.appspot.com/o/WhatsApp%20Image%202023-08-23%20at%2015.08.59%20(1).jpeg?alt=media&token=24de1e9a-1ab7-4f09-9c1d-59808a0bee01',true),
(3,1,'Limadora de Uñas','Consigue uñas impecables con nuestra limadora de uñas. Diseñada para brindar precisión y comodidad, nuestra limadora eléctrica es perfecta para dar forma, pulir y suavizar tus uñas. Olvídate de las limas convencionales y descubre cómo lograr resultados profesionales en la comodidad de tu hogar. Dale a tus uñas el cuidado que se merecen con nuestra limadora de uñas de alta calidad.',35000,3,'https://firebasestorage.googleapis.com/v0/b/proyectodesarrolloweb-f0ecd.appspot.com/o/WhatsApp%20Image%202023-08-23%20at%2015.08.59.jpeg?alt=media&token=50bc90fb-7b5c-4895-8257-c692ab6de8ef',true),
(4,2,'Cargador 3 en 1','Simplifica tu vida con nuestro cargador 3 en 1. Este versátil accesorio combina tres tipos de conectores en uno solo, lo que te permite cargar múltiples dispositivos con facilidad. Ya sea tu teléfono, tableta o auriculares, nuestro cargador 3 en 1 es la solución conveniente para mantener tus dispositivos alimentados y listos para usar. Di adiós a los cables enredados y disfruta de la comodidad de cargar todo en un solo lugar',32000,9,'https://firebasestorage.googleapis.com/v0/b/proyectodesarrolloweb-f0ecd.appspot.com/o/WhatsApp%20Image%202023-08-23%20at%2015.09.14.jpeg?alt=media&token=b9156158-9690-4bbd-82f6-0b9f90f0ce7e',true),
(5,2,'Microfonos Inalámbricos','Libertad y calidad se unen con nuestros micrófonos inalámbricos. Diseñados para brindar un rendimiento excepcional, estos micrófonos te permiten moverte sin restricciones mientras disfrutas de una claridad de sonido impresionante. Ya sea para presentaciones, actuaciones en vivo o grabaciones, nuestros micrófonos inalámbricos ofrecen una experiencia sin cables que eleva tu voz. ',22000,6,'https://firebasestorage.googleapis.com/v0/b/proyectodesarrolloweb-f0ecd.appspot.com/o/WhatsApp%20Image%202023-08-23%20at%2015.09.23.jpeg?alt=media&token=971ea8ee-77e9-4189-84a6-787f9f8a0364',true),
(6,2,'Audifonos Inalámbricos','Experimenta la libertad de la música con nuestros audífonos inalámbricos. Diseñados para un sonido excepcional sin ataduras, estos audífonos te brindan una experiencia auditiva inigualable. Olvídate de los cables enredados y disfruta de la comodidad de la conectividad inalámbrica mientras te sumerges en tus canciones favoritas o atiendes llamadas con claridad. Con un diseño ergonómico y una calidad de sonido superior, nuestros audífonos inalámbricos son la elección perfecta para acompañarte en tus momentos musicales y de comunicación.',54000,3,'https://firebasestorage.googleapis.com/v0/b/proyectodesarrolloweb-f0ecd.appspot.com/o/WhatsApp%20Image%202023-08-23%20at%2015.09.35.jpeg?alt=media&token=19d4fb8e-3b5d-4dd8-bbfe-9559da8a35a6',true),
(7,2,'Powerbank','Lleva la energía contigo gracias a nuestros powerbanks. Estas prácticas baterías portátiles te garantizan carga en movimiento para tus dispositivos electrónicos. Con una capacidad confiable y diseño compacto, nuestros powerbanks son tu respaldo en situaciones de baja batería. Mantente conectado y disfruta de la tranquilidad de no quedarte sin energía cuando más lo necesitas. Elige la conveniencia y la potencia de nuestros powerbanks para estar siempre cargado y listo para cualquier aventura.',9900,11,'https://firebasestorage.googleapis.com/v0/b/proyectodesarrolloweb-f0ecd.appspot.com/o/WhatsApp%20Image%202023-08-23%20at%2015.09.46.jpeg?alt=media&token=fe15eccf-7751-46dc-888a-42f9f685bc97',true),
(8,3,'Globos numericos','Celebra momentos especiales con nuestros globos numéricos. Estos globos llamativos y elegantes te permiten mostrar la edad, fecha o número que desees de una manera única. Perfectos para fiestas de cumpleaños, aniversarios y eventos importantes, nuestros globos numéricos agregan un toque personalizado y festivo a la decoración. ',2200,43,'https://firebasestorage.googleapis.com/v0/b/proyectodesarrolloweb-f0ecd.appspot.com/o/WhatsApp%20Image%202023-08-23%20at%2015.08.48.jpeg?alt=media&token=45478fe1-2169-47dc-afdc-00552a66e195',true),
(9,3,'Globos','Eleva la alegría de cualquier ocasión con nuestros coloridos globos. Desde fiestas hasta eventos especiales, nuestros globos añaden un toque de diversión y festividad. Disponibles en una amplia gama de colores, formas y tamaños, nuestros globos son la opción perfecta para decorar y celebrar. ',1000,86,'https://firebasestorage.googleapis.com/v0/b/proyectodesarrolloweb-f0ecd.appspot.com/o/WhatsApp%20Image%202023-08-23%20at%2015.08.49%20(1).jpeg?alt=media&token=f8444a3b-6a6e-4ae8-aab0-69f698410377',true),
(10,3,'Bolsa de regalo','Envuelve tus obsequios con estilo en nuestras elegantes bolsas de regalo. Diseñadas para realzar la presentación de tus regalos, nuestras bolsas combinan practicidad y estética. Con una variedad de diseños, colores y tamaños, encontrarás la bolsa perfecta para cada ocasión.',700,32,'https://firebasestorage.googleapis.com/v0/b/proyectodesarrolloweb-f0ecd.appspot.com/o/WhatsApp%20Image%202023-08-23%20at%2015.08.49.jpeg?alt=media&token=830243e4-9a55-4eaf-ab83-d0f35ee2340c',true),
(11,3,'Velas de cumpleaños','Celebra con luz y alegría con nuestras coloridas velas de cumpleaños. Estas encantadoras velas añaden un toque festivo a tu pastel y crean un momento mágico en cualquier celebración. Disponibles en una variedad de colores y números, nuestras velas de cumpleaños son el complemento perfecto para marcar otro año de vida. Haz que el deseo de cumpleaños sea aún más especial con nuestras velas que iluminan momentos inolvidables.',1500,45,'https://firebasestorage.googleapis.com/v0/b/proyectodesarrolloweb-f0ecd.appspot.com/o/WhatsApp%20Image%202023-08-23%20at%2015.08.48%20(1).jpeg?alt=media&token=b468ba1b-f2dc-4456-a775-184552579202',true);

/*Se crean 6 facturas */   /*'Activa','Pagada','Anulada')*/
INSERT INTO kourtneyshop.factura (id_factura,id_usuario,fecha,total,estado) VALUES
(1,1,'2023-08-05',211560,2),
(2,2,'2023-08-07',554340,2),
(3,3,'2023-08-07',871000,2),
(4,1,'2023-08-15',244140,1),
(5,2,'2023-08-17',414800,1),
(6,3,'2023-08-21',420000,1);

INSERT INTO kourtneyshop.venta (id_venta,id_factura,id_producto,precio,cantidad) values
(1,1,5,45000,3),
(2,1,9,15780,2),
(3,1,7,15000,3),
(4,2,5,45000,1),
(5,2,1,154000,3),
(6,2,9,15780,3),
(7,3,11,154000,1),
(8,3,6,57000,1),
(9,3,5,330000,2),
(10,1,6,57000,2),
(11,1,8,27600,3),
(12,1,9,15780,3),
(13,2,8,27600,3),
(14,2,4,154000,2),
(15,2,3,24000,1),
(16,3,11,330000,1),
(17,3,9,45000,1),
(18,3,1,15000,3);

create table kourtneyshop.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

insert into kourtneyshop.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1), (2,'ROLE_VENDEDOR',1), (3,'ROLE_USER',1);