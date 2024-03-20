CREATE DATABASE IF NOT EXISTS db_aula5
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_aula5;

SELECT NOW();


CREATE FUNCTION fn_soma(numero1 int, numero2 int)
RETURNS INT 
DETERMINISTIC 
RETURN numero1 + numero2;

DELIMITER //
CREATE FUNCTION fn_soma2 (numero1 INT, numero2 INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE soma INT;
    
    SET soma = numero1 + numero2;
    
    RETURN soma;
    
END //
DELIMITER ;

/*LENGTH() NUMERO DE VARIAVEIS
TRIM() CORTA OS ESPAÇOS
RTRIM() CORTA OS ESPAÇOS A DIREITA
LTRIM() CORTA OS ESPAÇOS A ESQUERDA
*/
SELECT REPLACE('Gustavo o mais pika do universo', 'Gustavo', 'Gugu');

SELECT REPLACE('ABCDEFBGHI', 'B', 'b');

SELECT IFNULL(NULL, 'Dado nulo');

SELECT IF(10 > 2, 'menor', 'maior');

SET @nome = '       Jó    ';

SELECT @nome;

SELECT IF(LENGTH(TRIM(@nome)) < 3, 'nome invalido', 'valido');

SELECT fn_soma2(10, 25);

SELECT UPPER('gustavo');
SELECT LOWER('GUSTAVO');
/*
-1) a função deve remover espaços e retornar verdadeiro para textos com no minimo 3 caracteres (fn_valida_texto)

-2) remova os acentos e 'ç' de quaisquer texto (fn_remove_acento)

-3) função que remova os caracteres não numeros de um texto (fn_retorna_numeros)

-4) retorne verdadeiro caso o telefone seja valido e falso para não (fn_valida_telefone)

*/
