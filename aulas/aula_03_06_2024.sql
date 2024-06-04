CREATE DATABASE IF NOT EXISTS detran
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE detran;

CREATE TABLE IF NOT EXISTS tb_motorista(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    pai VARCHAR(255),
    mae VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cpf CHAR(11) NOT NULL,
CONSTRAINT uq_email_motorista UNIQUE (email),
CONSTRAINT uq_cpf_motorista UNIQUE (cpf)
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_carro(
	id INT PRIMARY KEY,
    placa CHAR(7) NOT NULL,
    cor VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    ano_fabricacao YEAR NOT NULL,
    ano_modelo YEAR NOT NULL,
    id_motorista INT,
CONSTRAINT fk_id_motorista_carro FOREIGN KEY (id_motorista) REFERENCES tb_motorista (id)
)AUTO_INCREMENT=1;

DROP TABLE tb_motorista;