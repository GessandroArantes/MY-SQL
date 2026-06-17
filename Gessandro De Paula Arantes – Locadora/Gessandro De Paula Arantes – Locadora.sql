CREATE DATABASE locadora;

USE locadora;

CREATE TABLE diretor(
id_diretor INT PRIMARY KEY AUTO_INCREMENT,
nome_diretor VARCHAR(60)
);

CREATE TABLE filme(
id_filme INT PRIMARY KEY AUTO_INCREMENT,
titulo_filme VARCHAR(60),
ano_lancamento INT,
clas_indicativa VARCHAR(60),
genero VARCHAR(60),
id_diretor int,
FOREIGN KEY (id_diretor) REFERENCES diretor(id_diretor)
);

CREATE TABLE cliente(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome_cliente VARCHAR(60),
email VARCHAR(60),
data_nascimento DATE,
cpf VARCHAR(15),
sexo CHAR(1)
);

CREATE TABLE locacao(
id_locacao INT PRIMARY KEY AUTO_INCREMENT,
id_cliente int,
id_filme int,
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_filme) REFERENCES filme(id_filme),
data_emprestimo DATE,
data_devolucao DATE,
data_baixa_dev DATE
);

-- 1 Lista de todos os filmes do Steven Spielberg
SELECT f.titulo_filme, d.nome_diretor
FROM filme f
INNER JOIN diretor d
ON f.id_diretor = d.id_diretor
WHERE d.nome_diretor = 'Steven Spielberg';
-- corrigir

-- 2 Lista de todos os filmes por ordem de lançamento
SELECT titulo_filme, ano_lancamento
FROM filme
ORDER BY ano_lancamento ASC;

-- 3 Lista de todos os filmes por do gênero Drama e Romance
SELECT titulo_filme, genero
FROM filme
WHERE genero IN ('Drama', 'Romance');


-- 4 Lista de todos os filmes de terror com classificação de -18 anos
SELECT titulo_filme, genero, clas_indicativa 
FROM filme
WHERE genero = 'terror' AND clas_indicativa < '18';

-- 5 Qual o nome filme mais locado?
SELECT f.titulo_filme, COUNT(l.id_locacao) AS TOTAL
FROM locacao l
INNER JOIN filme f
ON f.id_filme = l.id_filme
GROUP BY f.titulo_filme
ORDER BY f.titulo_filme ASC;
-- corrigir

-- 6 Qual o cliente com mais locações?
SELECT c.nome_cliente, COUNT(l.id_locacao) AS TOTAL_LOCACAO 
FROM locacao l
INNER JOIN cliente c
ON c.id_cliente = l.id_cliente
GROUP BY c.nome_cliente
ORDER BY l.id_locacao ASC;

-- 7 Qual o filme mais locado entre as mulheres?
SELECT f.titulo_filme, c.sexo, COUNT(l.id_locacao) AS TOTAL
FROM locacao l
INNER JOIN filme f
ON f.id_filme = l.id_filme
INNER JOIN c.cliente
ON c.id_cliente = l.id_cliente
WHERE c.sexo = 'M';
-- corrigir

-- 8 Qual o filme mais locado entre os homens e do gênero ação?


-- 9 Qual o filme locado pelo cliente do Id 7, e qual seu nome, e qual a data foi sua data de devolução?
SELECT f.titulo_filme, c.nome_cliente, l.data_devolucao
FROM filme f
INNER JOIN cliente c 
ON f.id_cliente = c.id_cliente
WHERE c.id_cliente = '7'
INNER JOIN locacao l
ON f.id_locacao = l.id_locacao
ORDER BY l.data_devolucao;
-- CORRTIGIR

-- 10 Quais os filmes foram devolvidos após a data prevista?
SELECT f.titulo_filme, l.data_devolucao, l.data_baixa_dev
FROM filme f
INNER JOIN locacao l
ON f.id_filme = l.id_filme
where l.data_baixa_dev > l.data_devolucao;

-- 11 Quantas vezes o filme “The Dark Knight” foi locado?
SELECT f.titulo_filme, COUNT(l.id_locacao)
FROM filme f
INNER JOIN locacao l
ON f.id_filme = l.id_filme
WHERE f.titulo_filme = 'The Dark Knight';

-- 12 Lista dos 5 filmes mais locados em ordem decrescente
SELECT DISTINCT f.titulo_filme, COUNT(l.id_locacao)
FROM filme f
INNER JOIN locacao l
ON f.id_filme = l.id_filme
ORDER BY f.titulo_filme DESC
LIMIT 5;
-- CORRIGIR
-- 13 Lista dos 3 clientes com mais locações em ordem decrescente
SELECT c.nome_cliente, COUNT(l.id_locacao) AS TOTAL_LOCACAO 
FROM locacao l
INNER JOIN cliente c
ON c.id_cliente = l.id_cliente
GROUP BY c.nome_cliente
ORDER BY c.nome_cliente DESC
LIMIT 3;

-- 14 Lista de filmes que não foram devolvidos
SELECT f.titulo_filme, l.data_devolucao, l.data_baixa_dev
FROM filme f
LEFT JOIN locacao l
ON f.id_filme = l.id_filme
where l.data_devolucao IS NOT NULL;
-- CORRIGIR

-- 15 Lista de filmes sem locação












































