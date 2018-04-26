<%-- 
    Document   : dashboard_annual
    Created on : Apr 27, 2018, 12:05:28 AM
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
        <title>JSP Page</title>

    </head>
    <body>

<br><br><br>
<form action="ViewDashBoardServlet" method="POST">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="area" name="btn" /> <input type="submit" value="Annual Dashboard" name="btn"/>
</form>
        <br><br><br><br><br><br>

        <!--    Graph Pictures1 rent/book real price -->

        <sql:query var="myMoney" dataSource="test" >
            select month(tranfer_date_time) 'month',  sum(price_book) 'book_price' , sum(price_rent) 'rent_price',sum(price_book)+ sum(price_rent) 'total'
            from payment
            join indenture
            using (payment_id)
            join monthly_expense
            using (i_id )
            join inden_area
            using (i_id)
            where tranfer_date_time like '<% String year1 = request.getParameter("year");%>%'
            group by  month(tranfer_date_time);
        </sql:query> 


        <table  border="1" align="center"> 
            <thead>
                <tr>
                    <th>Month</th>
                    <th>Book price per Month</th>
                    <th>Rent price per Month</th>
                    <th>Total per Month</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="each_month" items="${myMoney.rows}">
                    <tr>

                        <td>${each_month.month}</td>

                        <td> 
                            ${each_month.book_price} 
                        </td>

                        <td>${each_month.rent_price}</td>

                        <td> 
                            ${each_month.total} 
                        </td>

                    </tr> 
                </c:forEach> 

                <sql:query var="myMoney" dataSource="test" >
                    select  sum(price_book) 'book_price' , sum(price_rent) 'rent_price',sum(price_book)+ sum(price_rent) 'total'
                    from payment
                    join indenture
                    using (payment_id)
                    join monthly_expense
                    using (i_id )
                    join inden_area
                    using (i_id)
                    where tranfer_date_time like '<% String year2 = request.getParameter("year");%>%'
                </sql:query>

                <c:forEach var="each_month" items="${myMoney.rows}">
                    <tr>

                        <td>TOTAL</td>

                        <td> 
                            ${each_month.book_price} 
                        </td>

                        <td>${each_month.rent_price}</td>

                        <td> 
                            ${each_month.total} 
                        </td>

                    </tr> 
                </c:forEach> 
            </tbody>
        </table>

            
            <br><br><br>
        <!--    Graph Pictures1 rent/book monthly expense -->

        <sql:query var="myMoney" dataSource="test" >
            SELECT month(date_time_pay) 'month', sum(total) 'total' FROM monthly_expense
            where slip is not null
            and date_time_pay like '<% String year3 = request.getParameter("year");%>%'
            group by month(date_time_pay)
        </sql:query> 


        <table  border="1" align="center"> 
            <thead>
                <tr>
                    <th>Month</th>
                    <th>Total per Month</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="each_month" items="${myMoney.rows}">
                    <tr>

                        <td>${each_month.month}</td>

                        <td> 
                            ${each_month.total} 
                        </td>

                    </tr> 
                </c:forEach> 

                <sql:query var="myMoney" dataSource="test" >
                    SELECT sum(total) 'total' FROM monthly_expense
                    where slip is not null
                    and date_time_pay like '<% String year4 = request.getParameter("year");%>%'

                </sql:query> 

                <c:forEach var="each_month" items="${myMoney.rows}">
                    <tr>

                        <td>TOTAL</td>

                        <td> 
                            ${each_month.total} 
                        </td>

                    </tr> 
                </c:forEach> 
            </tbody>
        </table>

    </body>
</html>
