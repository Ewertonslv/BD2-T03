DROP VIEW IF EXISTS idoso_fora CASCADE;

CREATE VIEW idoso_fora AS
SELECT nome
FROM funcionario
WHERE dtnasc > 	(	SELECT MIN(dtnasc)
				 	FROM funcionario
				);
				
SELECT * FROM idoso_fora;