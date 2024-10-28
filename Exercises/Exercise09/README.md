# Debezium: Advanced Change Data Capture

## Introduction

We will now reconfigure the connector and do some more complex changes.

## Pre-requisites

Follow the steps in the setup exercise (previous to this one) to launch the required components.

We will need the same consoles (or UIs) as in the previous exercise:

```shell
# Consume messages from a Debezium topic
docker compose exec kafka /kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --from-beginning --property print.key=true --topic dbserver1.inventory.customers

# Modify records in the database via MySQL client
docker compose exec mysql bash -c 'mysql -u $MYSQL_USER -p$MYSQL_PASSWORD inventory'
```

## What to do

Follow these steps:

1. Create a new table
2. Reconfigure Debezium connector so it **only uses that table**. You can delete it using the following command, or directly in the Kafka UI:

```shell
# Here's how to remove an existing connector (for Windows Command Line or Linux)
curl -X DELETE http://localhost:8083/connectors/inventory-connector

# Here's how to remove an existing connector (for PowerShell)
Invoke-RestMethod -Uri http://localhost:8083/connectors/inventory-connector -Method DELETE
```

3. Add new data to the new table, and check if data is flowing
4. Add new data to another table, and check if data is flowing
5. Apply simple data changes (some inserts/updates)
6. Change the data structure (add a column) of the new table
7. Add new data and check the new data structure flowing
   * What happened? Did the data structure change flow? Check the "dbserver1" topic. ;-)
8. Configure the masking for one of the columns ("column.mask.with._length_.chars") and update the table
   * **NOTE**: The 'length' in the param is a number (e.g. "column.mask.with.6.chars"), which represents the number of symbols used in the mask

# Resources:

* Debezium Documentation: https://debezium.io/documentation/reference/2.7/
* Debezium MySQL Connector: https://debezium.io/documentation/reference/2.7/connectors/mysql.html