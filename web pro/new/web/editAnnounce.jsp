<%-- 
    Document   : editAnnounce
    Created on : Apr 22, 2018, 8:39:56 AM
    Author     : jugjig
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit Announce</title>
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
            <h1>หน้าแก้ไข</h1>
        </div><br>
        <div class="row">
            <!-- Here starts the navbar -->
            <div class="col-md-3">
                <ul class="nav nav-pills nav-stacked">
                    <li ><a href="infoEmp">ข้อมูลส่วนตัว</a></li>
                    <li><a href="#">กรอกค่าใช้จ่ายรายเดือน</a></li>
                    <li><a href="#">...</a></li>
                    <li><a href="#">...</a></li>
                    <li class="active"><a href="FirstViewAnnounceServlet">จัดการเงื่อนไขของสัญญา</a></li>  
                </ul>
            </div>
            <!-- Here end the navbar -->
            <div class="col-sm-6">
                <div  contenteditable="true">
                    <%
                        Connection conn;
                        conn = (Connection) getServletContext().getAttribute("connection");

                        int announce_con_id = (int) session.getAttribute("annouce_con_id");

                        Statement stmt = conn.createStatement();
                        String sql = "SELECT * FROM announce WHERE con_id  = " + announce_con_id;
                        ResultSet rs = stmt.executeQuery(sql);
                        rs.next();
                        String text = rs.getString("content");
                    %>

                    <form action="addAnnounceServlet">
                        <textarea name="txt" rows="10" cols="100">
                            <%
                                out.print(text);
                            %>
                        </textarea>
                        <br>
                        <%
                            int edit_con_type = rs.getInt("type_contract_id");
                            session.setAttribute("edit_con_type", edit_con_type);
                        %>
                        <input type="submit" value="save" name="btn" />
                        <input type="submit" value="cancel" name="btn" /> 
                    </form>
                        

                </div>
            </div>
        </div>
    </body>
</html>
