from confluent_kafka.admin import AdminClient, NewTopic

conf = {'bootstrap.servers': 'localhost:9092'}
admin_client = AdminClient(conf)

#Creamos el nuevo topic
nombre_topic = "testtopic"
particiones = 3
nuevo = NewTopic(topic=nombre_topic, num_partitions=particiones)
result = admin_client.create_topics(new_topics=[nuevo])


#Imprimir el resultado de la creación del nuevo topic
for topic, future in result.items():
    try:
        future.result() #Esto lanza una eexcepción si hay un error
        print(f'Se ha creado el topic {nuevo} con {particiones} particiones.')
    except Exception as e:
        print(f"No se pudo crear el topic {topic}. Error: {e}")