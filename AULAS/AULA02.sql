-- Cria o banco
CREATE DATABASE campeonato;

-- Utilzando o banco
USE campeonato;

DROP DATABASE campeonato;
-- Cria a tabela equipe
CREATE TABLE  equipe (
cod_equipe INT PRIMARY KEY AUTO_INCREMENT,
nome_equipe VARCHAR(47) NOT NULL,
sigla_equipe CHAR(3) UNIQUE,
estado CHAR(2)
);

-- Cria a tabela de jogador
CREATE TABLE jogador(
    cod_jogador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nacionalidade VARCHAR(50),
    altura DECIMAL(3,2),
    peso DECIMAL(6,3),
    idade INT,
    numero_camisa INT,
    posicao ENUM("GOLEIRO", "ZAGUEIRO", "MEIO_CAMPO", "ATACANTE"),
    id_equipe INT,
    FOReIGN KEY (id_equipe) REFERENCES equipe(cod_equipe)
);

-- CRUD NO BANCO
-- FORMA 1 - COM COLUNA
INSERT INTO equipe (nome_equipe, sigla_equipe, estado)
			VALUES ("GAMA", "GAM", "DF"),
				   ("São Paulo", "SPA", "SP"),
                    ("Gremio", "GRE", "MG");
                    
-- FORMA 2 - SEM COLUNA
INSERT INTO equipe 
VALUES (DEFAULT, "Vasco da Gama", "VAS", "RJ");
 
 SELECT * FROM equipe;
 
 
INSERT INTO equipe 
VALUES (DEFAULT, "Flamengo", "FLA", "SP");

INSERT INTO equipe 
VALUES (DEFAULT, "Cruzeiro", "CRU", "MG");

INSERT INTO equipe 
VALUES (DEFAULT, "Fluminense", "FLu", "RJ");

INSERT INTO equipe 
VALUES (DEFAULT, "Real Madrid", "mad", "PA");

-- U - UPDATE
UPDATE equipe
SET estado = "MD"
WHERE nome_equipe = "Real Madrid";

UPDATE equipe
SET sigla_equipe = "MAD"
WHERE nome_equipe = "Real Madrid";

UPDATE equipe
SET sigla_equipe = "FLU"
WHERE nome_equipe = "Fluminense";

SELECT * FROM equipe;

-- D - DELETE
DELETE FROM equipe
WHERE cod_equipe = 0;

-- INSERIR
INSERT INTO jogador (nome, peso, numero_camisa, posicao, id_equipe)
			VALUES("Vinicius Jr", 73.0, 7, "ATACANTE", 4);
            
INSERT INTO jogador (nome, peso, numero_camisa, posicao, id_equipe)
			VALUES("Neymar Jr", 70.5, 10, "GOLEIRO", 1),
				  ("Ronaldinho Gaucho", 78.0, 99, "ZAGUEIRO", 2),
                  ("Ronaldinho Fenomeno", 98.0, 7, "MEIO_CAMPO", 3);

SELECT * FROM jogador;








































 