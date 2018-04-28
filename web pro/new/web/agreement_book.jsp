<%-- 
    Document   : Agreement_book
    Created on : Apr 28, 2018, 12:45:55 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="cus_header.html" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
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
            <center><h1> BOOKING AGREEMENT </h1></center><br>
           
            

            <%-- Using Scriptlet--%>
            <% model.Account account = (model.Account) session.getAttribute("account_info");%>

            <%-- Using userBean--%>
            <jsp:useBean class="model.AreaCart" scope="session" id="areaCart" /> 

            <form action="registerServlet" method="POST">
                <div class="sign">
                    <br>

                    <center>Full Name <input type="text" name="fname" value="" readonly="readonly" disabled="disabled" placeholder="<%= account.getFullname()%>"/><br>


                        Category <input type="text" name="category" value="" readonly="readonly" disabled="disabled" 
                                        placeholder="<c:forEach var="place" items="${areaCart.places}">${place.type}     </c:forEach>"/><br>

                        Place number <input type="text" name="number" value="" readonly="readonly" disabled="disabled" 
                                            placeholder="<c:forEach var="place" items="${areaCart.places}">${place.place_name}     </c:forEach>"/><br>
                        
                        Cost <input type="text" name="cost" value="" readonly="readonly" disabled="disabled" placeholder="<c:forEach var="place" items="${areaCart.places}">${place.price}     </c:forEach>"/>/><br>


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

