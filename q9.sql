DROP VIEW IF EXISTS respostaq9 CASCADE;
DROP VIEW IF EXISTS ganhamaisquegerente CASCADE;
DROP VIEW IF EXISTS listaderesponsaveis CASCADE;
DROP VIEW IF EXISTS listadegerentes CASCADE;
DROP VIEW IF EXISTS qtdproj CASCADE;

CREATE VIEW listaderesponsaveis AS
SELECT DISTINCT f.nome, f.codigo, f.salario
FROM funcionario f RIGHT JOIN projeto p
ON f.codigo = p.codresponsavel
ORDER BY f.codigo ASC;

CREATE VIEW listadegerentes AS
SELECT f.codigo, f.salario
FROM funcionario f RIGHT JOIN departamento p
ON f.codigo = p.codgerente
ORDER BY f.codigo ASC;

CREATE VIEW ganhamaisquegerente AS
SELECT DISTINCT lr.codigo, lr.nome, lr.salario
FROM listaderesponsaveis lr, listadegerentes lg
WHERE lr.salario > lg.salario;

CREATE VIEW qtdproj AS
SELECT f.codigo, COUNT(p.codresponsavel) AS "qtd"
FROM projeto p LEFT JOIN funcionario f
ON p.codresponsavel = f.codigo
GROUP BY f.codigo
ORDER BY f.codigo ASC;

CREATE VIEW respostaq9 AS
SELECT gm.nome AS "Responsável", qp.qtd AS "Qtd. Projetos", gm.salario AS "Salário"
FROM ganhamaisquegerente gm LEFT JOIN qtdproj qp
ON gm.codigo = qp.codigo;

SELECT * FROM respostaq9;