CREATE DATABASE spotify;

USE spotify;


CREATE TABLE top(
posicao INT PRIMARY KEY AUTO_INCREMENT,
artista VARCHAR(50),
musica VARCHAR(255),
dias INT,
top_vezes DOUBLE,
maior_posicao INT,
vezes_maior_posicao VARCHAR(10),
pico_streams INT,
total_streams BIGINT
);

SELECT * FROM top;

-- 1. Contagem de quantos artistas estão com valor nulo no nome.
SELECT COUNT(*) AS Artistas_Com_Valor_Nulo
FROM top
WHERE artista IS NULL;

-- 2. Contagem total de quantos registros tem na tabela.
SELECT COUNT(*) AS Total_de_Registros
FROM top;

-- 3. Contagem de quantas músicas estiveram no top 1.
SELECT COUNT(musica) AS TOP_1
FROM top
WHERE maior_posicao = 1;

-- 4. Qual a música que ficou por mais vezes no top 1.
SELECT musica, vezes_maior_posicao
FROM top
WHERE maior_posicao = 1
ORDER BY CAST(REPLACE(REPLACE(vezes_maior_posicao, '(x', ' '), ')', ' ') AS UNSIGNED) DESC
LIMIT 1;

-- 5. Quantos artistas diferentes há.
SELECT COUNT(DISTINCT (artista)) AS Artistas_Diferentes
FROM top;

-- 6. Qual música com mais streams.
SELECT musica, total_streams
FROM top
ORDER BY total_streams DESC
LIMIT 1;

SELECT musica, total_streams
FROM top
WHERE total_streams = (
SELECT MAX(total_streams)
FROM top
);
-- 7. Qual música com maior pico de streams.
SELECT musica, pico_streams
FROM top
ORDER BY pico_streams DESC
LIMIT 1;

SELECT musica, pico_streams
FROM top
WHERE pico_stremas = (SELECT max(pico_streams) FROM top);

-- 8. Qual artista ficou mais vezes no top 1.
SELECT artista, vezes_maior_posicao
FROM top
WHERE maior_posicao = 1
ORDER BY CAST(REPLACE(REPLACE(vezes_maior_posicao, '(x', ' '), ')', ' ') AS UNSIGNED) DESC
LIMIT 1;

-- 9. Qual artista possui mais registros.
SELECT artista, COUNT(*) AS Total_Registro
FROM top
GROUP BY artista 
ORDER BY Total_Registro DESC
LIMIT 1;

-- 10. Quantos artistas possuem nome iniciando com a letra “H”.
SELECT COUNT(DISTINCT artista)
FROM top
WHERE artista 
LIKE 'h%';

-- 11. Quais as músicas da artista “Anitta” estão na tabela.
SELECT DISTINCT musica, artista
FROM top
WHERE artista 
LIKE '%Anitta%';

-- 12. Quantas músicas passaram da marca de 500 mil streams.
SELECT COUNT(musica) 
FROM top
WHERE pico_streams > 500000;

-- 13. Qual a música no registro 3480.
SELECT posicao, musica, artista
FROM top
WHERE posicao = 3480;

-- 14. Quantas músicas o artista “The Weeknd” possui e quais.
SELECT COUNT(DISTINCT musica) AS Total_Musicas,
GROUP_CONCAT(musica) AS lista 
FROM top
WHERE artista 
LIKE '%The Weeknd%';

-- 15. Quantas músicas possuem “girl” no nome.
SELECT COUNT(DISTINCT musica) 
FROM top
WHERE musica 
LIKE '%girl%';

-- 16. Qual o total de streams do artista “Post Malone”.
SELECT artista, SUM(total_streams)
FROM top
WHERE artista 
LIKE '%Post Malone%';

-- 17. Quais são os 5 artistas com mais registros, de forma decrescente.
SELECT artista, COUNT(*) AS Total_Registro
FROM top
GROUP BY artista 
ORDER BY Total_Registro DESC
LIMIT 5;

-- 18. Qual o total de streams das 10 músicas com mais streams.
SELECT SUM(total_streams) AS Total_Streams
FROM (SELECT total_streams
		FROM top
		ORDER BY total_streams DESC
		LIMIT 10) AS Total;

-- 19. Quais as músicas que já estiveram no top 1 e estiveram entre 40 e 60 vezes na maior posição.
SELECT musica, vezes_maior_posicao
FROM top
WHERE maior_posicao = 1
AND CAST(REPLACE(REPLACE(vezes_maior_posicao, '(x', ' '), ')', ' ') AS UNSIGNED) BETWEEN 40 AND 60
ORDER BY vezes_maior_posicao DESC;

-- 20. Quais músicas tiveram menos de 500 mil streams e ficaram entre o top 5 e 10.
SELECT musica, maior_posicao, pico_streams
FROM top
WHERE pico_streams < 500000 AND  maior_posicao between 5 AND 10
ORDER BY pico_streams DESC;

-- 21. Qual a música com o mínimo de streams que atingiu a 1ª posição no top 10.
SELECT musica, artista, total_streams
FROM top
WHERE maior_posicao = 1
ORDER BY total_streams ASC
LIMIT 1;

-- 22. Qual a música com o mínimo de streams da artista Taylor Swift.
SELECT artista, musica, total_streams
FROM top
WHERE artista 
LIKE "%Taylor Swift%"
ORDER BY total_streams ASC
LIMIT 1;

-- Enunciado: Quais músicas têm total de streams acima da média?
-- SUBQUERIE
SELECT musica, total_streams
FROM top
WHERE total_streams > (
SELECT AVG(total_streams)
FROM top
);



