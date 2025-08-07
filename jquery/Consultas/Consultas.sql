CREATE DATABASE tienda;
USE tienda;

drop table if exists clientes;
drop table if exists pedidos;


-- Crear tabla CLIENTES
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150),
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    fecha_registro DATE
);

-- Crear tabla PEDIDOS
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    producto VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    fecha DATE,
    estado VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Insertar clientes
INSERT INTO clientes (nombre, direccion, email, telefono, fecha_registro) VALUES
('Juan Pérez', 'Av. Central 123', 'juan@example.com', '912345678', '2025-08-01'),
('María Gómez', 'Calle Sur 456', 'maria@example.com', '911223344', '2025-08-02'),
('Luis Torres', 'Pje. Norte 789', 'luis@example.com', '913334455', '2025-08-03');

-- Insertar pedidos
INSERT INTO pedidos (id_cliente, producto, cantidad, fecha, estado) VALUES
(1, 'Notebook Lenovo', 1, '2025-08-04', 'Procesado'),
(2, 'Teclado Logitech', 2, '2025-08-04', 'Pendiente'),
(3, 'Monitor 24"', 1, '2025-08-05', 'Enviado');


-- 2.- Utilizar Lenguaje Estructurado de Consultas (SQL) para la obtención de información que satisface los requerimientos planteados a partir de un modelo de datos dado.

-- 2.1. Obtener todos los pedidos realizados por un cliente específico

SELECT p.id_pedido, p.producto, p.cantidad, p.fecha, p.estado
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE c.nombre = 'Juan Pérez';

-- 2.2.- Listar los nombres de todos los clientes que han realizado pedidos

SELECT DISTINCT c.nombre
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente;

-- 2.3.- Mostrar la cantidad total de productos pedidos por cada cliente (GROUP BY)

SELECT c.nombre, SUM(p.cantidad) AS total_productos
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nombre;

-- 2.4.- Consultar los pedidos con estado = 'Pendiente'

SELECT p.id_pedido, c.nombre, p.producto, p.cantidad, p.fecha
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE p.estado = 'Pendiente';

-- 2.5.- Ver todos los pedidos ordenados por fecha descendente

SELECT p.id_pedido, c.nombre, p.producto, p.fecha, p.estado
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
ORDER BY p.fecha DESC;

-- 2.6.- Obtener el número total de pedidos por estado (GROUP BY con conteo)

SELECT estado, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY estado;

