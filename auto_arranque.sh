KAFKA_CLUSTER_ID="$(kafka-storage.sh random-uuid)"

kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c ~/kafka_2.13-3.7.1/config/kraft/server.properties

kafka-server-start.sh ~/kafka_2.13-3.7.1/config/kraft/server.properties