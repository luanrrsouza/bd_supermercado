/* Para registrar um novo relatório gerado: */
INSERT INTO relatorios (Tipo, Data_geracao, Conteudo) VALUES ('Relatório de Vendas', NOW(), 'Vendas totais por cliente');

/* Relatório de produtos mais vendidos: */
SELECT P.Nome, SUM(PT.Quantidade) AS QuantidadeVendida FROM Produtos P JOIN Produto_Transacao PT ON P.ID_Produto = PT.ID_Produto JOIN Transacao T ON PT.ID_Transacao = T.ID_Transacao WHERE T.Tipo = 'Venda' GROUP BY P.Nome ORDER BY QuantidadeVendida DESC;

/* Para gerar um novo relatório de vendas: */
SELECT c.Nome, SUM(t.Valor) AS TotalVendas FROM transacao t JOIN clientes c ON t.ID_cliente = c.ID_cliente WHERE t.Tipo = 'Venda' GROUP BY c.Nome;

/* Para atualizar um indicador no dashboard: */
INSERT INTO indicador (Nome, Valor, Data_atualizacao) VALUES ('Vendas Totais', (SELECT SUM(t.Valor) FROM transacao t WHERE t.Tipo = 'Venda'), NOW());