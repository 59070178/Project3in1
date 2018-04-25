<%-- 
    Document   : cusListDetails
    Created on : Apr 25, 2018, 1:49:44 AM
    Author     : jugjig
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Profile User</title>
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
            <h1>ข้อมูลลูกค้า</h1> <br>

        </div><br>

        <div class="row">
            <!-- Here starts the navbar -->
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="infoEmp">ข้อมูลส่วนตัว</a></li>
                <li><a href="#">กรอกค่าใช้จ่ายรายเดือน</a></li>
                <li><a href="CusList.jsp">ประวิติลูกค้า</a></li>
                <li><a href="#">...</a></li>
                <li><a href="FirstViewAnnounceServlet">จัดการเงื่อนไขของสัญญา</a></li>  
            </ul>
        </div>
        <!-- Here end the navbar -->

        <%-- Using Scriptlet--%>
        <% model.Account account = (model.Account) request.getAttribute("cus_account_info");%>
        <% model.Address address = (model.Address) request.getAttribute("cus_address_info");%>
        <% model.Contract contract = (model.Contract) request.getAttribute("cus_contract_info");%>
        <% model.Place place = (model.Place) request.getAttribute("cus_place_info");%>


        <div class="col-sm-2">
            <div class="font-heading">
                <p><b>เลขที่ผู้ใช้งาน</b></p>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="font-context">
                <p><%= account.getAccount_id()%><p>
            </div>
        </div><br><br>

        <div class="col-sm-2">
            <div class="font-heading">
                <p><b>ชื่อ-นามสกุล</b></p>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="font-context">
                <p><%= account.getFullname()%><p>
            </div>
        </div><br><br>


        <div class="col-sm-2">
            <div class="font-heading">
                <p><b>เพศ</b></p>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="font-context">
                <p><%= account.getGender()%><p>
            </div>
        </div><br><br>

        <div class="col-sm-2">
            <div class="font-heading">
                <p><b>เบอร์โทรศัพท์</b></p>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="font-context">
                <p><%= account.getPhone()%><p>               
            </div>
        </div><br><br>

        <div class="col-sm-2">
            <div class="font-heading">
                <p><b>ที่อยู่</b></p>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="font-context">
                <p><%= address.address_info()%><p>   
            </div>
        </div><br><br>



        <div class="col-sm-2">
            <div class="font-heading">
                <p><b>เลขที่สัญญา</b></p>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="font-context">
                <p><%= contract.getContractID()%><p>   
            </div>
        </div><br><br>

        <div class="col-sm-2">
            <div class="font-heading">
                <p><b>ประเภทของสัญญา</b></p>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="font-context">
                <p><%= contract.getType()%><p>   
            </div>
        </div><br><br>


        <div class="col-sm-2">
            <div class="font-heading">
                <p><b>วันที่เริ่มทำสัญญา</b></p>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="font-context">
                <p><%= contract.getStartDate()%><p>   
            </div>
        </div><br><br>

        <div class="col-sm-2">
            <div class="font-heading">
                <p><b>วันที่สิ้นสุดสัญญา</b></p>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="font-context">
                <p><%= contract.getEndDate()%><p>   
            </div>
        </div><br><br>

        <div class="col-sm-2">
            <div class="font-heading">
                <p><b>หมายเลขพื้นที่</b></p>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="font-context">
                <p><%= place.getPlaceID()%><p>   
            </div>
        </div><br><br>

        <div class="col-sm-2">
            <div class="font-heading">
                <p><b>ประเภทสินค้าที่ขาย</b></p>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="font-context">
                <p><%= place.getType()%><p>   
            </div>
        </div><br><br>

    </div>

</body>

</html>

