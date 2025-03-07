DROP TABLE IF EXISTS item;

CREATE TABLE items(
    name VARCHAR(25) PRIMARY KEY NOT NULL,
    rarity VARCHAR(10) NOT NULL,
    abilities_effected VARCHAR(6),
    description VARCHAR(25) NOT NULL,
    quest_bonus VARCHAR(25) NOT NULL

);

CREATE TABLE INVENTORY(
    name VARCHAR(25) PRIMARY KEY NOT NULL,
    rarity VARCHAR(10) NOT NULL,
    abilities_effected VARCHAR(6),
    description VARCHAR(25) NOT NULL,
    quest_bonus VARCHAR(25) NOT NULL
)
-- I think I want the inventory table to be populated with exact copies of what is in the items table, but obviously I dont want the entire items table to be in there
-- When a user clicks on an item, that corresponding item will be added to the inventory table and any neccesary changes will be made to the abilities table
-- I also need to do the inverse of that for when the user removes an item
-- 

CREATE TABLE character(
    character_name VARCHAR(20),
    character_id INTEGER PRIMARY KEY NOT NULL,
    base_hp INT NOT NULL,
    damage NUMERIC(4,1) DEFAULT 0 NOT NULL,
    armor NUMERIC(4,1) DEFAULT 0 NOT NULL,
    vitality NUMERIC(4,1) DEFAULT 0 NOT NULL
)

CREATE TABLE abilities (
    ability_id INTEGER PRIMARY KEY, -- Unique ID for the ability
    character_id INTEGER NOT NULL, -- References the character who has this ability
    ability_name VARCHAR(20) NOT NULL, -- Name of the ability
    key_binding VARCHAR(6) NOT NULL, -- Single character for the keyboard key (e.g., 'Q', 'W', 'E', 'R', 'T')
    damage INTEGER NOT NULL DEFAULT 0,
    description VARCHAR(100) NOT NULL,
    FOREIGN KEY (character_id) REFERENCES character(character_id),
    UNIQUE (character_id, ability_id) -- Ensure each key_binding is unique per character
);

CREATE TABLE passives (
    passive_id INTEGER PRIMARY KEY, -- Unique ID for the passive
    character_id INTEGER NOT NULL, -- References the character who has this passive
    passive_name VARCHAR(20) NOT NULL, -- Name of the passive
    description VARCHAR(100) NOT NULL,
    FOREIGN KEY (character_id) REFERENCES character(character_id),
    UNIQUE (character_id, passive_id) -- Ensure each passive_name is unique per character
);


INSERT INTO character(character_name, character_id, base_hp, damage, armor, vitality) VALUES
    ("Scarlet-Day", 1, 100, 0, 0, 0);

INSERT INTO abilities(ability_id, character_id, ability_name, key_binding) VALUES
    (1, 1, "Daggers", 'LMB', 15, "Every 2 consecutive hits generate a combo point."),
    (2, 1, "Swift Strike", "RMB", 40, "Consumes all combo points. Deals +50% damage for each combo point consumed this way."),
    (3, 1, "Bomb", "E", 60, "Explodes after a delay. Stuns Scarlet if she it hit by it."),
    (4, 1, "Cloak", "Shift", 0, "Become INTANGIBLE for 2 seconds. Next POWER or ATTACK triggered during this has +100% CRIT CHANCE");
-- CREATE TABLE IF NOT EXISTS users(
--     user_id SERIAL PRIMARY KEY
-- )
-- IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
-- BEGIN
-- CREATE TABLE users(
--     user_id SERIAL PRIMARY KEY,
--     name VARCHAR(20) NOT NULL
-- );
-- END