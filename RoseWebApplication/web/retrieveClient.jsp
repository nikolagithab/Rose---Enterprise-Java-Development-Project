<%-- 
    Document   : retrieveClient
    Created on : 12-Sep-2018, 4:41:14 PM
    Author     : Nikola Petrovski
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="bean.Client"%>
<%@page import="data.ClientDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">
      <link rel="stylesheet" href="rose3.css" type="text/css">
      <title>JSP Page retrieve Client</title>
   </head>

   <body>
      <h1 class="w3-container w3-tangerine"><img src="ROSA1.jpg" alt="Rose" style="width:18%"/>Rose Banquet Halls </h1>
   <center>
      <strong>Clients</strong>
      <br><br>
      <label>Client Name</label>
      <%
         ClientDAO clientDAO = new ClientDAO();
         ArrayList<Client> clients = clientDAO.retrieveClients();
         for (Client client : clients)
          {
      %>
      <ul class="w3-ul w3-card w3-hoverable" style="width:30%">
         <li class="bule"><%= client.getClientName()%>
            <a href="updateClient.jsp?clientID=<%=client.getClientID()%>">
               <img src="edit.png"   alt="edit"/></a>
            <a href="deleteClient.jsp?clientID=<%=client.getClientID()%>">
               <img src="delete.png" alt="delete"/></a>
         </li>
      </ul>
      <%
          }
      %>
      <br>
      <a href="createClient.jsp" class="button">Register Client</a>
      <a href="index.html" class="button">Home Page</a>
   </center>
</body>
</html>
