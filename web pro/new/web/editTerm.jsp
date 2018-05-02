<%-- 
    Document   : editTerm
    Created on : Apr 28, 2018, 8:49:32 AM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="boss_header.html" %>
<!DOCTYPE html>
<html>
    <head>
        <title>TERM.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="https://fonts.googleapis.com/css?family=Prompt" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/editTerm.css">
    </head>
    


        <br><br><br><h1><center>EDIT TERM.</center></h1><br>
        <!-- Show the previous term -->
        
        
         <% model.Announce announce  = (model.Announce) session.getAttribute("announce_details_2");%>
        

        <!-- edit & back button -->
        <br><form action="AddAnnounceServlet" method="POST">


            <center>
                <textarea name="txt" rows="10" cols="100">
                    <%=announce.getText() %>
                </textarea>
            </center>
            <br>
            <br><input name="btn" target="back" type="submit"  value="CANCEL" style="float:left;"> <input name="btn" target="submit" type="submit" value="SAVE"/>
        </form>
    
</html>

