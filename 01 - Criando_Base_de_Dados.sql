/*
   PROJETO: Global Cyber Intelligence
   ARQUIVO: 01 - Criando Base de Dados.sql
   OBJETIVO: Criar o ambiente de dados.
*/

-- 1. Cria o Banco
CREATE DATABASE Cybersecurity_Base;
GO

USE Cybersecurity_Base;
GO

-- 2. Cria o Schema para organizar as tabelas
CREATE SCHEMA CB;

-- 3. Cria a estrutura da tabela
-- Nota: Os dados serão importados via Import Wizard após rodar este script.
CREATE TABLE CB.Global_Cybersecurity_Threats (
    ID_Incident INT IDENTITY(1,1) PRIMARY KEY,
    Country VARCHAR(100),
    Year INT,
    Attack_Type VARCHAR(100),
    Target_Industry VARCHAR(100),
    Financial_Loss_in_Million DECIMAL(10,2), 
    Number_of_Affected_Users INT,
    Attack_Source VARCHAR(100),
    Security_Vulnerability_Type VARCHAR(150),
    Defense_Mechanism_Used VARCHAR(100),
    Incident_Resolution_Time_in_Hours INT
);