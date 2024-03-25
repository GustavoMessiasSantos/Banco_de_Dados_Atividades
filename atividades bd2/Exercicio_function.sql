CREATE DATABASE IF NOT EXISTS db_functions
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_functions;

DELIMITER //
CREATE FUNCTION fn_valida_texto(texto VARCHAR(255))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    
	SET texto = REPLACE(texto, ' ', '');		
    
    IF CHAR_LENGTH(texto)>=3 THEN
		RETURN 'texto possui 3 caracteres ou mais';
    ELSE
		RETURN 'texto invalido';
    END IF;
    
END //
DELIMITER ;

/*DROP FUNCTION fn_valida_texto;*/
SELECT fn_valida_texto('        oi        ') AS resultado;

DELIMITER //
CREATE FUNCTION fn_remove_acento(str VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	SET str = LOWER(str);
    SET str = REPLACE(str, 'á', 'a');
    SET str = REPLACE(str, 'à', 'a');
    SET str = REPLACE(str, 'â', 'a');
    SET str = REPLACE(str, 'ã', 'a');
    SET str = REPLACE(str, 'ä', 'a');
    SET str = REPLACE(str, 'é', 'e');
    SET str = REPLACE(str, 'è', 'e');
    SET str = REPLACE(str, 'ê', 'e');
    SET str = REPLACE(str, 'ë', 'e');
    SET str = REPLACE(str, 'í', 'i');
    SET str = REPLACE(str, 'ì', 'i');
    SET str = REPLACE(str, 'î', 'i');
    SET str = REPLACE(str, 'ï', 'i');
    SET str = REPLACE(str, 'ó', 'o');
    SET str = REPLACE(str, 'ò', 'o');
    SET str = REPLACE(str, 'ô', 'o');
    SET str = REPLACE(str, 'õ', 'o');
    SET str = REPLACE(str, 'ö', 'o');
    SET str = REPLACE(str, 'ú', 'u');
    SET str = REPLACE(str, 'ù', 'u');
    SET str = REPLACE(str, 'û', 'u');
    SET str = REPLACE(str, 'ü', 'u');
    SET str = REPLACE(str, 'ç', 'c');
    SET str = REPLACE(str, 'ñ', 'n');
    RETURN str;
END//

DELIMITER ;

SELECT fn_remove_acento('Paralelepípedo');

DELIMITER //
CREATE FUNCTION fn_retorna_numeros (cpf VARCHAR(14))
RETURNS VARCHAR(11)
DETERMINISTIC
BEGIN
	SET cpf = REPLACE(REPLACE(cpf, '.', ''), '-', '');
    RETURN cpf;
END//

DELIMITER ;

SELECT fn_retorna_numeros('123.456.789-10');

DELIMITER //
CREATE FUNCTION fn_valida_telefone(telefone VARCHAR(255))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	SET telefone = REPLACE(REPLACE(REPLACE(REPLACE(telefone, ')', ''),'(', ''),'-', ''), ' ', '');
    IF CHAR_LENGTH(telefone) = 10 OR CHAR_LENGTH(telefone) = 11 THEN
		RETURN TRUE;
    ELSE 
		RETURN FALSE;
    END IF;    
END//

DELIMITER ;

SELECT fn_valida_telefone('11 4002-8922');
SELECT fn_valida_telefone('61909990000');
SELECT fn_valida_telefone('0800 000 1234');
SELECT fn_valida_telefone('3384-8357');