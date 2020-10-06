DROP VIEW IF EXISTS respproj CASCADE;
DROP VIEW IF EXISTS qtdatividades CASCADE;

CREATE VIEW respproj AS
SELECT p.descricao, f.nome, p.codigo
FROM projeto p LEFT JOIN funcionario f
ON p.codresponsavel = f.codigo;

CREATE VIEW qtdatividades AS
SELECT p.codigo AS "codprojeto", COUNT(ap.codprojeto) AS "qtdatividade", COUNT(ap.codresponsavel) AS "qtdresp"
FROM projeto p LEFT JOIN atividadeprojeto ap
ON p.codigo = ap.codprojeto
GROUP BY p.codigo
ORDER BY p.codigo ASC;

SELECT rp.descricao AS "Nome do projeto", rp.nome AS "Nome do responsável", qa.qtdatividade AS "Quantidade de atividades",
		SUM(qa.qtdresp) AS "Quantidade de responsáveis por atividades"
FROM respproj rp LEFT JOIN qtdatividades qa
ON rp.codigo = qa.codprojeto
GROUP BY rp.descricao, rp.nome, qa.qtdatividade;