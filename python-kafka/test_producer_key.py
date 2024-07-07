from confluent_kafka import Producer
config = {'bootstrap.servers': 'localhost:9092'}

p = Producer(config)

name_topic = "testtopic"
clave = 'ciudad'
message = 'Sao Pablo'

#En caso de colocar u topic inexistente, lo crea por defecto
p.produce(topic = name_topic, key=clave, value = message)
#El p.flush() Se utiliza para que el mensaje no se escape del Buffer y vaya directamente a Kafka
p.flush()