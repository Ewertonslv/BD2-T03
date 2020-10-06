DROP VIEW IF EXISTS depgerproj CASCADE;
DROP VIEW IF EXISTS n_projetos CASCADE;

CREATE VIEW n_projetos AS
SELECT d.codigo, COUNT(p.codigo) AS "qtd"
FROM departamento d LEFT JOIN projeto p
ON d.codigo = p.coddepto
GROUP BY d.codigo
ORDER BY d.codigo ASC;

CREATE VIEW depgerproj AS
SELECT d.descricao AS "Departamento", f.nome AS "Gerente", n.qtd AS "Projetos"
FROM departamento d LEFT JOIN funcionario f
ON d.codgerente = f.codigo LEFT JOIN n_projetos n
ON d.codigo = n.codigo
ORDER BY d.codigo ASC;

SELECT * FROM depgerproj;