<%-- 
    Document   : deleteHall
    Created on : 12-Sep-2018, 4:45:39 PM
    Author     : Nikola Petrovski
--%>

<%@page import="bean.Hall"%>
<%@page import="data.HallDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">
      <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-highway.css">
      <link rel="stylesheet" type="text/css" href="rose1.css">
      <title>JSP Page delete Hall</title>
   </head>

   <body>
      <h1 class="w3-container w3-tangerine"><img src="ROSA1.jpg" alt="Rose"/>Rose Banquet Halls </h1>
   <center>
      <strong>Delete Hall</strong>
      <%
         int hallID = Integer.parseInt(request.getParameter("hallID"));
         HallDAO hallDAO = new HallDAO();
         Hall hall = hallDAO.retrieveHallByHallID(hallID);
      %>
      <br>
      Are you sure you want to delete <%= hall.getHallName()%> hall?

      <form action="HallControllerServlet" method="GET">
         <input type="hidden" name="hallID"     value="<%=hall.getHallID()%>">
         <input type="submit" name="action" value="Delete Hall">
         <input type="submit" name="action" value="Cancel">
      </form>
   </center>
</body>

</html>
