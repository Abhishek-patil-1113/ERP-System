# ERP System

It a simplified ERP (Enterprise Resource Planning) System. It is designed to manage basic business operations efficiently. 
The navigation contains :
  *Dashboard
  *Product Management
  *Order Management
  
#Dashboard :
  Provides an overview of the system's features. 
  It have auto updating low quamtity warning system which will detect the products having quantity less than 20.
  It have auto updating delayed order system which will detect the orders that are are placed more than 7 days ago.
  It contains indicators showing pending orders, delayed orders, total number of products.

#Products Management :
  Contains the the list of all the product in listed format.
  Products can be edited with 'edit' button.
  Prodcts can be deleted with 'delete' button.
  New products can be inserted with form on right side.
  Products can be listed with sorted on different columns.

#Order Managemnet :
  Contains the list of all the orders in listed format.
  Orders status can be changed with 'Change Status' button from pending to delivered and vice versa.
  Prodcts can be deleted with 'delete' button.
  Celendar view is available - which can be used to check the date wise expected delivery orders. Clicking on the dates will show all the orders to be delivered on that day.
  (Expected delivery date is considered to be 5 days after the order date which can be then changed by adding the expected delivery date column in database.)
