drop table if exists empleados;

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_ingreso DATE,
    id_jefe INT DEFAULT NULL
);


-- Insertar empleados
ALTER TABLE empleados
ADD departamento VARCHAR(50);

-- Modificar tipo de dato de la columna salario
ALTER TABLE empleados
MODIFY salario DECIMAL(12,2);

-- Agregar clave foránea para jefe
ALTER TABLE empleados
ADD CONSTRAINT fk_jefe
FOREIGN KEY (id_jefe) REFERENCES empleados(id_empleado);

-- Insertar empleados
CREATE INDEX idx_nombre ON empleados(nombre);


-- Eliminar índice
sql
Copiar
Editar
DROP INDEX idx_nombre ON empleados;
-- Eliminar columna
sql
Copiar
Editar
ALTER TABLE empleados
DROP COLUMN departamento;
-- Eliminar tabla completa
sql
Copiar
Editar
DROP TABLE empleados;