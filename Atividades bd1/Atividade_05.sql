CREATE DATABASE IF NOT EXISTS db_escola
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_escola;

CREATE TABLE IF NOT EXISTS tb_nacionalidade(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nacionalidade VARCHAR(255) NOT NULL DEFAULT 'brasileiro'
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_aluno(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf CHAR(11) NOT NULL,
    pai VARCHAR(255) NOT NULL,
	mae VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    id_nacionalidade INT, 
    
CONSTRAINT uq_cpf_aluno UNIQUE (cpf),
CONSTRAINT uq_email_aluno UNIQUE (email),
CONSTRAINT fk_id_nacionalidade_aluno FOREIGN KEY (id_nacionalidade) REFERENCES tb_nacionalidade (id)
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_logradouro(
	id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_endereco(
	id INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numero_casa INT NOT NULL,
    complemento VARCHAR(255) NOT NULL,
    id_aluno INT,
    id_logradouro INT,

CONSTRAINT fk_id_aluno_endereco FOREIGN KEY (id_aluno) REFERENCES tb_aluno (id),
CONSTRAINT fk_id_logradouro FOREIGN KEY (id_logradouro) REFERENCES tb_logradouro (id)
)AUTO_INCREMENT=1;

/*
Houve um erro nas nomeclaturas!
ALTER TABLE tb_endereco DROP FOREIGN KEY fk_id_logradouro;

ALTER TABLE tb_endereco
ADD CONSTRAINT fk_id_logradouro_endereco FOREIGN KEY (id_logradouro)
REFERENCES tb_logradouro (id);*/

CREATE TABLE IF NOT EXISTS tb_telefone(
	id INT PRIMARY KEY AUTO_INCREMENT,
    numero CHAR(11) NOT NULL,
    id_aluno_telefone INT,
    
CONSTRAINT fk_id_aluno_telefone FOREIGN KEY (id_aluno_telefone) REFERENCES tb_aluno (id)    
)AUTO_INCREMENT=1;


CREATE TABLE IF NOT EXISTS tb_area_estudo(
	id INT PRIMARY KEY AUTO_INCREMENT,
	area_estudo VARCHAR(255) NOT NULL

)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_curso(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    id_area_estudo INT,
  
CONSTRAINT fk_id_area_estudo FOREIGN KEY (id_area_estudo) REFERENCES tb_area_estudo (id)     
)AUTO_INCREMENT=1;

/*
houve erro na nomeclatura!
ALTER TABLE tb_curso DROP FOREIGN KEY fk_id_area_estudo;

ALTER TABLE tb_curso 
ADD CONSTRAINT fk_id_area_estudo_curso FOREIGN KEY (id_area_estudo)
REFERENCES tb_area_estudo (id);
*/

/*
Esqueci de adicionar a restrição unique!
ALTER TABLE tb_curso
ADD CONSTRAINT uq_nome_curso UNIQUE (nome);
*/

CREATE TABLE IF NOT EXISTS tb_matricula(
	id_aluno INT,
    id_curso INT,
	PRIMARY KEY (id_aluno, id_curso),
    
CONSTRAINT fk_id_aluno_matricula FOREIGN KEY (id_aluno) REFERENCES tb_aluno (id),
CONSTRAINT fk_id_curso_matricula FOREIGN KEY (id_curso) REFERENCES tb_curso (id)    

);

CREATE TABLE IF NOT EXISTS tb_tipo_turma(
	id INT PRIMARY KEY AUTO_INCREMENT,
    prefixo VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    
CONSTRAINT uq_prefixo_tipo_turma UNIQUE (prefixo)
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_turma(
	id INT PRIMARY KEY AUTO_INCREMENT,
	numero INT NOT NULL,
    id_curso INT,
    id_tipo_turma INT,
    
CONSTRAINT fk_id_curso_turma FOREIGN KEY (id_curso) REFERENCES tb_curso (id),
CONSTRAINT fk_id_tipo_turma FOREIGN KEY (id_tipo_turma) REFERENCES tb_tipo_turma (id)    
)AUTO_INCREMENT=1;

/*DROP TABLE tb_nacionalidade;*/