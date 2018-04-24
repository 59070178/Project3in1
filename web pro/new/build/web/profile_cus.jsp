<%-- 
    Document   : profile_cus
    Created on : Apr 23, 2018, 12:06:25 AM
    Author     : Suttida Sat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>PROFILE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="https://fonts.googleapis.com/css?family=Prompt" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/profile.css">
    </head>
    <body>
        <!-- Navbar (sit on top) -->
        <div class="w3-top">
            <div class="w3-bar w3-white w3-card" id="myNavbar">
                <a href="#home" class="w3-bar-item w3-button w3-wide"><img src="pic/logo.png" width="35" height="30"/> </a>
                <!-- Right-sided navbar links -->
                <div class="w3-right w3-hide-small">
                    <a href="home2.html" class="w3-bar-item w3-button"><i class="fa fa-home"></i>  Home</a>
                    <a href="home.html" class="w3-bar-item w3-button"><i class="fa fa-user-circle"></i>  Logout</a>

                    <!--side menu -->
                    <nav class="side-menu">
                        <ul>
                            <li><a href="#">PROFILE<span><i class="fa fa-user-circle" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">BOOKING<span><i class="fa fa-tag" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">RENT<span><i class="fa fa-handshake-o" style="font-size:30px"></i></span></a></li>
                            <li><a href="viewMonth">PAYMENT<span><i class="fa fa-credit-card" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">EXPENSE<span><i class="fa fa-calendar" style="font-size:30px"></i></span></a></li>
                        </ul>
                    </nav>


                </div>
            </div>
        </div>
        <div>
            <br><br>
            <center><h1> PROFILE</h1></center><br>
            <form action="registerServlet" method="POST">
                <div class="sign">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First Name <input type="text" name="fname" value="" readonly="readonly" disabled="disabled" /><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name <input type="text" name="lname" value="" readonly="readonly" disabled="disabled" /><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UserName <input type="text" name="username" value="" readonly="readonly" disabled="disabled" /><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gender <input type="text" name="tell" value="" readonly="readonly" disabled="disabled"/><br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone Number <input type="text" name="tell" value="" readonly="readonly" disabled="disabled"/><br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address <input type="text" target="address" name="address" value="" readonly="readonly" disabled="disabled"/><br>
                    
                </div>
            </form>
        </div>
    </body>
</html>
