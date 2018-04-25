<%-- 
    Document   : donthave
    Created on : Apr 24, 2018, 11:46:48 PM
    Author     : Suttida Sat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <a href="home2.html" class="w3-bar-item w3-button w3-wide"><img src="pic/logo.png" width="35" height="30"/> </a>
                    <!-- Right-sided navbar links -->
                    <div class="w3-right w3-hide-small">
                        <a href="home2.html" class="w3-bar-item w3-button"><i class="fa fa-home"></i>  HOME</a>
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
                <form action="viewPay_reservation.html" method="POST">
                    <button class="select_bn bn2">Reservation Fee</button>
                </form>
                <form action="viewPay_rent.html" method="POST">
                    <button class="select_bn bn3">Prepaid Rent</button>

                </form>
            </div>
        </div><br><br><br><br><br><br><br>

        <h1>           <center> Don't  Have</center></h1>

            <!--side menu -->
            <nav class="side-menu">
                <ul>
                    <li><a href="profile_cus.jsp">PROFILE<span><i class="fa fa-user-circle" style="font-size:30px"></i></span></a></li>
                    <li><a href="#">BOOKING<span><i class="fa fa-tag" style="font-size:30px"></i></span></a></li>
                    <li><a href="#">RENT<span><i class="fa fa-handshake-o" style="font-size:30px"></i></span></a></li>
                    <li><a href="#">PAYMENT<span><i class="fa fa-credit-card" style="font-size:30px"></i></span></a></li>
                    <li><a href="select.jsp">EXPENSE<span><i class="fa fa-calendar" style="font-size:30px"></i></span></a></li>
                </ul>
            </nav>



         

    </body>
</html>