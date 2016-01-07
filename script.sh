#!/bin/bash
PCT=0
MENSAGEM=$(head -n12 telas.sh)
( 
while test $PCT != 100; do

   # O codigo abaixo é apenas uma demonstração
   PCT=`expr $PCT + 10`;
   TITULO=$"Executando script numero $PCT"
   echo $PCT;
   echo $TITULO;
   sleep 1;

done; ) | dialog --title "$TITULO" --gauge "$PCT" 20 70 0 --and-widget
