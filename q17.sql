DROP VIEW IF EXISTS gerenterico CASCADE;
DROP VIEW IF EXISTS maximosalario CASCADE;
DROP VIEW IF EXISTS gerentes CASCADE;

CREATE VIEW gerentes AS
SELECT f.nome, f.codigo, f.coddepto, f.salario
FROM funcionario f RIGHT JOIN departamento d
ON f.codigo = d.codgerente
ORDER BY f.coddepto ASC;

CREATE VIEW maximosalario AS
SELECT MAX(salario) AS "salario"
FROM gerentes;

CREATE VIEW gerenterico AS
SELECT f.nome, f.codigo, f.coddepto
FROM gerentes f, maximosalario m
WHERE f.salario = m.salario;

SELECT p.codigo AS "Código", p.descricao AS "Nome do projeto"
FROM projeto p, gerenterico g
WHERE p.coddepto = g.coddepto;