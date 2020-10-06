DROP VIEW IF EXISTS projdeptoresppert CASCADE;
DROP VIEW IF EXISTS responsaveis_proj CASCADE;

CREATE VIEW responsaveis_proj AS
SELECT f.nome, d.descricao, f.codigo
FROM funcionario f RIGHT JOIN projeto p
ON f.codigo = p.codresponsavel LEFT JOIN departamento d
ON f.coddepto = d.codigo
ORDER BY f.codigo ASC;

CREATE VIEW projdeptoresppert AS
SELECT p.descricao AS "Nome do projeto", d.descricao AS "Departamento do projeto", 
		rp.nome AS "Responsável", rp.descricao AS "Departamento do responsável"
FROM projeto p LEFT JOIN departamento d
ON p.coddepto = d.codigo LEFT JOIN responsaveis_proj rp
ON p.codresponsavel = rp.codigo;

SELECT * FROM projdeptoresppert;