<%-- 
    Document   : agreement_rent
    Created on : Apr 29, 2018, 3:43:07 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="cus_header.html" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
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
        <div>
            <br>
            <center><h1> RENTAL AGREEMENT </h1></center><br>
            <form action="registerServlet" method="POST">
                <div class="sign">
                    <br>
                    <center>First Name <input type="text" name="fname" value="" readonly="readonly" disabled="disabled" /><br>
                    Last Name <input type="text" name="lname" value="" readonly="readonly" disabled="disabled" /><br>
                    Category <input type="text" name="category" value="" readonly="readonly" disabled="disabled" /><br>
                    Number <input type="text" name="number" value="" readonly="readonly" disabled="disabled" /><br>
                    Total amount to pay Advance 3 months <input type="text" name="cost" value="" readonly="readonly" disabled="disabled" placeholder="<%=payment.getPriceBook()%>"/><br>
                    Cost per Place <input type="text" name="cost" value="" readonly="readonly" disabled="disabled" /><br>
                    Rent Date <input type="text" name="rentdate" value="" readonly="readonly" disabled="disabled" /><br>
                    Expired Date <input type="text" name="expd" value="" readonly="readonly" disabled="disabled" /></center>
                    <center><textarea name="announce" rows="5" cols="60" readonly="readonly">
                    </textarea></center>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Agree <input type="checkbox" name="agree" value="ON" />
                    <br><center><input type="submit" value="Confirm" /></center>
                </div>
            </form>
        </div>
    </body>
</html>
