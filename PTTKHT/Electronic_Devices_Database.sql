CREATE TABLE Users(
  user_id INT PRIMARY KEY,
  username VARCHAR(225),
  password VARCHAR(225),
  full_name VARCHAR(225),
  role VARCHAR(225)
);

CREATE TABLE Customers(
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(225),
  phone VARCHAR(10),
  email VARCHAR(225),
  address VARCHAR(225)
);

CREATE TABLE Devices(
  device_id INT PRIMARY KEY,
  device_name VARCHAR(225),
  serial VARCHAR(225),
  nodel VARCHAR(225),
  quantity_in_stock INT CHECK (quantity_in_stock > 0), 
  import_price FLOAT,
  sale_price float
);

CREATE TABLE Orders(
  order_id INT PRIMARY KEY,
  order_date DATE,
  total_amount INT, 
  status VARCHAR(225) CHECK (status in ('COMPLETED', 'PENDING', 'FAILED')),
  customer_id INT, 
  user_id INT,
  foreign key (user_id) references Users(user_id),
  foreign key (customer_id) references Customers(customer_id)
);

CREATE TABLE Order_details(
  order_detail_id INT PRIMARY KEY, 
  order_id INT, 
  device_id INT, 
  quantity INT CHECK (quantity > 0),
  price_per_item FLOAT, 
  foreign key (order_id) references Orders(order_id),
  foreign key (device_id) references Devices(device_id) 
);



