
#herramiento para la unión en el dominio
wget https://github.com/beyondtrust/pbis-open/releases/download/9.1.0/pbis-open-9.1.0.551.linux.x86_64.deb.sh 
sudo apt update
sudo apt install realmd sssd sssd-tools libnss-sss libpam-sss adcli samba-common-bin oddjob oddjob-mkhomedir packagekit samba

#conceder permisos de ejecución

chmod +x pbis-open-9.1.0.551.linux.x86_64.deb.sh

#Ejecutar con privilegios de administrador

sudo ./pbis-open-9.1.0.551.linux.x86_64.deb.sh

# Una vez finalizada la intalación se debe editar el fichero /etc/samba/smb.conf

   # workgroup = EXAMENW
   # security = ADS
   # realm = EXAMENW.LOCAL

#comprobar que el archivo /etc/resolv.conf este asi 

#domain examenw.local
#search examenw.local
#nameserver 192.168.1.10

#COMANDO PARA UNIR AL DOMINIO
sudo /opt/pbis/domainjoin-cli join examenw.local
#después de esto tiene que salir success

#comprobación usuarios y grupos

getent passwd
getent group

#comaando para que no necesites escribir el dominio completo para iniciar sessión

sudo /opt/pbis/bin/config AssumeDefaultDomain true
#sin esta opción hay que usar EXAMENW\profesor1 o profesor1@examnew.local

#ahora se puede usar profesor1

sudo /opt/pbis/bin/config UserDomainPrefix EXAMENW
#PARA QUE ASUMAN QUE SI EL USUARIO NO ES LOCAL, PERTENECE A ESE DOMINIO


sudo /opt/pbis/bin/config LoginShellTemplate /bin/bash
#aqui se define el shell predeterminado de los usuarios

sudo /opt/pbis/bin/config HomeDirTemplate %H/%D/%U
#esto es para ver donde se construyen las rutas del directorio personal
#/%H --> /home
#/%D --> /EXAMEN
#/%U --> /USUARIO

