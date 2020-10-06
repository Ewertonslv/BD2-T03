DROP VIEW IF EXISTS responsavelrico CASCADE;
DROP VIEW IF EXISTS responsavelgenerico CASCADE;
DROP VIEW IF EXISTS gerenteresponsavel CASCADE;
DROP VIEW IF EXISTS listadegerentes CASCADE;

CREATE VIEW listadegerentes AS
SELECT f.nome, f.codigo, f.coddepto, f.salario
FROM funcionario f RIGHT JOIN departamento d
ON f.codigo = d.codgerente
ORDER BY f.coddepto ASC;

CREATE VIEW gerenteresponsavel AS
SELECT DISTINCT lg.nome
FROM projeto p LEFT JOIN listadegerentes lg
ON p.codresponsavel = lg.codigo
ORDER BY lg.nome ASC;

CREATE VIEW responsavelgenerico AS
SELECT DISTINCT f.nome, f.coddepto, f.codigo, f.salario
FROM funcionario f LEFT JOIN projeto p
ON f.codigo = p.codresponsavel
ORDER BY f.coddepto ASC;

CREATE VIEW responsavelrico AS
SELECT DISTINCT rg.nome
FROM responsavelgenerico rg, listadegerentes lg
WHERE rg.salario > lg.salario AND rg.coddepto = lg.coddepto;

SELECT *
FROM responsavelrico
WHERE nome IS NOT NULL
UNION
SELECT *
FROM gerenteresponsavel
WHERE nome IS NOT NULL;