/*
   PROJETO: Global Cyber Security Intelligence
   ARQUIVO: 03 - Analise de Dados.sql
   OBJETIVO: Extrair KPIs e responder às perguntas estratégicas.
*/

USE Cybersecurity_Base;
GO

-- ---------------------------------------------------------
-- PERGUNTA 1: MATRIZ DE RISCO (Frequência vs Impacto Financeiro)
-- Onde devemos focar? No que acontece muito ou no que custa caro?
-- ---------------------------------------------------------
SELECT 
    Attack_Type,
    COUNT(*) AS Frequencia_Incidentes,
    FORMAT(SUM(Financial_Loss_in_Million), 'C', 'en-US') AS Prejuizo_Total,
    FORMAT(AVG(Financial_Loss_in_Million), 'C', 'en-US') AS Ticket_Medio_Prejuizo
FROM CB.Global_Cybersecurity_Threats
GROUP BY Attack_Type
ORDER BY SUM(Financial_Loss_in_Million) DESC;


-- ---------------------------------------------------------
-- PERGUNTA 2: EFICÁCIA DE DEFESA (Custo da Falha)
-- Qual ferramenta, quando violada, gera o maior prejuízo médio?
-- ---------------------------------------------------------
SELECT 
    Defense_Mechanism_Used AS Defesa_Violada,
    COUNT(*) AS Qtd_Falhas,
    FORMAT(AVG(Financial_Loss_in_Million), 'C', 'en-US') AS Prejuizo_Medio_Por_Incidente
FROM CB.Global_Cybersecurity_Threats
GROUP BY Defense_Mechanism_Used
ORDER BY AVG(Financial_Loss_in_Million) DESC;


-- ---------------------------------------------------------
-- PERGUNTA 3: EXPOSIÇÃO SETORIAL
-- Quais indústrias concentram o maior risco financeiro acumulado?
-- ---------------------------------------------------------
SELECT TOP 5
    Target_Industry,
    COUNT(*) AS Numero_Ataques,
    FORMAT(SUM(Financial_Loss_in_Million), 'C', 'en-US') AS Prejuizo_Acumulado,
    FORMAT(MAX(Financial_Loss_in_Million), 'C', 'en-US') AS Pior_Incidente_Unico
FROM CB.Global_Cybersecurity_Threats
GROUP BY Target_Industry
ORDER BY SUM(Financial_Loss_in_Million) DESC;