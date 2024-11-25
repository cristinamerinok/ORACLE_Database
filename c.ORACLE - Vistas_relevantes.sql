-- Vista de comidas aptas para alergicos al gluten
CREATE OR REPLACE VIEW vw_alergicos_gluten AS
SELECT DISTINCT c.nombre AS comida
FROM Comidas c
WHERE NOT EXISTS (
    SELECT 1
    FROM comida_ingredientes ci
    JOIN ingrediente_alergenos ia ON ci.codIngrediente = ia.codIngrediente
    JOIN Alergenos a ON ia.codAlergeno = a.codAlergeno
    WHERE a.nombre = 'Gluten' AND ci.codComida = c.codComida
);

-- Comprobar vista:
select * from vw_alergicos_gluten;

/*/////////////////////////////////////////////////////////*/

-- Vista de comidas aptas para alérgicos al huevo
CREATE VIEW vw_alergicos_huevo AS
SELECT DISTINCT c.nombre AS comida
FROM Comidas c
WHERE c.codComida NOT IN (
    SELECT ci.codComida
    FROM comida_ingredientes ci
    JOIN ingrediente_alergenos ia ON ci.codIngrediente = ia.codIngrediente
    JOIN alergenos a ON ia.codAlergeno = a.codAlergeno
    WHERE a.nombre = 'Huevo' 
);

-- Comprobar vista:  
SELECT * FROM vw_alergicos_huevo;

/* ///////////////////////////////////////////////////// */

-- Vista de comidas y sus respectivos alérgenos
CREATE VIEW vw_comidas_alergenos AS
SELECT DISTINCT
    c.nombre AS comida,
    a.nombre AS alergeno
FROM Comidas c
JOIN comida_ingredientes ci ON c.codComida = ci.codComida
JOIN ingrediente_alergenos ia ON ci.codIngrediente = ia.codIngrediente
JOIN alergenos a ON ia.codAlergeno = a.codAlergeno
ORDER BY c.nombre, a.nombre;

-- Comrobar vista:  

select * from vw_comidas_alergenos;
