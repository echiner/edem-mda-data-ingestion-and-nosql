# Debezium: Basic Change Data Capture

## Introduction

In this exercise we will start playing around with Debezium and do our first CDC by updating a table row in MySQL and seeing it flow in real time in Kafka.

## Pre-requisites

Follow the steps in the setup exercise (previous to this one) to launch the required components.

Now, let's **connect to the "customers" Kafka topic**, to listen to new messages (feel free to use the Kafka UI if you will):

```shell
# Consume messages from a Debezium topic ("dbserver1.inventory.customers")
docker-compose exec kafka /kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --from-beginning --property print.key=true --topic dbserver1.inventory.customers
```

And then, in a different shell screen, **login to the MySQL CLI** (feel free to use the Adminer UI if you will):

```shell
# Modify records in the database via MySQL client (PowerShell)
docker-compose exec mysql bash -c 'mysql -u $MYSQL_USER -p$MYSQL_PASSWORD inventory'

# Modify records in the database via MySQL client (Command Line)
docker-compose exec mysql bash -c 'mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} inventory'
```

## Exercise

First of all, ensure both terminals (Kafka consumer & MySQL client) are active and visible at the same time. This way, when you make changes in MySQL, you can immediately see the effects in Kafka.

In the MySQL screen:

```shell
# Switch to the "inventory" database (if not already in)
mysql> use inventory;

# List the tables
mysql> show tables;

# Query the "customers" table
mysql> SELECT * FROM customers;
```

Make sure the connector is configured by checking in the Kafka UI (nunder "Connectors") or using "curl":

If using Liunx or Windows command line:

```shell
# Get the list of connectors ("inventory-connector" should appear!!)
curl -H "Accept:application/json" localhost:8083/connectors/

# Get the info of our Debezium connector ("inventory-connector")
curl -i -X GET -H "Accept:application/json" localhost:8083/connectors/inventory-connector
```

If using Windows PowerShell:

```shell
# Get the list of connectors ("inventory-connector" should appear!!)
Invoke-RestMethod -Uri http://localhost:8083/connectors/ -Method GET

# Get the info of our Debezium connector ("inventory-connector")
Invoke-RestMethod -Uri http://localhost:8083/connectors/inventory-connector -Method GET
```

**Task 1**

> Look into the documentation and try to understand all values in the connector response.

**Task 2**

> Look at the consumer console for the existing data flowing (TIP: it is a JSON line starting with {"schema":...). Understand all the values. Feel free to use the Kafka UI as well if you want.

Now, back in the MySQL screen, let's update some data:

```shell
# Update one of the records
mysql> UPDATE customers SET first_name='Anne Marie' WHERE id=1004;

# Check the data has been updated
mysql> select * from customers;
```

**Task 3**

> Look back at the consumer console or the Kafka UI. What happened? Understand the message.

And now, update a different table (e.g. "orders") and check again.

**Task 4**

> What happened? Did the message flow? Why and/or where?

## Playing around

**Task 5: Your time to play**

> Insert and/or delete data. What are the messages now?

> Stop the connector (that is, stop the "connect" container), make changes to the database and restart the connector. What happens?

# Resources:

* Debezium Documentation: https://debezium.io/documentation/reference/2.7/
* Debezium MySQL Connector: https://debezium.io/documentation/reference/2.7/connectors/mysql.html