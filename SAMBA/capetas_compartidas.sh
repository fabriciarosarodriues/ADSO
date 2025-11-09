#Antes de nada comprobar en windows que se puede ver la carpeta compartida
#Una vez hecho eso descargamos en debian12 estos paquetes para montar recursos

sudo apt update
sudo apt install cifs-utils keyutils

#crear carpetas 

sudo mkdir /profesores

#dar permisos

sudo chmod 777 /profesores

#cambiar de propietario (si hace falta)

sudo chwn profesor1@examenw.local

#perminos exclusivos de lectura y escritura

sudo chmod 700 /profesor1

#crear punto de monstaje

sudo mkdir -p /mnt/profesorado


#creamos archivo de credenciales
sudo nano /root/.smbcred

#lo editamos de la siguiente manera
#username=profesor1
#password=m@YTHE4TH
#domain= EXAMENW.LOCAL

#username=profesor2
#password=m@YTHE4TH
#domain= EXAMENW.LOCAL

#protegemos el archivo para que solo el root pueda leerlo

sudo chmod 600 /root/.smbcred


#ES IMPRTANTE CONFIGURAR EL ARCHIVO smb.conf



#probamos el montaje manualmente

sudo mount -t cifs //ExWinServer2019/Profesorado /mnt/profesorado \
  -o credentials=/root/.smbcred,iocharset=utf8,file_mode=0660,dir_mode=0770,uid=root,gid=profesores

#explicación

#file_mode=0660 << El archivo solo es accesible para el propietario y el grupo

#dir_mode=0770 << La capeta solo es accesible por propietario y grupo

#uid=root << Propietario de los archivos será el root

#gid = profesor(cambiar por el numero que corresponda) << El grupo de los archivos será profesores

#gid profesores = 802161743
#gid alumnos = 802161743




#como hacerlo según Itziaar

sudo mkdir /profesores
sudo apt-get install cifs-utils

#esto se utiliza para que las carpetas se monten nada mas iniciar el equipo
sudo nano /etc/ftab

//10.0.2.10/Profesores /profesores cifs user=profesor1,password=M@ythe4th,domain=examenw.local,gid=802161743,file_mode=0660,dir_mode=0770 0 0

sudo reboot

#file_mode → Define los permisos de los archivos dentro del recurso compartido cuando se montan en Linux.

#dir_mode → Define los permisos de las carpetas dentro del recurso compartido cuando se montan en Linux.

#0777
#Archivos/carpetas accesibles por todos: lectura, escritura y ejecución

#0666
#Archivos: lectura y escritura para todos

#0644
#Archivos: lectura/escritura propietario, lectura grupo/otros

#0660
#Archivos: lectura/escritura propietario y grupo, otros no

#0770
#Carpetas: lectura/escritura/entrar propietario y grupo, otros no

#0755
#Carpetas: propietario rwx, grupo y otros rx


#COMPROBAR CON 

su profesor1@examenw.local
cd /profesores
touth algo.txt

#mirar si sale en server

#mirar su otro usuario puede acceder o no

