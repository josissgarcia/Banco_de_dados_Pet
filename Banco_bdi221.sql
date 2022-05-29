--CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE bdi221;
GO

-- DEFINIR QUAL BANCO DE DADOS VAMOS UTILIZAR
USE bdi221;
GO

-- DELETAR A TABELA PRODUTO, SO SE NAO EXISTIR ( IF EXISTS), DBO(Objeo do Banco de Dados) --
DROP TABLE IF EXISTS DBO.PRODUTO;
GO

-- CRIAÇÃO DA TABELA PRODUTO -- Identity -> Configura um auto incremento
CREATE TABLE PRODUTO(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR(50),
	DESCRICAO VARCHAR(255),
	VALOR DECIMAL(5,2)
);
GO

-- ADICIONAR O CAMPO TIPO A TABELA PRODUTO
ALTER TABLE PRODUTO
ADD TIPO CHAR(1) NULL;
GO

-- SELECIONA TODOS OS DADOS DE TODAS AS COLUNAS
SELECT * FROM PRODUTO
-- SELECIONA TODOS OS DADOS DA COLUNA NOME
SELECT NOME FROM PRODUTO
-- SELECIONA TODOS OS DADOS DA COLUNA NOME QUE TENHA ID 55
SELECT NOME FROM PRODUTO WHERE ID=55

-- ADICIONAR CHAVE PRIMARIA A TAVELA PRODUTO
ALTER TABLE PRODUTO
ADD CONSTRAINT PK_PRODUTO PRIMARY KEY(ID);
GO

-- DELETAR A TABELA PRONTUARIO, SÓ SE NÃO EXISTIR ( IF EXISTS) --
DROP TABLE IF EXISTS DBO.PRONTUARIO;
GO

-- CRIAÇÃO DA TABELA PRONTUARIO
CREATE TABLE PRONTUARIO(
    ID INT IDENTITY(1,1)NOT NULL,
    DESCRICAO VARCHAR (255),
    TEMPERATURA DECIMAL(3,1),
    PESO DECIMAL(5,2),
    CONSTRAINT PK_PRONTUARIO PRIMARY KEY(ID)
);
GO

-- DELETAR A TABELA PET, SÓ SE NÃO EXISTIR ( IF EXISTS) --
DROP TABLE IF EXISTS DBO.PET;
GO

-- CRIAÇÃO DA TABELA PET
CREATE TABLE PET(
    ID INT IDENTITY(1,1)NOT NULL,
    NOME VARCHAR(50),
    ESPECIE VARCHAR(50),
    PORTE VARCHAR(50),
    DT_NASC DATE,
    ID_PRONTUARIO INT NULL,
    CONSTRAINT PK_PET PRIMARY KEY(ID),
    CONSTRAINT PK_PET_PRONTUARIO FOREIGN KEY(ID_PRONTUARIO) REFERENCES DBO.PRONTUARIO (ID)
);
GO

-- DELETE DA TEBELA PRODUTO
DROP TABLE IF EXISTS DBO.PRODUTO;
GO

-- RECRIACAO DA TABELA PRODUTO JA COM A CHAVE PRIMARIA
CREATE TABLE PRODUTO(
    ID INT IDENTITY(1,1) NOT NULL,
    NOME VARCHAR (50),
    DESCRICAO VARCHAR(255),
    TIPO CHAR (1),
    VALOR DECIMAL(5,2),
    CONSTRAINT PK_PRODUTO PRIMARY KEY(ID)
);
GO

-- DELETE TABELA FORMA DE PAGAMENTO --
DROP TABLE IF EXISTS DBO.FORMA_PAGAMENTO;
GO

-- CRIACAO DA TABELA FORMA DE PAGAMENTO
CREATE TABLE FORMA_PAGAMENTO(
    ID INT IDENTITY(1,1) NOT NULL,
    DESCRICAO VARCHAR(50) NOT NULL,
    CONSTRAINT PK_FORMA_PAGAMENTO PRIMARY KEY(ID)
);
GO

