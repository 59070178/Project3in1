<%-- 
    Document   : Booking
    Created on : Apr 27, 2018, 4:43:57 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="https://fonts.googleapis.com/css?family=Prompt" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/booking.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var limit = 1;

                $('input.single-checkbox').on('change', function (evt) {
                    if ($(this).siblings(':checked').length >= limit) {
                        this.checked = false;
                    }
                });
            });
        </script>
    </head>
    <body>
        <!--         Navbar (sit on top) -->
        <div class="w3-top">
            <div class="w3-bar w3-white w3-card" id="myNavbar">
                <a href="#home" class="w3-bar-item w3-button w3-wide"><img src="pic/logo.png" width="35" height="30"/> </a>
                <!--Right-sided navbar links--> 
                <div class="w3-right w3-hide-small">
                    <a href="#about" class="w3-bar-item w3-button"><i class="fa fa-home"></i>  Home</a>
                    <a href="#profile" class="w3-bar-item w3-button"><i class="fa fa-user-circle"></i>  Logout</a>

                    <!--side menu--> 
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
        <div>
            <br><br>
            <center><h1><b>BOOKING</b></h1></center><br>
            <form action="ProcessSelectionArea" method="POST">
                <div class="booking">
                    <center><h2><b>1st Floor</b></h2></center>
                    <img src="pic/floor1.jpg" alt="1f" height="800" width="600" class="center"><br>


                    <h3><b>Clothes Zone</b></h3>
                    <sql:query var="myArea" dataSource="test" >
                        SELECT * FROM area 
                        where area_type = 'clothes';
                    </sql:query> 

                    <c:forEach var="each_area" items="${myArea.rows}">


                        <input class="single-checkbox" type="checkbox" name="area_id" value="${each_area.area_id}" ${each_area.status}/>${each_area.area_name}
                    </c:forEach> 




                    <h3><b>Electronics Zone</b></h3>
                    <sql:query var="myArea" dataSource="test" >
                        SELECT * FROM area 
                        where area_type = 'electronics';
                    </sql:query> 

                    <c:forEach var="each_area" items="${myArea.rows}">


                        <input  class="single-checkbox" type="checkbox"  name="area_id" value="${each_area.area_id}" ${each_area.status}/>${each_area.area_name}
                    </c:forEach> 

                    <br><br><br>
                    <center><h2><b>2nd Floor</b></h2></center>
                    <img src="pic/floor2.jpg" alt="1f" height="800" width="600" class="center"><br>


                    <h3><b>Appliance Zone</b></h3>
                    <sql:query var="myArea" dataSource="test" >
                        SELECT * FROM area 
                        where area_type = 'appliance';
                    </sql:query> 

                    <c:forEach var="each_area" items="${myArea.rows}">


                        <input  class="single-checkbox" type="checkbox" name="area_id"  value="${each_area.area_id}" ${each_area.status}/>${each_area.area_name}
                    </c:forEach> 


                    <h3><b>Food Zone</b></h3>
                    <sql:query var="myArea" dataSource="test" >
                        SELECT * FROM area 
                        where area_type = 'food';
                    </sql:query> 

                    <c:forEach var="each_area" items="${myArea.rows}">


                        <input  class="single-checkbox" type="checkbox"  name="area_id" value="${each_area.area_id}" ${each_area.status}/>${each_area.area_name}
                    </c:forEach> 

                    <br>
                    <br>
                    <center><input type="submit" value="SUBMIT" /></center>
                </div>
            </form>
        </div>
    </body>
</html>

