-- TRIGGERS

--1. Trigger para registrar comidas con alergenos
CREATE OR REPLACE TRIGGER trg_comida_alergenos_check
AFTER INSERT ON comidas
FOR EACH ROW
BEGIN
    -- Verificar si la comida contiene alérgenos
    IF :NEW.alergenos = 'S' THEN
        -- Lanzar un mensaje indicando que se debe registrar en comida_alergenos
        RAISE_APPLICATION_ERROR(-20001, 'RECUERDE REGISTRAR esta nueva comida en la tabla comida_alergenos.');
    END IF;
END;
/


--2. Trigger para registrar ingredientes con alergenos
CREATE OR REPLACE TRIGGER trg_ingrediente_alergenos_check
AFTER INSERT ON ingredientes
FOR EACH ROW
BEGIN
    -- Verificar si la comida contiene alérgenos
    IF :NEW.alergenos = 'S' THEN
        -- Lanzar un mensaje indicando que se debe registrar en ingrediente_alergenos
        RAISE_APPLICATION_ERROR(-20001, 'RECUERDE REGISTRAR esta nueva comida en la tabla ingrediente_alergenos.');
    END IF;
END;
/
