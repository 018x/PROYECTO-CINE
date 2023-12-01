CREATE DATABASE cinehut;
USE cinehut;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(255) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    nivel_id INT,
    FOREIGN KEY (nivel_id) REFERENCES niveles(id)
);

CREATE TABLE niveles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nivel VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    clasificacion VARCHAR(255) NOT NULL,
    duracion INT,
    sinopsis TEXT
);

CREATE TABLE salas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    cantidad_asientos INT NOT NULL,
    funciones_id INT,
    FOREIGN KEY (funciones_id) REFERENCES funciones(id)
);

CREATE TABLE combos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    descuento DECIMAL(5, 2) NOT NULL
);

CREATE TABLE funciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cantidad_boletos_vendidos INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    pelicula_id INT,
    sala_id INT,
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id),
    FOREIGN KEY (sala_id) REFERENCES salas(id)
);

SELECT * FROM niveles;

INSERT INTO niveles (nivel) VALUES ('Administrador'), ('Vendedor'), ('Usuario');

INSERT INTO productos (nombre, descripcion, precio) VALUES ('Popcorn', 'Delicioso popcorn', 10.00), ('Refresco', 'Refrescante bebida', 8.00), ('Entrada', 'Boletos para ver una película', 15.00);

INSERT INTO peliculas (titulo, clasificacion, duracion, sinopsis) VALUES ('Película 1', 'AAA', 120, 'Sinopsis de la película 1'), ('Película 2', 'BBB', 130, 'Sinopsis de la película 2');

INSERT INTO salas (nombre, cantidad_asientos) VALUES ('Sala 1', 100), ('Sala 2', 120);

INSERT INTO combos (nombre, descripcion, descuento) VALUES ('Combo 1', 'Combo con 2 popcorns y 2 refrescos', 10.00), ('Combo 2', 'Combo con 3 popcorns y 1 refresco', 15.00);

INSERT INTO funciones (cantidad_boletos_vendidos, fecha_hora, pelicula_id, sala_id) VALUES (100, '2022-03-10 20:00:00', 1, 1), (150, '2022-03-10 22:00:00', 2, 2);
