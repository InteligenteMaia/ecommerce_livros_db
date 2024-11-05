-- 1) Criar Log
DROP TABLE LOG;
--
CREATE TABLE log (
    id INT PRIMARY KEY NOT NULL,
    nome_tabela VARCHAR(50) NOT NULL,
    operacao VARCHAR(10) NOT NULL CHECK (operacao IN ('INSERT', 'UPDATE', 'DELETE')),
    valor_atual VARCHAR(500),
    valor_novo VARCHAR(500)
);

-- 2) Configurar uma Sequência para o ID do Log 

CREATE SEQUENCE log_seq START WITH 1 INCREMENT BY 1;

-- 3) Criar as Triggers para Auditoria na Tabela Produto
-- a.	Trigger para INSERT na tabela Produto

CREATE OR REPLACE TRIGGER log_insert_produto
AFTER INSERT ON Produto
FOR EACH ROW
BEGIN
  INSERT INTO log (id, nome_tabela, operacao, valor_novo)
  VALUES (log_seq.NEXTVAL, 'Produto', 'INSERT', :NEW.nome);
END;

---

CREATE OR REPLACE TRIGGER log_insert_produto
AFTER INSERT ON Produto
FOR EACH ROW
BEGIN
  INSERT INTO log (id, nome_tabela, operacao, valor_novo)
  VALUES (log_seq.NEXTVAL, 'Produto', 'INSERT', :NEW.nome);
END;

-- b.	Trigger para UPDATE na tabela Produto:

CREATE OR REPLACE TRIGGER log_update_produto
AFTER UPDATE ON Produto
FOR EACH ROW
BEGIN
  INSERT INTO log (id, nome_tabela, operacao, valor_atual, valor_novo)
  VALUES (log_seq.NEXTVAL, 'Produto', 'UPDATE', OLD.nome, NEW.nome);
END;

-- c. Trigger para DELETE na tabela Produto:

CREATE OR REPLACE TRIGGER log_delete_produto
AFTER DELETE ON Produto
FOR EACH ROW
BEGIN
  INSERT INTO log (id, nome_tabela, operacao, valor_atual)
  VALUES (log_seq.NEXTVAL, 'Produto', 'DELETE', OLD.nome);
END;

-- 4) Testar as Triggers
-- a) Inserindo um Produto

INSERT INTO Produto (id, nome) VALUES (1, 'Livro Aventura');


-- b) Atualizando o Produto
UPDATE Produto SET nome = 'Livro Aventura 2' WHERE id = 1;

-- c) Deletando o Produto

DELETE FROM Produto WHERE id = 1;

--  5) Consultar a Tabela de Logs
SELECT * FROM log;





