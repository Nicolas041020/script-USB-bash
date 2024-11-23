**SCRIPT DE BASH CON SHH SPEAK ARBOL DE DIRECTORIOS XDG OPEN Y MAS...**

Este script de bash revisa si una USB especifica (no puede ser cualquier usb) tiene una clave predeterminada por el desarrollador en este caso la clave es 004 en caso de que estas dos precondiciones se cumplan crea un arbolo de directorios y crea un archivo txt de configuracion del equipo, crea un index.html y le hace un enlace simbolico al archivo de config1.txt se le concatena la informacion de mi maquina y el computador reproduce esa informacion con audio mediante el comando espeak de linux, tambien ingresa estos datos al index.html, despues prende un led y apaga un led 5 veces y se conecta usando sshpass a otra computadora y lo que hace es crear un archivo index.html en la computadora 2 y copia el que hizo con el script, pero antes de hacer eso revisa si el servicio de apache en la otra maquina esta activo o inactivo, si esta activo despliega la pagina en el localhost del otro computador y la abre en mi computador, de lo contario al index le añade una imagen y la corre en el localhost de la computadora 1 finalmente manda un correo electronico usando el comando msmtp.

**CONFIGURACION DE LINUX**

**entrar a sudo visudo y copiar estos comandos**

@includedir /etc/sudoers.d
suusuario ALL=(ALL) NOPASSWD: /home/suusuario/scriptP.sh
suusuario ALL=(ALL) NOPASSWD: /bin/rm, /bin/systemctl
suusuario ALL=(ALL) NOPASSWD: /usr/bin/tee
suusuario ALL=(ALL) NOPASSWD: /bin/systemctl start apache2
www-data ALL=(ALL) NOPASSWD: /usr/lib/cgi-bin/scriptP.sh
www-data ALL=(ALL) NOPASSWD: /var/www/html/parcial/scriptP.sh
suusuario ALL=(ALL) NOPASSWD:ALL
www-data ALL=(ALL) NOPASSWD: ALL
www-data ALL=(ALL) NOPASSWD: /bin/mkdir /home/suusuario/*, /bin/rmdir /home/suusuario/*, /bin/rm -rf /home/suusuario/*
www-data ALL=(ALL) NOPASSWD: /usr/lib/cgi-bin/scriptP-sh
suusuario ALL=(ALL) NOPASSWD: /home/suusuario/scriptP.sh
suusuario ALL=(ALL) NOPASSWD: /bin/rm, /bin/systemctl
suusuario ALL=(ALL) NOPASSWD: /usr/bin/tee
suusuario ALL=(ALL) NOPASSWD: /bin/systemctl start apache2
www-data ALL=(ALL) NOPASSWD: /usr/lib/cgi-bin/scriptP.sh
www-data ALL=(ALL) NOPASSWD: /var/www/html/parcial/scriptP.sh
www-data ALL=(ALL) NOPASSWD: ALL
www-data ALL=(ALL) NOPASSWD: /bin/mkdir /home/suusuario/*, /bin/rmdir /home/suusuario/*, /bin/rm -rf /home/suusuario/*
www-data ALL=(ALL) NOPASSWD: /usr/lib/cgi-bin/scriptP-sh
suusuario ALL=(ALL) NOPASSWD: /home/suusuario/spik.sh
www-data ALL=(ALL) NOPASSWD: /home/suusuario/spik.sh
www-data ALL=(ALL) NOPASSWD: /usr/bin/xdg-open
suusuario ALL=(ALL) NOPASSWD: /usr/bin/systemctl stop apache2


**BASRC**

ingresar la ruta del archivo que contiene el script
