-- Create DataBase

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Table structure for table `categoria`

CREATE TABLE categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  nome_categoria VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_categoria)
);

INSERT INTO categoria (id_categoria, nome_categoria) VALUES
  (1, 'Eletrônicos'),
  (2, 'Roupas'),
  (3, 'Livros'),
  (4, 'Beleza'),
  (5, 'Esportes'),
  (6, 'Móveis');

-- Table structure for table `cliente`

CREATE TABLE cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefone VARCHAR(20),
  data_nascimento DATE,
  cpf VARCHAR(14),
  data_aniversario CHAR(5) NOT NULL,
  id_perfil INT,
  PRIMARY KEY (id_cliente),
  UNIQUE KEY email (email),
  UNIQUE KEY cpf (cpf),
  KEY fk_perfil_cliente (id_perfil),
  CONSTRAINT fk_perfil_cliente FOREIGN KEY (id_perfil) REFERENCES perfil_cliente (id_perfil)
);

INSERT INTO cliente (id_cliente, nome, email, telefone, data_nascimento, cpf, data_aniversario, id_perfil) VALUES
  (1, 'Ana Souza', 'ana.souza@email.com', '11999998888', '1990-05-20', '123.456.789-00', '20-05', 2),
  (2, 'Bruno Lima', 'bruno.lima@email.com', '21988887777', '1985-03-14', '234.567.890-11', '14-03', 2),
  (3, 'Camila Rocha', 'camila.rocha@email.com', '31977776666', '1992-12-25', '345.678.901-22', '25-12', 2),
  (4, 'Diego Martins', 'diego.martins@email.com', '41966665555', '1988-09-30', '456.789.012-33', '30-09', 3),
  (5, 'Eduarda Pires', 'eduarda.pires@email.com', '51955554444', '1995-11-10', '567.890.123-44', '10-11', 2),
  (6, 'Felipe Alves', 'felipe.alves@email.com', '61944443333', '2000-07-08', '678.901.234-55', '08-07', 1);

-- Table structure for table `endereco`

