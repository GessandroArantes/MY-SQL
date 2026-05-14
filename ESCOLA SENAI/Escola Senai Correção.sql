CREATE DATABASE escolasenai;

USE escolasenai;


-- CRIANDO TABELA CAMPUS
CREATE TABLE tb_campus(
    id_campus INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(40),
    endereco VARCHAR(45)
);

-- CRIANDO TABELA CURSOS
CREATE TABLE tb_curso(
    cod_cur INT PRIMARY KEY AUTO_INCREMENT,
    nome_cur VARCHAR(50),
    turno VARCHAR(15),
    duracao INT,
    valor DECIMAL(6,2),
    id_campus INT,
    FOREIGN KEY (id_campus) REFERENCES tb_campus(id_campus)
);

-- Criando Tabela Aluno
CREATE TABLE tb_aluno(
ra_alu INT PRIMARY KEY AUTO_INCREMENT,
nome_alun VARCHAR(37),
dt_nasc DATE,
cpf VARCHAR(14),
sexo ENUM("F", "M", "C")
);

-- CRIANDO TABELA MATRICULAS
CREATE TABLE tb_matricula(
    cod_mat INT PRIMARY KEY AUTO_INCREMENT,
    dt_mat DATE,
    ra_alu INT,
    FOREIGN KEY (ra_alu) REFERENCES tb_aluno(ra_alu),
    cod_cur INT,
    FOREIGN KEY (cod_cur) REFERENCES tb_curso(cod_cur)
);

-- 1. Lista de todos os cursos do campus de Vitória
SELECT nome_cur, cidade
FROM tb_campus AS cam
JOIN tb_curso AS cur
ON cam.id_campus = cur.id_campus
WHERE cam.cidade = "Vitória";

-- 2. Lista de todos os cursos em ordem Alfabética
SELECT nome_cur
FROM tb_curso 
ORDER BY nome_cur ASC;

-- 3. Quais os 5 cursos mais caros?
SELECT nome_cur, valor
FROM tb_curso 
ORDER BY valor DESC
LIMIT 5;

-- 4. Qual curso é o mais barato no Campus da Serra?
SELECT nome_cur, valor, cidade
FROM tb_campus AS cam
JOIN tb_curso AS cur
ON cam.id_campus = cur.id_campus
WHERE cam.cidade = 'Serra'
ORDER BY valor 
LIMIT 1;

-- 5. Qual o turno com mais cursos disponíveis?
SELECT turno, COUNT(*) AS total_curso
FROM tb_curso 
GROUP BY turno
ORDER BY total_curso DESC
LIMIT 2;

-- 6. Quantos cursos duram mais de dois anos e meio?
SELECT COUNT(duracao) AS CONTAGEM
FROM tb_curso
WHERE duracao > 5 ;

-- 7. Quais os cursos com maior quantidade de alunos inscritos?
SELECT cur.nome_cur, COUNT(mat.cod_cur) AS contagem 
FROM tb_matricula AS mat 
JOIN tb_curso AS cur 
ON mat.cod_cur = cur.cod_cur 
GROUP BY cur.nome_cur 
HAVING contagem = 8 
ORDER BY contagem DESC;

-- 8. Qual a média de preço dos cursos listados?
SELECT AVG(valor) AS media_preco
FROM tb_curso;

-- 9. Quais cursos duram mais tempo?
SELECT nome_cur, duracao
FROM tb_curso
ORDER BY duracao DESC
LIMIT 5;

-- 10. Quantos alunos estão matriculados em cada turno?
SELECT cur.turno, COUNT(cur.turno) AS Total_Alunos
FROM tb_curso AS cur
INNER JOIN tb_matricula AS mat
ON mat.cod_cur = cur.cod_cur
GROUP BY cur.turno;

-- 11. Qual o campus com mais cursos?
SELECT cidade, COUNT(cidade) AS Total
FROM tb_campus AS cam
INNER JOIN tb_curso AS cur
ON cam.id_campus = cur.id_campus
GROUP BY cidade
ORDER BY Total DESC
LIMIT 1;

-- 12. Quais cursos não possuem alunos cadastrados?
SELECT nome_cur, cod_mat
FROM tb_curso AS cur
LEFT JOIN tb_matricula AS mat
ON mat.cod_cur = cur.cod_cur
WHERE mat.cod_mat IS NULL;

-- 13. Quem se matriculou em 2021?
SELECT alu.nome_alun, mat.dt_mat
FROM tb_aluno AS alu
INNER JOIN tb_matricula AS mat
ON alu.ra_alu = mat.ra_alu
WHERE mat.dt_mat BETWEEN '2021-01-01' AND '2021-12-31';

-- 14 Qual a data de matrícula da aluna “Fernanda Lima”?
SELECT alu.nome_alun, mat.dt_mat
FROM tb_aluno AS alu
JOIN tb_matricula AS mat
ON alu.ra_alu = mat.ra_alu
WHERE alu.nome_alun = "Fernanda Lima";

-- 15 Quais alunos não se cadastraram em nenhum curso?
SELECT nome_alun, cod_mat
FROM tb_aluno AS alu
LEFT JOIN tb_matricula as mat
ON alu.ra_alu = mat.ra_alu
WHERE mat.cod_mat IS NULL;

-- 16. Quantas alunas matriculadas até o momento?
SELECT COUNT(DISTINCT(alu.nome_alun)) as CONTAGEM
FROM tb_aluno AS alu
JOIN tb_matricula as mat
ON alu.ra_alu = mat.ra_alu
WHERE alu.sexo = "F";

-- 17. Quais alunos estão matriculados em 3 cursos?
SELECT alu.nome_alun, COUNT(mat.ra_alu) AS vezes
FROM tb_aluno AS alu
JOIN tb_matricula AS mat ON alu.ra_alu = mat.ra_alu
GROUP BY alu.nome_alun
HAVING vezes = 3;     

-- 18. Qual o curso do aluno "Guilherme Costa"?
SELECT *
FROM vw_alunos_e_cursos
WHERE aluno = "Guilherme Costa";

-- 19. Quais os alunos matriculados em "Ciência da computação"
SELECT *
FROM vw_alunos_e_cursos
WHERE curso = "Ciência da computação";

-- 20. Relação completa de todos os alunos e seus cursos
CREATE VIEW vw_alunos_e_cursos AS
SELECT alu.nome_alun AS aluno, cur.nome_cur AS CURSO
	FROM tb_matricula AS mat
		JOIN tb_aluno AS alu
			ON alu.ra_alu = mat.ra_alu
		JOIN tb_curso AS cur
			ON cur.cod_cur = mat.cod_cur;

SELECT *
FROM vw_alunos_e_cursos;

