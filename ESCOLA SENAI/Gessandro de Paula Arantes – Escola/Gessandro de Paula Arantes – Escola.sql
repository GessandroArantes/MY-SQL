
CREATE DATABASE escola_senai;

USE escola_senai;

CREATE TABLE campus(
id_campus INT PRIMARY KEY AUTO_INCREMENT,
cidade VARCHAR(255) NOT NULL,
endereco VARCHAR(255) NOT NULL
);

CREATE TABLE curso(
id_curso INT PRIMARY KEY AUTO_INCREMENT,
nome_curso VARCHAR(255) NOT NULL,
turno VARCHAR(255) NOT NULL,
dur_semestre INT(255) NOT NULL,
valor decimal(10,2) NOT NULL,
id_campus int,
FOREIGN KEY (id_campus) REFERENCES campus(id_campus)
);

CREATE TABLE Aluno(
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
nome_aluno VARCHAR(255) NOT NULL,
data_nasc DATE NOT NULL,
CPF CHAR(20) UNIQUE NOT NULL,
sexo CHAR(1) NOT NULL
);

CREATE TABLE matricula(
id_matricula INT PRIMARY KEY AUTO_INCREMENT,
data_matri DATE NOT NULL,
id_aluno INT,
id_curso INT,
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

SELECT * FROM campus;
SELECT COUNT(*) FROM campus;

SELECT * FROM curso;
SELECT COUNT(*) FROM curso;

SELECT * FROM aluno;
SELECT COUNT(*) FROM aluno;

SELECT * FROM matricula;
SELECT COUNT(*) FROM matricula;


-- 1. Lista de todos os cursos do campus de Vitória
SELECT C.nome_curso, CP.cidade
FROM curso AS C
INNER JOIN campus AS CP 
ON C.id_campus = CP.id_campus
WHERE CP.cidade = 'Vitória';

-- 2. Lista de todos os cursos em ordem Alfabética
SELECT *
FROM curso 
ORDER BY nome_curso;

-- 3. Quais os 5 cursos mais caros?
SELECT nome_curso, valor
FROM curso 
ORDER BY valor DESC
LIMIT 5;

-- 4. Qual curso é o mais barato no Campus da Serra?
SELECT C.nome_curso, C.valor, CP.cidade
FROM curso AS C
JOIN campus AS CP
ON C.id_campus = CP.id_campus
WHERE CP.cidade = 'Serra'
ORDER BY valor DESC
LIMIT 1;

-- 5. Qual o turno com mais cursos disponíveis?
SELECT turno, COUNT(*) AS total_curso
FROM curso 
GROUP BY turno
ORDER BY total_curso DESC
LIMIT 2;

-- 6. Quantos cursos duram mais de dois anos e meio?
SELECT COUNT(nome_curso) AS CONTAGEM
FROM curso
WHERE dur_semestre > 5 ;

-- 7. Quais os cursos com maior quantidade de alunos inscritos?
SELECT C.nome_curso, COUNT(M.id_aluno) AS Total_Alunos
FROM curso AS C
JOIN matricula AS M
ON M.id_curso = C.id_curso
GROUP BY C.nome_curso
ORDER BY Total_Alunos DESC
LIMIT 5;

-- 8. Qual a média de preço dos cursos listados?
SELECT AVG(valor) AS media 
FROM curso;

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
