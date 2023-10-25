#!/bin/bash
BLUE="\033[0;34m"
WHITE="\033[0;37m"
RED="\033[0;31m"
YELLOW="\033[0;33m"

echo -e "                                        "
echo -e "${BLUE}---------------------------------"
echo -e "${WHITE}WEB RECON - WEB RECON - WEB RECON"
echo -e "${RED}----------------------------------"
echo -e "                                        "

if [ -z "$1" ]
then
        echo -e "${WHITE}Para utilizar, coloque um site Exemplo:"
        echo "./WebRecon.sh businesscorp.com.br"
else
        for palavra in $(cat WordlistDesec.txt)
        do
                resposta=$(curl -s -H "User-Agent: DesecTool" -o /dev/null -w "%{http_code}" "$1/$palavra/")
                if [ $resposta == "200" ]
        then
                echo -e "${YELLOW}Diretorio encontrado: $palavra"
        fi
        done
fi
