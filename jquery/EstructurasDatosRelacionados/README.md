# Modelo de Datos: Tienda en Línea

Este modelo de datos representa el funcionamiento de una tienda en línea con foco en la gestión de clientes, productos, pedidos y pagos. Las entidades y sus relaciones están pensadas para ser implementadas en una base de datos relacional como MySQL.

## Entidades y Relaciones

### 1. Clientes
- **Atributos**: id_cliente (PK), nombre, dirección, email, teléfono, fecha_registro
- **Relación**: Un cliente puede tener múltiples pedidos (1:N)

### 2. Productos
- **Atributos**: id_producto (PK), nombre, descripción, precio, stock_actual
- **Relación**: Un producto puede estar en múltiples pedidos a través de la tabla intermedia DetallePedido (N:M)

### 3. Pedidos
- **Atributos**: id_pedido (PK), id_cliente (FK), fecha, total, estado
- **Relación**: Relación N:1 con Clientes, y relación N:M con Productos mediante DetallePedido

### 4. DetallePedido
- **Atributos**: id_pedido (FK), id_producto (FK), cantidad, precio_unitario
- **Relación**: Entidad intermedia que vincula Pedidos y Productos (N:M)

### 5. MetodoPago
- **Atributos**: id_metodo_pago (PK), descripcion
- **Relación**: Un método de pago puede ser usado por muchos pagos (1:N)

### 6. Pago
- **Atributos**: id_pago (PK), id_pedido (FK), id_metodo_pago (FK), fecha_pago, monto
- **Relación**: Cada pedido tiene un pago (1:1), y cada pago está asociado a un método de pago (N:1)

