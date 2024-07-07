# Kafka-Python

### Transmisión de Eventos en Streaming
la transmisión de eventos es la práctica de capturar datos en tiempo real fuentes de eventos como bases de datos, sensores, dispositivos móviles, servicios en la nube y aplicaciones de software en forma de flujos de los acontecimientos; almacenar estos flujos de eventos de forma duradera para su posterior recuperación; manipulación, procesamiento y reacción a los flujos de eventos en tiempo real y retrospectivamente; y enrutar los flujos de eventos a diferentes tecnologías de destino según sea necesario. De este modo, la transmisión de eventos garantiza un flujo continuo y la interpretación de datos para que la información correcta esté en el lugar correcto, en el momento correcto.

### ¿Qué es Apache Kafka?

Apache Kafka® es una plataforma avanzada de streaming de eventos diseñada para proporcionar una solución única y robusta para la transmisión de datos en tiempo real. Funciona permitiendo la publicación y suscripción de flujos de eventos, el almacenamiento seguro y duradero de estos datos, y la capacidad de procesarlos en tiempo real o de manera retrospectiva. Esta funcionalidad se ofrece a través de una arquitectura distribuida, que garantiza escalabilidad, elasticidad y tolerancia a fallos. Kafka es versátil en su implementación, pudiendo ejecutarse en hardware bare-metal, máquinas virtuales, contenedores y en entornos de nube, con opciones de autogestión o como servicio gestionado por diversos proveedores. En esencia, Kafka actúa como un sistema distribuido compuesto por servidores y clientes que se comunican mediante un protocolo TCP eficiente, con servidores que pueden funcionar como brokers de almacenamiento o ejecutar Kafka Connect para la integración con sistemas existentes y otros clústeres de Kafka, asegurando así una solución escalable y resistente para aplicaciones críticas.

### ¿Cómo instalamos Kafka?

En mi caso estoy trabajando desde WSL en windows, se ha creado un documento con los pasos para la instalación desde la línea de comandos de WSL. Puedes ubicarla aquí [INSTALACIÓN](install.sh)

### Inicializar Kafka

Para inicializar Kafka y comenzar a trabajar con esta poderosa herramienta desde su pc, pude seguir las instrucciones paso a paso, que se encuantran en el documento [INICIA-KAFKA](inicializar_kafka.shS)

### Eventos, Productores y Consumidores

Kafka es una plataforma de transmisión de eventos que permite a las aplicaciones registrar y procesar "eventos" en tiempo real. Un evento en Kafka se compone de una clave, un valor, una marca de tiempo y, opcionalmente, encabezados de metadatos. Por ejemplo, un evento podría ser un pago realizado por un usuario, identificado por su clave ("Alice"), con detalles del pago como valor ("Hiciste un pago de $200 a Bob"), y la fecha y hora del evento.

Los "productores" son aplicaciones que generan y envían estos eventos a Kafka, mientras que los "consumidores" son aquellos que leen y actúan basándose en estos eventos. Kafka se caracteriza por su diseño desacoplado, donde productores y consumidores operan independientemente, lo que contribuye a su escalabilidad y robustez. Los productores no necesitan esperar a los consumidores para continuar su procesamiento, y Kafka puede garantizar que cada evento se procese una sola vez.

Los eventos se almacenan en "topics", que actúan como contenedores para agrupar eventos similares. Un topic puede ser, por ejemplo, "pagos", y puede tener múltiples productores y consumidores asociados. A diferencia de otros sistemas de mensajería, los eventos en Kafka no se eliminan después de ser leídos; en cambio, se mantienen por un período definido antes de ser descartados. Esto permite que los eventos sean consumidos múltiples veces si es necesario.

### Interactuar con los elementos de Kafka

Para comenzar a interactuar con los elementos de kafka, primero hay que asegurarse de tener inicializado kafka, y luego puedes comenzar a probar. Para ello puedes ayudarte de los comandos que se encuentran en el archivo [COMANDOS](comandos-basicos.sh), importante identificar cómo se va a consumir los mensajes en los topics, sobre todo si existe un grupo de consumers, y se está trabajando con varias particiones en los topics.

### Apache Kafka con Cliente de Python a través de Confluent.

Se puede utilizar el módulo de python de confluent para interactuar con kafka, resulta una solución muy útil para los entornos de producción. y los scripts, para crear topics, producers y consumers los consigue en la carpeta [Python-kafka](python-kafka)

Tienes la carpeta [ejemplo_Uso](ejemplo_Uso), allí encontrar unos notebooks, con ejemplo de como usar pandas para leer mensajes desde kafka y guardarlos en un dataframe, o incluso hay un ejercicio dónde se lee un archivo ".csv", y el productor envía fila por fila de ese archivo, y el consumidor los recibe para luego, procesarlos y graficarlo. Es un ejercicio muy interesante que abre las puertas a pensar en infinitas posibilidades. 

Espero este repositorio pueda ayudarte a iniciar tu camino dentro de Kafka. A mi me sirvió. 