INSERT INTO CATEGORIAS (nombre_Categoria, id_Categoria_Padre) VALUES
('Tecnología', NULL),
('Literatura', NULL),
('Ciencia Ficción', 2),
('Programación', 1),
('Frontend', 4),
('Filosofía', NULL),
('Historia', NULL),
('Ensayo', 6), -- Ensayo es una subcategoría de Filosofía
('Biografía', 7), -- Biografía es una subcategoría de Historia
('Antigüedad', 7), -- Antigüedad es una subcategoría de Historia
('Arte', NULL),
('Ciencia', NULL),
('Música', 11), -- Música es una subcategoría de Arte
('Pintura', 11), -- Pintura es una subcategoría de Arte
('Química', 12), -- Química es una subcategoría de Ciencia
('Física', 12), -- Física es una subcategoría de Ciencia
('Literatura Infantil', NULL),
('Cómics', 17), -- Cómics es una subcategoría de Literatura Infantil
('Novela Gráfica', 14),
('Matemáticas', NULL),
('Psicología', NULL),
('Cine', NULL),
('Economía', NULL),
('Educación', NULL),
('Lógica Matemática', 20), -- Subcategoría de Matemáticas
('Psicología Clínica', 21), -- Subcategoría de Psicología
('Psicología Social', 21), -- Subcategoría de Psicología
('Cine Clásico', 22), -- Subcategoría de Cine
('Macroeconomía', 23), -- Subcategoría de Economía
('Pedagogía', 24); -- Subcategoría de Educación

INSERT INTO LIBROS (titulo_libro, autor_libro, edicion_libro, ISBN, lugar, agno_libro) VALUES
('Clean Code', 'Robert C. Martin', 1, '9780132350884', 'USA', 2008),
('The Pragmatic Programmer', 'Andrew Hunt', 2, '9780201616224', 'USA', 1999),
('1984', 'George Orwell', 1, '9780451524935', 'UK', 1949),
('The Lord of the Rings', 'J.R.R. Tolkien', 3, '9780261102385', 'UK', 1954),
('Design Patterns', 'Erich Gamma', 1, '9780201633610', 'USA', 1994),
('Meditaciones', 'Marco Aurelio', 1, '9780140449334', 'Italia', 180),
('Sapiens', 'Yuval Noah Harari', 1, '9780062316110', 'Israel', 2014),
('El arte de la guerra', 'Sun Tzu', 3, '9781590302255', 'China', -500),
('El origen de las especies', 'Charles Darwin', 1, '9781503275282', 'Reino Unido', 1859),
('La República', 'Platón', 2, '9780140455113', 'Grecia', -380);

INSERT INTO USUARIOS (nombre_usuario, apellido_usuario, nickname, password) VALUES
('Juan', 'Pérez', 'juanp', 'password123'),
('Ana', 'Gómez', 'anag', 'mypassword'),
('Luis', 'Martínez', 'luism', 'luispass'),
('María', 'López', 'marial', 'maripass'),
('Carlos', 'Hernández', 'charlyh', 'charlypass'),
('Pedro', 'Ramírez', 'pedror', 'pedro2023'),
('Sofía', 'Fernández', 'sofiaf', 'sofiapass'),
('Diego', 'Jiménez', 'diegom', 'diegopass'),
('Laura', 'Mendoza', 'lauram', 'laurapass'),
('Roberto', 'Sánchez', 'roberts', 'robertopass');

INSERT INTO CALIFICACIONES (calificacion, comentario, id_libro, id_usuario) VALUES
(5, 'Excelente libro sobre programación.', 1, 1),
(4, 'Muy práctico y útil.', 2, 2),
(5, 'Una visión distópica fascinante.', 3, 3),
(4, 'Un clásico de la fantasía épica.', 4, 4),
(5, 'Imprescindible para arquitectos de software.', 5, 5),
(5, 'Reflexiones profundas y atemporales.', 6, 6),
(4, 'Una excelente visión de la historia de la humanidad.', 7, 7),
(5, 'Un clásico imprescindible para la estrategia.', 8, 8),
(4, 'Fundamental en la biología moderna.', 9, 9),
(5, 'Un pilar en la filosofía política.', 10, 10);

INSERT INTO ENLACES (url_enlace, id_libro) VALUES  -- enlaces ficticios
('https://libros.com/cleancode', 1),
('https://libros.com/pragmaticprogrammer', 2),
('https://libros.com/1984', 3),
('https://libros.com/lotr', 4),
('https://libros.com/designpatterns', 5),
('https://libros.com/meditaciones', 6),
('https://libros.com/sapiens', 7),
('https://libros.com/arteguerra', 8),
('https://libros.com/originespecies', 9),
('https://libros.com/republica', 10),
('https://libroseningles.com/pragmaticprogrammer', 2),
('https://libros-diseno.com/designpatterns', 5),
('https://programming-books.com/pragmaticprogrammer', 2),
('https://medita-tu.com/meditaciones', 6);

INSERT INTO LIBROS_CATEGORIAS (id_Libro, id_Categoria) VALUES
(1, 4), -- Clean Code pertenece a Programación
(2, 1), -- The Pragmatic Programmer pertenece a Tecnología
(3, 3), -- 1984 pertenece a Ciencia Ficción
(4, 2), -- The Lord of the Rings pertenece a Literatura
(5, 1), -- Design Patterns pertenece a Tecnología
(6, 6), -- Meditaciones pertenece a Filosofía
(7, 7), -- Sapiens pertenece a Historia
(8, 7), -- El arte de la guerra pertenece a Historia
(9, 1), -- El origen de las especies pertenece a Tecnología
(10, 6); -- La República pertenece a Filosofía

INSERT INTO USUARIOS_LIBROS (id_Libro, id_usuario) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2),
(5, 2),
(6, 2),
(7, 7),
(8, 8),
(9, 1),
(10, 9);
