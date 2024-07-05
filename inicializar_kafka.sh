#Crear nuevo cluster kafka con un ID random
kafka-storage.sh random-uuid
#ese comando arrojará un id algo parecido a:
OIII2zHFSoy3sIdMOVSYTA
#Configurar directorio Logs, sustituyendo el ID por el recogido
#"kafka-storage.sh format -t ID -c ~/kafka_2.13-3.7.1/config/kraft/server.properties"
kafka-storage.sh format -t OIII2zHFSoy3sIdMOVSYTA -c ~/kafka_2.13-3.7.1/config/kraft/server.properties
#Lo anterior crea una carpeta llamada "kraft-combined-logs" en la ruta /tmp, para poder almacenar los logs.

#Inicializar Kafka en daemon mode
kafka-server-start.sh ~/kafka_2.13-3.7.1/config/kraft/server.properties

#Comando de ejemplo para probar
kafka-topics.sh --bootstrap-server localhost:9092 --list
#NOTA: el puerto por defecto es el 9092, si no se establece el puerto, no funcionan los comandos
