#Proclamar sudo a mi usuario
#!/bin/bash

# Script para configurar sudo para un usuario en Debian
echo "Configurando sudo para el usuario..."

su -

apt update && apt install sudo -Y

usermod -aG sudo usuario #para agregar tu usuario al grupo sudo

sudo whoami #esto es para comprobar que tu usuario ahora esta el el grupo sudo (tiene que decolver root)

#editar archivo /etc/sudoers
#con nombre usurio ALL=(ALL:ALL) ALL
# "dantooine\leia" ALL=(ALL:ALL) ALL

#esto es para dar permisos de sudo a un grupo en concreto

# "%dantooine\\admins" ALL=(ALL:ALL) ALL



chmod +x nombreDelArchivo.sh #esto es para dar permisos para ejercutar un archivo (tanto para ubuntu como para debian)

#Si no tiene permisos de ejecución, agrégaselos con:

chmod +x /ruta/del/programa