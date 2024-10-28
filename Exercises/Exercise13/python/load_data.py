from pymongo import MongoClient
import json

# MongoDB connection details
mongo_host = "localhost"
mongo_port = 27017
username = "root"
password = "example"
database_name = "airbnb"
collection_name = "listingsAndReviews"


try:
    # Create a connection to MongoDB
    client = MongoClient(f"mongodb://{username}:{password}@{mongo_host}:{mongo_port}/?authSource=admin")
    db = client[database_name]
    collection = db[collection_name]
    
    # Open the JSON file and insert each document into the collection
    with open('listingsAndReviews.json', encoding='utf-8-sig', errors='replace') as file:
        for line in file:
            # Remove leading/trailing whitespace and parse the JSON
            document = json.loads(line.strip())

            # Insert the document
            result = collection.insert_one(document)
            print("Document inserted with ID:", result.inserted_id)


except Exception as e:
    print("An error occurred:", e)

finally:
    # Close the connection
    client.close()
