#!/bin/bash
declare -i nResTestes=0
declare -i nResCorrecoes=0
declare -i nTesAtual=1

for (( nTesAtual=1; nTesAtual<=2; nTesAtual++ ))
do
   # Reseta o contador de erros da execucao dos testes
   nResTestes=0

   # Inicio dos codigos dos testes
   echo "Codigo de Teste 1"   ; nResTestes="$nResTestes"+"$?"
   echo "Codigo de Teste 2"   ; nResTestes="$nResTestes"+"$?"
   echo "Codigo de Teste ..." ; nResTestes="$nResTestes"+"$?"
   echo "Resultado de nResTeste: $nResTestes" # apagar
   # Fim dos codigos dos testes

   # Se algum teste falhar E o teste é feito pela primeira vez
   if [ "$nResTestes" -gt 0 ] && [ "$nTesAtual" -eq 1 ] ; then
      echo "LOG: Primeiro teste deu problema"

      echo "$nResTestes maior que 0?" # apagar
      echo "$nTesAtual igual a 1?" # apagar

      # Inicio dos codigos de correcoes
      echo "Codigo de Correcao 1"   ; nResCorrecoes="$nResCorrecoes"+"$?"
      echo "Codigo de Correcao 2"   ; nResCorrecoes="$nResCorrecoes"+"$?"
      echo "Codigo de Correcao ..." ; nResCorrecoes="$nResCorrecoes"+"$?"
      echo "Resultado de nResCorrecoes: $nResCorrecoes" # apagar
      # Fim dos codigos de correcoes

      # Se alguma correcao falhar
      if [ "$nResCorrecoes" -gt 0 ] ; then
         echo "LOG: Alguma correcao falhou. Verifique!"
         break
      else
         echo "LOG: As correcoes foram concluidas."
      fi

   # Se algum teste falhar E o teste é feito pela segunda vez
   elif [ "$nResTestes" -gt 0 ] && [ "$nTesAtual" -eq 2 ] ; then

      echo "LOG: As correcoes nao corrigiram o problema. Verifique!"

   # Se nenhum teste falhou
   else

      echo "LOG: A maquina esta protegida!"
      break

   fi
done
