<%-- 
    Document   : view_agm_book
    Created on : Apr 29, 2018, 3:07:00 AM
    Author     : Suttida Sat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@include  file="cus_header.html" %>
<!DOCTYPE html>
<html>
    <head>
        <title>AGREEMENT PAGE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="https://fonts.googleapis.com/css?family=Prompt" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/agree.css">
    </head>
    <body>
 <%-- Using Scriptlet--%>

            <% model.Agreement agm = (model.Agreement) request.getAttribute("Agreement");%>
            <br>
            <center><h1> BOOKING AGREEMENT </h1></center><br>

                <div class="sign">
                    <br>
                    <center>
                        Name <input type="text" name="lname" value="" readonly="readonly" disabled="disabled" placeholder="<%out.println(session.getAttribute("fullname"));%>"/><br>
                        Place number <input type="text" name="category" value="" readonly="readonly" disabled="disabled" placeholder="<%= agm.getPlace_number()%>"/><br>
                        Category <input type="text" name="amount" value="" readonly="readonly" disabled="disabled" placeholder="<%= agm.getPlace_type()%>"/><br>
                        Cost <input type="text" name="cost" value="" readonly="readonly" disabled="disabled" placeholder="<%= agm.getCost()%>"/><br>
                        Rent Date <input type="text" name="rentdate" value="" readonly="readonly" disabled="disabled" placeholder="<%= agm.getStart_date()%>"/><br>
                        Expired Date <input type="text" name="expd" value="" readonly="readonly" disabled="disabled" placeholder="<%= agm.getEnd_date()%>"/><br>
                        Status Payment <input type="text" name="expd" value="" readonly="readonly" disabled="disabled" placeholder="<%= agm.isStatus_payment()%>"/></center>

           
                </div>

        </div>
    </body>
</html>
