CREATE SCHEMA supermercado;

use supermercado;

/* Tabelas principais: */

CREATE TABLE produtos (
ID_produto INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Descricao VARCHAR(255) DEFAULT '-',
Preco FLOAT DEFAULT 0,
Quantidade_estoque FLOAT DEFAULT 0,
Data_entrada TIMESTAMP,
Data_saida TIMESTAMP
);

CREATE TABLE fornecedor(
ID_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255),
Contato VARCHAR(255),
Endereco VARCHAR(255)
);

CREATE TABLE clientes(
ID_cliente INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255),
Contato VARCHAR(255)
);

CREATE TABLE relatorios(
ID_relatorio INT AUTO_INCREMENT PRIMARY KEY,
Tipo VARCHAR(255),
Data_geracao TIMESTAMP,
Conteudo VARCHAR(255)
);

CREATE TABLE indicador(
ID_indicador INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255),
Valor FLOAT,
Data_atualizacao TIMESTAMP
);

/* Criando a tabela de transações, que depende de produtos e clientes: */

CREATE TABLE transacao(
ID_transacao INT AUTO_INCREMENT PRIMARY KEY,
Tipo VARCHAR(255),
Data_transacao TIMESTAMP,
Valor FLOAT,
ID_produto INT,
ID_cliente INT,
FOREIGN KEY (ID_produto) REFERENCES produtos(ID_produto),
FOREIGN KEY (ID_cliente) REFERENCES clientes(ID_cliente)
);

/* Tabelas intermediárias: */

CREATE TABLE Produto_Transacao (
ID_produto INT NOT NULL,
ID_transacao INT NOT NULL,
Quantidade INT NOT NULL,
PRIMARY KEY (ID_produto, ID_transacao),
FOREIGN KEY (ID_produto) REFERENCES produtos(ID_produto),
FOREIGN KEY (ID_transacao) REFERENCES transacao(ID_transacao)
);

CREATE TABLE Cliente_Transacao (
ID_cliente INT NOT NULL,
ID_transacao INT NOT NULL,
PRIMARY KEY (ID_cliente, ID_transacao),
FOREIGN KEY (ID_cliente) REFERENCES clientes(ID_cliente),
FOREIGN KEY (ID_transacao) REFERENCES transacao(ID_transacao)
);

CREATE TABLE Indicador_Relatorio (
ID_indicador INT NOT NULL,
ID_relatorio INT NOT NULL,
PRIMARY KEY (ID_indicador, ID_relatorio),
FOREIGN KEY (ID_indicador) REFERENCES indicador(ID_indicador),
FOREIGN KEY (ID_relatorio) REFERENCES relatorios(ID_relatorio)
);

CREATE TABLE Produto_Relatorio (
ID_produto INT NOT NULL,
ID_relatorio INT NOT NULL,
PRIMARY KEY (ID_produto, ID_relatorio),
FOREIGN KEY (ID_produto) REFERENCES produtos(ID_produto),
FOREIGN KEY (ID_relatorio) REFERENCES relatorios(ID_relatorio)
);

CREATE TABLE Transacao_Relatorio (
ID_transacao INT NOT NULL,
ID_relatorio INT NOT NULL,
PRIMARY KEY (ID_transacao, ID_relatorio),
FOREIGN KEY (ID_transacao) REFERENCES transacao(ID_transacao),
FOREIGN KEY (ID_relatorio) REFERENCES relatorios(ID_relatorio)
);
