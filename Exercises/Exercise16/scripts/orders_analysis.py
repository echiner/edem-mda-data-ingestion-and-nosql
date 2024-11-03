from pymongo import MongoClient
from time import sleep
from datetime import datetime, timedelta

# Establish MongoDB connection
client = MongoClient('mongodb://root:example@localhost:27017/') 

db = client['ecommerce']
collection = db['order_changes']

def get_orders_per_status():
    pipeline = [
      ####################################################
      ## TODO: Create the pipeline to get the aggregation required
      ####################################################
    ]
    
    results = collection.aggregate(pipeline)
    
    for result in results:
        print(f"Status: {result['_id']} - Count: {result['count']}")

def get_top_price_order():
    top_order = collection.find(
      ####################################################
      ## TODO: Use "collection.find" to get the top order
      ####################################################
    )
    
    top_order = list(top_order)
    if top_order:
        print(f"Top price order: Order ID {top_order[0]['order_id']} - Total Amount: ${top_order[0]['total_amount']:.2f}")
    else:
        print("No orders found.")

try:
    while True:
        print("-" * 40)
        print(f"Order status count at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}:")
        print("-" * 40)
        get_orders_per_status()
        print("-" * 40)
        get_top_price_order()
        print("-" * 40)
        print("\n")
        sleep(10)  # Wait for 10 seconds before running again
except KeyboardInterrupt:
    print("Process stopped by user.")
finally:
    client.close()
