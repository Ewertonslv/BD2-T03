DROP VIEW IF EXISTS soldado_veterano CASCADE;

CREATE VIEW soldado_veterano AS
SELECT nome, dtnasc
FROM funcionario
WHERE dtnasc < '1999-10-05'::DATE
AND codigo NOT IN	(	SELECT codgerente
						FROM departamento
					 	WHERE codgerente IS NOT NULL
					);

SELECT * FROM soldado_veterano;