CREATE DATABASE tienda;
USE tienda;

drop table if exists clientes;
drop table if exists pedidos;

-- 1.5 Tabla de clientes y pedidos de Pregunta 2
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
