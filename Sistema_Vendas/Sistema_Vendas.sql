CREATE DATABASE Sistema_Vendas;
USE Sistema_Vendas;

-- 1. Tabela de Produtos (Dimensão)
CREATE TABLE produto(
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(255)
);

-- 2. Tabela de Região (Dimensão)
CREATE TABLE regiao(
    id_regiao INT PRIMARY KEY AUTO_INCREMENT,
    nome_regiao VARCHAR(255)
);

-- 3. Tabela de Venda (Fato)
CREATE TABLE venda(
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE,
    quantidade INT,
    valor_total DECIMAL(10,2),
    lucro DECIMAL(10,2),
    id_produto INT,
    id_regiao INT,
    -- O nome da tabela aqui deve ser EXATAMENTE igual ao nome usado no CREATE TABLE
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_regiao) REFERENCES regiao(id_regiao) 
);
