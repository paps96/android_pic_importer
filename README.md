# android_pic_importer

##Descripción

Script bash para generar a partir de una imagen, distintas imagenes con diferentes resoluciones para un proyecto Android, con inspiración en Android drawable importer. Por ahora solo funciona con imágenes .png

##Instalación

Es necesario tener instalado Imagemagick en el path de tu terminal. Esto se hace con el comando

__En mac:__

```
brew install imagemagick
```

__En Ubuntu:__
```
sudo apt install imagemagick
```

##Uso

Simplemente posiciona el script "crearImagenesAndroid.sh" en la carpeta donde se encuentre tus imagenes, que utilizarás en tu proyecto android. Recomiendo utilizar imagenes de alta resolución.

<img width="752" alt="Captura de pantalla 2023-11-12 a la(s) 8 37 40 p m" src="https://github.com/paps96/android_pic_importer/assets/93355667/e7af2278-dccf-40c3-8d22-7c3de2400bbe">


Escribe el comando y pulsa __Enter__:

```
sh crearImagenesAndroid.sh
```

<img width="752" alt="Captura de pantalla 2023-11-12 a la(s) 8 35 53 p m" src="https://github.com/paps96/android_pic_importer/assets/93355667/3bd120fa-13a5-4f39-b3e2-ff47ad8963a9">

Se crearán las carpetas con el nombre de cada resolución y en cada una de ellas estarán las imágenes necesarias para tu proyecto con su resolución ajustada.

<img width="1032" alt="Captura de pantalla 2023-11-12 a la(s) 8 36 04 p m" src="https://github.com/paps96/android_pic_importer/assets/93355667/c51b0972-ebad-46df-aee8-d39630fe81f8">
<img width="1032" alt="Captura de pantalla 2023-11-12 a la(s) 8 36 09 p m" src="https://github.com/paps96/android_pic_importer/assets/93355667/43e16390-bf9b-4a99-b296-ea64db1cb22a">
<img width="1032" alt="Captura de pantalla 2023-11-12 a la(s) 8 55 53 p m" src="https://github.com/paps96/android_pic_importer/assets/93355667/4b29a9b1-f77b-429e-bd27-1c8eee3f5b63">


