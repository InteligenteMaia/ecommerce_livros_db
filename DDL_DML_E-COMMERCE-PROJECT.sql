-- Comandos DDL-DML

--Criação de Tabela Usuario

CREATE TABLE Usuario 
(ID_Usuario INT PRIMARY KEY,
Nome VARCHAR(100),
Email VARCHAR(100) UNIQUE,
Senha VARCHAR(100),
Endereco VARCHAR(255)
);

--Criação de Tabela Produtos

CREATE TABLE Produtos
(ID_Produtos INT PRIMARY KEY,
Nome VARCHAR(90),
Descricao CLOB,
Preco DECIMAL(10, 2),
Estoque INT);

--Criação de Tabela Carrinho

CREATE TABLE Carrinho
(ID_Carrinho INT PRIMARY KEY,
ID_Usuario INT,
Data_Criacao DATE,
FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

--Criação de Tabela Pedido

CREATE TABLE Pedido 
(ID_Pedido INT PRIMARY KEY,
ID_Usuario INT,
ID_Carrinho INT,
Data_Pedido DATE,
Status VARCHAR(50),
FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
FOREIGN KEY (ID_Carrinho) REFERENCES Carrinho(ID_Carrinho)
);
--Criação de Tabela Pagamento

CREATE TABLE Pagamento ( 
ID_Pagamento NUMBER GENERATED ALWAYS AS IDENTITY, 
ID_Pedido INT, 
Tipo_Pagamento VARCHAR2(50), 
Data_Pagamento DATE, 
Valor_Pago DECIMAL(10, 2), 
CONSTRAINT pk_pagamento PRIMARY KEY (ID_Pagamento) );

--Criação de Tabela Carrinho_Produtos

CREATE TABLE Carrinho_Produtos
(ID_Carrinho INT,
ID_Produtos INT,
Quantidade INT,
FOREIGN KEY (ID_Carrinho) REFERENCES Carrinho(ID_Carrinho),
FOREIGN KEY (ID_Produtos) REFERENCES Produtos(ID_Produtos),
PRIMARY KEY (ID_Carrinho, ID_Produtos)
);

--Inserir dados na Tabela Usuario

INSERT INTO Usuario 
(Nome, Email, Senha, Endereco, ID_Usuario)
VALUES ('JoÃ£o Silva', 'joao@gmail.com', 'senha123', 'Rua A, 123', 1);

--Inserir dados na Tabela Produtos

INSERT INTO Produtos
(Nome, Descricao, Preco, Estoque, ID_Produtos)
VALUES ('Livro A', 'Um otimo livro de ficção, 29.90, 100, 1);

-- Inserir dados na Tabela Carrinho

INSERT INTO Carrinho
(ID_Carrinho, Data_Criacao)
VALUES (1, SYSDATE);

-- Inserir dados na Tabela Pedido,

INSERT INTO Pedido
(ID_Usuario, ID_Carrinho, ID_Pedido, Data_Pedido, Status)
VALUES (1, 1, 1, SYSDATE,'Em andamento');

--Inserir dados na Tabela Pagamento

INSERT INTO Pagamento 
INSERT INTO Pagamento (ID_Pagamento, ID_Pedido, Tipo_Pagamento, Data_Pagamento, Valor_Pago) VALUES (pagamento_seq.NEXTVAL, 1, 'Cartão de Crédito', SYSDATE, 29.90);

--Inserir dados na Tabela Carrinho_Produtos
INSERT INTO Carrinho_Produtos
(ID_Carrinho, ID_Produtos, Quantidade)
VALUES(1, 1, 1);

