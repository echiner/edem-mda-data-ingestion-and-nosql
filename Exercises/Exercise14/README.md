# MongoDB - Indexes

## Introduction

In this exercise we will focus on MongoDB indexes to increase the query performance.

## Pre-requisites

In this exercise, we will work with the `listingsAndReviews` collection in the `airbnb` database from the [previous exercise](../Exercise13/README.md). Only MongoDB and the UI Docker containers are needed.


## Exercise
The goal is to find the host_name of the host with the most total listings (*host.host_total_listings_count*).

- Find the host_name of the host with the most total listings (*host.host_total_listings_count*).
- Tips, use:
    - find() with projection
    - sort()
    - limit()
    - explain()
- Create an index to support the query
- Calculate how much more efficient it is now with this index


# Resources
https://www.mongodb.com/docs/manual/indexes/