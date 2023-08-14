<%-- 
    Document   : ManagerStaffs
    Created on : Aug 14, 2023, 10:45:12 AM
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
        <form action="staffsController" class="staffsController" method="post">
            <input type="hidden" name ="service" value="display">
            <form action="staffsController?service=insertStaffs" method="post">                 
                <input type="submit" value="Insert"/>
            </form>

            <table border="1" width="5"  style="width:92%">
                <thead>
                    <tr>
                        <th>Staff ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Actice</th>
                        <th>Store ID</th>
                        <th>Manager ID</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.listStaffs}" var="o">
                        <tr>
                            <td>${o.getStaff_id()}</td>
                            <td>${o.getFirst_name()}</td>
                            <td>${o.getLast_name()}</td>
                            <td>${o.getEmail()}</td>
                            <td>${o.getPhone()}</td>
                            <td>${o.getActive()}</td>
                            <td>${o.getStore_id()}</td>
                            <td>${o.getManager_id()}</td> 
                            <td>
                                <form action="staffsController?service=updateStaffs&StaffID=${o.getStaff_id()}" method="post">                 
                                    <input type="submit" value="update"/>
                                </form> 
                            </td>
                            <td>
                                <form action="staffsController?service=deleteStaffs&StaffID=${o.getStaff_id()}" method="post">                 
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