CREATE TABLE endereco (
  id_cliente INT NOT NULL,
  rua VARCHAR(100),
  numero VARCHAR(10),
  cidade VARCHAR(50),
  estado VARCHAR(2),
  cep VARCHAR(10),
  PRIMARY KEY (id_cliente),
  CONSTRAINT endereco_ibfk_1 FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

INSERT INTO endereco (id_cliente, rua, numero, cidade, estado, cep) VALUES
  (1, 'Rua das Flores', '123', 'São Paulo', 'SP', '01001-000'),
  (2, 'Av. Brasil', '456', 'Rio de Janeiro', 'RJ', '20040-002'),
  (3, 'Rua da Liberdade', '789', 'Belo Horizonte', 'MG', '30130-010'),
  (4, 'Rua Curitiba', '321', 'Curitiba', 'PR', '80010-000'),
  (5, 'Av. Ipiranga', '654', 'Porto Alegre', 'RS', '90010-001'),
  (6, 'Rua Goiás', '987', 'Goiânia', 'GO', '74000-000');

-- Table structure for table `evento_especial`

CREATE TABLE evento_especial (
  id_evento INT NOT NULL AUTO_INCREMENT,
  nome_evento VARCHAR(100) NOT NULL,
  data_evento DATE,
  desconto_percentual DECIMAL(5,2) NOT NULL,
  tipo_evento ENUM('DATA_FIXA', 'ANIVERSARIO') NOT NULL,
  PRIMARY KEY (id_evento)
);

INSERT INTO evento_especial (id_evento, nome_evento, data_evento, desconto_percentual, tipo_evento) VALUES
  (1, 'Natal', '2025-12-25', 20.00, 'DATA_FIXA'),
  (2, 'Dia das Mães', '2025-05-11', 15.00, 'DATA_FIXA'),
  (3, 'Black Friday', '2025-11-28', 30.00, 'DATA_FIXA'),
  (4, 'Dia do Consumidor', '2025-03-15', 10.00, 'DATA_FIXA'),
  (5, 'Aniversário do Cliente', NULL, 40.00, 'ANIVERSARIO');

-- Table structure for table `item_pedido`

CREATE TABLE item_pedido (
  id_item INT NOT NULL AUTO_INCREMENT,
  id_pedido INT NOT NULL,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  subtotal DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id_item),
  KEY (id_pedido),
  KEY (id_produto),
  CONSTRAINT FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
  CONSTRAINT FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO item_pedido (id_item, id_pedido, id_produto, quantidade, preco_unitario, subtotal) VALUES
  (1, 1, 1, 1, 199.90, 199.90),
  (2, 1, 3, 1, 99.90, 99.90),
  (3, 2, 2, 1, 89.90, 89.90),
  (4, 3, 5, 1, 49.90, 49.90),
  (5, 3, 6, 1, 39.90, 39.90),
  (6, 4, 7, 1, 129.90, 129.90),
  (7, 4, 8, 1, 99.90, 99.90),
  (8, 4, 9, 1, 69.90, 69.90),
  (9, 5, 10, 1, 79.90, 79.90),
  (10, 5, 11, 1, 39.90, 39.90),
  (11, 6, 12, 1, 899.90, 899.90),
  (12, 6, 1, 1, 199.90, 199.90),
  (13, 7, 12, 1, 899.90, 899.90),
  (14, 8, 11, 1, 499.90, 499.90),
  (15, 9, 4, 2, 59.95, 119.90),
  (16, 9, 3, 1, 99.90, 99.90),
  (17, 10, 5, 2, 59.90, 119.80),
  (18, 11, 6, 2, 74.90, 149.80),
  (19, 12, 4, 1, 49.90, 49.90),
  (20, 13, 9, 1, 79.90, 79.90);

-- Table structure for table `pagamento`

CREATE TABLE pagamento (
  id_pagamento INT NOT NULL AUTO_INCREMENT,
  id_pedido INT NOT NULL,
  forma_pagamento ENUM('PIX','Débito','Crédito','Boleto') NOT NULL,
  status_pagamento ENUM('Pendente','Aprovado','Recusado','Cancelado') NOT NULL DEFAULT 'Pendente',
  data_pagamento DATETIME DEFAULT NULL,
  valor_pago DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (id_pagamento),
  KEY (id_pedido),
  CONSTRAINT FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

INSERT INTO pagamento (id_pagamento, id_pedido, forma_pagamento, status_pagamento, data_pagamento, valor_pago) VALUES
  (1, 1, 'PIX', 'Aprovado', '2025-12-25 10:15:00', 159.92),
  (2, 2, 'Débito', 'Aprovado', '2025-07-10 14:32:00', 89.90),
  (3, 3, 'Crédito', 'Aprovado', '2025-05-11 09:47:00', 72.42),
  (4, 4, 'Crédito', 'Aprovado', '2025-11-28 20:01:00', 209.97),
  (5, 5, 'PIX', 'Aprovado', '2025-03-15 16:20:00', 107.91),
  (6, 6, 'Boleto', 'Aprovado', '2025-12-25 11:08:00', 239.85),
  (7, 7, 'Crédito', 'Aprovado', '2025-07-08 13:15:00', 899.90),
  (8, 8, 'Débito', 'Aprovado', '2025-07-08 13:45:00', 499.90),
  (9, 9, 'PIX', 'Aprovado', '2025-09-30 10:00:00', 139.90),
  (10, 10, 'Crédito', 'Aprovado', '2025-11-28 18:30:00', 119.88),
  (11, 11, 'Débito', 'Aprovado', '2025-11-10 15:22:00', 89.85),
  (12, 12, 'Boleto', 'Aprovado', '2025-03-15 17:05:00', 44.91),
  (13, 13, 'PIX', 'Aprovado', '2025-10-01 08:59:00', 79.90);

-- Table structure for table `pedido`

CREATE TABLE pedido (
  id_pedido INT NOT NULL AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  data_pedido DATE NOT NULL,
  valor_total DECIMAL(10,2) DEFAULT NULL,
  id_evento INT DEFAULT NULL,
  PRIMARY KEY (id_pedido),
  KEY (id_cliente),
  KEY (id_evento),
  CONSTRAINT pedido_ibfk_1 FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  CONSTRAINT pedido_ibfk_2 FOREIGN KEY (id_evento) REFERENCES evento_especial(id_evento)
);

INSERT INTO pedido (id_pedido, id_cliente, data_pedido, valor_total, id_evento) VALUES
  (1, 1, '2025-12-25', 159.92, 1),
  (2, 1, '2025-07-10', 89.90, NULL),
  (3, 1, '2025-05-11', 72.42, 2),
  (4, 2, '2025-11-28', 209.97, 3),
  (5, 2, '2025-03-15', 107.91, 4),
  (6, 3, '2025-12-25', 239.85, 1),
  (7, 4, '2025-07-08', 899.90, NULL),
  (8, 4, '2025-07-08', 499.90, NULL),
  (9, 4, '2025-09-30', 139.90, 5),
  (10, 4, '2025-11-28', 119.88, 3),
  (11, 5, '2025-11-10', 89.85, 5),
  (12, 5, '2025-03-15', 44.91, 4),
  (13, 6, '2025-10-01', 79.90, NULL),
  (14, 1, '2025-06-15', 150.00, NULL),
  (15, 5, '2025-05-20', 150.00, NULL);

-- Table structure for table `perfil_cliente`

CREATE TABLE perfil_cliente (
  id_perfil INT NOT NULL AUTO_INCREMENT,
  nome_perfil VARCHAR(50) NOT NULL,
  gasto_minimo DECIMAL(10,2) NOT NULL,
  gasto_maximo DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id_perfil)
);

INSERT INTO perfil_cliente (id_perfil, nome_perfil, gasto_minimo, gasto_maximo) VALUES
  (1, 'Conservador', 0.00, 199.99),
  (2, 'Moderado', 200.00, 1000.00),
  (3, 'Arrojado', 1000.01, 9999999.99);

-- Table structure for table `produto`

CREATE TABLE produto (
  id_produto INT NOT NULL AUTO_INCREMENT,
  nome_produto VARCHAR(100) NOT NULL,
  descricao TEXT,
  preco DECIMAL(10,2) NOT NULL,
  estoque INT DEFAULT 0,
  id_categoria INT DEFAULT NULL,
  PRIMARY KEY (id_produto),
  KEY id_categoria (id_categoria),
  CONSTRAINT produto_ibfk_1 FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

INSERT INTO produto (id_produto, nome_produto, descricao, preco, estoque, id_categoria) VALUES
  (1, 'Fone Bluetooth', 'Fone sem fio com cancelamento de ruído', 199.90, 50, 1),
  (2, 'Carregador Turbo', 'Carregador rápido USB-C 30W', 89.90, 80, 1),
  (3, 'Camiseta Básica', 'Camiseta de algodão unissex', 39.90, 100, 2),
  (4, 'Jaqueta Jeans', 'Jaqueta casual estilo urbano', 159.90, 30, 2),
  (5, 'O Hobbit', 'Livro de fantasia de J.R.R. Tolkien', 49.90, 70, 3),
  (6, 'Clean Code', 'Guia de boas práticas em programação', 99.90, 40, 3),
  (7, 'Perfume Floral', 'Fragrância feminina com notas doces', 129.90, 25, 4),
  (8, 'Creme Facial', 'Hidratante com proteção solar FPS 30', 59.90, 60, 4),
  (9, 'Bola de Futebol', 'Bola oficial tamanho 5', 79.90, 45, 5),
  (10, 'Luvas de Academia', 'Luvas para treino com proteção', 39.90, 70, 5),
  (11, 'Cadeira Gamer', 'Cadeira ergonômica com ajuste de altura', 899.90, 15, 6),
  (12, 'Mesa de Escritório', 'Mesa com tampo de madeira e estrutura metálica', 499.90, 10, 6);

-- Procedure to update customer profiles based on their total spending on orders

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AtualizarPerfisClientes`()
BEGIN
    UPDATE cliente c
    JOIN (
        SELECT 
            p.id_cliente,
            SUM(p.valor_total) AS total_gasto
        FROM pedido p
        GROUP BY p.id_cliente
    ) gastos ON c.id_cliente = gastos.id_cliente
    JOIN perfil_cliente pc 
      ON gastos.total_gasto BETWEEN pc.gasto_minimo AND pc.gasto_maximo
    SET c.id_perfil = pc.id_perfil;
END ;;
DELIMITER ;