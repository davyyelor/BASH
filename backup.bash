#! /bin/bash
#precondicion:
# Instrucción cron (crontab -e): 
# 00 12 * * * bash /home/david/Escritorio/seguridad/backups.bash
#En este archivo se deberan de cambiar los directorios de la copia origen y destino dependiendo de cuales quieres que sean. 


dir_copia="/var/tmp/Backups/"
origen="/home/david/Escritorio/seguridad"

function getDiaAnt(){
    echo $(date --date="1 day ago" +%d-%m-%Y)
}

function getDia(){
    echo $(date +%d-%m-%Y)
}

function make_backup(){
    ayer="$dir_copia$(getDiaAnt)"
    hoy="$dir_copia$(getDia)"

    # Si no existe el directorio del backup anterior lo creamos
    [ ! -d "$ayer" ] && mkdir $ayer 
    mkdir $hoy

    rsync -av --link-dest=$ayer $origen $hoy
}

echo "Creating backup of "$origen
make_backup
