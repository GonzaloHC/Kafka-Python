from confluent_kafka import Consumer

nombre = 'testtopic'
grupo_consumer = 'testgroup'
config={'bootstrap.servers': 'localhost:9092',
    'group.id':grupo_consumer, 
    'auto.offset.reset':'earliest'
}
c = Consumer(config)
c.subscribe([nombre])

try:
    while True:
        msg = c.poll(timeout=1.0)
        if msg is None: 
                print('No hay ningún mensaje')
                continue

        print(f"Valor Mensaje: {msg.value()}")
        print(f"Clave: {msg.key()}")
        print(f"Partición: {msg.partition()}")
        print(f"Offset: {msg.offset()}")
except KeyboardInterrupt:
    pass
finally:
        # Close down consumer to commit final offsets.
        c.close()

