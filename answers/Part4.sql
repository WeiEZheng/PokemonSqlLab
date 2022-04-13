SELECT
p.name AS 'Pokemon Name',
t.trainername AS 'Trainer Name',
pt.pokelevel as Level,
p_type.name as 'Primary Type',
s_type.name as 'Secondary Type'
FROM types p_type
JOIN pokemons p
ON p_type.id = p.primary_type
JOIN pokemon_trainer pt
ON pt.pokemon_id = p.id
JOIN types s_type
ON s_type.id = p.secondary_type
JOIN trainers t
ON pt.trainerID = t.trainerID
ORDER BY Level desc;