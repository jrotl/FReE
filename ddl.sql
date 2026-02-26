CREATE SCHEMA Running_B;
USE Running_B;

CREATE TABLE Escola (
nome VARCHAR(20) NOT NULL,
cidade VARCHAR(20) NOT NULL,
telefone VARCHAR(15),
conceito CHAR(1),
CONSTRAINT PK_Escola PRIMARY KEY (nome,cidade)
);

CREATE TABLE Professor (
professor_id SMALLINT NOT NULL,
primeiroNome VARCHAR(20),
sobrenome VARCHAR(20),
telefone VARCHAR(15),
titulo CHAR(3),
cargaHoraria TINYINT,
CONSTRAINT PK_Professor PRIMARY KEY (professor_id)
);

CREATE TABLE Exame (
primeiroNome VARCHAR(20) NOT NULL,
sobrenome VARCHAR(20) NOT NULL,
cpf CHAR(11) NOT NULL PRIMARY KEY,
email VARCHAR(255) NOT NULL UNIQUE,
cep INT,
dataNascimento DATE,
idade TINYINT,
resultado DECIMAL(4,2),
nomeEscola VARCHAR(20),
cidadeEscola VARCHAR(20),
feedback TEXT,
aprovado BOOLEAN,
professor SMALLINT NOT NULL,
CONSTRAINT FK_ExameEscola FOREIGN KEY(nomeEscola,cidadeEscola)
REFERENCES Escola(nome,cidade),
CONSTRAINT FK_ExameProfessor FOREIGN KEY(professor)
REFERENCES Professor(professor_id)
);
