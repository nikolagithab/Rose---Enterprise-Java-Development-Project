<%-- 
    Document   : createHall
    Created on : 12-Sep-2018, 4:39:57 PM
    Author     : Nikola Petrovski
--%>

<%@page import="bean.Hall"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">
      <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-highway.css">
      <link rel="stylesheet" type="text/css" href="rose2.css">
      <title>JSP Page create Hall</title>
   </head>

   <body>

      <% Hall hall = (Hall) request.getAttribute("hall");%>


   <center>
      <h1 class="w3-container w3-tangerine">Rose Banquet Halls </h1>

      <div class="w3-card-4" style="width:60%">

         <div class="w3-container w3-highway-red">
            <h2>Register Hall</h2>
         </div>

         <form class="w3-container w3-white" action="HallControllerServlet" method="GET">
            <label class="w3-text-red"><b>Hall Name</b></label>
            <input class="w3-input w3-border w3-theme-l3" type="text" name="hallName" placeholder="Hall Name" autocomplete="off">
            <br>          
            <input class="w3-btn w3-highway-red" type="submit" name="action" value="Save New Hall"> 
            <input class="w3-btn w3-highway-red" type="submit" name="action" value="Cancel">
            <br><br>
         </form>
      </div>
   </center>
</body>

</html>
