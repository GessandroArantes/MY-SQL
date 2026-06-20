CREATE DATABASE locadora;

USE locadora;

CREATE TABLE cliente(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome_cliente VARCHAR(50),
email VARCHAR(50),
data_nascimento VARCHAR(20), -- Para eu ter acesso ao arquivo CSV, precisei utilizar VARCHAR.
cpf VARCHAR(15),
sexo CHAR(1)
);

CREATE TABLE diretor(
id_diretor INT PRIMARY KEY AUTO_INCREMENT,
nome_diretor VARCHAR(50)
);

CREATE TABLE filme(
id_filme INT PRIMARY KEY AUTO_INCREMENT,
titulo_filme VARCHAR(50),
ano_lancamento INT,
clas_indicativa VARCHAR(50),
genero VARCHAR(50),
id_diretor int,
FOREIGN KEY (id_diretor) REFERENCES diretor(id_diretor)
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

-- Consultar todos os clientes cadastrados
SELECT * FROM cliente;

-- Consultar todos os filmes cadastrados
SELECT * FROM filme;

-- Consultar todas as locações
SELECT * FROM locacao;

-- Consultar todos os diretores
SELECT * FROM diretor;

-- Inserindo 4 novos Filmes
INSERT INTO filme (titulo_filme, ano_lancamento, clas_indicativa, genero, id_diretor)
		VALUES
			('Homem de Ferro', 2008, '12', 'Ação', 1),
			('Capitão América: Guerra Civil', 2016, '12', 'Ação', 2),
			('Mulher-Maravilha', 2017, '12', 'Ação', 3),
			('O Homem de Aço', 2013, '12', 'Ação', 4);
            
-- Inserindo 4 novos clientes
INSERT INTO cliente (nome_cliente, email, data_nascimento, cpf, sexo) 
		VALUES
			('Amanda Arantes', 'amanda.arantes@email.com', '1995-05-12', '11122233344', 'F'),
			('Gessandro Arantes', 'gessandro.arantes@email.com', '1998-09-23', '55566677788', 'M'),
			('Geandro Arantes', 'geandro.arantes@email.com', '1987-01-30', '99900011122', 'M'),
			('Claudia Arantes', 'claudia.arantes@email.com', '2001-07-14', '44455566677', 'F');	
           
-- Inserindo 4 novas locações
INSERT INTO locacao (id_cliente, id_filme, data_emprestimo, data_devolucao, data_baixa_dev)
		VALUES
			(16, 31, '2024-04-10', '2024-04-17', NULL),
			(17, 32, '2024-04-11', '2024-04-18', NULL),
			(18, 33, '2024-04-12', '2024-04-19', NULL),
			(19, 34, '2024-04-13', '2024-04-20', NULL);

-- 1 Lista de todos os filmes do Steven Spielberg
SELECT f.titulo_filme, d.nome_diretor
FROM filme f
INNER JOIN diretor d
ON f.id_diretor = d.id_diretor
WHERE d.nome_diretor = 'Steven Spielberg';

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
SELECT f.titulo_filme, COUNT(*) AS total_locacoes
FROM locacao l
INNER JOIN filme f
ON l.id_filme = f.id_filme
GROUP BY f.id_filme, f.titulo_filme
ORDER BY total_locacoes DESC
LIMIT 10; -- Aqui possuimos 10 filmes com 4 locações cada

-- 6 Qual o cliente com mais locações?
SELECT c.nome_cliente, COUNT(*) AS total_locacoes
FROM locacao l
INNER JOIN cliente c 
ON l.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome_cliente
ORDER BY total_locacoes DESC
LIMIT 10; -- Aqui possuimos 10 clientes com 7 locações

-- 7 Qual o filme mais locado entre as mulheres?
SELECT f.titulo_filme, c.sexo, COUNT(*) AS total_locacoes
FROM locacao l
INNER JOIN filme f 
ON l.id_filme = f.id_filme
INNER JOIN cliente c 
ON l.id_cliente = c.id_cliente
WHERE c.sexo = 'F'
GROUP BY f.id_filme, f.titulo_filme
ORDER BY total_locacoes DESC
LIMIT 5; -- Aqui possuimos 5 filmes mais locado entre as mulheres com 4 locações cada

-- 8 Qual o filme mais locado entre os homens e do gênero ação?
SELECT f.titulo_filme, COUNT(*) AS total_locacoes
FROM locacao l
INNER JOIN filme f 
ON l.id_filme = f.id_filme
INNER JOIN cliente c 
ON l.id_cliente = c.id_cliente
WHERE c.sexo = 'M' AND f.genero = 'Ação' 
GROUP BY f.id_filme, f.titulo_filme
ORDER BY total_locacoes DESC
LIMIT 10; -- Aqui possuimos 2 filme mais locado entre os homens e do gênero ação com 3 locações cada

-- 9 Qual o filme locado pelo cliente do Id 7, e qual seu nome, e qual a data foi sua data de devolução?
SELECT c.nome_cliente, f.titulo_filme, l.data_devolucao
FROM locacao l
INNER JOIN cliente c 
ON l.id_cliente = c.id_cliente
INNER JOIN filme f 
ON l.id_filme = f.id_filme
WHERE c.id_cliente = 7;

-- 10 Quais os filmes foram devolvidos após a data prevista?
SELECT f.titulo_filme, l.data_devolucao AS data_prevista, l.data_baixa_dev AS data_entrega
FROM locacao l
INNER JOIN filme f 
ON l.id_filme = f.id_filme
WHERE l.data_baixa_dev > l.data_devolucao;

-- 11 Quantas vezes o filme “The Dark Knight” foi locado?
SELECT f.titulo_filme, COUNT(*) AS total_locacoes
FROM filme f
INNER JOIN locacao l 
ON f.id_filme = l.id_filme
WHERE f.titulo_filme = 'The Dark Knight'
GROUP BY f.id_filme, f.titulo_filme;

-- 12 Lista dos 5 filmes mais locados em ordem decrescente
SELECT f.titulo_filme, COUNT(*) AS total_locacoes
FROM locacao l
INNER JOIN filme f 
ON l.id_filme = f.id_filme
GROUP BY f.id_filme, f.titulo_filme
ORDER BY total_locacoes DESC
LIMIT 5; -- Obs: Possui 10 filmes mais locados com 4 locações cada

-- 13 Lista dos 3 clientes com mais locações em ordem decrescente
SELECT c.nome_cliente, COUNT(*) AS total_locacoes
FROM locacao l
INNER JOIN cliente c 
ON l.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome_cliente
ORDER BY total_locacoes DESC
LIMIT 3; -- Obs: Possui 10 clientes com 7 locações cada

-- 14 Lista de filmes que não foram devolvidos
SELECT f.titulo_filme, l.data_emprestimo, l.data_devolucao AS data_prevista, l.data_baixa_dev
FROM locacao l
INNER JOIN filme f 
ON l.id_filme = f.id_filme
WHERE l.data_baixa_dev IS NULL;

-- 15 Lista de filmes sem locação
SELECT f.titulo_filme
FROM filme f
LEFT JOIN locacao l 
ON f.id_filme = l.id_filme
WHERE l.id_locacao IS NULL;

-- Como não possuia filmes sem locação foi inserido mais 4 filmes
INSERT INTO filme (titulo_filme, ano_lancamento, clas_indicativa, genero, id_diretor)
		VALUES
			('Cidade de Deus', 2002, '16', 'Drama', 1),
			('Central do Brasil', 1998, '12', 'Drama', 2),
			('O Auto da Compadecida', 2000, '10', 'Comédia', 3),
			('Tropa de Elite', 2007, '16', 'Ação', 4);