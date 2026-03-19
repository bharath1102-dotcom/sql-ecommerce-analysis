INSERT INTO customers VALUES
(1,'Arun Kumar','Chennai','India','2023-01-10'),
(2,'Priya Sharma','Delhi','India','2023-02-12'),
(3,'Rahul Verma','Mumbai','India','2023-02-18'),
(4,'Sneha Iyer','Bangalore','India','2023-03-05'),
(5,'Amit Singh','Hyderabad','India','2023-03-22'),
(6,'Neha Gupta','Pune','India','2023-04-01'),
(7,'Ravi Patel','Ahmedabad','India','2023-04-10'),
(8,'Kavya Nair','Kochi','India','2023-04-18'),
(9,'Vikram Mehta','Jaipur','India','2023-05-03'),
(10,'Anjali Das','Kolkata','India','2023-05-20');

INSERT INTO products VALUES
(101,'Laptop','Electronics',60000),
(102,'Smartphone','Electronics',25000),
(103,'Headphones','Electronics',2000),
(104,'Office Chair','Furniture',7000),
(105,'Desk Lamp','Furniture',1500),
(106,'Running Shoes','Fashion',3500),
(107,'Backpack','Fashion',1200),
(108,'Smart Watch','Electronics',8000);

INSERT INTO orders VALUES
(1001,1,'2023-06-01'),
(1002,2,'2023-06-03'),
(1003,3,'2023-06-05'),
(1004,1,'2023-06-10'),
(1005,5,'2023-06-12'),
(1006,6,'2023-06-15'),
(1007,7,'2023-06-18'),
(1008,8,'2023-06-20'),
(1009,9,'2023-06-25'),
(1010,10,'2023-06-28');

INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1001,103,2),
(3,1002,102,1),
(4,1003,106,1),
(5,1004,104,1),
(6,1005,101,1),
(7,1006,108,1),
(8,1007,107,2),
(9,1008,105,1),
(10,1009,102,1),
(11,1010,106,1);

INSERT INTO payments VALUES
(1,1001,64000,'Credit Card'),
(2,1002,25000,'UPI'),
(3,1003,3500,'Debit Card'),
(4,1004,7000,'UPI'),
(5,1005,60000,'Credit Card'),
(6,1006,8000,'UPI'),
(7,1007,2400,'Debit Card'),
(8,1008,1500,'UPI'),
(9,1009,25000,'Credit Card'),
(10,1010,3500,'UPI');