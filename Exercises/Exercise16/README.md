# Real-Time E-Commerce Analytics: End-to-end Project with Data Ingestion, CDC and NOSQL (Optional)

## Introduction
In this exercise, we build an architecture that combines MySQL for transactional data, Debezium for change data capture, Apache NiFi for data processing and routing, and MongoDB for flexible, schema-less storage of data. It provides a robust solution for building real-time data pipelines and analytics applications.

**Business Scenario**: 
An e-commerce platform needs to analyze user interactions, sales transactions, and product inventory in real-time to enhance customer experience, optimize inventory, and drive sales. The company wants to capture and analyze data on orders, product details, and customer interactions.


## Architecture
```scss
[MySQL] --(CDC)--> [Debezium] --(Change Events)--> [Message Broker (Kafka)] 
      |                                                        |
      |                                                        |
      +-------------------(Events)-------------------> [Apache NiFi]
                                                      |
                                                      |
                                                  [MongoDB]
```

- **MySQL**: Stores transactional data on orders, products, and customers.
- **Debezium**: Captures row-level changes in the MySQL database and streams them to Kafka.
- **NiFi**: Processes and routes data from Kafka to MongoDB.
- **MongoDB**: Stores the data in a flexible, schema-less format for real-time analytics.


## Pre-requisites
In this exercise, we will use all the components from the previous exercises. Run the following command to start the required containers:

```shell	
docker compose up -d
```
## Exercise

1. **MySQL Database:** Set up the MySQL database. Create a new database named `ecommerce` and 3 tables: `orders`, `products`, and `customers`. Insert some sample data into these tables. --> provide SQL script

2. **Debezium:** Configure Debezium to capture changes in the MySQL database. Use the `register-mysql.json` file from [Exercise 07](../Exercise07/register-mysql.json) to set up the MySQL connector.

3. **Apache NiFi:** Create a dataflow in NiFi to consume messages from the Kafka topic, extract fields from the JSON message, and insert the data into MongoDB. Use the following processors:
    - **ConsumeKafkaRecord_2_6**: Consume messages from the Kafka topic.
    - **EvaluateJsonPath**: Extract fields from the JSON message.
    - **PutMongoRecord**: Insert the data into MongoDB (database: `ecommerce`, collection: `changes_orders`).

4. **MongoDB:** Verify that the data is being inserted into MongoDB. Connect to the MongoDB container and query the `changes_orders` collection to view the data. Perform some basic queries to analyze the data.


# Resources
* **Data:** https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
* **Debezium (MySQL Connector)**: https://debezium.io/documentation/reference/1.7/connectors/mysql.html
* **Apache NiFi (MongoDB processors)**: https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-mongodb-nar/1.14.0/org.apache.nifi.processors.mongodb.PutMongo/index.html
* **MongoDB (Query operators)**: https://www.mongodb.com/docs/manual/reference/operator/query/
