-- Cria o banco de dados com suporte a emojis e caracteres especiais (utf8mb4)
CREATE DATABASE IF NOT EXISTS sistema_vendas
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8_unicode_ci;

-- UTILIZA O BANCO PARA AS PRÓXIMAS OPERAÇÕES
USE sistema_vendas;

-- -----------------------------------------------------
-- Table USUÁRIOS
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS usuarios (
  `id_usuario` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `cargo` VARCHAR(50) NOT NULL,
  `departamento` VARCHAR(50) NULL DEFAULT NULL,
  `ativo` BOOLEAN DEFAULT TRUE,
  `email` VARCHAR(45) NULL UNIQUE,
  `senha` VARCHAR(45) NULL,
  `perfil` ENUM('ADM', 'GERENTE', 'VENDEDOR', 'ESTOQUISTA', 'VISUALIZADOR')
);

-- -----------------------------------------------------
-- Table CLIENTES
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS clientes (
  -- DADOS PESSOAIS
  `id_cliente` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `CPF_CNPJ` VARCHAR(20) UNIQUE,
  `email` VARCHAR(100) UNIQUE,
  `telefone` VARCHAR(20),
  `tipo` ENUM('FÍSICO', 'JURÍDICO'),

  -- ENDEREÇO
  `cidade` VARCHAR(100),
  `estado` CHAR(2),
  `cep` VARCHAR(10),
  `logradouro` VARCHAR(100),
  `pais` VARCHAR(20),
  `numero` VARCHAR(5),
  `bairro` VARCHAR(20),
  `complemento` VARCHAR(50),

  -- ADICIONAIS
  `limite_credito` DECIMAL(10, 2) NULL DEFAULT '0.00',
  `data_cadastro` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table PRODUTOS
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS produtos(
  `id_produto` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `categoria` VARCHAR(50) NOT NULL,
  `sku` VARCHAR(50) NOT NULL,
  `preco_custo` DECIMAL(10,2) NOT NULL,
  `preco_venda` DECIMAL(10,2) NOT NULL,
  `quantidade_estoque` INT(11) NOT NULL DEFAULT 0,
  `estoque_minimo` INT DEFAULT 0,
  `status` BOOLEAN DEFAULT TRUE,
  `fornecedor` VARCHAR(50) NOT NULL
);


-- -----------------------------------------------------
-- Table PEDIDOS
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS pedidos (
  `id_pedido` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `id_cliente` INT(11) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  `data_pedido` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `status_pedido` ENUM('PENDENTE', 'CONCLUIDO', 'CANCELADO', 'EM ANDAMENTO'),
  `valor_total` DECIMAL(10,2) DEFAULT 0.00,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- -----------------------------------------------------
-- Table ITENS-PEDIDOS
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS itens_pedido (
  `id_item` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `id_pedido` INT(11) NOT NULL,
  `id_produto` INT(11) NOT NULL,
  `quantidade` INT NOT NULL,
  `preco_unitario` DECIMAL(10,2),
  `desconto_percentual` DECIMAL(5,2) DEFAULT 0.00,
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- -----------------------------------------------------
-- Table PAGAMENTOS
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS pagamentos (
  `id_pagamento` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `id_pedido` INT(11) NOT NULL,
  `metodo_pagamento` ENUM('PIX', 'CREDITO', 'DEBITO', 'DINHEIRO', 'BOLETO', 'TICKET'),
  `valor_pago` DECIMAL(10,2) NOT NULL,
  `status` ENUM('PENDENTE', 'APROVADO', 'RECUSADO') DEFAULT 'PENDENTE',
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);













