<%-- 
    Document   : CusList
    Created on : Apr 22, 2018, 10:10:53 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>view Announce</title>
        <style>

            .flex-container {
                text-align: center;
                padding: 15px;
                flex: 1 100%;
            }

            .font-heading{
                background-color:lightgray;
                padding-top: 3px;
                padding-bottom: 3px;
                padding-left: 10px;
                padding-right: 10px;
            }

            .font-context{
                background-color:whitesmoke;
                padding-top: 3px;
                padding-bottom: 3px;
                padding-left: 10px;
                padding-right: 10px;
            }

            @media all and (min-width: 768px) {
                .nav {text-align:left;-webkit-flex: 1 auto;flex:1 auto;-webkit-order:1;order:1;}
                .article {-webkit-flex:5 0px;flex:5 0px;-webkit-order:2;order:2;}
                footer {-webkit-order:3;order:3;}
            }

        </style>
    </head>
    <body>
        <div class="flex-container">
            <h1>รายชื่อลูกค้า</h1>
        </div><br>
        <div class="row">
            <!-- Here starts the navbar -->
            <div class="col-md-3">
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="infoEmp">ข้อมูลส่วนตัว</a></li>
                    <li><a href="#">กรอกค่าใช้จ่ายรายเดือน</a></li>
                    <li class="active"><a href="cusList.jsp">ประวิติลูกค้า</a></li>
                    <li><a href="#">...</a></li>
                    <li><a href="ViewAnnounce.jsp">จัดการเงื่อนไขของสัญญา</a></li>  
                </ul>
            </div>
            <!-- Here end the navbar -->

            <sql:query var="myCustomer" dataSource="test" >
                select * from customer join account using(account_id) join indenture using (account_id);
            </sql:query> 

            <div  class="col-md-3">
                <form action="CusListDetailsServlet" method="POST">

                <table border="1" align="center"> 
                    <thead>
                        <tr>
                            <th>Customer_ID</th>
                            <th>Name</th>
<!--                            <th>View</th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="each_customer" items="${myCustomer.rows}">
                            <tr>
                               
                                <td><input type="radio"  name="account_id" value="${each_customer.account_id}"/></td>
                      
                        <td> 
                            ${each_customer.firstname} ${each_customer.lastname} 
                        </td>

                        </tr> 
                    </c:forEach> 
                    <td></td>
                        <td><input type="submit" value="view_details" name="view_details"/></td>
                    </tbody>
                </table>
                </form>  
            </div> 

        </div>
    </body>
</html>
