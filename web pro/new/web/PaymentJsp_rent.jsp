<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Prompt" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/pay.css">
        <title>Profile User</title>
    </head>
    <body style="background-color: #ffffff;">
    <center>
            <h1>PAYMENT</h1>
    </center>
    <br>

        

            <!-- Here starts the navbar -->
            <!-- Navbar (sit on top) -->
        <div class="w3-top">
            <div class="w3-bar w3-white w3-card" id="myNavbar">
                <a href="#home" class="w3-bar-item w3-button w3-wide"><img src="pic/logo.png" width="35" height="30"/> </a>
                <!-- Right-sided navbar links -->
                <div class="w3-right w3-hide-small">
                    <a href="#about" class="w3-bar-item w3-button"><i class="fa fa-home"></i>  Home</a>
                    <a href="#profile" class="w3-bar-item w3-button"><i class="fa fa-user-circle"></i>  Logout</a>

                    <!--side menu -->
                    <nav class="side-menu">
                        <ul>
                            <li><a href="#">PROFILE<span><i class="fa fa-user-circle" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">BOOKING<span><i class="fa fa-tag" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">RENT<span><i class="fa fa-handshake-o" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">PAYMENT<span><i class="fa fa-credit-card" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">EXPENSE<span><i class="fa fa-calendar" style="font-size:30px"></i></span></a></li>
                        </ul>
                    </nav>
                    
                    
                </div>
            </div>
        </div>
            <center>
            <div class="page">
                <center>
                <input type="button" value="Monthly Expense" />
                <input type="button" value="Book/Rent" />
                </center>
                Select month :<select name="">
                    <option>Book</option>
                    <option>Rent</option>
                </select>
                <input type="submit" value="select" />
            </div>
            </center>
            <div class="row">
            <form action="PaymentServlet" method="POST">
                <b>Category</b>
                        <select name="typePayment">
                            <option>Deposit</option>
                            <option>Prepay (Rent)</option>
                            <option>Monthly expense</option>
                        </select>
                    <br><br>

                    <b>Bank</b>
                        <select name="bank">
                            <option>BBL</option>
                            <option>KBANK</option>
                            <option>SCB</option>
                        </select>
                    <br><br>

               <b>Date</b>
                        <input type="date" name="trans_date">
                    <br><br>

                        <b>Time</b>
                        <input type="time" name="trans_time">
                <br><br>

                        <b>Cost</b>
                        <input type="text" name="amount" value="" size="10" />
                <br><br>

                        <b>Bill</b>
                        <br>
                        <input type="file" name="trans_image" accept="image/gif, image/jpeg, image/png">
                        <br><br>
                        <center><input type="submit" value="Upload" /></center>
            </form>
            </div>
    </body>
</html>