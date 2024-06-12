CREATE DATABASE IF NOT EXISTS db_biblioteca
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_biblioteca;

CREATE TABLE IF NOT EXISTS tb_autor(
	id_autor SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(45) NOT NULL
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_editora(
	id_editora TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_livro(
	codigo_livro SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_livro VARCHAR(80) NOT NULL,
    dt_aq_livro DATE NOT NULL,
    id_editora TINYINT,
    
CONSTRAINT FOREIGN KEY fk_id_editora_livro (id_editora) REFERENCES tb_editora (id_editora)
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_livro_autor(
	id_livro SMALLINT NOT NULL,
    id_autor SMALLINT NOT NULL,
    
CONSTRAINT PRIMARY KEY (id_livro, id_autor),
CONSTRAINT FOREIGN KEY fk_id_livro_livro_autor (id_livro) REFERENCES tb_livro (codigo_livro),
CONSTRAINT FOREIGN KEY fk_id_autor_livro_autor (id_autor) REFERENCES tb_autor (id_autor)
);

CREATE TABLE IF NOT EXISTS tb_amigo(
	id_amigo TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_amigo VARCHAR(60) NOT NULL,
    email VARCHAR(65) NOT NULL
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_emprestimo(
	no_emprestimo SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dt_emprestimo DATE NOT NULL,
    id_amigo TINYINT NOT NULL,
    
CONSTRAINT FOREIGN KEY fk_id_amigo_emprestimo (id_amigo) REFERENCES tb_amigo (id_amigo)
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_livro_emprestado(
	no_emprestimo SMALLINT NOT NULL,
    codigo_livro SMALLINT NOT NULL,
    dv_sn CHAR(1) NOT NULL,
    dt_dev DATE,
    
CONSTRAINT PRIMARY KEY (no_emprestimo, codigo_livro) ,
CONSTRAINT FOREIGN KEY fk_no_emprestimo_livro_emprestimo (no_emprestimo) REFERENCES tb_emprestimo (no_emprestimo),
CONSTRAINT FOREIGN KEY fk_codigo_livro_livro_emprestado (codigo_livro) REFERENCES tb_livro (codigo_livro)   
);

################################################################
ALTER TABLE tb_livro
ADD COLUMN ISBN BIGINT NOT NULL;

ALTER TABLE tb_livro
ADD CONSTRAINT uq_ISBN UNIQUE (ISBN);

ALTER TABLE tb_livro_emprestado
DROP COLUMN dv_sn;

ALTER TABLE tb_amigo
ADD CONSTRAINT uq_email UNIQUE (email);

################################################################
DELIMITER $$
CREATE PROCEDURE pd_inserir_autor(
	IN p_nome_autor VARCHAR(45)
)
BEGIN
	INSERT INTO tb_autor (nome_autor)
    VALUES (p_nome_autor);
END $$

DELIMITER ;


DELIMITER $$
CREATE PROCEDURE pd_inserir_editora(
	IN p_nome_editora VARCHAR(30)
)
BEGIN
	INSERT INTO tb_editora (nome_editora)
    VALUES (p_nome_editora);
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE pd_inserir_livro(
	IN p_nome_livro VARCHAR(80),
    IN p_dt_aq_livro DATE,
    IN p_ISBN BIGINT
)
BEGIN
	INSERT INTO tb_livro (nome_livro, dt_aq_livro, ISBN)
    VALUES (p_nome_livro, p_dt_aq_livro, p_ISBN);
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE pd_inserir_amigo(
	IN p_nome_amigo VARCHAR(60),
    IN p_email VARCHAR(80)
)
BEGIN
	INSERT INTO tb_amigo (p_nome_amigo, p_email)
    VALUES(nome_amigo, email);
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE pd_inserir_emprestimo(
	IN p_dt_emprestimo DATE
)
BEGIN
	INSERT INTO tb_emprestimo (p_dt_emprestimo)
    VALUES(dt_emprestimo);
END $$

DELIMITER ;
################################################################
################################################################
CREATE USER 'Atendente'@'localhost' IDENTIFIED BY '88Ç-c';

GRANT EXECUTE ON *.* TO 'Atendente'@'localhost';

SHOW GRANTS FOR 'Atendente'@'localhost';
################################################################
CREATE USER 'Estagiário'@'localhost' IDENTIFIED BY '2534-a';

GRANT SELECT ON db_biblioteca.* TO 'Estagiário'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'Estagiário'@'localhost';
################################################################

DELIMITER $$

CREATE FUNCTION IF NOT EXISTS fn_remove_caracter_esp(nome VARCHAR(255))
RETURNS VARCHAR(255)

BEGIN
	DECLARE output VARCHAR(255)
DEFAULT '';
	DECLARE temp_char VARCHAR(1)
DEFAULT '';
	DECLARE I int DEFAULT 1;
    
    WHILE i <= LENGTH(input) DO
		SET temp_char = SUBSTRING(input, i 1);
        IF
