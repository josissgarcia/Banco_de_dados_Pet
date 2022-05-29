
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

-- Entrada de dados--

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



    