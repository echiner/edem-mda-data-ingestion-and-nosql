# Debezium: Setup

## Introduction

<img width="150" src="https://new.paradigmadigital.com/wp-content/uploads/2017/06/debezium-1.png">

In this exercise we will setup a CDC architecture with the following components:

MySQL --> CDC (Debezium) --> Kafka

FYI, we will follow similar steps as defined in the Debezium tutorial, in case you want to have more details:

* http://debezium.io/docs/tutorial/

## Pre-requisites

Run the docker containers with Docker Compose, **starting the following containers**:

```shell
docker compose up -d zookeeper kafka connect redpanda-console mysql adminer
```
## Exercise

And **install the Debezium connector** in Kafka Connect:

```shell
# If you are using Cywin, Linux or a Windows version of "curl"
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @Exercises\Exercise07\register-mysql.json

# If you are using PowerShell
Invoke-RestMethod -Uri http://localhost:8083/connectors/ -Method POST -Infile 'Exercises\Exercise07\register-mysql.json' -ContentType 'application/json'
```
Do some final checks:

* Check that the connector has been created in the [Kafka UI](http://localhost:9000/overview) via the "Connectors" tab. You should see a connector named "inventory-connector" with status "RUNNING"
* Check that you are able to access MySQL using the [Adminer UI](http://localhost:8090/), and that the "inventory" database exists

**NOTE**: All the component URLs and credentials required are defined below in the "Understanding the components" section.

## Understanding the components

In this installation we have the following components:

* **Kafka**: Message broker we will use to send real-time update messages from Debezium
* **Zookeeper**: Required for Kafka to run. You can ignore it for the time being
* **Kafka Connect**: This is where Debezium will run and will connect to MySQL to get the real-time updates
* **Kafka UI (a.k.a. Redpanda Console)**: UI to visualize Kafka: topics, messages and connectors
* **MySQL**: Database we will be using as the source
* **Adminer (MySQL UI)**: UI to view the database, tables, etc. No 100% required since you could do it using the command line
    - System: MySQL
    - Server: mysql
    - Username: mysqluser
    - Password: mysqlpw
    - Database: inventory

# Resources

* **Debezium**: https://debezium.io/
* **Apache Kafka**: https://kafka.apache.org/
* **MySQL**: https://www.mysql.com/