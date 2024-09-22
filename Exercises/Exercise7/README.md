# Introduction

<img width="150" src="https://new.paradigmadigital.com/wp-content/uploads/2017/06/debezium-1.png">

In this exercise we will setup a CDC architecture with the following components:

MySQL --> CDC (Debezium) --> Kafka

FYI, we will follow similar steps as defined in the Debezium tutorial, in case you want to have more details:

* http://debezium.io/docs/tutorial/

# Initial setup

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
docker compose up -d
```

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

# Exercises

* [**Exercise 1**: Basic CDC](Exercises/Exercise1)
* [**Exercise 2**: Complex CDC](Exercises/Exercise2)
* [**Exercise 3**: Message filtering with SMT](Exercises/Exercise3)
* [**Exercise 4** (Optional): End to end flow](Exercises/Exercise4)
* [**Post Work**: Run the Attunity tutorial](Exercises/PostWork)

# Understanding the components

In this installation we have the following components:

* **Kafka**: Message broker, used for building real-time data pipelines and streaming apps. It is horizontally scalable, fault-tolerant and wicked fast
* **Zookeeper**: Open-source server which enables highly reliable distributed coordination
* **Kafka Connect**: MySQL Debezium connector, which reads the MySQL logs and sends data to a Kafka topic
* **Kafka UI (a.k.a. Redpanda Console)**: UI to visualize the cluster, topics, messages and connectors
* **MySQL**: Open-source database, which will be the data source
* **Adminer (MySQL UI)**: Web-base front-end to brower and interact with the database

This is the config we have in the Docker Compose:

| Component | Service | Ports | URL/Comments |
| ------------- | ------------- | ------------- | ------------- |
| **Kafka** | kafka | 9092  | N/A  |
| **Zookeeper** | zookeeper | 2181, 2888 and 3888  | N/A  |
| **Kafka Connect** | connect | 8083  | N/A  |
| **Kafka UI** | redpanda-console | 9000 | http://localhost:9000/ |
| **MySQL** | mysql | 3306  | **Server**: mysql<br/>**Credentials**: mysqluser/mysqlpw  |
| **Adminer (MySQL UI)** | adminer | 8090  | http://localhost:8090/  |

# Shut down and destroy

```
# Shut down the cluster
docker-compose down
```

If you only want to stop the cluster (not destroy) use the stop command, and start to bring it up again:

```
# Stop the cluster
docker-compose stop

# Start the cluster
docker-compose start
```

You can also stop a specific service:

```
# Stop a service
docker-compose stop <service>

# Start a service
docker-compose start <service>
```
