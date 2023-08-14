<%-- 
    Document   : ManagerStores
    Created on : Aug 14, 2023, 11:11:02 AM
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
        <form action="storesController" class="storesController" method="post">
            <input type="hidden" name ="service" value="display">
            <form action="storesController?service=insertStores" method="post">                 
                <input type="submit" value="Insert"/>
            </form>

            <table border="1" width="5"  style="width:92%">
                <thead>
                    <tr>
                        <th>Store ID</th>
                        <th>Store Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Street</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Zip_code</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.listStores}" var="o">
                        <tr>
                            <td>${o.getStore_id()}</td>
                            <td>${o.getStore_name()}</td>
                            <td>${o.getPhone()}</td>
                            <td>${o.getEmail()}</td>
                            <td>${o.getStreet()}</td>
                            <td>${o.getCity()}</td>
                            <td>${o.getState()}</td>
                            <td>${o.getZip_code()}</td>
                            <td>
                                <form action="storesController?service=updateStores&StoresID=${o.getStore_id()}" method="post">                 
                                    <input type="submit" value="update"/>
                                </form> 
                            </td>
                            <td>
                                <form action="storesController?service=deleteStores&StoresID=${o.getStore_id()}" method="post">                 
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
