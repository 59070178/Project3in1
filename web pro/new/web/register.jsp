<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register</title>
    </head>
    <body>
        <%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
        <%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
        <%@page contentType="text/html"%>

        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><bean:message key="title.message"/> </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/regis.css">
    </head>

    <body style="background-image: url(pic/mall2.jpg)">
        
        <html:form action="register" styleId="form"
enctype="multipart/form-data: charset=utf-8">
        <div>
            <h1 class="topic"> ลงทะเบียน !</h1><br>
            <form action="registerServlet" method="POST">
                
                
                <label for="fname">ชื่อจริง </label>&nbsp;&nbsp;	
                <html:text property="firstname" />
                
                &nbsp;&nbsp;&nbsp;
                <label for="lname">นามสกุล </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;<html:text property="lastname" />

                <br> <label for="username">ชื่อผู้ใช้ </label>&nbsp;&nbsp;&nbsp;&nbsp;
                <html:text property="username" />

                <br><label for="password">รหัสผ่าน </label>&nbsp;&nbsp;
                <html:password property="password"  />
                
                &nbsp;&nbsp;&nbsp;
                <label for="confirm_password">ยืนยันรหัสผ่าน </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <html:password property="confirm_pw" />

                  <br><label for="u_gender">เพศ </label>&nbsp;&nbsp;
                   <html:select property="gender" >
                <html:option value="male">ชาย</html:option>
                <html:option value="female">หญิง</html:option>
            </html:select>

                    
                <br> <label for="tel">เบอร์โทรศัพท์ </label>&nbsp;&nbsp;
                 <html:text property="phone" />
                 
                <br> <label for="h_num">เลขที่บ้าน </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <html:text property="ban" />
                &nbsp;&nbsp;&nbsp;       
                
                <label for="h_soi">ซอย </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <html:text property="soi"/>

                <br> <label for="h_district">แขวง </label>&nbsp;&nbsp;
                <html:text property="district"/>
                &nbsp;&nbsp;&nbsp;              
                
                <label for="h_area">เขต </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:text property="area" />

                <br> <label for="h_county">จังหวัด </label>&nbsp;&nbsp;
                <html:text property="country"  />
                &nbsp;&nbsp;&nbsp;           
                
                
                <label for="h_zipcode">รหัสไปรษณีย์ </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:text property="code" />
                
                <br><br><br><br><br>
                <center><html:submit value="ยืนยัน" /></center>
                <h2> <html:errors /></h2>
            </html:form>
        </div>
    </body>
</html>
