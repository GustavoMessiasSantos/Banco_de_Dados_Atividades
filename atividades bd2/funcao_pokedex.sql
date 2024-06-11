DELIMITER $$
CREATE FUNCTION fn_validar_minusculo(input VARCHAR(255)) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE lowercaseInput VARCHAR(255);
    
    SET lowercaseInput = LOWER(input);
    
    IF input = lowercaseInput THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END $$

DELIMITER ;

#Colocarei a procedure aqui para economizar arquivo!

