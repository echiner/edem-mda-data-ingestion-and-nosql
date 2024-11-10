# Neo4j - Introduction (Optional)

## Introduction

![Neo4j Logo](https://dist.neo4j.com/wp-content/uploads/20230926084108/Logo_FullColor_RGB_TransBG.svg)

In this optional exercise we will be testing Neo4j: Graph database management system developed by Neo4j, Inc. Described by its developers as an ACID-compliant transactional database with native graph storage and processing.

## Pre-requisites

First we will run the latest version of Neo4j using Docker:

```
docker run --name testneo4j -p7474:7474 -p7687:7687 -d --env NEO4J_AUTH=neo4j/test --env NEO4J_dbms_connector_https_advertised__address="localhost:7473" --env NEO4J_dbms_connector_http_advertised__address="localhost:7474" --env NEO4J_dbms_connector_bolt_advertised__address="localhost:7687" neo4j:latest
```

Now go to the database's UI: http://localhost:7474/browser/

When asked to "Connect to Neo4j", leave everything as default except for:

* Username: neo4j
* Password: test

In the home page, you can choose from the different guided tutorials:

* Getting started with Neo4j Browser: If you want to lear the basics
* Try Neo4j with live data (RECOMMENDED): Test the database with real data from movies/actors
* Cypher basics: Learn the basics of Cypher, the Neo4j query language

## Exercise

If you like text better or the UI is not working, you can also use the Cypher shell directly by following these steps:

* Get into the Neo4j docker container:

```
docker exec -it testneo4j bash
```

* Launch the Cypher shell:

```
cypher-shell -u neo4j -p test
```

* Test with a simple command (list the number of nodes in the database):

```
MATCH (n) RETURN count(n);
```

The above query will return '0' since we don't have any data. So now feel free to add data, query and play around.

# Resources

* [Neo4j](https://neo4j.com/)
* [Running Neo4j in Docker](https://neo4j.com/developer/docker-run-neo4j/)
