/* Para o fluxo de caixa, imaginamos os seguintes cenários: */

/* Registrar uma nova transação de venda: */
INSERT INTO clientes(Nome, Contato) VALUES ('Luan', 'luanrodrigo@gmail.com'); -- Registrando um cliente para associar à ele a transação
INSERT INTO transacao (Tipo, Data_transacao, Valor, ID_produto, ID_cliente) VALUES ('Venda', NOW(), 102.50, 1, 1);

INSERT INTO clientes(Nome, Contato) VALUES ('Eric', 'eric@gmail.com'); -- Registrando um cliente para associar à ele a transação
INSERT INTO transacao (Tipo, Data_transacao, Valor, ID_produto, ID_cliente) VALUES ('Venda', NOW(), 320.00, 4, 2);

INSERT INTO clientes(Nome, Contato) VALUES ('Matheus', 'luanrodrigo@gmail.com'); -- Registrando um cliente para associar à ele a transação
INSERT INTO transacao (Tipo, Data_transacao, Valor, ID_produto, ID_cliente) VALUES ('Venda', NOW(), 50.00, 3, 3);

/* Relacionando o produto à transação e diminuindo o estoque:  */
INSERT INTO produto_transacao (ID_Produto, ID_Transacao, Quantidade) VALUES (1,1,2);
UPDATE produtos SET Quantidade_estoque = Quantidade_estoque -2 WHERE ID_Produto = 1;

/* Registrar uma despesa(sangria): */
INSERT INTO transacao (Tipo, Data_transacao, Valor) VALUES ('Despesa', NOW(), -500.00);

/* Para obter o fluxo de caixa por clientes: */
SELECT Tipo, SUM(Valor) AS Total FROM transacao GROUP BY Tipo;
