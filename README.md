# wmxer

---

## Descripción

Este script de Bash permite la suma de múltiples diccionarios eliminando líneas duplicadas para diversas finalidades, especialmente útil en auditorías donde se requiere variedad sin tener que cambiar constantemente de diccionario y reiniciar el proceso.
En caso de no encontrar el diccionario especificado este será omitido, si realmente existe y deseas agregar este diccionario faltante puedes volver a lanzar el script para expander el diccionario con el que se desea trabajar.


## Script
``` bash
./wmxer.sh [-f / --files <archivos>] [-o / --output <directorio_archivo_salida>] [-n / --name <nombre_archivo_salida>]
 ```
## Opciones
``` bash
-f, --files <archivos>: Especifica los archivos que se van a sumar, separados por comas.
-o, --output <directorio_archivo_salida>: Especifica la ruta del archivo de salida, por ejemplo: "/ruta/a/guardar/resultado_sin_duplicados.txt".
-n, --name <nombre_archivo_salida>: Especifica el nombre del archivo de salida, por ejemplo: "resultado.txt"
```

## Ejemplos de uso

1.- Output en el mismo directorio de trabajo.
``` bash
./wmxer.sh -f diccionario1.txt,diccionario2.txt,diccionario3.txt -n resultado.txt
```
2.- Output en un directorio diferente.
``` bash
./wmxer.sh -f diccionario1.txt,diccionario2.txt,diccionario3.txt -o /directorio/a/guardar/el/resultado.txt
```
