#Desactivar IPV6 en Windows para evitar errores de conexión al instalar Java o Kafka

sysctl -w net.ipv6.conf.all.disable_ipv6=1

sysctl -w net.ipv6.conf.default.disable_ipv6=1

#Instalar Java, en este caso se usara la versión 11 de Amazon Correto.
wget -O - https://apt.corretto.aws/corretto.key | sudo gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | sudo tee /etc/apt/sources.list.d/corretto.list

sudo apt-get update; sudo apt-get install -y java-11-amazon-corretto-jdk

#Verifica que se haya instalado Java de forma adecuada
java -version

#Descarga la ultima versión de Kafka, compatible con la version de scala_2.13
wget https://downloads.apache.org/kafka/3.7.1/kafka_2.13-3.7.1.tgz

#descomprimimos kafka
tar -xvzf kafka_2.13-3.7.1.tgz

#Mover kafka a la ruta principal solo si es necesario
mv kafka_2.13-3.7.1 ~

#Configuración de path, en las variables de entorno para poder ejecutar Kafka desde cualquier ubicación
vim .bashrc
#pulsa "i" para escribir, ubicar al final del archivo y pegar el path, luego pulsar "esc", ":wq" para guardar y salir
PATH="$PATH:~/kafka_2.13-3.7.1/bin"  
