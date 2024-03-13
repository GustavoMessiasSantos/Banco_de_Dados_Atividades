/*
- Auto_increment nas 3 tabelas <Feito>
- os nomes são not null <Feito>
- todas as primarias se chamam 'id' <Feito>
- a mae e o pai também devem ter data de nascimento <Feito>
- todos os varchar são NOT NULL com 255 <Feito>
- id_pai na tabela filho deve ser NOT NULL <Feito>
*/

ALTER TABLE tb_mae
CHANGE codigo id INT;

ALTER TABLE tb_mae
ADD COLUMN data_nascimento DATE AFTER nome;

ALTER TABLE tb_pai
ADD COLUMN data_nascimento DATE AFTER nome;

ALTER TABLE tb_mae
MODIFY nome VARCHAR(255) NOT NULL;

ALTER TABLE tb_mae
MODIFY id INT AUTO_INCREMENT;

ALTER TABLE tb_pai
MODIFY id INT AUTO_INCREMENT;

ALTER TABLE tb_filho
MODIFY id_pai INT NOT NULL;

DESCRIBE tb_mae;
DESCRIBE tb_pai;
DESCRIBE tb_filho;

SELECT * FROM tb_mae;

