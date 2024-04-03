-- Gatilho (trigger) "before delete"

CREATE TRIGGER delete_cliente
BEFORE DELETE ON cliente
FOR EACH ROW
BEGIN

INSERT INTO cliente_backup (id, nome, identificacao, endereco)
VALUES (OLD.id, OLD.nome, OLD.identificacao, OLD.endereco NOW());
END;

-- Atualização

CREATE TRIGGER atualizar_salario
AFTER INSERT ON employee 
FOR EACH ROW
BEGIN 


IF NEW.base_salary IS NULL THEN

SET NEW.base_salary = 5000;


END IF;
END;