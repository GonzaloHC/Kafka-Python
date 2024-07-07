from confluent_kafka import Producer
config = {'bootstrap.servers': 'localhost:9092'}

p = Producer(config)

name_topic = "testtopic"
id_partitions = 2
message = "Hola, esto es una prueba mas"
#En caso de colocar u topic inexistente, lo crea por defecto
p.produce(topic = name_topic, value = message, partition = id_partitions)
#El p.flush() Se utiliza para que el mensaje no se escape del Buffer y vaya directamente a Kafka
p.flush()