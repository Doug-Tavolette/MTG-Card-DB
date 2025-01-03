DROP TABLE IF EXISTS cards;

CREATE TABLE cards(
    title VARCHAR(25) PRIMARY KEY NOT NULL,
    mana VARCHAR(10) NOT NULL,
    converted_mana INT NOT NULL,
    type VARCHAR(10) NOT NULL,
    rarity VARCHAR(10) NOT NULL,
    color VARCHAR(10) NOT NULL,
    power VARCHAR(5) NOT NULL,
    toughness VARCHAR(5) NOT NULL,
    text TEXT,
    themes TEXT --this will be populated by an array and be read by a helper function

);

-- CREATE TABLE IF NOT EXISTS users(
--     user_id SERIAL PRIMARY KEY
-- )
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
BEGIN
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);
END