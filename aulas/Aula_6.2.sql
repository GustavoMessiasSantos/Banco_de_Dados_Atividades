INSERT INTO tb_pai
	(nome)
VALUES
	('Mr. Catra'),('Darth Vader'), 
    ('Odin'), ('Kyle rise'), ('Fabio Jr');
    
INSERT INTO tb_mae
	(nome)
VALUES
	('Padme'), ('Sara Connor'), ('Gretechen'), ('Rochelle');
    
 INSERT INTO tb_filho
		(nome, id_pai, id_mae)
VALUES
	('Jhon Connor', 4, 2), 
    ('Luke Skywalker', 2, 1),
    ('Leia Skywalker', 2, 1),
    ('Cris', NULL, 4),
    ('Afonso Padilha', NULL, NULL),
    ('Gabriel', 1, NULL);
 
 
SELECT 
	f.nome,
	f.id_mae,
    m.codigo,
    m.nome
FROM tb_filho AS f
RIGHT JOIN tb_mae AS m
	ON f.id_mae = m.codigo
UNION
 SELECT 
	f.nome,
	f.id_mae,
    m.codigo,
    m.nome
FROM tb_filho AS f
LEFT JOIN tb_mae AS m
	ON f.id_mae = m.codigo;
    
    
SELECT * FROM tb_filho;

SELECT id_mae, count(id_mae) from tb_filho
GROUP BY id_mae;

SELECT 
	f.nome AS filho, 
    m.nome AS mae,
    p.nome AS pai
FROM tb_filho AS f
INNER JOIN tb_mae AS m
	ON f.id_mae = m.codigo
LEFT JOIN tb_pai AS p
	ON f.id_pai = p.codigo;
 
 /*DROP TABLE tb_filho;*/
#Selecionar de outras db 
 SELECT * FROM fbr.tb_aluno;   