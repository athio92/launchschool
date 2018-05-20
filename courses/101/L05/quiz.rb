 # Question 8 - 10 - pasting for easier side-by-side reading only. Not going to run the code.

order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]
# Goal: restructure so data becomes:
customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

all_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48},
  {customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65},
  # rest of data
]

fulfilled_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
  {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
  # rest of data
]

# Question 8 assessment:
# Method 1:
# {12 => {customer_id : 12, customer_name : "Emma Lopez"}, orders : [[true, 135.99], [true, 289.49]] }
# customer_orders = customer_orders.values -> doesn't give desired format

# Method 2:
# {12 => {customer_name : "Emma Lopez", customer_id: 12, orders: [{order_fulfilled : true, order_value: 289.49}]} }
# Wrong, the method replaces orders of same customer ID instead of aggregating them

# Method 3:
# {12 => {customer_id : 12, customer_name : "Emma Lopez", 
#  orders : [ {order_fulfilled: true, order_value: 135.99 }, 
#             {order_fulfilled: true, order_value: 135.99 } ] 
# }}

# Question 9 assessment: create the all_olders (unfiltered total)
# Method 1:
#  [{customer_id: 12, customer_name: "Emma Lopez"}, {customer_id: 32, customer_name: "Michael Richards"}]
#
#