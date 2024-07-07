from confluent_kafka import Producer
config = {'bootstrap.servers': 'localhost:9092'}

p = Producer(config)
#En caso de colocar u topic inexistente, lo crea por defecto
p.produce('testtopic', 'mensaje de prueba')
#El p.flush() Se utiliza para que el mensaje no se escape del Buffer y vaya directamente a Kafka
p.flush()