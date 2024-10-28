# MongoDB - Advanced Querying

## Introduction

In this exercise we will use the data we inserted in the previous exercise to perform some advanced queries to explore flight data in more detail by applying filters with different operators.

## Pre-requisites

Use the same setup as in the [previous exercise](../Exercise11/README.md). Once you have loaded the data into MongoDB, you can stop the NiFi container. We will only use the MongoDB and its UI container for this exercise.

```shell
docker compose stop nifi
```

## Exercise

1. **Flights Departing from a Specific Airport and Arriving in Another**: Retrieve all flights that depart from 'BCN' and arrive in 'MAD'.
2. **Flights with Delays**: Retrieve all flights that have a departure delay greater than 10 minutes.
3. **Flights Arriving in a Specific Time Frame:** Retrieve all flights that arrive in the year 2019.
4. **Flights Currently in the Air:** Retrieve all flights that are currently in the air and above 10,000 feet.

**Tip**: Use comparison operators like `$gt`, `$lt`, `$gte`, `$lte`, `$eq`, `$ne` to build your queries.


# Resources
* **MongoDB (CRUD)**: https://www.mongodb.com/docs/manual/crud/
* **MongoDB (Query operators)**: https://www.mongodb.com/docs/manual/reference/operator/query/