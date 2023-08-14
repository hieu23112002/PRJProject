<%-- 
    Document   : ManagerOrders
    Created on : Aug 14, 2023, 9:35:17 AM
    Author     : HIEUPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ordersController" class="ordersController" method="post">
            <input type="hidden" name ="service" value="display">
            <form action="ordersController?service=insertOrders" method="post">                 
                <input type="submit" value="Insert"/>
            </form>

            <table border="1" width="5"  style="width:92%">
                <thead>
                    <tr>
                        <th>Orders ID</th>
                        <th>Customer Id</th>
                        <th>Status</th>
                        <th>Order_Date</th>
                        <th>Required_date</th>
                        <th>Shipped_date</th>
                        <th>Store Id</th>
                        <th>Staff Id</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.listOrders}" var="o">
                        <tr>
                            <td>${o.getOrder_id()}</td>
                            <td>${o.getCustomer_id()}</td>
                            <td>${o.getOrder_status()}</td>
                            <td>${o.getOrder_date()}</td>
                            <td>${o.getRequired_date()}</td>
                            <td>${o.getShipped_date()}</td>
                            <td>${o.getStore_id()}</td>
                            <td>${o.getStaff_id()}</td>
                            <td>
                                <form action="ordersController?service=updateOrders&OrdersID=${o.getOrder_id()}" method="post">                 
                                    <input type="submit" value="update"/>
                                </form> 
                            </td>
                            <td>
                                <form action="ordersController?service=deleteOrders&OrdersID=${o.getOrder_id()}" method="post">                 
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
