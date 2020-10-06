DROP VIEW IF EXISTS funcrespativ CASCADE;

CREATE VIEW funcrespativ AS
SELECT f.nome, COUNT(ap.codigo)
FROM funcionario f RIGHT JOIN atividadeprojeto ap
ON f.codigo = ap.codresponsavel
GROUP BY f.nome
ORDER BY count DESC;

SELECT nome AS "Funcionário responsável por atividade", count AS "Qtd. de atividades"
FROM funcrespativ;