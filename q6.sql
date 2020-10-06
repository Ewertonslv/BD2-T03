DROP VIEW IF EXISTS nomsaldes CASCADE;

CREATE VIEW nomsaldes AS
SELECT f.nome, f.salario, d.descricao
FROM funcionario f LEFT JOIN departamento d
ON f.coddepto = d.codigo;

SELECT * FROM nomsaldes;