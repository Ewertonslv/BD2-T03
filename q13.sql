DROP VIEW IF EXISTS projativdatas CASCADE;

CREATE VIEW projativdatas AS
SELECT p.descricao AS "Nome do projeto", p.datainicio AS "Início do projeto", p.datafim AS "Fim do projeto",
		a.descricao AS "Nome da atividade", ap.datainicio AS "Início da atividade", ap.datafim AS "Fim da atividade"
FROM projeto p LEFT JOIN atividadeprojeto ap
ON p.codigo = ap.codprojeto LEFT JOIN atividade a
ON ap.codatividade = a.codigo;

SELECT *
FROM projativdatas
WHERE "Nome da atividade" IS NOT NULL AND ("Início do projeto"::DATE > "Início da atividade"::DATE OR
										  "Fim do projeto"::DATE < "Fim da atividade"::DATE);