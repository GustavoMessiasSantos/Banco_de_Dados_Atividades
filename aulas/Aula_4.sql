CREATE DATABASE IF NOT EXISTS db_familia
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_familia;

CREATE TABLE IF NOT EXISTS tb_pai(
	id INT PRIMARY KEY,
    nome VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS tb_mae(
	codigo INT PRIMARY KEY,
    nome VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_filho(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    id_mae INT NOT NULL,
    id_pai INT,
    CONSTRAINT fk_id_mae_filho FOREIGN KEY (id_mae) REFERENCES tb_mae(codigo),
    CONSTRAINT fk_id_pai_filho FOREIGN KEY (id_pai) REFERENCES tb_pai(id)
) AUTO_INCREMENT = 1;

INSERT INTO tb_mae 
	(codigo, nome)
VALUES
	(DEFAULT, 'Padme');

SELECT * FROM tb_mae;

DESCRIBE tb_mae;

ALTER TABLE tb_mae
MODIFY codigo INT AUTO_INCREMENT;

ALTER TABLE tb_filho
DROP CONSTRAINT fk_id_mae_filho;

ALTER TABLE tb_filho
ADD CONSTRAINT fk_id_mae_filho
FOREIGN KEY (id_mae) REFERENCES tb_mae(codigo);

SELECT * FROM tb_filho;

ALTER TABLE tb_pai
MODIFY nome VARCHAR(255) NOT NULL;

/*ALTER TABLE tb_filho
DROP COLUMN dt_nascimento;*/

DESCRIBE filho;

ALTER TABLE tb_filho
ADD COLUMN dt_nascimento DATE NOT NULL AFTER nome;

ALTER TABLE tb_filho
CHANGE dt_nascimento data_nascimento DATE NOT NULL;

RENAME TABLE filho TO tb_filho;

/*INSERT categoria DML
ALTER TABLE categoria DDL
DROP #excluir
MODIFY #modifica
ADD #adiciona
CHANGE #mudança
*/  