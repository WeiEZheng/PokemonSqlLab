--1.) What is each pokemon's primary type?
SELECT p.id, p.name, t.name AS Primary_Type
FROM pokemons p
JOIN types t
ON p.primary_type = t.id;

--2.) What is Rufflet's secondary type?
SELECT t.name AS Secondary_Type
FROM pokemons p
JOIN types t
ON p.secondary_type = t.id
WHERE p.name = 'Rufflet';

--3.) What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT p.name
FROM pokemon_trainer pt
JOIN pokemons p
ON pt.pokemon_id = p.id
WHERE pt.trainerID = '303';

--4.) How many pokemon have a secondary type Poison
SELECT COUNT(*)
FROM pokemons p
JOIN types t
ON p.secondary_type = t.id
WHERE t.name = 'Poison';

--5.) What are all the primary types and how many pokemon have that type?
SELECT t.name, COUNT(*) AS "COUNT"
FROM pokemons p
JOIN types t
ON p.primary_type = t.id
GROUP BY t.name;

--6.) How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
SELECT pt.trainerID, COUNT(pt.pokemon_id) AS "Number of level 100 pokemons"
FROM pokemon_trainer pt
WHERE pt.pokelevel = '100'
GROUP BY pt.trainerID;

--7.) How many pokemon only belong to one trainer and no other?
SELECT COUNT(*) AS "Number of pokemon"
FROM (
SELECT *
FROM pokemon_trainer pt
JOIN pokemons p
ON pt.pokemon_id = p.id
GROUP BY pt.pokemon_id HAVING COUNT(trainerID)=1) c;