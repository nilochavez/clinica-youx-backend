CREATE TABLE usuarios (
                           id SERIAL PRIMARY KEY UNIQUE NOT NULL,
                           login TEXT NOT NULL UNIQUE,
                           senha TEXT NOT NULL,
                           cargo TEXT NOT NULL
);
