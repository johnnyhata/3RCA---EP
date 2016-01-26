#!/bin/bash
# Escrever textos no VI (Modo Inserção)
# 1. Entre no Modo pressionando [Insert], [i] ou [I];
#
# Copiar, colar textos, etc. igual [Menu/Editar] (Modo Comando)
# 1. Entre no Modo pressionando [ESC];
# 
# Salvar arquivo, sair, etc. igual [Menu/Arquivo] (Modo Comando e ":")
# 1. Entre no Modo pressionando [ESC];
# 2. Pressione [:];
#
# Cortar ou Copiar e Colar textos (Modo Inserção)
# 1. Pressione [ESC];
# 2. Posicione o cursor no começo da linha que deseja cortar ou copiar;
# 3. Precione [V]. Depois [d] para cortar ou [y] para copiar;
# 4. Posicione o cursor na linha que deseja colar;
# 5. Precione [P] para colar;
# 
# Salvar e sair (Modo Comando e ":")
# 1. Pressione [ESC] e depois [:];
# 2. Digite "wq" sem aspas e depois [ENTER];
#
# Sair sem salvar (Modo Comando e ":")
# 1. Pressione [ESC] e depois [:];
# 2. Digite "q!" sem aspas de depois [ENTER];
#
# Mostrar numero da linha (Modo Comando e ":")
# 1. Pressione [ESC] e depois [:];
# 2. Digite "set nu" sem aspas e depois [ENTER];
#
# Apagar/Cortar uma linha (Modo Comando)
# 1. Pressione [d][d];
#
# Pesquisar texto (Modo Comando)
# 1. Pressione [ESC];
# 2. Pressione [/];
# 3. Digite o texto que deseja pesquisar e depois [ENTER];
# 4. Pressione [n] para a proxima ocorrencia e [N] para anterior;
#

# Script : logEventos()
# Autor  : Johnny Hata
# Descri.: Formata a saida do log padrao
# Sintaxe: logEvento <mensagem> <-concluido/-erro> <-tela/-arquivo>
# Exemplo: logEvento "$0: Script executado." -concluido -tela
# Logs   : 040116: Primeira versao do codigo.
#          260116: Adicionado a opcao -telaarq para imprimir o log
#                  na tela e em arquivo.
#

logEvento()
{
   # Declaração de variáveis
   dDataAtual=$(date +"%d%m%y")   # Data atual do log
   cArgumentos=""   # Armazena temporariamente os argumentos
   cMensagem=""     # Nome do script e mensagem do que ocorreu
   cStatus=""       # Mensagem do status do que ocorreu
   aOpcoes=""       # -concluido/-erro, -tela/-arquivo/-telaarq
   nIndex=0         # Usado para o array aOpcoes

   # Separa mensagem de opcoes
   for cArgumentos in "$@"
   do
      # Se cArgumentos comecar com "-", significa que e opcao
      if [ "${cArgumentos:0:1}" == "-" ] ; then
         aOpcoes[nIndex]="$cArgumentos"
         ((nIndex++))
      else
         cMensagem="$cMensagem$cArgumentos "
      fi
   done

   # Redireciona o log para a tela ou arquivo
   for cArgumentos in "${aOpcoes[@]}"
   do
      # Se o log reportar que foi concluido
      if [ "$cArgumentos" == "-concluido" ] ; then
         cStatus="Concluido"
      elif [ "$cArgumentos" == "-erro" ] ; then
         cStatus="  Erro!  "
      fi

      # Se o log sera mostrado na tela
      if [ "$cArgumentos" == "-tela" ] ; then
         echo "[""$dDataAtual""][""$cMensagem""][""$cStatus""]"
      elif [ "$cArgumentos" == "-arquivo" ] ; then
         echo "[""$dDataAtual""][""$cMensagem""][""$cStatus""]" >> hardening.log
      elif [ "$cArgumentos" == "-telaarq" ] ; then
         echo "[""$dDataAtual""][""$cMensagem""][""$cStatus""]"
         echo "[""$dDataAtual""][""$cMensagem""][""$cStatus""]" >> hardening.log
      fi

      ((nIndex++))
   done

}
