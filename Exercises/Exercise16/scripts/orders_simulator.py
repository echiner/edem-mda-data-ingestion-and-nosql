import mysql.connector
import random
import time
from datetime import datetime, timedelta

# Function to create random customer data
def generate_order():
    customer_id = random.randint(1, 100)
    order_date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    status = random.choice(['Pending', 'Shipped', 'Delivered', 'Cancelled'])
    total_amount = round(random.uniform(50.0, 500.0), 2)
    payment_method = random.choice(['Credit Card', 'PayPal', 'Bank Transfer', 'Cash on Delivery'])
    shipping_address = f"{random.randint(100, 999)} Random St, City {chr(random.randint(65, 90))}"
    
    return (customer_id, order_date, status, total_amount, payment_method, shipping_address)

# Database connection
connection = mysql.connector.connect(
    host='localhost',
    user='mysqluser',
    password='mysqlpw',
    database='ecommerce_db'
)
cursor = connection.cursor()

# Function to insert data into the table
def insert_order():
    order_data = generate_order()
    ####################################################
    ## TODO: Insert the order data in the database
    ####################################################

try:
    while True:
        insert_order()
        time.sleep(random.randint(1, 10))  # Insert data every 1 to 10 seconds
except KeyboardInterrupt:
    print("Process stopped by user.")
finally:
    cursor.close()
    connection.close()
