<%-- 
    Document   : viewAnnounce
    Created on : Apr 21, 2018, 10:14:02 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <h1>Announce's Details</h1>
        </div><br>
        <div class="row">
            <!-- Here starts the navbar -->
            <div class="col-md-3">
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="infoEmp">ข้อมูลส่วนตัว</a></li>
                    <li><a href="#">กรอกค่าใช้จ่ายรายเดือน</a></li>
                    <li><a href="CusList.jsp">ประวิติลูกค้า</a></li>
                    <li><a href="#">...</a></li>
                    <li class="active"><a href="ViewAnnounce.jsp">จัดการเงื่อนไขของสัญญา</a></li>  
                </ul>
            </div>
            <!-- Here end the navbar -->

            <sql:query var="myAnnounce" dataSource="test" >
                select * from announce join payment_detail using(type_contract_id)
            </sql:query> 

            <div  class="col-md-3">
                <form action="ViewAnnounceServlet" method="POST">

                    <table border="1" align="center"> 
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Type_contract</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="each_announce" items="${myAnnounce.rows}">
                                <tr>
                                    <td><input type="submit" value="${each_announce.con_id}" name="view_details"/></td>
                                    
                                    <td> 
                                        ${each_announce.name_type}
                                    </td>
                                    
                                </tr> 
                            </c:forEach> 
                        </tbody>
                    </table>
                </form>  
            </div> 

        </div>
    </body>
</html>
