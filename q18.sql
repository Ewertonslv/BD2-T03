DROP VIEW IF EXISTS maximosalariodepto CASCADE;

CREATE VIEW maximosalariodepto AS
SELECT d.codigo, d.descricao, MAX(f.salario) AS "salario"
FROM departamento d LEFT JOIN funcionario f
ON d.codigo = f.coddepto
GROUP BY d.codigo
ORDER BY d.codigo ASC;

SELECT f.nome AS "Nome do funcionário", ms.descricao AS "Nome do departamento"
FROM maximosalariodepto ms LEFT JOIN funcionario f
ON ms.codigo = f.coddepto AND ms.salario = f.salario
ORDER BY f.salario ASC;