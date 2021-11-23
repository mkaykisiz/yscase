# Yemeksepeti
How to install app

---

### Docker Installation
Install docker and docker-compose.

Build all services
```bash
docker-compose build
```

Start an app instance
```bash
docker-compose up app
```

> You can connect to <http://localhost:8000/> from your local machine.

Access to project terminal
```bash
docker-compose exec app bash
```

---

### Example Requests
## Postman Doc
If you want make test endpoints, import postman.json to postman.
- Endpoints
```bash
    > [POST] Create Order: Crete new order.
    > [GET]  Get Orders: List All orders and status. filter choices: '?status=waiting'
    > [GET]  Process Order: Get first order on redis and process order 
```
#### Swagger Doc

<http://localhost:8000/static/doc/index.html>

### Run Tests 
Run tests
```bash
./manage.py test
```

### Run Flake8 
Run lint controls
```bash
flake8
```

### App Info
#### Food
##### - Food
    Food detail
#### Restaurant
##### - RestaurantCategory
    Category for restaurant
##### - Restaurant
    Restaurant info
##### - Menu
    Restaurant and food match for menu
#### Order
##### - Order
    restaurant, user info for order 
##### - OrderFood
    food and total info for order