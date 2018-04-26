<%-- 
    Document   : dashboard
    Created on : Apr 23, 2018, 10:35:23 AM
    Author     : Suttida Sat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html>
<html>
    <head>
        <title>DASHBOARDS PAGE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="https://fonts.googleapis.com/css?family=Prompt" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/dashboard.css">
    <body>
        <!-- Navbar (sit on top) -->
        <div class="header">
            <!-- Navbar (sit on top) -->
            <div class="w3-top">
                <div class="w3-bar w3-white w3-card" id="myNavbar">
                    <a href="home2.html" class="w3-bar-item w3-button w3-wide"><img src="pic/logo.png" width="35" height="30"/> </a>
                    <!-- Right-sided navbar links -->
                    <div class="w3-right w3-hide-small">
                        <a href="home2.html" class="w3-bar-item w3-button"><i class="fa fa-home"></i>  HOME</a>
                        <a href="#profile" class="w3-bar-item w3-button"><i class="fa fa-user-circle"></i>  LOGOUT</a>
                    </div>
                </div>
            </div>
            <h1 class="topic">DASHBOARD</h1>

            <!--side menu -->
            <nav class="side-menu">
               <ul>
                            <li><a href="profile_boss.jsp">PROFILE<span><i class="fa fa-user-circle" style="font-size:30px"></i></span></a></li>
                            <li><a href="dashboard.jsp">DASHBOARD<span><i class="fa fa-pie-chart" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">CUSTOMER INFO.<span><i class="fa fa-id-card-o" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">PAYMENT RECORD<span><i class="fa fa-credit-card" style="font-size:30px"></i></span></a></li>
                            <li><a href="#">EDIT TERM<span><i class="fa fa-edit" style="font-size:30px"></i></span></a></li>
                        </ul>
            </nav>
        </div>
    </div>
</div>  

<!-- Graph Pictures1 -->


<br><br><br><br>
<p class="topic">Summarize Shop Type</p> <br><br><br><br>
<sql:query var="myArea" dataSource="test" >
    select area_type , count(area_id) 'Number'
    from area
    join inden_area
    using (area_id )
    join indenture
    using (i_id)
    join payment
    using (payment_id )
    where type_contract_id = 2
    group by area_type;

</sql:query> 

<table border="1" align="center"> 
    <thead>
        <tr>
            <th>Area_type</th>
            <th>Number</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach var="each_area" items="${myArea.rows}">
            <tr>

                <td>${each_area.area_type}</td>

                <td> 
                    ${each_area.Number} 
                </td>

            </tr> 
        </c:forEach> 

        <sql:query var="myArea" dataSource="test" >
            select count(area_id) 'Number'
            from area
            where status = 0;


        </sql:query> 

        <c:forEach var="each_area" items="${myArea.rows}">
            <tr>

                <td>Empty</td>

                <td> 
                    ${each_area.Number} 
                </td>

            </tr> 
        </c:forEach> 

    </tbody>
</table>


<!-- Graph Pictures2 -->

</body>
</html>
