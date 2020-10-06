DROP VIEW IF EXISTS mdo CASCADE;

CREATE VIEW mdo AS
SELECT nome, salario, coddepto
FROM funcionario
WHERE codigo NOT IN	(	SELECT codgerente
						FROM departamento
						WHERE codgerente IS NOT NULL)
ORDER BY coddepto ASC;

SELECT * FROM mdo;