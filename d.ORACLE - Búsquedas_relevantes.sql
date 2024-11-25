-- Comidas con tomate
SELECT * FROM comidas c
JOIN comida_ingredientes ci
on ci.codcomida = c.codcomida
JOIN ingredientes i 
ON i.codingrediente = ci.codingrediente
WHERE LOWER(i.nombre) = 'tomate';

-- Comidas con pescado
SELECT * FROM comidas c
JOIN comida_ingredientes ci
on ci.codcomida = c.codcomida
JOIN ingredientes i 
ON i.codingrediente = ci.codingrediente
JOIN ingrediente_alergenos ia
ON ia.codingrediente = i.codingrediente
JOIN alergenos a
ON a.codalergeno = ia.codalergeno
WHERE LOWER(a.nombre) = 'pescado';

-- Ingredientes con su correspondiente alérgeno
SELECT i.nombre AS ingrediente, a.nombre AS alergeno
FROM ingrediente_alergenos ia
JOIN ingredientes i ON ia.codIngrediente = i.codIngrediente
JOIN alergenos a ON ia.codAlergeno = a.codAlergeno;


-- Comida con sus correspondinetes ingredientes que tienen alérgenos
SELECT c.nombre AS Comida, i.nombre AS Ingrediente, a.nombre AS Alergeno
FROM comidas c
JOIN comida_ingredientes ci ON ci.codcomida = c.codcomida
JOIN ingredientes i ON i.codIngrediente = ci.codIngrediente
JOIN ingrediente_alergenos ia ON ia.codIngrediente = i.codIngrediente
JOIN alergenos a ON a.codAlergeno = ia.codAlergeno
WHERE c.codcomida = 2 -- o cualquier otro codigo de comida
;

-- Comida con todos sus ingredientes, y alérgenos si los hubiera
SELECT c.nombre AS Comida, 
       i.nombre AS Ingrediente, 
       a.nombre AS Alergeno
FROM comidas c
JOIN comida_ingredientes ci 
    ON ci.codcomida = c.codcomida
JOIN ingredientes i 
    ON i.codIngrediente = ci.codIngrediente
LEFT JOIN ingrediente_alergenos ia 
    ON ia.codIngrediente = i.codIngrediente
LEFT JOIN alergenos a 
    ON a.codAlergeno = ia.codAlergeno
WHERE c.codcomida = 2;


-- Postres sin huevo
SELECT DISTINCT c.nombre AS Postre
FROM Comidas c
JOIN comida_ingredientes ci ON c.codComida = ci.codComida
WHERE c.tipo = 'Postre'
  AND c.codComida NOT IN (
    SELECT ci.codComida
    FROM comida_ingredientes ci
    JOIN ingrediente_alergenos ia ON ci.codIngrediente = ia.codIngrediente
    WHERE ia.codAlergeno = 2
  );
  
  -- Comidas sin gluten
SELECT DISTINCT c.nombre AS Comida
FROM Comidas c
WHERE c.codComida NOT IN (
    SELECT ci.codComida
    FROM comida_ingredientes ci
    JOIN ingrediente_alergenos ia ON ci.codIngrediente = ia.codIngrediente
    JOIN alergenos a ON ia.codAlergeno = a.codAlergeno
    WHERE LOWER(a.nombre) = 'gluten'
);


-- Bebidas con azúcar
SELECT c.nombre AS Bebida
FROM Comidas c
JOIN comida_ingredientes ci ON c.codComida = ci.codComida
JOIN Ingredientes i ON ci.codIngrediente = i.codIngrediente
WHERE LOWER(c.tipo) = 'bebida' AND LOWER(i.nombre) = 'azúcar';

-- Comidas con tomate
SELECT DISTINCT c.nombre AS Comida
FROM Comidas c
JOIN comida_ingredientes ci ON c.codComida = ci.codComida
JOIN Ingredientes i ON ci.codIngrediente = i.codIngrediente
WHERE LOWER(i.nombre) = 'tomate';

