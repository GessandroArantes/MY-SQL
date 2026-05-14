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
SELECT C.nome_curso, COUNT(M.id_aluno) AS Total_Alunos
FROM curso AS C
JOIN matricula AS M
ON M.id_curso = C.id_curso
GROUP BY C.nome_curso
ORDER BY Total_Alunos DESC
LIMIT 5;

-- 8. Qual a média de preço dos cursos listados?
SELECT AVG(valor) AS media_preco
FROM tb_curso;

-- 9. Quais cursos duram mais tempo?
SELECT nome_curso, dur_semestre
FROM curso
ORDER BY dur_semestre DESC
LIMIT 5;

-- 10. Quantos alunos estão matriculados em cada turno?
SELECT C.turno, COUNT(M.id_aluno) AS Total_Alunos
FROM matricula AS M
INNER JOIN curso AS C
ON M.id_curso = C.id_curso
GROUP BY C.turno;

-- 11. Qual o campus com mais cursos?
SELECT CP.cidade, COUNT(C.id_curso) AS Campus_Mais_Curso
FROM campus AS CP
INNER JOIN curso AS C
ON CP.id_campus = C.id_campus
GROUP BY CP.cidade
ORDER BY Campus_Mais_Curso DESC
LIMIT 1;

-- 12. Quais cursos não possuem alunos cadastrados?
SELECT C.nome_curso
FROM curso AS C
LEFT JOIN matricula AS M
ON C.id_curso = M.id_curso
WHERE id_matricula IS NULL;

-- 13. Quem se matriculou em 2021?
SELECT A.nome_aluno, M.data_matri
FROM aluno AS A
INNER JOIN matricula AS M
ON A.id_aluno = M.id_aluno
WHERE YEAR(M.data_matri) = 2021;

-- 14. Qual a data de matrícula da aluna "Fernanda Lima"?
SELECT A.nome_aluno, M.data_matri
FROM matricula AS M
INNER JOIN aluno AS A 
ON M.id_aluno = A.id_aluno
WHERE A.nome_aluno = 'Fernanda Lima';

-- 15. Quais alunos não se cadastraram em nenhum curso?
SELECT A.nome_aluno 
FROM aluno AS A
LEFT JOIN matricula AS M
ON A.id_aluno = M.id_aluno
WHERE id_matricula IS NULL;

-- 16. Quantas alunas matriculadas até o momento?
SELECT COUNT(A.sexo)
FROM matricula AS M
INNER JOIN aluno AS A 
ON M.id_aluno = A.id_aluno
WHERE A.sexo = 'F';

-- 17. Quais alunos estão matriculados em 3 cursos?
SELECT * FROM 
		(SELECT A.nome_aluno, COUNT(M.id_curso) AS _3_Cursos
         FROM aluno AS A
         INNER JOIN matricula AS M
         ON A.id_aluno = M.id_aluno
         GROUP BY A.nome_aluno) AS Contagem
WHERE _3_Cursos = 3;         

-- 18. Qual o curso do aluno "Guilherme Costa"?
SELECT A.nome_aluno, C.nome_curso 
FROM curso AS C
INNER JOIN matricula AS M
ON C.id_curso = M.id_curso
INNER JOIN aluno AS A
ON M.id_aluno = A.id_aluno
WHERE A.nome_aluno = "Guilherme Costa";

-- 19. Quais os alunos matriculados em "Ciência da computação"
SELECT A.nome_aluno, C.nome_curso 
FROM curso AS C
INNER JOIN matricula AS M
ON C.id_curso = M.id_curso
INNER JOIN aluno AS A
ON M.id_aluno = A.id_aluno
WHERE C.nome_curso = "Ciência da computação";

-- 20. Relação completa de todos os alunos e seus cursos
SELECT A.nome_aluno, C.nome_curso
FROM curso AS C
INNER JOIN matricula AS M
ON C.id_curso = M.id_curso
INNER JOIN aluno AS A
ON A.id_aluno = M.id_aluno;



















