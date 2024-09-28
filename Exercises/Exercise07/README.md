# Debezium: Setup

## Introduction

<img width="150" src="https://new.paradigmadigital.com/wp-content/uploads/2017/06/debezium-1.png">

In this exercise we will setup a CDC architecture with the following components:

MySQL --> CDC (Debezium) --> Kafka

FYI, we will follow similar steps as defined in the Debezium tutorial, in case you want to have more details:

* http://debezium.io/docs/tutorial/

## Pre-requisites

Run the docker containers with Docker Compose.

First **set the Debezium version**:

```shell
# In PowerShell
$env:DEBEZIUM_VERSION="2.7"

# In Windows Command Line
set DEBEZIUM_VERSION=2.7

# In Cywin and/or Linux
export DEBEZIUM_VERSION="2.7"
```

Now **start the containers**:

```shell
docker compose start zookeeper kafka kafka-ui mysql adminer
```
## Exercise

And **install the Debezium connector** in Kafka Connect:

```shell
# If you are using Cywin, Linux or a Windows version of "curl"
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @register-mysql.json

# If you are using PowerShell
Invoke-RestMethod -Uri http://localhost:8083/connectors/ -Method POST -Infile 'register-mysql.json' -ContentType 'application/json'
```
Do some final checks:

* Check that the connector has been created in the Kafka UI
* Check that you are able to access MySQL using the Adminer UI, and that the "inventory" database exists

**NOTE**: All the component URLs and credentials required are defined below in the "Understanding the components" section.

# Understanding the components

In this installation we have the following components:

* **Kafka**: Message broker, used for building real-time data pipelines and streaming apps. It is horizontally scalable, fault-tolerant and wicked fast
* **Zookeeper**: Open-source server which enables highly reliable distributed coordination
* **Kafka Connect**: MySQL Debezium connector, which reads the MySQL logs and sends data to a Kafka topic
* **Kafka UI (a.k.a. Redpanda Console)**: UI to visualize the cluster, topics, messages and connectors
* **MySQL**: Open-source database, which will be the data source
* **Adminer (MySQL UI)**: Web-base front-end to brower and interact with the database

# Resources