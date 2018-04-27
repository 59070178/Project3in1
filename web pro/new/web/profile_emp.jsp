<%-- 
    Document   : profile_emp
    Created on : Apr 23, 2018, 12:06:53 AM
    Author     : Suttida Sat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>PROFILE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
                    <a href="home2.html" class="w3-bar-item w3-button"><i class="fa fa-home"></i>  HOME</a>
                    <a href="logout" class="w3-bar-item w3-button"><i class="fa fa-user-circle"></i>  LOGOUT</a>

                    <!--side menu -->
                    <nav class="side-menu">
                        <ul>
                            <li><a href="ViewInfoEmpAndBossServlet">PROFILE<span><i class="fa fa-user-circle" style="font-size:30px"></i></span></a></li>
                            <li><a href="selectInfoCustomer_boss.jsp">CUSTOMER INFO.<span><i class="fa fa-id-card-o" style="font-size:30px"></i></span></a></li>
                            <li><a href="selectInfoCustomer_boss2.jsp">PAYMENT RECORD<span><i class="fa fa-credit-card" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">FILL OUT THE COST<span><i class="fa fa-edit" style="font-size:30px"></i></span></a></li>
                        </ul>
                    </nav>


                </div>
            </div>
        </div>
        <div>
            <br><br>
            <center>
                <h1> PROFILE</h1>
            </center><br>
            <%-- Using Scriptlet--%>
        <% model.Account account = (model.Account) request.getAttribute("account_info");%>
                <div class="sign">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Full Name <input type="text" name="fname" value="" readonly="readonly" disabled="disabled" placeholder= "<%= account.getFullname()%>"/> <br>
                  
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UserName <input type="text" name="username" value="" readonly="readonly" disabled="disabled" placeholder = "<%= account.getUsername()%>"/><br>

                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone Number <input type="text" name="tell" value="" readonly="readonly" disabled="disabled" placeholder = "<%= account.getPhone()%>"/><br>

                    
                </div>
        </div>
    </body>
</html>

