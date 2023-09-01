CREATE DATABASE vet_clinic;
\c vet_clinic;

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL(5, 2)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

-- Create the 'owners' table
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
);

-- Create the 'species' table
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Modify the 'animals' table
ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species(id),
ADD COLUMN owner_id INT REFERENCES owners(id);

-- Create the 'vets' table
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

-- Create the 'specializations' table for the many-to-many relationship between 'vets' and 'species'
CREATE TABLE specializations (
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id)
);

-- Create the 'visits' table for the many-to-many relationship between 'animals' and 'vets'
CREATE TABLE visits (
    vet_id INTEGER REFERENCES vets(id),
    animal_id INTEGER REFERENCES animals(id),
    visit_date DATE
);
