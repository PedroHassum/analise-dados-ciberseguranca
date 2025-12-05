/*
   PROJETO: Global Cyber Security Intelligence
   ARQUIVO: 02 - Auditoria e Limpeza de Dados.sql
   OBJETIVO: Corrigir inconsistências e validar a importação.
*/

USE Cybersecurity_Base
GO

-- 1. AUDITORIA INICIAL
-- Verificando se os valores vieram inflacionados (ex: 8053 em vez de 80.53)
SELECT TOP 5 
    Country, 
    Attack_Type, 
    Financial_Loss_in_Million AS Valor_Original_Incorreto
FROM CB.Global_Cybersecurity_Threats;

-- 2. DATA PATCHING (Correção em Massa)
-- O dataset original ignorou o ponto decimal. Dividindo por 100 para corrigir.
UPDATE CB.Global_Cybersecurity_Threats
SET Financial_Loss_in_Million = Financial_Loss_in_Million / 100.0;

-- 3. VALIDAÇÃO PÓS-CORREÇÃO
-- Verificando se os valores estão coerentes
SELECT TOP 5 
    Country, 
    Attack_Type, 
    Financial_Loss_in_Million AS Valor_Corrigido
FROM CB.Global_Cybersecurity_Threats;

-- 4. CHECAGEM DE INTEGRIDADE
-- Confirmando se não sobrou nenhum nulo ou erro nos campos principais
SELECT 
    COUNT(*) AS Total_Linhas,
    COUNT(Financial_Loss_in_Million) AS Total_Com_Valor_Financeiro,
    MIN(Financial_Loss_in_Million) AS Menor_Prejuizo,
    MAX(Financial_Loss_in_Million) AS Maior_Prejuizo
FROM CB.Global_Cybersecurity_Threats;