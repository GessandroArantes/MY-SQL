CREATE DATABASE spotify;

-- Utilizando o banco para relizar as operações
USE spotify;

-- Criando tabela
CREATE TABLE top(
posicao INT PRIMARY KEY AUTO_INCREMENT,
artista VARCHAR(50),
musica VARCHAR(255),
dias INT,
top_vezes DOUBLE,
maior_posicao INT,
vezs_maior_posicao VARCHAR(10),
pico_strems INT
);

SELECT * FROM spotify.top;

-- Filtrando colunas
SELECT musica, maior_posicao
FROM top;

SELECT posicao, artista, musica
FROM top;

-- Filtrando com WHERE
SELECT posicao, artista, musica
FROM top
WHERE artista = "Travis Scott";

SELECT posicao, artista, musica
FROM top
WHERE artista = "XXXTENTACION";

-- Filtrando Operadores Relacionais - <, >, <>, <=, >=
SELECT *
FROM top
WHERE top_vezes = 100;


-- Filtrando Operadores Lógicos - AND - E, OR - OU, NOT - NÃO
SELECT *
FROM top
WHERE artista = "SZA" AND maior_posicao = 5;

-- Ordenando - ORDER BY, ASC - DE CIMA PRA BAIXO, DESC - DE BAIXO PRA CIMA
SELECT artista, musica
FROM top
ORDER BY artista DESC;

SELECT artista, musica
FROM top
ORDER BY artista ASC;

-- ENTRE - BETWEEN
SELECT *
FROM top
WHERE maior_posicao BETWEEN 10 AND 15;

-- Filtrando entre os nomes Drake e Khalid 
 SELECT posicao, artista, musica 
 FROM top WHERE artista BETWEEN  "Drake" 
 AND "Khalid";

SELECT *
FROM top
WHERE artista BETWEEN "Adele" AND "Calvin Harris"
ORDER BY artista;

-- IN - DENTRO DE UMA LISTA
SELECT *
FROM top
WHERE artista IN ('Justin Bieber', 'Maroon 5', 'Queen');

SELECT *
FROM top
WHERE dias IN (20, 30, 40);

-- LIKE - PESQUISA NOMES
SELECT artista, musica
FROM top
WHERE musica LIKE 'Super%';

SELECT artista, musica
FROM top
WHERE musica LIKE '%blue';

SELECT artista, musica
FROM top
WHERE musica LIKE '%boy%';

-- COUNT
SELECT COUNT(*) AS contagem
FROM top; 

SELECT COUNT(*) AS contagem
FROM top
WHERE artista = 'Travis Scott';

-- DISTINCT - REGISTROS DIFERENTES
SELECT DISTINCT (artista)  AS diferente
FROM top; 

-- CINTAGEM DE ARTISTAS DIFERENTES
SELECT COUNT(DISTINCT (artista))  AS diferente
FROM top
ORDER BY artista;

-- AGRUPAR RESULTADOS
SELECT artista
FROM top
ORDER BY artista;

-- LIMIT - LIMITA OS RESULTADOS
SELECT *
FROM top
WHERE maior_posicao = 7
LIMIT 5;

-- SUM - SOMA DE RESULTADOS
SELECT SUM(total_streams) AS total_streams_da_tabela
FROM top;

-- AVG Média de Resultados
SELECT AVG(total_streams) AS total_streams_da_tabela
FROM top;

-- MAX - VALOR MÁXIMO DE RESULTADO
 SELECT MAX(total_streams) AS total_streams_da_tabela
FROM top;

-- MIN - VALOR MINIMO DE RESULTADO
SELECT MIN(total_streams) AS total_streams_da_tabela
FROM top;

-- VERIFICA SE O VALOR É NULO
SELECT *
FROM top
WHERE maior_posicao IS NULL;