-- DELETE DA TABELA FUNCIONARIO
DROP TABLE IF EXISTS FUNCIONARIO;
GO

-- CRIACAO DA TABELA FUNCIONARIO
CREATE TABLE FUNCIONARIO(
    ID INT IDENTITY(1,1) NOT NULL,
    NOME VARCHAR(255) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    SALARIO DECIMAL(6,2) NOT NULL,
    -- Codigo do Endereço --
    TIPO CHAR(1) NULL,
    N_CONSELHO INT NULL,
    ESPECIALIDADE VARCHAR(20) NULL,
    COMISSAO DECIMAL(4,2),
    CONSTRAINT PK_FUNCIONARIO PRIMARY KEY(ID)
);
GO

-- DELETE DA TABELA CLIENTE
DROP TABLE IF EXISTS CLIENTE;
GO

-- CRIACAO DA TABELA CLIENTE 
CREATE TABLE CLIENTE(
    ID INT IDENTITY(1,1) NOT NULL,
    NOME VARCHAR(255) NOT NULL,
    -- Codigo Endereço
    -- Telefone
    EMAIL VARCHAR(50)NOT NULL,
    CONSTRAINT PK_CLIENTE PRIMARY KEY(ID)
    
); 
GO

-- DELETE TABELA CLIENTE_PET
DROP TABLE IF EXISTS CLIENTE_PET;
GO

-- CRIAÇÃO DA TABELA CLIENTE_PET 
CREATE TABLE CLIENTE_PET(
    ID INT IDENTITY(1,1) NOT NULL,
    ID_CLIENTE INT NOT NULL,
    ID_PET INT NOT NULL,
    CONSTRAINT PK_CLIENTE_PET PRIMARY KEY(ID),
    CONSTRAINT FK_CLIENTE_PET_CLIENTE FOREIGN KEY(ID_CLIENTE) REFERENCES DBO.CLIENTE(ID),
    CONSTRAINT FK_CLIENTE_PET_PET FOREIGN KEY(ID_PET) REFERENCES DBO.PET (ID)
    
); 
GO
-- TABELA VENDA
DROP TABLE VENDA;
GO

CREATE TABLE VENDA(
	ID INT IDENTITY(1,1) NOT NULL,
	ID_FORMA_PAGAMENTO INT NOT NULL,
	ID_CLIENTE INT NOT NULL,
	ID_FUNCIONARIO INT NOT NULL,
	CONSTRAINT PK_VENDA PRIMARY KEY(ID),
	CONSTRAINT FK_VENDA_FORMA_PAGAMENTO FOREIGN KEY(ID_FORMA_PAGAMENTO)
	REFERENCES DBO.FORMA_PAGAMENTO (ID),
	CONSTRAINT FK_VENDA_CLIENTE FOREIGN KEY (ID_CLIENTE)
	REFERENCES DBO.CLIENTE (ID),
	CONSTRAINT FK_vENDA_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO)
	REFERENCES DBO.FUNCIONARIO (ID)
);
GO

-- TABELA PRODUTO_VENDA
DROP TABLE PRODUTO_VENDA;
GO

CREATE TABLE PRODUTO_VENDA(
	ID INT IDENTITY(1,1) NOT NULL,
	ID_PRODUTO INT NOT NULL,
	ID_VENDA INT NOT NULL,
	CONSTRAINT PK_PRODUTO_VENDA PRIMARY KEY(ID, ID_PRODUTO, ID_VENDA),
	CONSTRAINT FK_PRODUTO_VENDA_PRODUTO FOREIGN KEY (ID_PRODUTO)
	REFERENCES DBO.PRODUTO (ID),
	CONSTRAINT FK_PRODUTO_VENDA_VENDA FOREIGN KEY (ID_VENDA)
	REFERENCES DBO.VENDA (ID)
);
GO

-- INSERT FORMAS DE PAGAMENTO

SELECT * FROM DBO.FORMA_PAGAMENTO;

INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Dinheiro');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Cartão de Débito');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Cartão de Crédito (Vencimento)');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Cartão de Crédito (Parcelado)');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Carnê');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Pix');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('PicPay');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES ('Google Pay');
INSERT INTO DBO.FORMA_PAGAMENTO VALUES('Mercado Pago');

-- TABELA PRODUTO
SELECT *FROM DBO.PRODUTO

-- ENTRADA DE DADOS--

INSERT INTO DBO.PRODUTO
VALUES('Bola de brinquedo','Bola de morder e pegar para cachorros','P', 10.00);

INSERT INTO DBO.PRODUTO
VALUES('Shampoo Pet Love', 'Para um banho cheiroso','P',13.00);

INSERT INTO DBO.PRODUTO
VALUES('Banho e Tosa','Serviço de estética','S', 60.00);

INSERT INTO DBO.PRODUTO
VALUES('Coleira','Segurança para seu Pet','P',66.90);

INSERT INTO DBO.PRODUTO
VALUES('Consulta Vetarinária','Consulta especializada','S',299.90);

INSERT INTO DBO.PRODUTO
VALUES
    ('Ração Atacama 16kg', 'Ração boa pra cachorro', 'P', 230.00),
    ('Bola de brinquedo', 'Bola para morder e pegar para cachorros', 'P', 10.00),
    ('Catnip 10g', 'Erva de gato desidratada', 'P', 25.00),
    ('Pedras de fire', 'Ração crocante e flamejante', 'P', 0.50),
    ('Remedio pulkill', 'Matar pulga ', 'p', 90.00),
    ('Ração Wiskas', 'Ração para gatos', 'P', 20.00),
    ('Correntes de Asgard ', 'Correntes que prederam o lobo Fenrir de Asgard', 'P', 98.00),
    ('Sampoo Premium', 'Shampoo da linha premium para pelos sedosos', 'P', 250.00),
    ('Rações Pilar', 'Comida de cachorro', 'P', 88.00),
    ('Mordedor', 'Mordedor para cachorro de grande porte', 'P', 58.90),
    ('Ração mania', 'Comida de cachorro', 'P', 58.91),
    ('Osso Roedor', 'Ossinho de roer para cachorro inquieto', 'P', 58.92),
    ('Gaiola roedores', 'Gaiola para pequenos roedores - tamanho medio ', 'P', 58.93);

-- TABELA CLIENTES

SELECT * FROM DBO.CLIENTE;

INSERT INTO DBO.CLIENTE
VALUES

    ('Márcia Nicole Vieira', 'marcianicolevieira@cdcd.com.br'),
    ('Maria Nunes', 'marianunes11@gmail.com'),
    ('Giro Comes', 'Giro_idoso+60@gmail.com'),
    ('Gabriel', 'FogoFest2022@gmail.com'),
    ('Joaovisck', 'joaovisk@gmail.com'),
    ('Pedro Silva', 'pedrinhoradical@gmail.com'),
    ('Mbappe', 'MatheuzinReiDelas2010@hotmail.com'),
    ('Ribamar', 'Ribagol@gmail.com'),
    ('Alphonse Areola', 'alphonseareola@gmail.com'),
    ('Brito', 'tuliocesarluna@gmail.com'),
    ('Bento Andre de Lima', 'bentoal@gmail.com'),
    ('Cleiton Rasta', 'cleitonreagge@gmail.com');


-- TABELA FUNCIONÁRIOS
SELECT * FROM DBO.FUNCIONARIO;
--tableName (Nome,CPF,Salário,Tipo,N_conselho,Especialidade,Comissão)

