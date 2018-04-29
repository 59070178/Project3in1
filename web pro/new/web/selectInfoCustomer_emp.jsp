<%-- 
    Document   : selectInfoCustomer_emp
    Created on : Apr 27, 2018, 7:00:45 PM
    Author     : asus
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
                    <a href="#about" class="w3-bar-item w3-button"><i class="fa fa-home"></i>  HOME</a>
                    <a href="#profile" class="w3-bar-item w3-button"><i class="fa fa-user-circle"></i>  LOGOUT</a>

                    <!--side menu -->
                    <nav class="side-menu">
                        <ul>
                            <li><a href="ViewInfoEmpAndBossServlet">PROFILE<span><i class="fa fa-user-circle" style="font-size:30px"></i></span></a></li>
                            <li><a href="selectInfoCustomer_emp.jsp">CUSTOMER INFO.<span><i class="fa fa-id-card-o" style="font-size:30px"></i></span></a></li>
                            <li><a href="selectInfoCustomer_emp2.jsp">PAYMENT RECORD<span><i class="fa fa-credit-card" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">FILL OUT THE COST<span><i class="fa fa-edit" style="font-size:30px"></i></span></a></li>
                        </ul></nav>
                </div>
            </div>
        </div>

        &nbsp;<br><br><br><h1><center>CUSTOMER INFORMATION.</center></h1><br> 

        <!-- table part -->
    <br><center><table border="1">
            <thead>
                <tr>
                    <th target="cus_id">CUSTOMER ID.</th>
                    <th>NAME.</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table></center>

    <!-- BUTTON PART -->
    <br><form action="infoCustomer_emp.html" method="POST">
        <center><input type="submit" value="VIEW INFO." /></center></form>
</body>
</html>
