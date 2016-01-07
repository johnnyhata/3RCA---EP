#!/bin/bash
PCT=0
NOMESCRIPT[0]="ola.sh"
( 
while test $PCT != 100; do

   # Exemplo de mudanca de mensagem de script
   if [ $PCT -lt 50 ]; then
      MENSAGEM=$(cat telas.sh);
   else
      MENSAGEM=$(cat telas2.sh);
   fi

   # Colocando duas caixas ao mesmo tempo na tela
   dialog --begin 0 1 --title "Script Atual" --infobox "$MENSAGEM" 19 38 --and-widget \
          --begin 0 41 --title "Log do script" --infobox "tail log" 19 38 --and-widget \
          --begin 20 1 --title "Porcentagem " --infobox "$PCT" 2 80 --and-widget;

   # O codigo abaixo é apenas uma demonstração
   PCT=`expr $PCT + 10`;

   # Executando um script
   #./${NOMESCRIPT[0]}

   sleep 1;

done; )
