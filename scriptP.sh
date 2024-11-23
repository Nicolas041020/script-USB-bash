#!/bin/bash

sudo rm -r /home/nicocraxker33/A

usb_buscada="058f:6387"
echo "La USB: $usb_buscada"

while true; do
if lsusb | grep -q "$usb_buscada"; then

    Ruta="/media/nicocraxker33/NICOCRAXKER/Inicio.txt"
if [ -e "$Ruta" ]; then
    contenido=$(cat "$Ruta")

 if [ "$contenido" = "004" ]; then
	echo "se conecto la usb correcta"
        mkdir -p /home/nicocraxker33/A/C/B/F/G /home/nicocraxker33/A/C/D/H /home/nicocraxker33/A/C/B/E

        touch /home/nicocraxker33/A/C/B/F/G/config1.txt /home/nicocraxker33/A/C/D/H/index.html

        ln -s /home/nicocraxker33/A/C/D/H/index.html /home/nicocraxker33/A/C/B/E/Econfig2.html

        usb_data=$(lsusb | grep "$usb_buscada")
        arbol_directorios=$(tree /home/nicocraxker33/A)
        capacidad_d=$(df -h / | awk 'NR==2 {print $2}')
        tamano_ram=$(free -h | awk 'NR==2 {print $2}')
        info_pc=$(uname -a | awk '{print $1}')
        procesador=$(grep -m 1 "model name" /proc/cpuinfo | cut -d: -f2 | xargs)
        ip=$(hostname -I)
	fecha=$(date)

        c1="/home/nicocraxker33/A/C/B/F/G/config1.txt"

        echo "I am Nicolas Moreno Ramirez,I am in Systems Engineering Program sixth semester, $fecha" | sudo tee "$c1"
	echo "Laptop Information" | sudo tee -a "$c1"
        echo "Operating System : " | sudo tee -a "$c1"
        echo "$info_pc" | sudo tee -a "$c1"
        echo "Processor : " | sudo tee -a "$c1"
        echo "$procesador" | sudo tee -a "$c1"
        echo "IP : " | sudo tee -a "$c1"
        echo "$ip" | sudo tee -a "$c1"

	/home/nicocraxker33/spik.sh > /tmp/spik_output.log 2> /tmp/spik_error.log
	#espeak -f /home/nicocraxker33/A/C/B/F/G/config1.txt

        text=$(cat "$c1")
        html_f="/home/nicocraxker33/A/C/D/H/index.html"

        echo "<html>" | sudo tee "$html_f"
        echo "<head><title>Nicolas Moreno quiz</title><meta charset=\"UTF-8\"></head>" | sudo tee -a "$html_f"
	echo "<body><h2>I am Nicolas Moreno Ramirez,I am in Systems Engineering Program sixth semester, $fecha</h2>" | sudo tee -a "$html_f"
	echo "<h2>USB :</h2><pre>$usb_data</pre>" | sudo tee -a "$html_f"
	echo "<h2>ARBOL :</h2><pre>$arbol_directorios</pre>" | sudo tee -a "$html_f"
	echo "<h2>DISCO :</h2><pre>$capacidad_d</pre>" | sudo tee -a "$html_f"
	echo "<h2>RAM :</h2><pre>$tamano_ram</pre>" | sudo tee -a "$html_f"
        echo "<h2>INFORMACION PC :</h2><pre>$text</pre></body></html>" | sudo tee -a "$html_f"



        # LED
        LED_PATH="/sys/class/leds/input3::capslock/"
        if [ ! -d "$LED_PATH" ]; then
            echo "No se encontró el LED de Caps Lock en $LED_PATH"
            exit 1
        fi

        for i in {1..5}; do
            echo 1 | sudo tee "${LED_PATH}brightness"
            sleep 0.5
            echo 0 | sudo tee "${LED_PATH}brightness"
            sleep 0.5
        done

        # ssh pass para el otro pc
        PASSWORD='Nacionalcampeon04.'
        USER='petriv'
        HOST='172.20.10.5'
        FILE_TO_COPY="/home/nicocraxker33/A/C/D/H/index.html"
        REMOTE_PATH='/var/www/html/'
        REMOTE_FILE='index.html'

        # borrar el index si existe
sshpass -p "$PASSWORD" ssh "$USER@$HOST" "sudo rm -f $REMOTE_PATH$REMOTE_FILE"


# Copiar el html y pegarlo en la ruta de la otra pc
sshpass -p "$PASSWORD" scp "$FILE_TO_COPY" "$USER@$HOST:$REMOTE_PATH"

# Iniciar el servicio Apache (si esta apagado)
st=$(sshpass -p "$PASSWORD" ssh "$USER@$HOST" "systemctl is-active apache2")
if [ "$st" != "active" ]; then
	echo "ADVERTENCIA EL APACHE ESTA ABAJO, INICIANDO LOCALHOST..."
	#sshpass -p "$PASSWORD" ssh "$USER@$HOST" "sudo systemctl start apache2"

	> "$html_f"

	echo "<html>" | sudo tee "$html_f"
        echo "<head><title>Nicolas Moreno quiz</title><meta charset=\"UTF-8\"></head>" | sudo tee -a "$html_f"
        echo "<body><h2>I am Nicolas Moreno Ramirez,I am in Systems Engineering Program sixth semester, $fecha</h2>" | sudo tee -a "$html_f"
        echo "<h2>USB :</h2><pre>$usb_data</pre>" | sudo tee -a "$html_f"
        echo "<h2>ARBOL :</h2><pre>$arbol_directorios</pre>" | sudo tee -a "$html_f"
	echo "<h2>DISCO :</h2><pre>$capacidad_d</pre>" | sudo tee -a "$html_f"
        echo "<h2>RAM :</h2><pre>$tamano_ram</pre>" | sudo tee -a "$html_f"
        echo "<h2>INFORMACION PC :</h2><pre>$text</pre>" | sudo tee -a "$html_f"
	echo "<img src=\"real.jpg\"></body></html>" | sudo tee -a "$html_f"


	 mv /home/nicocraxker33/A/C/D/H/index.html /var/www/html/
	sudo systemctl start apache2
	xdg-open http://localhost:9000
else
xdg-open http://$HOST:9005/index.html
echo "else"
fi

{
echo "Subject: Correo Quiz Desarrollo Web"
echo "Mi nombre es Nicolas Moreno Ramirez de Desarrollo WEB y mi nota es 4.3"
} | msmtp -a gmail nm341510@gmail.com


exit
break
else
	echo "La clave dentro del archivo Inicio.txt es incorrecta"
break
    fi
fi
fi
done
