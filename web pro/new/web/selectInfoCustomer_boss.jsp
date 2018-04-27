<%-- 
    Document   : selectInfoCustomer_boss
    Created on : Apr 27, 2018, 2:36:32 PM
    Author     : Suttida Sat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html>
<html>
    <title> CUSTOMER INFORMATION PAGE </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/selectInfoCus.css">
    <body>
        <!-- Navbar (sit on top) -->
        <div class="w3-top">
            <div class="w3-bar w3-white w3-card" id="myNavbar">
                <a href="#home" class="w3-bar-item w3-button w3-wide"><img src="pic/logo.png" width="35" height="30"/> </a>
                <!-- Right-sided navbar links -->
                <div class="w3-right w3-hide-small">
                    <a href="home2.jsp" class="w3-bar-item w3-button"><i class="fa fa-home"></i>  HOME</a>
                    <a href="logout" class="w3-bar-item w3-button"><i class="fa fa-user-circle"></i>  LOGOUT</a>

                    <!--side menu -->
                    <nav class="side-menu">
                        <ul>
                            <li><a href="ViewInfoEmpAndBossServlet">PROFILE<span><i class="fa fa-user-circle" style="font-size:30px"></i></span></a></li>
                            <li><a href="dashboard.jsp">DASHBOARD<span><i class="fa fa-pie-chart" style="font-size:30px"></i></span></a></li>
                            <li><a href="selectInfoCustomer_boss.jsp">CUSTOMER INFO.<span><i class="fa fa-id-card-o" style="font-size:30px"></i></span></a></li>
                            <li><a href="selectInfoCustomer_boss2.jsp">PAYMENT RECORD<span><i class="fa fa-credit-card" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">EDIT TERM<span><i class="fa fa-edit" style="font-size:30px"></i></span></a></li></ul>
                    </nav>
                </div>
            </div>
        </div>

        &nbsp;<br><br><br><h1><center>CUSTOMER INFORMATION.</center></h1><br> 

        <!-- table part -->
        <sql:query var="myCustomer" dataSource="test" >
<<<<<<< HEAD
                select * from customer join account using(account_id) join indenture using (account_id);
            </sql:query> 
             <form action="CusListDetailsServlet" method="POST">   
        <br><center><table border="1">
            <thead>
                <tr>
                    <th>Select</th>
                    <th>NAME.</th>
                </tr>
            </thead>
            <tbody>
                
                <c:forEach var="each_customer" items="${myCustomer.rows}">
                <tr>
                    <td><input type="radio"  name="account_id" value="${each_customer.account_id}"/></td>
                    <td> ${each_customer.firstname} ${each_customer.lastname} </td>
                </tr>
                </c:forEach>
            </tbody>
            </table></center>
=======
            select * from customer 
            join account using(account_id) 
            join indenture using (account_id) 
            where payment_id in (
            select max(payment_id)
            from payment
            join indenture
            using (payment_id)
            join customer
            using (account_id)
            group by (account_id)
            );
        </sql:query> 
        <form action="CusListDetailsServlet" method="POST">   
            <br><center><table border="1">
                    <thead>
                        <tr>
                            <th>Select</th>
                            <th>NAME.</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="each_customer" items="${myCustomer.rows}">
                            <tr>
                                <td><input type="radio"  name="account_id" value="${each_customer.account_id}"/></td>
                                <td> ${each_customer.firstname} ${each_customer.lastname} </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table></center>
>>>>>>> master

            <!-- BUTTON PART -->
            <br>
            <center><input type="submit" value="VIEW INFO." /></center></form>
    </body>
</html>
