#!/bin/bash
#
# Arquivo: script.sh
# Autor  : Johnny Hata
# Descri.: Script base arquitetado para fazer integracoes (bibliotecas, UX,
#          outros script, etc.) de todos os codigos do projeto.
#          Sera necessario alterar as linhas de testes e correcoes indicadas.
#          no codigo abaixo, de acordo com o entendimento do documento CIS.
# Logs  : --------------------------------------------------------------------
# 080216: Foi definido a area de correcoes e melhoria nos textos dos logs.
# 020216: Na area de testes, foi adicionado um codigo que adiciona valores na
#         variavel nResTestes se o resultado dos comandos retornaram algum
#         texto.
# 310116: Adicionado Exit Return do Script:
#         0 = testes ou correcoes executadas com sucesso;
#         1 = falha no segundo teste;
#         2 = falha durante as correcoes.
# 260116: Adicionado variaveis de identificacao de Level e Score.
# 040116: Primeira versao do codigo.
#

# Declaracao de bibliotecas e variaveis
. lib.sh                      # Carrega a biblioteca de funcoes
declare -i nResTestes=0       # Contador de erros dos testes
declare -i nResCorrecoes=0    # Contador de erros das correcoes
declare -i nTesAtual=1        # Diz se e a primeira ou segunda vez dos testes
cScrAtual="$0"                # Nome do script atual para o log.
cSaida="-tela"                # Define a saida padrao para a tela
[ "$1" != "" ] && cSaida="$1" # Se especificado a saida sera arquivo
cResultado=""                 # Resultado dos comandos de testes

# (ALTERE AQUI) Inicio da declaracao das variaveis do Script
declare -i nLevel=9  # 1 ou 2
declare -i nScore=9  # 0 (Not Scored), 1 (Scored)
# Fim (ALTERE ATE AQUI)

for (( nTesAtual=1; nTesAtual<=2; nTesAtual++ ))
do
   # Reseta o contador de erros da execucao dos testes
   nResTestes=0


   # AREA DE TESTES: INICIO
   # ----------------------
   # Geralmente, se os resultados dos comandos de testes nao retornarem
   # textos, e' necessario aplicar as correcoes. nResTestes acumula os
   # os caracteres dos resultados dos testes.

   cResultado=$(echo "")
   nResTestes="$nResTestes"+"${#cResultado}"

   # Use o codigo abaixo caso o resultado dos comandos de testes devem
   # falhar para nao aplicar as correcoes.

   # echo "Codigo de Teste ..."
   # nResTestes="$nResTestes"+"$?"

   # AREA DE TESTES: FIM
   # -------------------

   # O codigo abaixo verifica se nResTestes e igual a 0 para aplicar as
   # correcoes.
   if [ "$nResTestes" -eq 0 ] && [ "$nTesAtual" -eq 1 ] ; then

      logEvento "$cScrAtual: Foram encontradas falhas de segurança." -erro $cSaida

      # AREA DE CORRECOES: INICIO
      # -------------------------
      # Escreva os comandos para as correcoes dos testes. Se o comando falhar,
      # o valor de nResCorrecoes deve ser maior que 0.

      echo "Codigo de Correcao ..."
      nResCorrecoes="$nResCorrecoes"+"$?"

      # AREA DE CORRECOES: FIM
      # ----------------------

      # Se alguma correcao falhar
      if [ "$nResCorrecoes" -gt 0 ] ; then
         logEvento "$cScrAtual: Execução da correção falhou. Verifique!" -erro $cSaida
         # echo "Adicione mais informações aqui." >> hardening.log
         exit 2
      else
         logEvento "$cScrAtual: Correções executadas com sucesso." -concluido $cSaida
      fi

   # Se algum teste falhar E o teste é feito pela segunda vez
   elif [ "$nResTestes" -eq 0 ] && [ "$nTesAtual" -eq 2 ] ; then
      logEvento "$cScrAtual: Falha nos testes depois das correções. Verifique!" -erro $cSaida
      exit 1

   # Se nenhum teste falhou
   else
      logEvento "$cScrAtual: Testes não acusaram falhas de segurança." -concluido $cSaida
      exit 0

   fi
done
