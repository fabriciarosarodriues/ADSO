
#herramiento para la unión en el dominio
wget https://github.com/beyondtrust/pbis-open/releases/download/9.1.0/pbis-open-9.1.0.551.linux.x86_64.deb.sh 
sudo apt update
sudo apt install realmd sssd sssd-tools libnss-ss libpam-sss adcli samba-common-bin oddjob oddjob-mkhomedir packagekit samba

#conceder permisos de ejecución

chmod +x pbis-open-9.1.0.551.linux.x86_64.deb.sh

#Ejecutar con privilegios de administrador

sudo ./pbis-open-9.1.0.551.linux.x86_64.deb.sh

# Una vez finalizada la intalación se debe editar el fichero /etc/samba/smb.conf

   # workgroup = EXAMENW
   # security = ADS
   # realm = EXAMENW.LOCAL

#COMANDO PARA UNIR AL DOMINIO
sudo /opt/pbis/domainjoin-cli join examenw.local

#comprobación usuarios y grupos

getent psswd
getent group
