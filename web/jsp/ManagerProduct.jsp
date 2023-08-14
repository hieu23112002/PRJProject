<%-- 
    Document   : ManagerProduct
    Created on : Aug 14, 2023, 8:21:47 AM
    Author     : HIEUPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Product</title>
    </head>
    <body>
        <form action="productController" class="productController" method="post">
            <input type="hidden" name ="service" value="display">
            <form action="productController?service=insertProduct" method="post">                 
                <input type="submit" value="Insert"/>
            </form>

            <table border="1" width="5"  style="width:92%">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Model year</th>
                        <th>Price</th>
                        <th>Brand Name</th>
                        <th>Category</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.listProduct}" var="o">
                        <tr>
                            <td>${o.getProduct_id()}</td>
                            <td>${o.getProduct_name()}</td>
                            <td>${o.getModel_year()}</td>
                            <td>${o.getList_price()}</td>
                            <td>${o.getBrand_name()}</td>
                            <td>${o.getCategory_name()}</td>                           
                            <td>
                                <form action="productController?service=updateProduct&productID=${o.getProduct_id()}" method="post">                 
                                    <input type="submit" value="update"/>
                                </form> 
                            </td>
                            <td>
                                <form action="productController?service=deleteProduct&productID=${o.getProduct_id()}" method="post">                 
                                    <input type="submit" value="delete"/>
                                </form> 
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>

    </body>
</html>
