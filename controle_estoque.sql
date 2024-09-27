/* Nesse exemplo, imaginamos que o lojista ampliou significativamente o tamanho de sua loja e contratou mais funcionários e agora ele precisa que todos os produtos tenham sua localização exata
no estoque a fim de poupar tempo na hora que precisar manusear esses itens(Por na prateleira, guardar novos pedidos, etc) : */

ALTER TABLE produtos ADD COLUMN Localizacao VARCHAR(255);



/* Usamos o insert para registrar a entrada de produtos: */

INSERT INTO produtos (Nome, Descricao, Preco, Quantidade_estoque, Data_entrada, Localizacao) VALUES ('Arroz', 'Arroz Integral', 20.50, 100, NOW(), 'Setor 1');
INSERT INTO produtos (Nome, Descricao, Preco, Quantidade_estoque, Data_entrada, Localizacao) VALUES ('Macarrão', 'Macarrão Espaquete', 21.00, 50, NOW(), 'Setor 1');
INSERT INTO produtos (Nome, Descricao, Preco, Quantidade_estoque, Data_entrada, Localizacao) VALUES ('Feijão', 'Feijão Carioca', 25.00, 70, NOW(), 'Setor 1');
INSERT INTO produtos (Nome, Descricao, Preco, Quantidade_estoque, Data_entrada, Localizacao) VALUES (' Coca-Cola 2L', 'Refrigerante de cola 2L Coca Cola', 9.99, 35, NOW(), 'Setor 3');

UPDATE produtos SET Quantidade_estoque = Quantidade_estoque - 2, Data_saida = NOW() WHERE ID_produto = 1;
UPDATE produtos SET Quantidade_estoque = Quantidade_estoque - 5, Data_saida = NOW() WHERE ID_produto = 2;
UPDATE produtos SET Quantidade_estoque = Quantidade_estoque - 3, Data_saida = NOW() WHERE ID_produto = 3;
UPDATE produtos SET Quantidade_estoque = Quantidade_estoque - 6, Data_saida = NOW() WHERE ID_produto = 4;

-- Alterando o preço dos produtos em estoque:
UPDATE produtos SET Preco = 19.50 WHERE ID_produto = 1;
UPDATE produtos SET Preco = 24 WHERE ID_produto = 2;

SELECT * FROM produtos;
