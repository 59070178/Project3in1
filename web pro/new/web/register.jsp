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
        
        <html:form action="register" styleId="form">
        <div>
            <h1 class="topic"> SIGN UP !</h1><br>
                
                
                <label for="fname">FIRST NAME </label>&nbsp;&nbsp;	
                <html:text property="firstname" />
                
                &nbsp;&nbsp;&nbsp;
                <label for="lname">LAST NAME </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;<html:text property="lastname" />

                <br> <label for="username">USERNAME </label>&nbsp;&nbsp;&nbsp;&nbsp;
                <html:text property="username" />

                <br><label for="password">PASSWORD </label>&nbsp;&nbsp;
                <html:password property="password"  />
                
                &nbsp;&nbsp;&nbsp;
                <label for="confirm_password">CONFIRM PASSWORD </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <html:password property="confirm_pw" />

                  <br><label for="u_gender">GENDER </label>&nbsp;&nbsp;
                   <html:select property="gender" >
                <html:option value="male">MALE</html:option>
                <html:option value="female">FEMALE</html:option>
            </html:select>

                    
                <br> <label for="tel">PHONE NUMBER </label>&nbsp;&nbsp;
                 <html:text property="phone" />
                 
                <br> <label for="h_num">NO. </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <html:text property="ban" />
                &nbsp;&nbsp;&nbsp;       
                
                <label for="h_soi">ALLEY </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <html:text property="soi"/>

                <br> <label for="h_district">DISTRICT </label>&nbsp;&nbsp;
                <html:text property="district"/>
                &nbsp;&nbsp;&nbsp;              
                
                <label for="h_area">CITY </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:text property="area" />

                <br> <label for="h_county">PROVINCE </label>&nbsp;&nbsp;
                <html:select property="country" >
                        <html:option  value='bangkok'>Bangkok</html:option>
                        <html:option  value='pattaya'>Pattaya</html:option>
                        <html:option  value='krabi'>Krabi</html:option>
                        <html:option  value='kanchanaburi'>Kanchanaburi</html:option>
                        <html:option  value='kalasin'>Kalasin</html:option>
                        <html:option  value='kamphaeng Phet'>Kamphaengphet</html:option>
                        <html:option  value='khonkaen'>Khonkaen</html:option>
                        <html:option value='chanthaburi'>Chanthaburi</html:option>
                        <html:option  value='chachoengsao'>Chachoengsao</html:option>
                        <html:option  value='chonburi'>Chon Buri</html:option>
                        <html:option  value='chainat'>Chai Nat</html:option>
                        <html:option  value='chaiyaphum'>Chaiyaphum</html:option>
            <html:option value='chumphon'>Chumphon</html:option>
            <html:option value='trang'>Trang</html:option>
            <html:option value='Trat'>Trat</html:option>
            <html:option value='Tak'>Tak</html:option>
            <html:option value='nakhonnayok'>Nakhon Nayok</html:option>
            <html:option value='nakhonpathom'>Nakhon Pathom</html:option>
            <html:option value='nakhonphanom'>Nakhon Phanom</html:option>
            <html:option value='nakhonratchasima'>Nakhon Ratchasima</html:option>
            <html:option value='nakhonsithammarat'>Nakhon Si Thammarat</html:option>
            <html:option value='nakhonsawan'>Nakhon Sawan</html:option>
            <html:option value='nonthaburi'>Nonthaburi</html:option>
            <html:option value='narathiwat'>Narathiwat</html:option>
            <html:option value='buengkan'>Bueng Kan</html:option>
            <html:option value='buriram'>Buri Ram</html:option>
            <html:option value='pathumthani'>Pathum Thani</html:option>
            <html:option value='prachuapkhirikhan'>Prachuap Khiri Khan</html:option>
            <html:option value='prachinburi'>Prachin Buri</html:option>
            <html:option value='pattani'>Pattani</html:option>
            <html:option value='phranakhonsiayutthaya'>Phra Nakhon Si Ayutthaya</html:option>
            <html:option value='phayao'>Phayao</html:option>
            <html:option value='phangnga'>Phangnga</html:option>
            <html:option value='phatthalung'>Phatthalung</html:option>
            <html:option value='phichit'>Phichit</html:option>
            <html:option value='phitsanulok'>Phitsanulok</html:option>
            <html:option value='phuket'>Phuket</html:option>
            <html:option value='mahasarakham'>Maha Sarakham</html:option>
            <html:option value='mukdahan'>Mukdahan</html:option>
            <html:option value='yala'>Yala</html:option>
            <html:option value='yasothon'>Yasothon</html:option>
            <html:option value='ranong'>Ranong</html:option>
            <html:option value='rayong'>Rayong</html:option>
            <html:option value='ratchaburi'>Ratchaburi</html:option>
            <html:option value='roiet'>Roi Et</html:option>
            <html:option value='lopburi'>Lop Buri</html:option>
            <html:option value='lampang'>Lampang</html:option>
            <html:option value='lamphun'>Lamphun</html:option>
            <html:option value='sisaket'>Si Sa Ket</html:option>
            <html:option value='sakonnakhon'>Sakon Nakhon</html:option>
            <html:option value='songkhla'>Songkhla</html:option>
            <html:option value='satun'>Satun</html:option>
            <html:option value='samutprakan'>Samut Prakan</html:option>
            <html:option value='samutsongkhram'>Samut Songkhram</html:option>
            <html:option value='samutsakhon'>Samut Sakhon</html:option>
            <html:option value='saraburi'>Saraburi</html:option>
            <html:option value='sakaew'>Sa Kaew</html:option>
            <html:option value='singburi'>Sing Buri</html:option>
            <html:option value='suphanburi'>Suphan Buri</html:option>
            <html:option value='suratthani'>Surat Thani</html:option>
            <html:option value='surin'>Surin</html:option>
            <html:option value='sukhothai'>Sukhothai</html:option>
            <html:option value='nongkhai'>Nong Khai</html:option>
            <html:option value='nongbualamphu'>Nong Bua Lam Phu</html:option>
            <html:option value='amnatcharoen'>Amnat Charoen</html:option>
            <html:option value='udonthani'>Udon Thani</html:option>
            <html:option value='uttaradit'>Uttaradit</html:option>
            <html:option value='uthaithani'>Uthai Thani</html:option>
            <html:option value='ubonratchathani'>Ubon Ratchathani</html:option>
            <html:option value='angthong'>Ang Thong</html:option>
            <html:option value='chiangrai'>Chiang Rai</html:option>
            <html:option value='chiangmai'>Chiang Mai</html:option>
            <html:option value='phetchaburi'>Phetchaburi</html:option>
            <html:option value='phetchabun'>Phetchabun</html:option>
            <html:option value='loei'>Loei</html:option>
            <html:option value='phrae'>Phrae</html:option>
            <html:option value='maehongson'>Mae Hong Son</html:option>

                </html:select>
                &nbsp;&nbsp;&nbsp;           
                
                
                <label for="h_zipcode">ZIP CODE </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:text property="code" />
                
                <br><br><br><br><br>
                <center><html:submit value="SUBMIT" /></center>
                <h2> <html:errors /></h2>
            </html:form>
        </div>
    </body>
</html>
