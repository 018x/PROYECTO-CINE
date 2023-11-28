-- Crear tabla de usuarios
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    correo VARCHAR(50),
    contraseña VARCHAR(50),
    rol ENUM('administrador', 'vendedor')
);

-- Crear tabla de salasusuarios
CREATE TABLE salas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    disponibilidad INT,
    id_administrador INT,
    FOREIGN KEY (id_administrador) REFERENCES usuarios(id)
);

-- Crear tabla de películas
CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50),
    sinopsis TEXT,
    id_administrador INT,
    FOREIGN KEY (id_administrador) REFERENCES usuario(id)
);

-- Crear tabla de funciones de películas
CREATE TABLE funciones_peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hora_inicio TIME,
    hora_fin TIME,
    id_pelicula INT,
    id_sala INT,
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id),
    FOREIGN KEY (id_sala) REFERENCES salas(id)
);

-- Crear tabla de combos
CREATE TABLE combos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(5,2),
    id_administrador INT,
    FOREIGN KEY (id_administrador) REFERENCES usuario(id)
);

-- Crear tabla de ventas
CREATE TABLE ventass (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_combo INT,
    id_funcion_pelicula INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES usuario(id),
    FOREIGN KEY (id_combo) REFERENCES combos(id),
    FOREIGN KEY (id_funcion_pelicula) REFERENCES funciones_peliculas(id)
);


SELECT * FROM usuario;
SELECT * FROM salas;
SELECT * FROM peliculas;
SELECT * FROM funciones_peliculas;
SELECT * FROM combos;