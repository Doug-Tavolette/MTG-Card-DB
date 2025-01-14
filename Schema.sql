DROP TABLE IF EXISTS item;

CREATE TABLE item(
    name VARCHAR(25) PRIMARY KEY NOT NULL,
    rarity VARCHAR(10) NOT NULL,
    abilities_effected VARCHAR(6),
    description VARCHAR(25) NOT NULL,
    quest_bonus VARCHAR(25) NOT NULL

);

CREATE TABLE character(
    character_name VARCHAR(20),
    character_id INTEGER PRIMARY KEY NOT NULL,
    base_hp INT NOT NULL,
    damage NUMERIC(4,1) DEFAULT 0 NOT NULL,
    armor NUMERIC(4,1) DEFAULT 0 NOT NULL,
    vitality NUMERIC(4,1) DEFAULT 0 NOT NULL
)

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