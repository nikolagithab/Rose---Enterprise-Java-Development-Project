<%-- 
    Document   : retrieveHall
    Created on : 12-Sep-2018, 4:41:33 PM
    Author     : Nikola Petrovski
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="bean.Hall"%>
<%@page import="data.HallDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">
      <link rel="stylesheet" href="rose3.css" type="text/css">
      <title>JSP Page retrieve Hall</title>
   </head>

   <body>
      <h1 class="w3-container w3-tangerine"><img src="ROSA1.jpg" alt="Rose" style="width:18%"/>Rose Banquet Halls </h1>
   <center>
      <strong>Halls</strong>
      <br><br>
      <label>Hall Name</label>


      <%
         HallDAO hallDAO = new HallDAO();
         ArrayList<Hall> halls = hallDAO.retrieveHalls();
         for (Hall hall : halls)
          {
      %>
      <ul class="w3-ul w3-card w3-hoverable" style="width:30%">
         <li class="bule"><%= hall.getHallName()%> 
            <a href="updateHall.jsp?hallID=<%=hall.getHallID()%>">
               <img src="edit.png"   alt="edit"/></a>
            <a href="deleteHall.jsp?hallID=<%=hall.getHallID()%>">
               <img src="delete.png" alt="delete"/></a>
         </li>
      </ul>
      <%
          }
      %>
      <br>
      <a href="createHall.jsp" class="button">Add New Hall</a>
      <a href="index.html" class="button">Home Page</a>
   </center>
</body>

</html>
