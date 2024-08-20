SELECT l.id_Libro, l.titulo_libro, c.nombre_Categoria
FROM LIBROS l
JOIN LIBROS_CATEGORIAS lc ON l.id_Libro = lc.id_Libro
JOIN CATEGORIAS c ON lc.id_Categoria = c.id_Categoria
ORDER BY c.nombre_Categoria;

SELECT c.nombre_Categoria, COUNT(l.id_Libro) AS cantidad_libros
FROM CATEGORIAS c
LEFT JOIN LIBROS_CATEGORIAS lc ON c.id_Categoria = lc.id_Categoria
LEFT JOIN LIBROS l ON lc.id_Libro = l.id_Libro
GROUP BY c.id_Categoria, c.nombre_Categoria
ORDER BY c.nombre_Categoria;

SELECT u.nombre_usuario, u.apellido_usuario, l.titulo_libro
FROM USUARIOS u -- alias para Usuarios = u 
JOIN USUARIOS_LIBROS ul ON u.id_usuario = ul.id_usuario -- alias para usuario-libros = ul
JOIN LIBROS l ON ul.id_Libro = l.id_Libro
ORDER BY u.nombre_usuario, u.apellido_usuario, l.titulo_libro;


SELECT c.nombre_Categoria, COUNT(l.id_Libro) AS cantidad_libros
FROM CATEGORIAS c
JOIN LIBROS_CATEGORIAS lc ON c.id_Categoria = lc.id_Categoria
JOIN LIBROS l ON lc.id_Libro = l.id_Libro
WHERE c.id_Categoria_Padre IS NOT NULL
GROUP BY c.id_Categoria, c.nombre_Categoria
ORDER BY cantidad_libros DESC
LIMIT 10;

SELECT u.nombre_usuario, u.apellido_usuario, COUNT(ul.id_Libro) AS cantidad_libros_vistos
FROM USUARIOS u
LEFT JOIN USUARIOS_LIBROS ul ON u.id_usuario = ul.id_usuario
GROUP BY u.id_usuario, u.nombre_usuario, u.apellido_usuario
ORDER BY cantidad_libros_vistos DESC;

CREATE VIEW Usuarios_Categorias_Consultadas AS
SELECT u.id_usuario, u.nombre_usuario, u.apellido_usuario, c.nombre_Categoria
FROM USUARIOS u
JOIN USUARIOS_LIBROS ul ON u.id_usuario = ul.id_usuario
JOIN LIBROS_CATEGORIAS lc ON ul.id_Libro = lc.id_Libro
JOIN CATEGORIAS c ON lc.id_Categoria = c.id_Categoria
ORDER BY u.id_usuario;

DELIMITER // -- Cuidado con eliminar los delimiter

CREATE FUNCTION Categoria_Mas_Visitada_Por_Usuario(p_id_usuario INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
    DECLARE categoria_mas_visitada VARCHAR(45);

    -- Seleccionar la categoría más visitada por el usuario
    SELECT c.nombre_Categoria
    INTO categoria_mas_visitada
    FROM CATEGORIAS c
    JOIN LIBROS_CATEGORIAS lc ON c.id_Categoria = lc.id_Categoria
    JOIN USUARIOS_LIBROS ul ON lc.id_Libro = ul.id_Libro
    WHERE ul.id_usuario = p_id_usuario
    GROUP BY c.id_Categoria, c.nombre_Categoria
    ORDER BY COUNT(ul.id_Libro) DESC
    LIMIT 1;

    RETURN categoria_mas_visitada;
END//

DELIMITER ;
SELECT Categoria_Mas_Visitada_Por_Usuario(2) AS categoria_mas_visitada; -- Colocamos en el parentesis el id del usuario que queremos consultar


DELIMITER //

CREATE PROCEDURE InsertarUsuario(
    IN p_nombre_usuario VARCHAR(45),
    IN p_apellido_usuario VARCHAR(45),
    IN p_nickname VARCHAR(20),
    IN p_password VARCHAR(255)
)
BEGIN
    -- Verificar si el nombre de usuario ya existe
    IF EXISTS (
        SELECT 1
        FROM USUARIOS
        WHERE nombre_usuario = p_nombre_usuario
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre de usuario ya existe.';
    ELSE
        -- Insertar nuevo usuario
        INSERT INTO USUARIOS (nombre_usuario, apellido_usuario, nickname, password)
        VALUES (p_nombre_usuario, p_apellido_usuario, p_nickname, p_password);
    END IF;
END//

DELIMITER ;
CALL InsertarUsuario('Juan', 'Pérez', 'juanp', 'password123');

-- ULTIMO EJERCICIO
CREATE TABLE ALTA_USUARIOS (
    id_alta INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario)
);

DELIMITER //

CREATE TRIGGER RegistrarAltaUsuario
AFTER INSERT ON USUARIOS
FOR EACH ROW
BEGIN
    INSERT INTO ALTA_USUARIOS (id_usuario)
    VALUES (NEW.id_usuario);
END//

DELIMITER ;

-- Insertar un nuevo usuario
INSERT INTO USUARIOS (nombre_usuario, apellido_usuario, nickname, password)
VALUES ('Ana', 'García', 'anag', 'password456');

-- Consultar los registros de alta
SELECT * FROM ALTA_USUARIOS;
