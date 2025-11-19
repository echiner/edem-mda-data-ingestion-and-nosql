"""
MongoDB Bulk Ingestion Script for Flight Data

Purpose
-------
This script ingests a JSON file (either newline-delimited JSON (JSONL) or a single JSON array)
into a MongoDB collection efficiently using bulk insert operations.

Usage
-----
1. Install the required dependencies:
   pip install pymongo python-dateutil

2. Update the connection details and file path below.

3. Run the script:
   python mongo_ingest.py
"""

from bson import json_util
from dateutil import parser
from pymongo import InsertOne, MongoClient


def convert_timestamps(obj):
    """
    Helper: recursively convert ISO timestamps to datetime objects
    """
    if isinstance(obj, dict):
        return {k: convert_timestamps(v) for k, v in obj.items()}
    elif isinstance(obj, list):
        return [convert_timestamps(i) for i in obj]
    elif isinstance(obj, str):
        try:
            return parser.isoparse(obj)
        except ValueError:
            return obj
    else:
        return obj


class MongoFlightIngestor:
    """
    A helper class to handle bulk ingestion of flight data into MongoDB.
    """

    def __init__(self, connection_string, database_name, collection_name):
        """
        Initialize MongoDB connection.
        """
        self.connection_string = connection_string
        self.database_name = database_name
        self.collection_name = collection_name

        # Connect to MongoDB
        self.client = MongoClient(self.connection_string)
        self.db = self.client[self.database_name]
        self.collection = self.db[self.collection_name]

    def read_json_file(self, filename):
        """
        Reads flight data from a JSON or JSON Lines file.
        Automatically handles MongoDB Extended JSON ($oid, $date, etc.)
        """
        print(f"Reading data from {filename} ...")
        data = []

        with open(filename, "r", encoding="utf-8") as file:
            first_char = file.read(1)
            file.seek(0)

            if first_char == "[":
                # JSON array file
                data = json_util.loads(file.read())
            else:
                # JSON Lines (newline-delimited)
                for line in file:
                    if line.strip():
                        data.append(json_util.loads(line))
            converted = convert_timestamps(data)

        print(f"Loaded {len(converted)} records from file.")
        return converted

    def bulk_insert(self, records):
        """
        Performs a bulk insert operation for the given records.
        """
        if not records:
            print("No records to insert.")
            return

        print(f"Inserting {len(records)} records into MongoDB...")
        requests = [InsertOne(record) for record in records]
        result = self.collection.bulk_write(requests)
        print(f"Inserted {result.inserted_count} records successfully!")

    def close_connection(self):
        """Closes the MongoDB connection."""
        self.client.close()
        print("MongoDB connection closed.")


def main():
    # --- CONFIGURATION SECTION ---
    CONNECTION_STRING = "mongodb://<username>:<password>@<host>:<port>"
    DATABASE = "<database_name>"
    COLLECTION = "<collection_name>"
    FILENAME = "flights_data_backup.json"
    # ------------------------------

    # Create an ingestor instance
    ingestor = MongoFlightIngestor(
        connection_string=CONNECTION_STRING,
        database_name=DATABASE,
        collection_name=COLLECTION,
    )

    # Read and ingest data
    records = ingestor.read_json_file(filename=FILENAME)
    ingestor.bulk_insert(records=records)

    # Close connection
    ingestor.close_connection()


if __name__ == "__main__":
    main()
