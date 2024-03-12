CREATE DATABASE IF NOT EXISTS bd_biblioteca
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE bd_biblioteca;

CREATE TABLE IF NOT EXISTS tb_autor(
	codigo INT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tb_editora(
	codigo INT PRIMARY KEY,
    nome VARCHAR(255),
    cidade VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tb_genero(
	codigo INT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tb_livro(
	isbn VARCHAR(255) PRIMARY KEY,
    titulo VARCHAR(255),
    edicao INT,
    volume INT,
    codigo_editora INT,
    codigo_genero INT,
    CONSTRAINT fk_editora_livro FOREIGN KEY (codigo_editora) REFERENCES tb_editora(codigo),
    CONSTRAINT fk_genero_livro FOREIGN KEY (codigo_genero) REFERENCES tb_genero(codigo)
);

CREATE TABLE IF NOT EXISTS tb_autoria(
	livro_isbn VARCHAR(45),
    autor_codigo INT,
    CONSTRAINT fk_livro_isbn FOREIGN KEY (livro_isbn) REFERENCES tb_livro(isbn),
    CONSTRAINT fk_autor_codigo FOREIGN KEY (autor_codigo) REFERENCES tb_autor(codigo)
);

CREATE TABLE IF NOT EXISTS tb_exemplar(
	codigo INT PRIMARY KEY,
    livro_isbn VARCHAR(45),
    CONSTRAINT fk_livro_isbn_exemplar FOREIGN KEY (livro_isbn) REFERENCES tb_livro(isbn)
);

CREATE TABLE IF NOT EXISTS tb_usuario(
	cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tb_emprestimo(
	codigo INT PRIMARY KEY,
    exemplar_codigo INT,
    usuario_cpf VARCHAR(11),
    data_emprestimo DATE,
    data_entrega DATE,
    prazo INT,
    CONSTRAINT fk_exemplar_codigo FOREIGN KEY (exemplar_codigo) REFERENCES tb_exemplar(codigo),
    CONSTRAINT fk_usario_cpf FOREIGN KEY (usuario_cpf) REFERENCES tb_usuario(cpf)
);

/*Professor sei que fiz errado mas estou mandando minha tentativa espero que não infarte kkkk, foi só uma piadinha*/

ALTER TABLE tb_usuario
ADD COLUMN perfil_codigo INT;

ALTER TABLE tb_usuario
ADD CONSTRAINT fk_perfil_codigo
FOREIGN KEY (perfil_codigo) REFERENCES tb_emprestimo(codigo);