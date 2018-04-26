<%-- 
    Document   : paymentHistory
    Created on : Apr 26, 2018, 12:00:05 AM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>paymentHistory</title>
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
            <h1>Payment Record</h1>
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



           
                <%
                    int view_account_id = (Integer) request.getAttribute("view_account_id");

                    Connection conn;
                    conn = (Connection) getServletContext().getAttribute("connection");

                    Statement stmt = conn.createStatement();
                    String sql = "SELECT * From customer join indenture using (account_id) join monthly_expense using (i_id) where account_id =" + view_account_id;
                    ResultSet rs = stmt.executeQuery(sql);
                  
                %>


  

            <div  class="col-md-3">
               

                    <table border="1" align="center"> 
                        <thead>
                            <tr>
                                <th>month</th>
                                <th>cost</th>
                                <th>status</th>
                                <!--                            <th>View</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                while (rs.next()) {
                                    out.print("<tr>");
                                    out.print("<td>");
                                    out.print(rs.getString("month"));
                                    out.print("</td>");

                                    out.print("<td>");
                                    out.print(rs.getString("total"));
                                    out.print("</td>");

                                    
                                    out.print("<td>");
                                    
                                    String status = "";
                                    if(rs.getString("slip") != null){
                                        status = "paid";
                                    }else{
                                         status = "not paid";
                                    }
                                    
                                    out.print(status);
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            %>
                        </tbody>
                    </table>

            </div> 

        </div>
    </body>
</html>