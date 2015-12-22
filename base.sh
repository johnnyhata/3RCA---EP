#!/bin/bash
# Informações do Script ........................................................
#
# Programa    : <nome do script>
# Autor       : <nome de quem escreveu o script>
# Descrição   : <descreva com suas palavras qual o objetivo do script usando
#               como referencia os itens "Description" e "Rationale" do
#               documento do CIS>
# Dependências: <quais pacotes são necessários para executar esse script>
# Comando     : <comando da CLI para executar o script>
# Observação  : <Opcional - escreva se tiver alguma observação a fazer>
# Logs        : <alterações que foram feitas nesse código, colocando data e
#               descrição do que foi feito incluindo a linha>
#
# 1. Leia as referências:
#    - Shellscript Profissional: Paginas 28-34, 475-477;
#
# 2. Recomendações:
#    - Faça o backup do script antes de altera-los;
#
# 3. Fluxo do script:
#
#
Início
   Executar teste de auditoria
   Se resultado do teste for erro de comando
      criar log de erro do comando
   Se resultado do teste for que o teste foi sucedido
      Criar log de teste foi sucedido
   Se resultado do teste for teste acusou falha de segurança
      Criar log de teste acusou falha de segurança
      Executar comando que conserta a falha de segurança
      Se resultado do comando que conserta a falha de segurança for erro de comando
         criar log de erro do comando
      Se resultado do comando que conserta a falha de segurança for bem sucedido
         Criar log de que a falha foi consertada
      Se resultado do comando que conserta a falha de segurança fachou
         Criar log de que ocorreu alguma falha
Fim

#
#
#...............................................................................

# Declaração de bibliotecas e variáveis ........................................
#
# 0. Leia e entenda todas instruções antes de fazer;
# 1. Sobre variáveis no bash do Linux:
#    - Não inicie os nomes das variáveis com números;
#    - Não utilize caracteres especiais (arroba, cerquilha, espaços, etc.) nos
#      nomes das variáveis;
#    - Não há necessidade de declarar o tipo da variável;
#    - Não coloque espaços entre o sinal de igualdade;
#    - Não utilize nomes de variáveis de ambiente para declarar suas variáveis;
#    - Ao utilizar a variável, coloque aspas duplas " no início e fim;
#    - Nomes de variáveis são case sensitive;
#    - 
# 2. Declare todas as variáveis que for utilizar no início do script;
# 3. Declare variáveis globais em maiúsculas e as locais em minúsculas;
# 4. Coloque aspas duplas " ao colocar um valor do tipo texto;
# 5. Variáveis de controle obrigatórias:
#    - GUI: se o primeiro parâmetro estiver vazio, o script será executado sem
#      a GUI;
#    - SCORED: coloque o número 1 (um) se no título do item a ser auditado
#      (testado) estiver escrito (Scored);
#    - LEVEL : coloque o número 1 (um) ou 2 (dois) verificando o "Level" em
#      "Profile Applicability";
#
# 6. Leia as referências:
#    - Shellscript Profissional: Paginas 41-42, 328-333;
#
#...............................................................................
. auditlib.sh   # Biblioteca de funções
GUI="$1"
SCORED=
LEVEL=


# Testes e auditoria (Audit) ...................................................
#
# 0. Leia e entenda todas instruções antes de fazer;
# 1. Entenda o que o comando especificado em "Audit" faz usando o comando de
#    DEBUG do bash, executando o comando no terminal, quebrando os comandos
#    em partes, lendo as referências recomendadas;
# 2. Faça o comentário do código dizendo o que entendeu usando suas palavras;
# 3. Execute e verifique um comando por vez;
# 4. Adicione no log o resultado de "Audit" no formato abaixo:
#    [ddmmaa(6 caracteres)][Descrição(59 car.)][Verificar/Testado(9 car.)]
#
# 5. Leia as referências:
#    - ;
#
#...............................................................................


# Verificação do teste e ações corretivas (Remediation) ........................
#
# 0. Leia e entenda todas instruções antes de fazer;
# 1. Verifique a saída esperada do comando executado (Audit);
# 2. Entenda o que o comando especificado em "Remediation" faz usando o comando
#    de DEBUG do bash, executando o comando no terminal, quebrando os comandos
#    em partes, lendo as referências recomendadas;
# 3. Faça o comentário do código dizendo o que entendeu usando suas palavras;
# 4. Execute a ação corretiva (Remediation) um comando por vez;
# 5. Verifique a saída esperada do comando executado (Remediation);
# 6. Adicione no log o resultado de "Remediation" no formato abaixo:
#    [ddmmaa(6 caracteres)][Descrição(59 car.)][Erro/Concluído(9 car.)]
#
# 7. Leia as referências:
#    - ;
#
#...............................................................................



# Testes e auditoria após ações corretivas (Audit) .............................
#
# 1. Execute e verifique um comando por vez;
# 2. Entenda o que o comando especificado em "Audit" faz usando o comando de
#    DEBUG do bash, executando o comando no terminal, quebrando os comandos em
#    em partes, lendo as referências recomendadas;
# 3. Faça o comentário do código do que entendeu usando suas palavras;
# 2. Adicione o significado do resultado de forma formatada para o log;
#
# ?. Leia as referências:
#    - ;
#
# Log se deu certo ou não
#...............................................................................





Framework do código:
--------------------------
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
