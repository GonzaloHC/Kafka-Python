########
#TOPICS#
########

#Crear un topics, de nombre "prueba"
kafka-topics.sh --bootstrap-server localhost:9092 --topic prueba --create
#obtener inforamción sobre el topic creado
kafka-topics.sh --bootstrap-server localhost:9092 --topic prueba --describe
#mostrar topics creados
kafka-topics.sh --bootstrap-server localhost:9092 --list
#borrar topics
kafka-topics.sh --bootstrap-server localhost:9092 --topic prueba --delete
#crear un topic con particiones
kafka-topics.sh --bootstrap-server localhost:9092 --topic particiones --create --partitions 2

#REPLICAS 
#Cuando se está en un entorno distribuido 
kafka-topics.sh --bootstrap-server localhost:9092 --topic replicas --create --partitions 3 --replication-factor 2

###########
#PRODUCERS#
###########

#Para enviar un mensaje a los topics de un producer basta con el comando:
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic pruebaparticiones
#Allí se abre un un espacion en donde escribir el mensaje, sin embargo el mensaje puede llegar de forma aleatoria a diferentes particiones
#Para evitar la aleatoriedad en las particiones, en Kafka se puede trabajar con clave valor. De esta manera todos los mensajes con la misma clave irán a la misma particion.
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic pruebaparticiones --property parse.key=true --property key.separator=:
#Si queremos confirmación de que todos los mensajes están llegando de forma correcta, con agregar una nueva propiedad
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic pruebaparticiones --producer-property acks=all

