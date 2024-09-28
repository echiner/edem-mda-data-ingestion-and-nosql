# MongoDB - Basic Querying

## Introduction

In this exercise we will do some basic querying in MongoDB to the data loaded in the Aviation Stack exercise (using NiFi).

## Pre-requisites

For this exercise we will only need MongoDB and the UI:

```shell
docker-compose start mongo mongo-express
```

## Exercise

For this exercise, we will use the MongoDB instance from the “Data Ingestion” module.

### Query the data using the **MongoDB Shell**:

```bash
shell> docker ps
shell> docker exec -it <container_id> mongosh -u root -p example --authenticationDatabase admin

mongo> show dbs;
mongo> use <your_database>;
mongo> db.<your_collection>.countDocuments({"arrival.iata": "MAD"});
mongo> db.<your_collection>.find({"arrival.iata": "MAD"});
```

Do the same using Mongo Express (admin/pass): http://localhost:8081/

# Resources

* **MongoDB (Query documents)**: https://www.mongodb.com/docs/manual/tutorial/query-documents/