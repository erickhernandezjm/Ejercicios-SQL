CREATE schema if not exists JUSTBOOKS;

use justbooks;

-- Crear tabla CATEGORIAS
CREATE TABLE CATEGORIAS (
    id_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_Categoria VARCHAR(45) NOT NULL,
    id_Categoria_Padre INT,
    FOREIGN KEY (id_Categoria_Padre) REFERENCES CATEGORIAS(id_Categoria)
);

-- Crear tabla LIBROS
CREATE TABLE LIBROS (
    id_Libro INT PRIMARY KEY AUTO_INCREMENT,
    titulo_libro VARCHAR(80) NOT NULL,
    autor_libro VARCHAR(45) NOT NULL,
    edicion_libro INT,
    ISBN VARCHAR(13),
    lugar VARCHAR(20),
    agno_libro INT
);

-- Crear tabla USUARIOS
CREATE TABLE USUARIOS (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(45) NOT NULL,
    apellido_usuario VARCHAR(45) NOT NULL,
    nickname VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Crear tabla CALIFICACIONES
CREATE TABLE CALIFICACIONES (
    id_cals INT PRIMARY KEY AUTO_INCREMENT,
    calificacion INT NOT NULL,
    comentario TEXT,
    id_libro INT,
    id_usuario INT,
    FOREIGN KEY (id_libro) REFERENCES LIBROS(id_Libro),
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario)
);

-- Crear tabla ENLACES
CREATE TABLE ENLACES (
    id_enlace INT PRIMARY KEY AUTO_INCREMENT,
    url_enlace VARCHAR(255) NOT NULL,
    id_libro INT,
    FOREIGN KEY (id_libro) REFERENCES LIBROS(id_Libro)
);

-- Crear tabla LIBROS_CATEGORIAS (relación M:N entre LIBROS y CATEGORIAS)
CREATE TABLE LIBROS_CATEGORIAS (
    id_Libro INT,
    id_Categoria INT,
    PRIMARY KEY (id_Libro, id_Categoria),
    FOREIGN KEY (id_Libro) REFERENCES LIBROS(id_Libro),
    FOREIGN KEY (id_Categoria) REFERENCES CATEGORIAS(id_Categoria)
);

-- Crear tabla USUARIOS_LIBROS (relación M:N entre USUARIOS y LIBROS)
CREATE TABLE USUARIOS_LIBROS (
    id_Libro INT,
    id_usuario INT,
    PRIMARY KEY (id_Libro, id_usuario),
    FOREIGN KEY (id_Libro) REFERENCES LIBROS(id_Libro),
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario)
);
