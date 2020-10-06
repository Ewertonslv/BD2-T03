DROP VIEW IF EXISTS juntarprojdepresp CASCADE;
DROP VIEW IF EXISTS projresp CASCADE;
DROP VIEW IF EXISTS projdepto CASCADE;
DROP VIEW IF EXISTS respproj CASCADE;

CREATE VIEW projdepto AS
SELECT p.descricao AS "nomeprojeto", d.descricao AS "nomedepto", p.codigo, p.coddepto, p.codresponsavel
FROM projeto p LEFT JOIN departamento d
ON p.coddepto = d.codigo;

CREATE VIEW respproj AS
SELECT f.nome, d.descricao, f.codigo, f.coddepto, d.codigo AS "depto"
FROM projeto p LEFT JOIN funcionario f
ON p.codresponsavel = f.codigo LEFT JOIN departamento d
ON f.coddepto = d.codigo;

CREATE VIEW juntarprojdepresp AS
SELECT DISTINCT pd.nomeprojeto AS "Nome do projeto", pd.nomedepto AS "Departamento do projeto", rp.nome AS "Responsável", rp.descricao AS "Departamento do responsável"
FROM projdepto pd LEFT JOIN respproj rp
ON pd.coddepto != rp.coddepto AND pd.codresponsavel = rp.codigo;

SELECT * FROM juntarprojdepresp;