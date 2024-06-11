CREATE DATABASE IF NOT EXISTS db_pokedex
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_pokedex;

/*DROP DATABASE db_pokedex;*/

#Tabela Pokemon
CREATE TABLE IF NOT EXISTS tb_pokemon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT
)AUTO_INCREMENT=1;

#Tabela Tipo
CREATE TABLE IF NOT EXISTS tb_tipo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255)
)AUTO_INCREMENT=1;

#Tabela Habilidade
CREATE TABLE IF NOT EXISTS tb_habilidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    habilidade VARCHAR(255)
)AUTO_INCREMENT=1;

#Tabela Evolucao
CREATE TABLE IF NOT EXISTS tb_evolucao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    evolucao VARCHAR(255)
)AUTO_INCREMENT=1;

#Tabela de junção Pokemon_Tipo
CREATE TABLE IF NOT EXISTS tb_pokemon_tipo (
    id_pokemon INT,
    id_tipo INT,

CONSTRAINT PRIMARY KEY (id_pokemon, id_tipo),
CONSTRAINT FOREIGN KEY fk_id_pokemon_pk_tip (id_pokemon) REFERENCES tb_pokemon (id),
CONSTRAINT FOREIGN KEY fk_id_tipo_pk_tip (id_tipo) REFERENCES tb_tipo (id)
);

#Tabela de junção Pokemon_Habilidade
CREATE TABLE IF NOT EXISTS tb_pokemon_habilidade (
    id_pokemon INT,
    id_habilidade INT,
    
CONSTRAINT PRIMARY KEY (id_pokemon, id_habilidade),
CONSTRAINT FOREIGN KEY fk_id_pokemon_pk_hb (id_pokemon) REFERENCES tb_pokemon (id),
CONSTRAINT FOREIGN KEY fk_id_pokemon_pk_hb (id_habilidade) REFERENCES tb_habilidade (id)
);

#Tabela de junção Pokemon_Evolucao
CREATE TABLE IF NOT EXISTS tb_pokemon_evolucao (
    id_pokemon INT,
    id_evolucao INT,
    
CONSTRAINT PRIMARY KEY (id_pokemon, id_evolucao),
CONSTRAINT FOREIGN KEY fk_id_pokemon_pk_ev (id_pokemon) REFERENCES tb_pokemon (id),
CONSTRAINT FOREIGN KEY fk_id_evolucao_pk_ev (id_evolucao) REFERENCES tb_evolucao (id)
);
