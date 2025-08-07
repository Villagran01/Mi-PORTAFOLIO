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


-- Insertar nuevo cliente
INSERT INTO clientes (nombre, direccion, email, telefono, fecha_registro)
VALUES ('Carlos Soto', 'Av. Libertador 888', 'carlos@example.com', '912222333', '2025-08-07');

-- Insertar nuevo pedido para el cliente anterior (suponiendo id_cliente = 4)
INSERT INTO pedidos (id_cliente, producto, cantidad, fecha, estado)
VALUES (4, 'Tablet Samsung', 1, '2025-08-07', 'Pendiente');

-- Actualizar dirección del cliente con id = 2
UPDATE clientes
SET direccion = 'Nueva Avenida 456'
WHERE id_cliente = 2;

-- Cambiar estado del pedido con id = 3 a "Cancelado"
UPDATE pedidos
SET estado = 'Cancelado'
WHERE id_pedido = 3;

-- Eliminar pedidos con estado "Pendiente"
DELETE FROM pedidos
WHERE estado = 'Pendiente';

-- Eliminar cliente con id = 5 si no tiene pedidos
DELETE FROM clientes
WHERE id_cliente = 5
  AND id_cliente NOT IN (SELECT DISTINCT id_cliente FROM pedidos);