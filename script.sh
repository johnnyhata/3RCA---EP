#!/bin/bash
#
# Arquivo: script.sh
# Autor  : Johnny Hata
# Descri.: Script base arquitetado para fazer integracoes (bibliotecas, UX,
#          outros script, etc.) de todos os codigos do projeto.
#          Sera necessario alterar as linhas de testes e correcoes indicadas
#          no codigo abaixo, de acordo com o entendimento do documento CIS.
# Logs   : 040116: Primeira versao do codigo.
#          260116: Adicionado variaveis de identificacao de Level e Score.
#
#

# Declaracao de bibliotecas e variaveis
. lib.sh                     # Carrega a biblioteca de funcoes
declare -i nResTestes=0      # Contador de erros dos testes
declare -i nResCorrecoes=0   # Contador de erros das correcoes
declare -i nTesAtual=1       # Diz se e a primeira ou segunda vez dos testes
cScrAtual="$0"               # Nome do script atual para o log.
cSaida="-tela"               # Define a saida padrao para a tela
[ "$1" != "" ] && cSaida="$1"   # Se especificado a saida sera arquivo

# Inicio da declaracao das variaveis do Script (ALTERE AQUI)
declare -i nLevel=9  # 1 ou 2
declare -i nScore=9  # 0 (Not Scored), 1 (Scored)
# Fim (ALTERE ATE AQUI)

for (( nTesAtual=1; nTesAtual<=2; nTesAtual++ ))
do
   # Reseta o contador de erros da execucao dos testes
   nResTestes=0

   # Inicio dos codigos dos testes (ALTERE AQUI)
   echo "Codigo de Teste 1"   ; nResTestes="$nResTestes"+"$?"
   echo "Codigo de Teste 2"   ; nResTestes="$nResTestes"+"$?"
   echo "Codigo de Teste ..." ; nResTestes="$nResTestes"+"$?"
   # Fim (ALTERE ATE AQUI)

   # Se algum teste falhar E o teste é feito pela primeira vez
   if [ "$nResTestes" -gt 0 ] && [ "$nTesAtual" -eq 1 ] ; then

      logEvento "$cScrAtual: Foram encontradas falhas de segurança." -erro $cSaida

      # Inicio dos codigos de correcoes (ALTERE AQUI)
      echo "Codigo de Correcao 1"   ; nResCorrecoes="$nResCorrecoes"+"$?"
      echo "Codigo de Correcao 2"   ; nResCorrecoes="$nResCorrecoes"+"$?"
      echo "Codigo de Correcao ..." ; nResCorrecoes="$nResCorrecoes"+"$?"
      # Fim dos codigos de correcoes (ALTERE ATE AQUI)

      # Se alguma correcao falhar
      if [ "$nResCorrecoes" -gt 0 ] ; then
         logEvento "$cScrAtual: Alguma correção falhou. Verifique!" -erro $cSaida
         # echo "Adicione mais informações aqui." >> hardening.log
         break
      else
         logEvento "$cScrAtual: As correções foram aplicadas." -concluido $cSaida
      fi

   # Se algum teste falhar E o teste é feito pela segunda vez
   elif [ "$nResTestes" -gt 0 ] && [ "$nTesAtual" -eq 2 ] ; then
      logEvento "$cScrAtual: Falha nos testes depois das correções. Verifique!" -erro $cSaida

   # Se nenhum teste falhou
   else
      logEvento "$cScrAtual: Os testes não acusaram falhas de segurança." -concluido $cSaida
      break

   fi
done
