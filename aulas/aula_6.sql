CREATE DATABASE IF NOT EXISTS db_aula6
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_aula6;

CREATE TABLE IF NOT EXISTS tb_pai(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_mae(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_filho(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR(255) NOT NULL,
    id_mae INT,
    id_pai INT,
    CONSTRAINT fk_id_mae_filho FOREIGN KEY (id_mae) REFERENCES tb_mae(codigo),
    CONSTRAINT fk_id_pai_filho FOREIGN KEY (id_pai) REFERENCES tb_pai(codigo)
);