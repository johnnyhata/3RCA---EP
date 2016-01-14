#!/bin/bash

# write a function
logEvento()
{
   # Declaração de variáveis
   echo "$1"
   cMensagem=$(echo "$1" | cut -c 1-10)
   

#   cMensagem="$@"                 # Mensagem do log.
#   cMensagem=${cMensagem:0:58}    # Cortando a mensagem
   nResultado="$3"                # Resultado 0 = Concluido e 1 = Erro
   dDataAtual=$(date +"%d%m%y")   # Data atual do log
   echo "["$dDataAtual"]["$cMensagem"]["$nResultado"]"

}

logEvento $1 $2
