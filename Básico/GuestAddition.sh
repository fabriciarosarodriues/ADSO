sudo apt update && sudo apt upgrade -y
#actualizamos sistema
sudo apt install -y build-essential dkms linux-headers-$(uname -r)
#instalamos paquetes necesarios para las guest additions

sudo mount /dev/cdrom /mnt
cd /mnt
sudo sh VBoxLinuxAdditions.run
#Montamos e instalamos las guest additions

sudo reboot
#Reiniciamos la maquina virtual

lsmod | grep vbox
#Comprobamos que las guest additions se han instalado correctamen
