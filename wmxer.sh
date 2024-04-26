#!/bin/bash

#-----------------------------------------------------------------------------------------------------------------#
#    Hola...                                                                                                      #
#    Scipt hecho por Ex1on con la utilidad de poder sumar multiples diccionarios para diversas finalidades de     #
#    entre las cuales destacaría el poder tener más variedades al momento de realizar una auditoria y no tener    #
#    que estar cambiando de diccionario y reiniciando el proceso.                                                 #
#                                                                                                                 #
#    Creado sobre todo para poder salvar el tiempo :)                                                             #
#-----------------------------------------------------------------------------------------------------------------#


# ---------- Variables ---------- #
resultado="resultado.txt"
output_path="resultado_sin_duplicados.txt"
output_file=""
archivos=()

# ---------- Colores ---------- #
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"

# ---------- Parametros ---------- # 
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in 
        -f|--files)
            shift
            IFS=',' read -r -a FILE_PATHS <<< "$1"
            ;;
        -o|--output)
            shift
            output_path="$1"
            ;;
        -n|--name)
            shift
            output_file="$1"
            ;;
        *)
            echo -e "${yellowColour}[*]${endColour} ${redColour}Argumento desconocido, -p/--paths | -o/--output | -f|--file-name${endColour}"
            exit 1
            ;;
    esac
    shift
done 

# ---------- Procesos ---------- #
if [ ${#FILE_PATHS[@]} -eq 0 ]; then
    echo -e "${yellowColour}[*]${endColour} ${redColour}Debes especificar al menos una ruta de archivo usando -p/--paths.${endColour}"
    exit 1
fi

for archivo in "${FILE_PATHS[@]}"; do
    if [ ! -f "$archivo" ]; then
        echo -e "${yellowColour}[*]${endColour} ${redColour}El archivo ${greenColour}$archivo${endColour} ${redColour}no existe.${endColour}"
        continue
    fi

    cat "$archivo" >> "$resultado"
done 

if command -v test > /dev/null; then
    if test -z "$output_file"; then
        sort -u "$resultado" > "$output_path"
    else
        sort -u "$resultado" > "$output_file"
    fi
fi

# ---------- Listo ---------- #
rm resultado.txt
echo -e "${yellowColour}[*]${endColour} ${greenColour}Terminado... resultado en:${endColour} ${purpleColour}${output_file:-$output_path}${endColour}"