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
pico_strems INT,
total_streams INT
);

SELECT * FROM top;

-- 1. Contagem de quantos artistas estão com valor nulo no nome.
SELECT COUNT(*) AS contagem
FROM top
WHERE artista IS NULL;

-- 2. Contagem total de quantos registros tem na tabela.
SELECT COUNT(*) AS contagem
FROM top;

-- 3. Contagem de quantas músicas estiveram no top 1.
SELECT COUNT(musica) AS 'top 1'
FROM top
WHERE maior_posicao = 1;

-- 4. Qual a música que ficou por mais vezes no top 1.

-- 5. Quantos artistas diferentes há.
SELECT COUNT(DISTINCT (artista))  AS diferente
FROM top
ORDER BY artista;

-- 6. Qual música com mais streams.
SELECT musica, MAX(total_streams) AS 'Maior Streams'
FROM top;

-- 7. Qual música com maior pico de streams.
SELECT musica, MAX(pico_strems) AS 'Maior Pico Streams'
FROM top;

-- 8. Qual artista ficou mais vezes no top 1.

-- 9. Qual artista possui mais registros.

-- 10. Quantos artistas possuem nome iniciando com a letra “H”.

-- 11. Quais as músicas da artista “Anitta” estão na tabela.

-- 12. Quantas músicas passaram da marca de 500 mil streams.

-- 13. Qual a música no registro 3480.

-- 14. Quantas músicas o artista “The Weeknd” possui e quais.

-- 15. Quantas músicas possuem “girl” no nome.

-- 16. Qual o total de streams do artista “Post Malone”.

-- 17. Quais são os 5 artistas com mais registros, de forma decrescente.

-- 18. Qual o total de streams das 10 músicas com mais streams.

-- 19. Quais as músicas que já estiveram no top 1 e estiveram entre 40 e 60 vezes na maior posição.

-- 20. Quais músicas tiveram menos de 500 mil streams e ficaram entre o top 5 e 10.

-- 21. Qual a música com o mínimo de streams que atingiu a 1ª posição no top 10.

-- 22. Qual a música com o mínimo de streams da artista Taylor Swift.











