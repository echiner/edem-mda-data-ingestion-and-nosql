# EDEM - Master Big Data and Cloud - Data Ingestion and NOSQL

Exercises for the "Introduction to Data Ingestion and NOSQL" class at EDEM.
In this course we learn how to ingest data using [Apache NiFi](https://nifi.apache.org/) and CDC ([Debezium](https://debezium.io/)), and how to store it in [MongoDB](https://www.mongodb.com/).

## Introduction

TBD

## Initial Setup

We will be using the Docker Compose in this root folder, so start the Docker Compose components:

```shell
docker-compose up -d
```

```shell
# List the running services
docker ps

# Stop a specific service
docker-compose stop <SERVICE>
```

Finde below the list of services with a description of each one.

## Exercises

* [**Exercise 1**: NiFi - Building our first Data Flow - File to File](Exercises/Exercise1)
* [**Exercise 2**: NiFi - Basic Ingestion (I) - HTTP to File](Exercises/Exercise2)
* [**Exercise 3**: NiFi - Basic Ingestion (II) - HTTP to File, with data manipulation](Exercises/Exercise3)
* [**Exercise 4**: NiFi - Complex Data Ingestion - Real-time Flights](Exercises/Exercise4)
* [**Exercise 5**: NiFi - GDELT Data Ingestion (Optional)](Exercises/Exercise5)
* [**Exercise 6**: NiFi - Ingesting real-time data (Optional)](Exercises/Exercise6)
* [**Exercise 7**: Debezium - Setup](Exercises/Exercise7)
* [**Exercise 7**: Debezium - Basic CDC](Exercises/Exercise8)
* [**Exercise 8**: Debezium - Advanced CDC](Exercises/Exercise9)
* [**Exercise 8**: MongoDB - Basic Querying](Exercises/Exercise10)


## Understanding the components

We will be using the same Docker Compose throught the three sessions, and these are the components which will be launched:

* **Apache NiFi**: Ingestion tool used in the course
* **Apache NiFi Registry**: Code management and repository for Apache NiFi
* **Kafka**: Message broker for streaming data
* **Kafka UI**: Web UI for monitoring and managing Kafka topics (we will be using the Redpanda Console)
* **Kafka Connect**: Apache Kafka Connectors for ingesting data from external systems
* **Debezium**: CDC open-source tool for ingesting data from databases, which will run as a Kafka Connect source connector
* **MongoDB**: NOSQL document database for storing JSON
* **MongoDB Express**: Basic MongDB front-end for viewing and searching data

Here is the list of components and ports:

| Component  | Docker Service | Port |
| ------------- | ------------- | ------------- |
| **Apache NiFi**  | nifi  |  [8443](https://localhost:8443/nifi) |
| **Apache NiFi Registry**   | nifi-registry  | [18080](http://localhost:18080/nifi-registry)  |
| **Kafka** | kafka | 9092  | N/A  |
| **Zookeeper** | zookeeper | 2181, 2888 and 3888  | N/A  |
| **Kafka Connect** | connect | 8083  | N/A  |
| **Kafka UI** | redpanda-console | 9000 | http://localhost:9000/ |
| **MySQL** | mysql | 3306  | **Server**: mysql<br/>**Credentials**: mysqluser/mysqlpw  |
| **Adminer (MySQL UI)** | adminer | 8090  | http://localhost:8090/  |
| **MongoDB**   | mongo  | 27017  |
| **MongoDB Express - UI**   | mongo-express  | [8081](http://localhost:8081/)  |

## Shut down and destroy

```
# Shut down the cluster
docker-compose down
```