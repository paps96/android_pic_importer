#!/bin/sh

#  crearImagenesAndroid.sh
#  
#
#  Created by Pedro Alberto  on 11/11/23.
#  

program_name="convert"

if command -v $program_name &> /dev/null ; then
    echo "$program_name (ImageMagick) está instalado."
else
    echo "$program_name no está instalado. Por favor instala imageMagick en el path"
    exit 1
fi

        lowLimitmdpi=0
        highLimitmdpi=200
        highLimithdpi=500
        highLimitxhdpi=1200
        highLimitxxhdpi=1800

        mdpiSrc=("225%" "400%" "900%" "1600%")
        carpetas_sinmdpi=("drawable-hdpi" "drawable-xhdpi" "drawable-xxhdpi" "drawable-xxxhdpi")
        hdpiSrc=("44.44%" "177.77%" "400%" "711.11%")
        carpetas_sinhdpi=("drawable-mdpi" "drawable-xhdpi" "drawable-xxhdpi" "drawable-xxxhdpi")
        xhdpiSrc=("25%" "56.25%" "225%" "400%")
        carpetas_sinxhdpi=("drawable-mdpi" "drawable-hdpi" "drawable-xxhdpi" "drawable-xxxhdpi")
        xxhdpiSrc=("11.11%" "25%" "44.44%" "177.77%")
        carpetas_sinxxhdpi=("drawable-mdpi" "drawable-hdpi" "drawable-xhdpi" "drawable-xxxhdpi")
        xxxhdpiSrc=("6.25%" "14.0625%" "25%" "56.25%")
        carpetas_sinxxxhdpi=("drawable-mdpi" "drawable-hdpi" "drawable-xhdpi" "drawable-xxhdpi")
        longitud_carpetas=4

nombre_directorio="res"
nombre_carpetas=("drawable-mdpi" "drawable-hdpi" "drawable-xhdpi" "drawable-xxhdpi" "drawable-xxxhdpi")


ruta_script="$(dirname "$0")"
echo "Esto es el directorio raíz: $ruta_script"

ruta_directorio="$ruta_script/$nombre_directorio"

if [ -d "$ruta_directorio" ]; then
    echo "El directorio $nombre_directorio existe en la ruta del script."
else
    echo "El directorio $nombre_directorio no existe en la ruta del script."
    echo "Se creará el directorio"
    mkdir "$nombre_directorio"
fi

for resoluciones in "${nombre_carpetas[@]}"; do
    carpeta_resolucion="$ruta_directorio/$resoluciones"
    if [ ! -d "$carpeta_resolucion" ]; then
        mkdir "$carpeta_resolucion"
        echo "Directorio creado: $carpeta_resolucion"
    else
        echo "El directorio $carpeta_resolucion ya existe."
    fi
done


crear_imagen(){
    local archivo_a_convertir=$1
    local compresion=$2
    local carpeta=$3
    local ruta_final="$ruta_directorio/$carpeta/$archivo_a_convertir"
    
    convert "$archivo_a_convertir" -resize "$compresion" "$ruta_final"
}

for archivo in "$ruta_script"/*.png; do
    if [ -f "$archivo" ]; then
        echo "Procesando archivo: $archivo"

        resolucion=$(identify -format "%w %h" "$archivo")

        ancho_string=$(echo $resolucion | cut -d' ' -f1)
        alto_string=$(echo $resolucion | cut -d' ' -f2)


        echo "Ancho: $ancho_string"
        echo "Alto: $alto_string"

        ancho_entero=$((ancho_string))
        alto_entero=$((alto_string))

        echo "Ancho: $ancho_entero"
        echo "Alto: $alto_entero"


        if [ "$ancho_entero" -gt "$lowLimitmdpi" -a "$ancho_entero" -le "$highLimitmdpi" ]; then
            cp "$archivo" "$ruta_directorio/drawable-mdpi"
            
            for ((i=0; i<$longitud_carpetas; i++)); do
                crear_imagen "$archivo" "${mdpiSrc[i]}" "${carpetas_sinmdpi[i]}"
            done
            
            echo "$ancho_entero está entre $lowLimitmdpi y $highLimitmdpi"
        elif [ "$ancho_entero" -gt "$highLimitmdpi" -a "$ancho_entero" -le "$highLimithdpi" ]; then
            cp "$archivo" "$ruta_directorio/drawable-hdpi"
            
            for ((i=0; i<$longitud_carpetas; i++)); do
                crear_imagen "$archivo" "${hdpiSrc[i]}" "${carpetas_sinhdpi[i]}"
            done
            echo "$ancho_entero está entre $highLimitmdpi y $highLimithdpi"
        elif [ "$ancho_entero" -gt "$highLimithdpi" -a "$ancho_entero" -le "$highLimitxhdpi" ]; then
            cp "$archivo" "$ruta_directorio/drawable-xhdpi"
            
            for ((i=0; i<$longitud_carpetas; i++)); do
                crear_imagen "$archivo" "${xhdpiSrc[i]}" "${carpetas_sinxhdpi[i]}"
            done
            echo "$ancho_entero está entre $highLimithdpi y $highLimitxhdpi"
        elif [ "$ancho_entero" -gt "$highLimitxhdpi" -a "$ancho_entero" -le "$highLimitxxhdpi" ]; then
            cp "$archivo" "$ruta_directorio/drawable-xxhdpi"
            
            for ((i=0; i<$longitud_carpetas; i++)); do
                crear_imagen "$archivo" "${xxhdpiSrc[i]}" "${carpetas_sinxxhdpi[i]}"
            done
            echo "$ancho_entero está entre $highLimitxhdpi y $highLimitxxhdpi"
        else
            cp "$archivo" "$ruta_directorio/drawable-xxxhdpi"
            
            for ((i=0; i<$longitud_carpetas; i++)); do
                crear_imagen "$archivo" "${xxxhdpiSrc[i]}" "${carpetas_sinxxxhdpi[i]}"
            done
            echo "$ancho_entero está entre $highLimitxhdpi y $highLimitxxhdpi"
            echo "$ancho_entero es mayor a $highLimitxxhdpi"
        fi
    fi
done



echo "el programa termino"
