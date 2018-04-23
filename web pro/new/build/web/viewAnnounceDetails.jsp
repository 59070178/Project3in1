<%-- 
    Document   : viewAnnounceDetails
    Created on : Apr 21, 2018, 11:08:26 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewAnnounceDetails</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
            <h1>รายละเอียดเงื่อนไข</h1>
        </div><br>
        <div class="row">
            <!-- Here starts the navbar -->
            <div class="col-md-3">
                <ul class="nav nav-pills nav-stacked">
                    <li ><a href="infoEmp">ข้อมูลส่วนตัว</a></li>
                    <li><a href="#">กรอกค่าใช้จ่ายรายเดือน</a></li>
                    <li><a href="CusList.jsp">ประวิติลูกค้า</a></li>
                    <li><a href="#">...</a></li>
                    <li class="active"><a href="viewAnnounce.jsp">จัดการเงื่อนไขของสัญญา</a></li>  
                </ul>
            </div>
            <!-- Here end the navbar -->

            <div class="col-sm-6">
                <div class="font-heading">
                    <%-- Using Scriptlet--%>
                    <% model.Announce announce = (model.Announce) request.getAttribute("announce_details");%>
                    <p><%= announce.getInformation()%><p>
                </div>

            </div>

            <form action="editAnnounce.jsp" method="POST">
                <div class="col-sm-6">
                    <div >
                        <input type="submit" value="Edit" name="edit" />
                    </div>
                </div>
            </form>

        </div>    


    </body>
</html>
