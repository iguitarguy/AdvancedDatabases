--list animals (ID, name, weight and breed_id) for any animals who weight more than the average weight for their own bread
SELECT animal_id, animal_name, animal_weight, br.breed_id, breed_name
FROM animal main JOIN breed br ON main.breed_id = br.breed_id
WHERE animal_weight > (Select avg(animal_weight) 
from animal sub 
where main.breed_id = sub.breed_id); 