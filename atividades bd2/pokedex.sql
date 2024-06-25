CREATE DATABASE IF NOT EXISTS db_pokedex
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_pokedex;

CREATE TABLE IF NOT EXISTS tb_pokemon (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao LONGTEXT
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_tipo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_evolucao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_fraqueza (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_habilidade(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_pokemon_tipo (
    id_pokemon INT,
    id_tipo INT,
    
PRIMARY KEY (id_pokemon, id_tipo),
CONSTRAINT fk_id_pokemon_pokemon_tipo FOREIGN KEY (id_pokemon) REFERENCES tb_pokemon (id),
CONSTRAINT fk_id_tipo_pokemon_tipo FOREIGN KEY (id_tipo) REFERENCES tb_tipo (id)
);

CREATE TABLE IF NOT EXISTS tb_pokemon_evolucao (
    id_pokemon INT,
    id_evolucao INT,
PRIMARY KEY (id_pokemon, id_evolucao),
CONSTRAINT fk_id_pokemon_pokemon_evolucao FOREIGN KEY (id_pokemon) REFERENCES tb_pokemon (id),
CONSTRAINT fk_id_evolucao_pokemon_evolucao FOREIGN KEY (id_evolucao) REFERENCES tb_evolucao (id)
);

CREATE TABLE IF NOT EXISTS tb_pokemon_fraqueza (
    id_pokemon INT,
    id_fraqueza INT,
PRIMARY KEY (id_pokemon, id_fraqueza),
CONSTRAINT fk_id_pokemon_pokemon_fraqueza FOREIGN KEY (id_pokemon) REFERENCES tb_pokemon (id),
CONSTRAINT fk_id_fraqueza_pokemon_fraqueza FOREIGN KEY (id_fraqueza) REFERENCES tb_fraqueza (id)
);

CREATE TABLE IF NOT EXISTS tb_pokemon_habilidade (
    id_pokemon INT,
    id_habilidade INT,
PRIMARY KEY (id_pokemon, id_habilidade),
CONSTRAINT fk_id_pokemon_pokemon_habilidade FOREIGN KEY (id_pokemon) REFERENCES tb_pokemon (id),
CONSTRAINT fk_id_habilidade_pokemon_habilidade FOREIGN KEY (id_habilidade) REFERENCES tb_habilidade (id)
);

DELIMITER //
CREATE PROCEDURE sp_insert_pokemon(
	_nome VARCHAR(255), 
    _descricao LONGTEXT
    )
    
BEGIN
	INSERT INTO tb_pokemon (nome, descricao)
	VALUES (_nome, _descricao);
END //
    
    DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insert_tipo(
	_nome VARCHAR(255)
)
BEGIN
	INSERT INTO tb_tipo (nome)
	VALUES (_nome);
END //
    
    DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insert_evolucao(
	_nome VARCHAR(255)
    )
BEGIN
	INSERT INTO tb_evolucao (nome)
	VALUES (_nome);
END //

	DELIMITER ;
    
DELIMITER //
CREATE PROCEDURE sp_insert_fraqueza(
	_nome VARCHAR(255)
    )
BEGIN
	INSERT INTO tb_fraqueza (nome)
	VALUES (_nome);
END //

	DELIMITER ;
    
DELIMITER //

CREATE PROCEDURE sp_insert_habilidade(
	_nome VARCHAR(255),
    _descricao TEXT 
)
BEGIN
	INSERT INTO tb_habilidade (nome, descricao)
    VALUES (_nome, _descricao);
END //

	DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insert_pokemon_tipo(
	_id_pokemon INT,
    _id_tipo INT
    )
BEGIN

	INSERT INTO tb_pokemon_tipo(id_pokemon, id_tipo)
    VALUES (_id_pokemon, _id_tipo);

END //
	DELIMITER ;
       
DELIMITER //
CREATE PROCEDURE sp_insert_pokemon_evolucao(
	_id_pokemon INT,
    _id_evolucao INT
    )
BEGIN

	INSERT INTO tb_pokemon_evolucao(id_pokemon, id_evolucao)
    VALUES (_id_pokemon, _id_evolucao);

END //
	DELIMITER ;
    
DELIMITER //
CREATE PROCEDURE sp_insert_pokemon_fraqueza(
	_id_pokemon INT,
    _id_fraqueza INT
    )
BEGIN

	INSERT INTO tb_pokemon_fraqueza(id_pokemon, id_fraqueza)
    VALUES (_id_pokemon, _id_fraqueza);

END //
	DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insert_pokemon_habilidade(
	_id_pokemon INT,
    _id_habilidade INT
    )
BEGIN

	INSERT INTO tb_pokemon_habilidade(id_pokemon, id_habilidade)
    VALUES (_id_pokemon, _id_habilidade);

END //
	DELIMITER ;

DELIMITER //

CREATE FUNCTION fn_deixa_tudo_minusculo(entrada VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    RETURN LOWER(entrada);
END //

DELIMITER ;

########################################################################################################
SELECT 
    p.id AS numero_pokedex,
    fn_deixa_tudo_minusculo(p.nome) AS nome_pokemon,
    GROUP_CONCAT(DISTINCT fn_deixa_tudo_minusculo(t.nome) ORDER BY t.nome ASC SEPARATOR ' ou ') AS tipo,
    fn_deixa_tudo_minusculo(h.nome) AS habilidade,
    fn_deixa_tudo_minusculo(h.descricao) AS descricao_habilidade
FROM 
    tb_pokemon p
JOIN 
    tb_pokemon_tipo pt ON p.id = pt.id_pokemon
JOIN 
    tb_tipo t ON pt.id_tipo = t.id
JOIN 
    tb_pokemon_habilidade ph ON p.id = ph.id_pokemon
JOIN 
    tb_habilidade h ON ph.id_habilidade = h.id
GROUP BY 
    p.id, p.nome, h.nome, h.descricao
ORDER BY 
    p.id;
##############################################################################################





/*DROP DATABASE db_pokedex;*/