INSERT INTO DBO.FUNCIONARIO
VALUES
    ('Rosimere Theodoro Manhães', '38786704940', 2500.00, 'V', '696432', 'Clinico Geral', 15.00),
    ('Osmar da Silva ', '11122233304', 1500.00, 'A', NULL, NULL, 15.00),
    ('José Da Silva', '7978314665', 5000.00, 'V', '1234569', 'Dermatologia', 10.00),
    ('Mestre dos Magos', '17878987485', 2500.00, 'A', NULL, NULL, 7.00),
    ('Biu Silva', '18968412399', 1870.00, 'A', NULL, NULL, 11.00),
    ('Serafin da silva ', '40028922188', 1200.00, 'V', '171078', NULL, 15.00),
    ('Shayane Silva', '98456512300', 1795.00, 'A', NULL, NULL, 8.00),
    ('Hermenegildo', '55244364476', 3500.00, 'V', '6743856', 'Clinico', 9.00),
    ('Biu do Espetinho', '55026988075', 6980.00, 'A', NULL, NULL, 10.00),
    ('Joaquim Da Silva Santos', '12107745285', 9785.00, 'V', '7854', NULL, 15.00),
    ('Brito de Oliveira', '14236918708', 4000.96, 'V', '786321', 'Clinico', 15.00),
    ('Jonas da Silveira', '77794923034', 1900.00, 'V', '230196', 'Clinico ', 10.00),
    ('Pedro Henrique Yuri Thomas Monteiro', '56765934235', 3.000, 'V', '2123',NULL ,8.00),
    ('Sevirino Garcia', '54566854504', 1700.00, 'V','17854', NULL, 20.00),
    ('Cristiano Ronaldo', '36367700471', 2000.00, 'V', '25006', 'Clinico', 10.00),
    ('Ricardo Moises ', '01440682496', 2500.00, 'V', '242424', NULL, 10.00),
    ('Estela Nogueira', '03476005488', 5000.00, 'A', NULL, NULL, 15.00),
    ('Maria Júlia', '01234567899', 3500.40, 'V ', '1519', NULL,15.00),
    ('Josimere Garcia', '18798578575', 3750.00, 'V','9874','Clinico', 8.00),
    ('Vinicius de Morais', '75759509071', 2831.83, 'A', NULL, NULL, 18.50),
    ('Caio Vieira', '09833316094', 2500.00, 'V', '231106', NULL , 10.00),
    ('Fausto Silva', '01001101213', 1800.00, 'V', '7811', 'Clinico', 10.00),
    ('Alice Araújo', '84224064951', 6000.00, 'A', NULL, NULL,15.00);

-- ENTRADA DE DADOS--
INSERT INTO DBO.VENDA
VALUES
    (1, 3, 5),
	(1, 2, 1),
	(2, 4, 3),
	(1, 1, 2),
	(3, 5, 3),
	(6, 6, 8)

INSERT INTO DBO.PRODUTO_VENDA
VALUES
    (1, 3 ),
	(1, 2),
	(2, 4)

INSERT INTO DBO.PRONTUARIO(DESCRICAO, TEMPERATURA, PESO)
VALUES
    ('Fratura',38.5, 8.50),
	('Vomito', 37.0, 10.60),
	('Vacina', 37.4, 11.80)

INSERT INTO DBO.PET(NOME,ESPECIE,PORTE, ID_PRONTUARIO)
VALUES
    ('Filó', 'Gato', 'Pequeno', 1),
	('Nina', 'Cão', 'Pequeno', 2),
	('Bella', 'Cão', 'Grande', 3)

    
	INSERT INTO DBO.CLIENTE_PET(ID_CLIENTE,ID_PET)
VALUES
    ( 2, 1),
	( 1, 2),
    ( 3, 3)

-- TED 13, 15 e 16  

--1) Quais os produtos com valor acima de R$ 100,00?
SELECT nome FROM produto WHERE valor >= 100.00;

--2) Quais as formas de pagamento ?
SELECT id, descricao FROM forma_pagamento;

--3) Qual o email do cliente com id = 5?
SELECT id, nome, email FROM cliente WHERE id=5;

--4) Quia os nomes dos clientes das vendas?
SELECT V.ID AS ID_VENDA, C.NOME AS NOME_CLIENTE FROM VENDA AS V
INNER JOIN CLIENTE AS C ON V.ID_CLIENTE = C.ID 

