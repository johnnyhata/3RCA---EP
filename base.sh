#!/bin/bash
# Informações do Script ........................................................
# Programa    : <nome do script>
# Autor       : <nome de quem escreveu o script>
# Descrição   : <descreva qual o objetivo do script, o que ele faz, qual o
#               problema que ele resolve, etc.>
# Dependências: <quais pacotes são necessários para executar esse script>
# Comando     : <comando da CLI para executar o script>
# Observação  : <Opcional - escreva se tiver alguma observação a fazer>
# Logs        : <alterações que foram feitas nesse código, colocando data e
#               descrição do que foi feito incluindo a linha>
#...............................................................................

# Declaração de bibliotecas e variáveis ........................................
#
#...............................................................................


# Testes e auditoria ........................................
#
#...............................................................................

Framework do código:
--------------------------
- Colocar exemplos de boas práticas do capitulo 13; 
   - fazer copia de arquivos de configuração antes de altera-los colocando com extensão data e hora;
   - fazer copia do script antes de altera-los colocando com extensão data e hora;
- Informações e comentários do código (cap 2-28-34, MF-475-477);
- Declaração de bibliotecas e variáveis utilizadas (cap 13-328-333, cap 2-41-42);
   SCORE=1 (SIM) log?
   LEVEL=1 ou 2 log?
   GUI=1 (SIM)
- Print do teste que será feito e execução do teste (cap 2-34-41, ape D-426-474, cap 5-101-105);
- Decisão do que fazer baseado no resultado do teste;
- Print do resultado negativo do teste;
   - Alteração necessária;
   - verificação da alteração PdC;
- Print do resultado positivo do teste;
- Adicionar resultado no log;
- Print do resultado negativo do teste;
- Adicionar resultado no log;
- Próximo teste;

• Outros
Validar com Ismar
# Padrão de Configuração dos Executáveis em Linux (Serviços, servidores, aplicações, programas) #
1. Arquivo de opções do executável: caminhos dos arquivos, opções de inicializarão, etc.
   Ex.: nome-do-executável.options
2. Arquivo de configuração do executável: arquivos de trabalho, opções de leitura desses arquivos, etc.
   Ex.: nome-do-executável.conf
3. Arquivo que o executável irá usar para fazer seu trabalho: configurações de endereços, limites, etc.
4. FALTA ALGUM?