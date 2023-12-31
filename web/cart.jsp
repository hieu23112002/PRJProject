<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.DAOProduct,entity.Product,java.sql.ResultSet"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Shopping Cart</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"">
        <link href=" https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="css/cart.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <style>
        .black-text {
            color: black;
        }
    </style>
    <style>
        .btn-container {
            display: flex;
            justify-content: flex-start;
            max-width: 200px;
        }

        .btn-primary {
            margin-right: auto;
        }
    </style>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="homeController">Clothes</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" href="homeController">Home</a></li>
                            <c:if test="${empty sessionScope.customer && empty sessionScope.staff }">
                            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                            </c:if>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li>
                                    <hr class="dropdown-divider" />
                                </li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-dark btn-sm btn-smaller" type="submit">Search</button>
                    </form>
                    <a href="cart">
                        <button class="btn btn-outline-dark ms-2">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${numOfCart}</span>
                        </button>
                    </a>
                    <div class="dropdown">
                        <button class="btn btn-outline-dark  ms-2 dropdown-toggle" type="button" id="loginRegisterDropdown"
                                data-bs-toggle="dropdown" aria-expanded="false">
                            <c:choose>
                                <c:when test="${not empty sessionScope.customer}">
                                    Welcome, ${sessionScope.customer.getFirst_name()}
                                </c:when>
                                <c:when test="${not empty sessionScope.staff}">
                                    Welcome, ${sessionScope.staff.getFirst_name()}
                                </c:when>
                                <c:otherwise>
                                    Welcome, Guest!
                                </c:otherwise>
                            </c:choose>

                        </button>
                        <ul class="dropdown-menu" aria-labelledby="loginRegisterDropdown">
                            <c:if test="${not empty sessionScope.customer}">
                                <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                                </c:if>
                                <c:if test="${not empty sessionScope.staff}">
                                <li><a class="dropdown-item" href="managerProductController?service=display">Manager Product</a></li>
                                <li><a class="dropdown-item" href="managerCustomerController?service=display">Manager Customer</a></li>
                                </c:if>
                            <li><a class="dropdown-item" href="logoutController">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <style>
            .btn-smaller {
                font-size: 0.75rem;
                padding: 0.25rem 0.5rem;
            }

            .form-control {
                width: 250px;
            }
        </style>
        <main class="page">
            <section class="shopping-cart dark">
                <div class="container">
                    <div class="block-heading">

                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12 col-lg-8">
                                <div class="items">
                                    <form action="updateCart" method="post">
                                        <c:forEach items="${listCart}" var="p">
                                            <div class="product">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <img class="img-fluid mx-auto d-block image" src="img/a.png">
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="info">
                                                            <div class="row">
                                                                <div class="col-md-5 product-name">
                                                                    <div class="product-name">
                                                                        <a href="#" class="black-text">${p.product_name}</a>
                                                                        <div class="product-info">
                                                                            <div>Model Year: <span class="value">${p.model_year}</span></div>
                                                                            <div>  Category: <span class="value">${p.category_name}</span></div>
                                                                            <div>     Brand: <span class="value">${p.brand_name}</span></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 quantity">
                                                                    <label for="quantity">Quantity:</label>
                                                                    <input name="idUpdate" value="${p.product_id}" style="display: none">
                                                                    <input id="quantity" type="text"
                                                                           class="form-control quantity-input" name="quantity" value="${p.quantity}" required>
                                                                </div>
                                                                <div class="col-md-3 price">
                                                                    <span>${p.list_price}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <div class="btn-container">
                                            <button type="submit" class="btn btn-primary btn-lg">Update</button>
                                        </div>
                                    </form>

                                    <!--                                    
                                                                        <div class="product">
                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    <img class="img-fluid mx-auto d-block image" src="img/a.png">
                                                                                </div>
                                                                                <div class="col-md-8">
                                                                                    <div class="info">
                                                                                        <div class="row">
                                                                                            <div class="col-md-5 product-name">
                                                                                                <div class="product-name">
                                                                                                    <a href="#" class="black-text">Lorem Ipsum dolor</a>
                                                                                                    <div class="product-info">
                                                                                                        <div>Display: <span class="value">5 inch</span></div>
                                                                                                        <div>RAM: <span class="value">4GB</span></div>
                                                                                                        <div>Memory: <span class="value">32GB</span></div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4 quantity">
                                                                                                <label for="quantity">Quantity:</label>
                                                                                                <input id="quantity" type="text"
                                                                                                       class="form-control quantity-input">
                                                                                            </div>
                                                                                            <div class="col-md-3 price">
                                                                                                <span>$120</span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product">
                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    <img class="img-fluid mx-auto d-block image" src="img/a.png">
                                                                                </div>
                                                                                <div class="col-md-8">
                                                                                    <div class="info">
                                                                                        <div class="row">
                                                                                            <div class="col-md-5 product-name">
                                                                                                <div class="product-name">
                                                                                                    <a href="#" class="black-text">Lorem Ipsum dolor</a>
                                                                                                    <div class="product-info">
                                                                                                        <div>Display: <span class="value">5 inch</span></div>
                                                                                                        <div>RAM: <span class="value">4GB</span></div>
                                                                                                        <div>Memory: <span class="value">32GB</span></div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4 quantity">
                                                                                                <label for="quantity">Quantity:</label>
                                                                                                <input id="quantity" type="text"
                                                                                                       class="form-control quantity-input">
                                                                                            </div>
                                                                                            <div class="col-md-3 price">
                                                                                                <span>$120</span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product">
                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    <img class="img-fluid mx-auto d-block image" src="img/a.png">
                                                                                </div>
                                                                                <div class="col-md-8">
                                                                                    <div class="info">
                                                                                        <div class="row">
                                                                                            <div class="col-md-5 product-name">
                                                                                                <div class="product-name">
                                                                                                    <a href="#" class="black-text">Lorem Ipsum dolor</a>
                                                                                                    <div class="product-info">
                                                                                                        <div>Display: <span class="value">5 inch</span></div>
                                                                                                        <div>RAM: <span class="value">4GB</span></div>
                                                                                                        <div>Memory: <span class="value">32GB</span></div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4 quantity">
                                                                                                <label for="quantity">Quantity:</label>
                                                                                                <input id="quantity" type="text"
                                                                                                       class="form-control quantity-input">
                                                                                            </div>
                                                                                            <div class="col-md-3 price">
                                                                                                <span>$120</span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>-->


                                </div>
                            </div>
                            <div class="col-md-12 col-lg-4">
                                <div class="summary">
                                    <h3>Summary</h3>
                                    <div class="summary-item"><span class="text">Subtotal</span><span
                                            class="price">$${subTotal}</span></div>
                                    <div class="summary-item"><span class="text">Discount</span><span
                                            class="price">$0</span></div>
                                    <div class="summary-item"><span class="text">Shipping</span><span
                                            class="price">$0</span></div>
                                    <div class="summary-item"><span class="text">Total</span><span class="price">$${subTotal}</span>
                                    </div>
                                    <button type="button" class="btn btn-primary btn-lg btn-block">Checkout</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
<script src="./js/cart.js"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</html>