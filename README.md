# Global Cyber Security Intelligence: Análise Estratégica de Ameaças Cibernéticas (2015-2024)

## Visão Geral do Projeto

Este projeto simula a atuação de um **Analista de Dados** respondendo a demandas estratégicas sobre Cibersegurança.

O objetivo foi analisar 10 anos de dados globais de incidentes cibernéticos para direcionar o orçamento de defesa, identificando quais vetores de ataque causam maior prejuízo financeiro e qual a eficácia real das ferramentas de proteção atuais.

**Ferramentas Utilizadas:** SQL Server (T-SQL), Excel (Visualização).

## O Problema de Negócio

A diretoria de segurança solicitou uma auditoria de dados para responder a três perguntas estratégicas:

1. O maior prejuízo acumulado vem de ataques de alta frequência ou de vetores complexos e raros?
2. Qual o prejuízo médio financeiro quando nossas barreiras são violadas?
3. Quais indústrias do nosso portfólio demandam maior prioridade em investimentos de mitigação devido à severidade dos incidentes?

## Principais Insights

### 1. O Mito da Sofisticação: Por que a Força Bruta (DDoS) Custa Mais Caro

**Resposta à Pergunta:** "O maior prejuízo vem de frequência ou complexidade?"

* **Insight:** Contra o senso comum de que ataques sofisticados são os mais perigosos, o **DDoS** se consolidou como o vetor de maior impacto financeiro acumulado.
* **Contexto:** Um ataque DDoS (Negação de Serviço Distribuída) tenta tornar um serviço online indisponível inundando-o com tráfego. O estudo revelou que a interrupção da operação custa mais caro que o roubo de dados pontual.
* **Dados:** Os ataques DDoS lideraram tanto o ranking de frequência quanto o de prejuízo total, acumulando um total de **US$ 25,2 Bilhões**, com 531 incidentes no período analisado.
* **Ação Recomendada:** O investimento não deve focar apenas em inteligência de ameaças raras, mas principalmente em redundância de infraestrutura e largura de banda para mitigar paradas operacionais.

### 2. A Ilusão do Perímetro: Por que Gastamos Mal em Firewalls

**Resposta à Pergunta:** "Qual o custo da falha das nossas defesas?"

* **Insight:** Embora o Firewall seja a defesa mais onipresente, ele apresentou o pior desempenho financeiro (maior ticket médio de prejuízo) quando falhou em conter incidentes críticos como Malware e Ransomware.
* **Dados:** Média de prejuízo por incidente com Firewall vazado: **US$ 46,3 Milhões** vs. Sistema de detecção via IA: **US$ 43,6 Milhões**.
* **Ação Recomendada:** Isso indica uma dependência excessiva na defesa de perímetro. É urgente adotar uma postura de *Zero Trust* e investir em segregação interna de rede, pois uma vez que o Firewall é transposto, o dano é catastrófico.

### 3. O Alvo de US$ 23 Bilhões: O Setor Mais Castigado do Mundo

**Resposta à Pergunta:** "Onde está nossa exposição setorial?"

* **Insight:** O setor de **Tecnologia da Informação (IT)** sofreu uma desproporção entre volume de ataques e dano financeiro, registrando o maior prejuízo acumulado do período.
* **Dados:** Prejuízo total de **US$ 23,1 Bilhões**, com um pico único de incidente custando US$ 99,9 Milhões.
* **Ação Recomendada:** Revisão imediata das apólices de seguro cibernético para este setor específico, visto que a volatilidade de prejuízo excede a média global.

## Visualização de Dados

**1. Danos por Ataque (Volume vs Valor)**

<img src="https://github.com/user-attachments/assets/596615ef-854d-4e0d-8ed5-e50bdfc853ca" alt="Danos por Ataque" width="800">

**2. Custo Médio das Falhas de Defesa**

<img src="https://github.com/user-attachments/assets/add8df2f-70b3-48bd-b05f-1b62a3249384" alt="Custo Médio Defesa" width="800">

**3. Setores Mais Afetados**

<img src="https://github.com/user-attachments/assets/d647e5aa-1608-4e63-a71d-e6964c5899b6" alt="Setores Afetados" width="800">

## Metodologia e Desafios Técnicos

A análise seguiu um fluxo rigoroso de Engenharia de Dados e Análise Descritiva para garantir a integridade das métricas financeiras.

### 1. Engenharia de Dados (Data Engineering)
* **Ingestão e Tipagem:** Importação de dataset flat (CSV) para SQL Server, com conversão forçada de tipos de dados (`NVARCHAR` -> `DECIMAL(10,2)`) para habilitar operações matemáticas precisas.
* **Correção de Anomalias (Data Patching):** Identificação de erro crítico de escala monetária na fonte de dados (conflito de localização ponto/vírgula). Implementação de script `UPDATE` para normalização aritmética de toda a base, corrigindo uma distorção de 100x nos valores originais.

### 2. Análise Estratégica (SQL Analytics)
* **Agregação Multidimensional:** Utilização de `GROUP BY` para consolidar métricas por três vetores principais: Tipo de Ataque, Indústria e Mecanismo de Defesa.
* **Análise de Eficácia (ROI):** Cálculo de ticket médio (`AVG`) de prejuízo por ferramenta de defesa para isolar a performance financeira de cada tecnologia.
* **Formatação Executiva:** Aplicação de funções de formatação (`FORMAT` com `en-US`) diretamente nas queries para gerar relatórios prontos para visualização.

### 3. Visualização de Dados
* Exportação dos datasets processados para a criação de Gráficos de Combinação (Eixo Duplo) e Barras Horizontais no Excel, facilitando a comparação entre Frequência e Impacto Financeiro.

## Estrutura do Repositório

* `01_criacao_base_dados.sql`: Criação da Base de dados e do Schema.
* `02_auditoria_limpeza.sql`: Scripts de auditoria e correções.
* `03_analise_dados.sql`: Queries consolidadas de análise de dados.

## COMO EXECUTAR ESTE PROJETO

Para reproduzir os resultados, você precisará do **SQL Server** e do **SQL Server Management Studio (SSMS)** instalados.

**Passo 1: Configuração do Ambiente**
1. Clone este repositório.
2. Abra o arquivo `01_criacao_base_dados.sql` no SSMS.
3. Execute o script para criar o Banco de Dados `Cybersecurity_Base`, o Schema `CB` e a estrutura da tabela vazia.

**Passo 2: Ingestão de Dados (ETL)**
Como o dataset original é um arquivo CSV, realize a importação via Wizard:
1. No SSMS, clique com o botão direito no banco `Cybersecurity_Base`, vá em **Tasks** e selecione **Import Flat File**.
2. Selecione o arquivo CSV baixado neste repositório.
3. **Importante:** Na etapa de seleção de tabela, escolha a tabela existente `CB.Global_Cybersecurity_Threats` (não crie uma nova).
4. Conclua a importação.

**Passo 3: Limpeza e Tratamento**
1. Abra o arquivo `02_auditoria_limpeza.sql`.
2. Execute o script para auditar a carga inicial e aplicar o *Data Patching* (correção da escala monetária).

**Passo 4: Análise**
1. Execute o arquivo `03_analise_dados.sql` para gerar os KPIs e tabelas utilizados nos insights deste relatório.

---

**Autor:** Pedro Cardoso de Souza Hassum Moreira
**Fonte:** Dados baseados em dataset público de Cibersegurança Global.
