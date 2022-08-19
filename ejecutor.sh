#!/bin/bash
#
#script ejecutor.sh
# Version : 1.0
#Para ejecutar archivos consultaX.sh  , se captura el resultaod de la consulta a la bas de datos para genera archivos con nombres según fecha y envio de estas consultas guardadas en archivos por telegra. Uso de cron en linux
#Autor : Ing. Jorge Navarrete
#mail : jorge_n@web.de
#Fecha : 202-05-17

#script ejecutor.sh
#Para ejecutar archivos consultaX.sh  , se captura el resultaod de la consulta a la bas de datos para genera archivos con nombres según fecha y envio de estas consultas guardadas en archivos por telegram. Uso de cron en linux


#===========================================================================
PATH=/bin:/usr/bin:/usr/sbin/
#===========================================================================
#VARIABLES
NOMBREBACKUP=resultado-
DIRECTORIO1=/usr/local/bin/postgresconsulta/
DIRECTORIO2=/tmp/
#servermicro="192.168.0.5"

#===========================================================================i
FECHAINICIO=`date +%Y-%m-%d`
CADENALASTDAY="`echo $FECHAINICIO | sed 's/:/ /g'`"
ARCHIVO1=`echo $NOMBREBACKUP`"1_"`echo $CADENALASTDAY`".txt"
ARCHIVO2=`echo $NOMBREBACKUP`"2_"`echo $CADENALASTDAY`".txt"
ARCHIVO3=`echo $NOMBREBACKUP`"3_"`echo $CADENALASTDAY`".txt"

cd $DIRECTORIO1

./consulta1.sh >> $DIRECTORIO2$ARCHIVO1
./consulta2.sh >> $DIRECTORIO2$ARCHIVO2
./consulta3.sh >> $DIRECTORIO2$ARCHIVO3


     TOKEN="569774679:AAEl8uSwPNDzHwM_MCCR1-iXi4C6zLGeoqU"
     ID="152054272"
     IDdiego="966225514"
     MENSAJE="Servidor postgres test,  consultas diarias "
     MENSAJEIP="Servidor no alcanzable!!"
     URL="https://api.telegram.org/bot$TOKEN/sendMessage"
     URLFILE="https://api.telegram.org/bot$TOKEN/sendDocument"
     curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE"  > /dev/null
     curl -s -X POST $URL -d chat_id=$IDdiego -d text="$MENSAJE"  > /dev/null


#envio archivos a Jorge
curl -v -F "chat_id=$ID" -F document=@$DIRECTORIO2$ARCHIVO1 $URLFILE
curl -v -F "chat_id=$ID" -F document=@$DIRECTORIO2$ARCHIVO2 $URLFILE
curl -v -F "chat_id=$ID" -F document=@$DIRECTORIO2$ARCHIVO3 $URLFILE

#envios archvios Diego
curl -v -F "chat_id=$IDdiego" -F document=@$DIRECTORIO2$ARCHIVO1 $URLFILE
curl -v -F "chat_id=$IDdiego" -F document=@$DIRECTORIO2$ARCHIVO2 $URLFILE
curl -v -F "chat_id=$IDdiego" -F document=@$DIRECTORIO2$ARCHIVO3 $URLFILE
