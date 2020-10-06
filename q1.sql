DROP VIEW IF EXISTS funcionarios_de_elite CASCADE;

CREATE VIEW funcionarios_de_elite AS
SELECT nome
FROM funcionario
WHERE funcionario.salario > (	SELECT MAX(salario)
							 	FROM funcionario
							 	WHERE funcionario.coddepto = 5
							);

SELECT * FROM funcionarios_de_elite;