--5) Número de vendas de cada forma de pagamento?
SELECT F.DESCRICAO,	COUNT(P.VALOR) AS VALOR_VENDA FROM PRODUTO AS P
INNER JOIN PRODUTO_VENDA AS PV ON P.ID = PV.ID_PRODUTO
INNER JOIN VENDA AS V ON PV.ID_VENDA = V.ID
INNER JOIN FORMA_PAGAMENTO AS F ON V.ID_FUNCIONARIO = F.ID
GROUP BY F.DESCRICAO
ORDER BY VALOR_VENDA DESC

--6) Quia os nomes dos funcionários das vendas?
SELECT V.ID AS ID_VENDA, C.NOME AS NOME_CLIENTE FROM VENDA AS V
INNER JOIN CLIENTE AS C ON V.ID_CLIENTE = C.ID    

--  T E O R I A --


--SELECT nome FROM DBO.CLIENTE;
-- SELECT DISTINCT nome FROM DBO.CLIENTE; -- Mostra o cadastro unico (DISTINCT)
-- HAVING é exclusivo para usar com o GROUP BY, Pq neste caso não serve o WHERE.
--SELECT TIPO FROM DBO.FUNCIONARIO
--GROUP BY TIPO
--HAVING COUNT (TIPO) > 1

SELECT COUNT (TIPO) FRON DBO.FUNCIONARIO
SELECT NOME, SALARIO, TIPO FROM DBO.FUNCIONARIO
WHERE TIPO = 'A'


--  Selecione o compo ID da tabela V e coloque o titulo ID_VENDA
SELECT V.ID AS ID_VENDA, A.ID, A.NOME AS NOME_FUNCIONARIO
-- A tabela venda sera V 
-- A tabela funcionario será A 
-- Junte e mostre os ID da tabela venda = ao ID da tabela func 
FROM VENDA AS V INNER JOIN FUNCIONARIO AS A ON V.ID_FUNCIONARIO = A.ID

--DDL (Linguagem de DEFINIÇÃO DE DADOS) - ESTRUTURA
--ALTER - Alterar,EX:ALTER TABLE DBO.Produto / ADD Descricao VARCHAR (50) NULL; ADD CONSTRAINT PK_Produto PRIMARY KEY(ID);
--CREATE - Criar, EX: CREATE DATABASE bdi221; CREATE TABLE Produto( );
--DROP - Remover, EX: DROP TABLE Produto; DROP TABLE IF EXISTS Cliente;

-- DML (Linguagem de MANIPILAÇÃO DE DADOS) - DADOS
--SELECT - SELECT Campos FROM Tabela EX: SELECT nome, sobrenome, dt_nasc FROM pessoa 
         --SELECT * FROM Tabela
         --SELECT Campo FROM Tabela WHERE Condicao
--INSERT - INSERT INTO tabela (campos) VALUES (valores); OU INSERT INTO tabela (valores);
--UPDATE - UPDATE Tabela SET Campo = NovoValor WHERE Condicao EX: UPDATE PESSOA SET nome = 'Milena' WHERE id = 3
--DELETE - DELETE FROM Tabela WHERE Condicao EX: DELETE FROM pessoa WHERE id BETWEEN 3 AND 5

--DCL (Linguagem de CONTROLE DE DADOS) - CONTROLE DE ACESSO
--GRANT - Atribui
--REVOKE - Remove
--DENY - impedir explicitamente que um usuário receba uma permissão específica.

--TCL (Linguagem de CONTROLE DE TRANSAÇÕES) -gerenciar as mudanças feitas por instruções DML (DADOS) .
--COMMIT - Salvar permanentemente qualquer transação no banco de dados.
--ROLLBACK - Restaura o banco de dados para o último estado commited.

-- ON DELETE CASCADE (Só pode excluir um setor se não tiver nada cadastrado)
-- ON UPDATE CASCADE (Só pode inserir se a tabela existir)
-- DBO (O sql exige que seja utilizado, é a instancia da tabela)


