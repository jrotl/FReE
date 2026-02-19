-- Criação de usuário, banco e privilégios (como root)
CREATE SCHEMA Uni;
CREATE USER 'ted'@'localhost' IDENTIFIED BY 'xyz';
SELECT * FROM mysql.user WHERE user = 'ted';
GRANT ALL PRIVILEGES ON Uni.* TO 'ted'@'localhost';

-- Criação de tabelas e inserções (como ted)
CREATE TABLE Student (name VARCHAR(45));
INSERT INTO Student(name) VALUES('Peter Chen');
SELECT * FROM Student;

-- Observar permissões e revogar privilégios (como root)
SHOW GRANTS FOR 'ted'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'ted'@'localhost';
SHOW GRANTS FOR 'ted'@'localhost';

-- Conectar-se ao banco (como ted)
USE Uni;

-- Conceder novos privilégios ao usuário ted (como root)
GRANT SELECT, UPDATE ON Uni.Student TO 'ted'@'localhost';

-- Atualizar e consultar a tabela Student (como ted)
INSERT INTO Student(name) VALUES('Gordon Everest');
SET SQL_SAFE_UPDATES = 0;
UPDATE Student SET name = 'Gordon Everest';
SELECT * FROM Student;

-- Revoguar o privilégio de SELECT do usuário ted em Student (como root)
REVOKE SELECT ON Uni.Student FROM 'ted'@'localhost';

-- Verificar os privilégios atuais do usuário ted (como root)
SHOW GRANTS FOR 'ted'@'localhost';

-- Consultar na tabela Student (como ted)
SELECT * FROM Student;

-- Alterar a senha do usuário ted (como root)
ALTER USER 'ted'@'localhost' IDENTIFIED BY 'new';

-- Renomear o usuário ted em usuário tim (como root)
RENAME USER 'ted'@'localhost' TO 'tim'@'localhost';

-- Excluir o usuário tim (como root)
DROP USER 'tim'@'localhost';

-- Criar um grupo, privilégios e colocar o usuário tim no grupo (como root)
CREATE ROLE 'dbajr';
GRANT SELECT, UPDATE ON Uni.Student TO 'dbajr';
GRANT 'dbajr' TO 'tim'@'localhost';
