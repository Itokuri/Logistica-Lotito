CREATE TABLE registro (
usuario VARCHAR(200),
nombre VARCHAR(200),    
apellido VARCHAR(200),        
telefono VARCHAR(200),        
contraseña VARCHAR(200),        
confirmar_contraseña VARCHAR(200),        
id int AUTO_INCREMENT,    
primary key (id)
);


CREATE TABLE logeo (
    usuario varchar(200),
    contraseña varchar(200),
    id_registro int AUTO_INCREMENT,
    PRIMARY KEY (usuario),
    FOREIGN KEY (id_registro) REFERENCES registro(id)  
);