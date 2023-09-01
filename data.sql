INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  ('Agumon', '2020-02-03', 0, true, 10.23),
  ('Gabumon', '2018-11-15', 2, true, 8),
  ('Pikachu', '2021-01-07', 1, false, 15.04),
  ('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES
  ('Charmander', '2020-02-08', 0, false, -11, 'pokemon'),
  ('Plantmon', '2021-11-15', 2, true, -5.7, 'unspecified'),
  ('Squirtle', '1993-04-02', 3, false, -12.13, 'pokemon'),
  ('Angemon', '2005-06-12', 1, true, -45, 'unspecified'),
  ('Boarmon', '2005-06-07', 7, true, 20.4, 'unspecified'),
  ('Blossom', '1998-10-13', 3, true, 17, 'unspecified'),
  ('Ditto', '2022-05-14', 4, true, 22, 'unspecified');

-- Insert data into 'owners' table
INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Insert data into 'species' table
INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

-- Modify inserted animals based on name for 'species_id'
UPDATE animals
SET species_id = CASE
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
    END;

-- Modify inserted animals to include 'owner_id' information
UPDATE animals
SET owner_id = CASE
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
    END;

-- Insert data for vets
INSERT INTO vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

-- Insert data for specializations
INSERT INTO specializations (vet_id, species_id)
VALUES
    (1, 1),
    (3, 1),
    (3, 2),
    (4, 2);

-- Insert data for visits
INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES
    (1, 1, '2020-05-24'),
    (3, 1, '2020-07-22'),
    (4, 2, '2021-02-02'),
    (2, 3, '2020-01-05'),
    (2, 3, '2020-03-08'),
    (2, 3, '2020-05-14'),
    (3, 4, '2021-05-04'),
    (4, 5, '2021-02-24'),
    (2, 6, '2019-12-21'),
    (1, 6, '2020-08-10'),
    (2, 6, '2021-04-07'),
    (3, 7, '2019-09-29'),
    (4, 8, '2020-10-03'),
    (4, 8, '2020-11-04'),
    (2, 9, '2019-01-24'),
    (2, 9, '2019-05-15'),
    (2, 9, '2020-02-27'),
    (2, 9, '2020-08-03'),
    (3, 10, '2020-05-24'),
    (1, 10, '2021-01-11');
