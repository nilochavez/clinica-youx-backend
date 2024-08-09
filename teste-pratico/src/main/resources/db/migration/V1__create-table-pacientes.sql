CREATE TABLE pacientes (
                           id SERIAL PRIMARY KEY,
                           nome VARCHAR(100) NOT NULL,
                           cpf VARCHAR(255) NOT NULL UNIQUE,
                           data_nascimento DATE,
                           peso NUMERIC(5, 2),
                           altura NUMERIC(3, 2),
                           uf CHAR(2) NOT NULL,
                           ativo boolean not null
);
