DROP VIEW IF EXISTS descnomqtd CASCADE;
DROP VIEW IF EXISTS n_funcionarios_no_depto CASCADE;

CREATE VIEW n_funcionarios_no_depto AS
SELECT d.codigo, COUNT(f.codigo) AS "qtd"
FROM departamento d LEFT JOIN funcionario f
ON d.codigo = f.coddepto
GROUP BY d.codigo
ORDER BY d.codigo ASC;

CREATE VIEW descnomqtd AS
SELECT d.descricao AS "Departamento", f.nome AS "Gerente", n.qtd AS "Funcionários"
FROM departamento d LEFT JOIN funcionario f
ON d.codgerente = f.codigo LEFT JOIN n_funcionarios_no_depto n
ON d.codigo = n.codigo;

SELECT * FROM descnomqtd;