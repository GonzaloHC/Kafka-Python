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
kafka-topics.sh --bootstrap-server localhost:9092 --topic pruebaparticiones --create --partitions 2

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

###########
#CONSUMERS#
###########

#Para consumir los mensajes en tiemp real basta  con un topic específico basta con usar el comando
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic pruebaparticiones
#Para consumir los mensajes desde el principio 
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic pruebaparticiones --from-beginning
#Si los mensajes llegaron a particiones distintas o si queremos saber la hora en la que se produjeron etc.
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic pruebaparticiones --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning

###########
#CONSUMER GROUPS
###########

#Productor balancea aleatoriamente mensajes entre particiones de un mismo topic
kafka-console-producer.sh --bootstrap-server localhost:9092 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic topicgrupo

#Iniciar un consumidor asociado a un grupo
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topicgrupo --group testgrupoconsumers

#Listar los consumidores que tenemos
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list

#Mostrar mas detalles de un grupo de consumidores
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group pruebagrupoconsumers

#Mover el offset a la posición zero (no se formaliza hasta que se lanza el "--execute")
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group pruebagrupoconsumers --reset-offsets --to-earliest --topic topicgrupo --dry-run

#Mover el offset a la posición zero
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group pruebagrupoconsumers --reset-offsets --to-earliest --topic topicgrupo --excute