ALTER TABLE IF EXISTS departamento DROP CONSTRAINT gerentedepto;

DROP TABLE IF EXISTS atividadeprojeto CASCADE;
DROP TABLE IF EXISTS projeto CASCADE;
DROP TABLE IF EXISTS funcionario CASCADE;
DROP TABLE IF EXISTS departamento CASCADE;
DROP TABLE IF EXISTS atividade CASCADE;

DROP SEQUENCE IF EXISTS satividade;
DROP SEQUENCE IF EXISTS sdepartamento;
DROP SEQUENCE IF EXISTS sfuncionario;
DROP SEQUENCE IF EXISTS sprojeto;
DROP SEQUENCE IF EXISTS satividadeprojeto;

CREATE SEQUENCE satividade START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sdepartamento START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sfuncionario START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sprojeto START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE satividadeprojeto START WITH 1 INCREMENT BY 1;

CREATE TABLE atividade(
	codigo INT DEFAULT NEXTVAL('satividade'),
	descricao TEXT,
	PRIMARY KEY (codigo)
);

CREATE TABLE departamento(
	codigo INT DEFAULT NEXTVAL('sdepartamento'),
	descricao TEXT,
	codgerente INT,
	PRIMARY KEY (codigo)
);

CREATE TABLE funcionario(
	codigo INT DEFAULT NEXTVAL('sfuncionario'),
	nome VARCHAR(256),
	sexo VARCHAR(50),
	dtnasc DATE,
	salario MONEY,
	coddepto INT,
	PRIMARY KEY (codigo),
	CONSTRAINT funcionariodepto FOREIGN KEY (coddepto) REFERENCES departamento(codigo)
);

CREATE TABLE projeto(
	codigo INT DEFAULT NEXTVAL('sprojeto'),
	descricao TEXT,
	coddepto INT,
	codresponsavel INT,
	datainicio DATE,
	datafim DATE,
	PRIMARY KEY (codigo),
	CONSTRAINT departamentoproj FOREIGN KEY (coddepto) REFERENCES departamento(codigo),
	CONSTRAINT responsavelproj FOREIGN KEY (codresponsavel) REFERENCES funcionario(codigo)
);

CREATE TABLE atividadeprojeto(
	codigo INT DEFAULT NEXTVAL('satividadeprojeto'),
	codprojeto INT,
	codatividade INT,
	codresponsavel INT,
	datainicio DATE,
	datafim DATE,
	PRIMARY KEY (codigo),
	CONSTRAINT projetoap FOREIGN KEY (codprojeto) REFERENCES projeto(codigo),
	CONSTRAINT atividadeap FOREIGN KEY (codatividade) REFERENCES atividade(codigo),
	CONSTRAINT responsavelap FOREIGN KEY (codresponsavel) REFERENCES funcionario(codigo)
);

ALTER TABLE departamento ADD CONSTRAINT gerentedepto FOREIGN KEY (codgerente) REFERENCES funcionario(codigo);