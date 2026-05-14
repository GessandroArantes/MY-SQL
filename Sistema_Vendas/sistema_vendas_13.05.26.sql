CREATE DATABASE sistema_vendas;

USE sistema_vendas;

CREATE TABLE usuarios(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100),
cargo VARCHAR(50),
departamento VARCHAR(50),
ativo TINYINT(1),
email VARCHAR(45),
senha VARCHAR(45)
);

CREATE TABLE produtos(
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
categoria VARCHAR(50),
preco_custo DECIMAL(10,2),
preco_venda DECIMAL(10,2),
quantidade_estoque INT(11)
);

CREATE TABLE clientes(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
cidade VARCHAR(100),
estado CHAR(2),
limite_credito decimal(10,2),
data_cadasto DATE
);

CREATE TABLE pedidos(
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
data_pedido DATE,
status_pedido VARCHAR(30),
forma_pagamento VARCHAR(50),
id_cliente INT,
id_usuario INT,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE itens_pedido(
id_item INT PRIMARY KEY AUTO_INCREMENT,
quantidade INT(11),
preco_unitario decimal(10,2),
id_pedido INT,
id_produto INT,
FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
