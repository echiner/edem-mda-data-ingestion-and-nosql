# MongoDB - Query flight data

## Introduction

In this exercise we will do some basic querying in MongoDB to the data loaded in the [Aviation Stack exercise (using NiFi)](../Exercise04/README.md).

## Pre-requisites

For this exercise we use the generated data from exercise 04. Keep using the same MongoDB and its UI container instances. If you have deleted them, you can start them again with the following command:

```shell
docker compose up -d nifi mongo mongo-express
```

Import your saved template from the exercise 04 and run it to load the data into MongoDB.

## Exercise

For this exercise, we will get familiar with both the MongoDB shell and the Mongo Express UI for basic querying.

First, connect to the MongoDB shell within your container:

```bash
shell> docker ps
shell> docker exec -it <container_id> mongosh -u root -p example --authenticationDatabase admin
```

Then, try some of the following queries in the MongoDB shell to get familiar with the data:

```javascript
// List all databases
show dbs;

// Create/ use the database
use <your_database>;

// List all collections
show collections;

// Count the number of documents in the collection (with query to filter)
db.<your_collection>.countDocuments();

// Find all documents with a specific field value
db.<your_collection>.find({"field": "value"});
```

1. Find all documents with the 'arrival.iata' field equal to 'MAD'.
2. How many flights are there in the collection?
3. How many flights depart from 'BCN'?


Do the same using Mongo Express (admin/pass): http://localhost:8081/
Feel free to explore the data and try different queries.

# Resources

* **MongoDB (Query documents)**: https://www.mongodb.com/docs/manual/tutorial/query-documents/