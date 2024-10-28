# MongoDB - Aggregations & Projections

## Introduction

We continue with MongoDB querying. Going into more detail on aggregations and projections. You will learn how to use MongoDB's aggregation framework to filter, project, sort, and limit documents in a collection.

## Pre-requisites

For this exercise we will only need MongoDB and the UI:

```shell
docker compose up -d mongo mongo-express
```

## Exercise

### Part 1 - Setup
Load the data from the `listingsAndReviews.json` file into the `airbnb` database by executing the python script [`load_data.py`](./python/load_data.py). Check the data in the `listingsAndReviews` collection, either using the MongoDB shell or the UI.

### Part 2 - Working with Aggregations and Projections

In this exercise, you will work with the `listingsAndReviews` collection in the `airbnb` database. The goal is to find the first document with the country "Brazil". 

**Hint:** There are different ways to achieve this:
1. Using the find method with projection and sort.
2. Using the aggregation framework with the `$match`, `$project`, `$sort`, and `$limit` stages. 

The goal is to build the aggregation pipeline to query the following requirements:
- Match documents where the address.country is "Brazil".
- Project only the name, address.country, and address.city fields.
- Sort the documents in ascending order by the name field.
- Limit the result to the first document.


**Tip:** You can either hardcode the stages or better, use variables to store them, making the code more readable. It will help you to understand the stages, as it is easier to read and maintain the code.


## Extra Exercise: Max property price

**Scenario:** The base price for the basic rental is $price; that price includes the number of guests provided in $guests_included field. But a property may take more guests in total ($accommodates). Those extra guests pay an $extra_people cost per person for every person more than the number of guests included.

1. How many extra guests can each property have? Add that as a new field with $set
2. How much it would cost with these extra guests? Use $project to show the basic price and the maximum price if fully occupied with $accommodates people




# Resources
* **MongoDB (Aggregation)**: https://www.mongodb.com/docs/manual/aggregation/