<%-- 
    Document   : viewPay_rent
    Created on : Apr 26, 2018, 11:58:20 PM
    Author     : Suttida Sat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title> View Payment PAGE </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="https://fonts.googleapis.com/css?family=Prompt" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/viewPay.css">
    </head>
    <body>
        <div class="header">
            <!-- Navbar (sit on top) -->
            <div class="w3-top">
                <div class="w3-bar w3-white w3-card" id="myNavbar">
                    <a href="home2.jsp" class="w3-bar-item w3-button w3-wide"><img src="pic/logo.png" width="35" height="30"/> </a>
                    <!-- Right-sided navbar links -->
                    <div class="w3-right w3-hide-small">
                        <a href="home2.jsp" class="w3-bar-item w3-button"><i class="fa fa-home"></i>  HOME</a>
                        <a href="logout" class="w3-bar-item w3-button"><i class="fa fa-user-circle"></i>  LOGOUT</a>
                    </div>
                </div>
            </div>
            <!-- select type of payment -->

            <h1 class="topic">PAYMENT</h1>
            <div class="btn-group">
                <form action="select.jsp" method="POST">
                    <button class="select_bn bn1">Monthly Expense</button>
                </form>
                <form action="viewBookCost" method="POST">
                    <button class="select_bn bn2">Reservation Fee</button>
                </form>
                <form action="viewRentCost" method="POST">
                    <button class="select_bn bn3">Prepaid Rent</button>

                </form>
            </div>
        </div>

        <!-- table of customer info. -->
      
         <sql:query var="myPlace" dataSource="test" >
            select area_id ,area_type 
            from area
            join inden_area
            using (area_id)
            join indenture
            using (i_id)
            where i_id = "<%= session.getAttribute("i_id") %>"
        </sql:query> 
        <div class="content1 w3-container">
            <table class="cusinfo">
                <tr>
                    <th> ID </th>
                    <th> USERNAME </th>
                    <th> AREA NO. </th>
                    <th> ZONE </th>

                </tr>
                <c:forEach var="place" items="${myPlace.rows}">
                <tr height="60px">
                   
                    
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%out.println(session.getAttribute("id_user"));%></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%out.println(session.getAttribute("username"));%></td>
                    <td>&nbsp&nbsp&nbsp&nbsp${place.area_id}</td>
                    <td>&nbsp&nbsp&nbsp&nbsp${place.area_type }</td>
                </tr>
                </c:forEach> 
            </table>
        </div>

 <!--side menu -->
            <nav class="side-menu">
                <ul>
                    <li><a href="profile_cus">PROFILE<span><i class="fa fa-user-circle" style="font-size:30px"></i></span></a></li>
                    <li><a href="#">BOOKING<span><i class="fa fa-tag" style="font-size:30px"></i></span></a></li>
                    <li><a href="#">RENT<span><i class="fa fa-handshake-o" style="font-size:30px"></i></span></a></li>
                    <li><a href="confirmPayment.html">PAYMENT<span><i class="fa fa-credit-card" style="font-size:30px"></i></span></a></li>
                    <li><a href="select.jsp">EXPENSE<span><i class="fa fa-calendar" style="font-size:30px"></i></span></a></li>
                </ul>
            </nav>
<!-- เช็คก่อนว่ามีสัญญาเช่าไหม-->


 <sql:query var="myRent" dataSource="test" >
     select price_rent  
from payment
join indenture
using(payment_id)
where i_id = <%= session.getAttribute("i_id") %> and slip is null
and type_contract_id = 2
           
        </sql:query> 
            
            <c:choose>
        <c:when test="${myRent.rowCount == 0}">
           <!--/  /* No results */ -->
           <jsp:forward page="donthave.jsp"></jsp:forward>
        </c:when>
        <c:otherwise>
            <!-- table of payment -->
            <div>
            <table class="paytable">
                <tr>
                    <th> EXPENSES </th>
                    <th> AMOUNT </th>

                </tr>
                <tr>
                    <td>Prepaid Rent</td>
                    <td><%out.println(session.getAttribute("price_rent"));%> </td>

                </tr>
            </table>
            </div></c:otherwise></c:choose>


    </body>
</html>
