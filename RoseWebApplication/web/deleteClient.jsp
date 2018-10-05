<%-- 
    Document   : deleteClient
    Created on : 12-Sep-2018, 4:45:21 PM
    Author     : Nikola Petrovski
--%>

<%@page import="bean.Client"%>
<%@page import="data.ClientDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">
      <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-highway.css">
      <link rel="stylesheet" type="text/css" href="rose1.css">
      <title>JSP Page delete Client</title>
   </head>
   <body>
      <h1 class="w3-container w3-tangerine"><img src="ROSA1.jpg" alt="Rose"/>Rose Banquet Halls </h1>
   <center>
      <strong>Delete Client</strong>
      <%
         int clientID = Integer.parseInt(request.getParameter("clientID"));
         ClientDAO clientDAO = new ClientDAO();
         Client client = clientDAO.retrieveClientByClientID(clientID);
      %>
      <br>
      Are you sure you want to delete <%= client.getClientName()%> ?

      <form action="ClientControllerServlet" method="GET">
         <input type="hidden" name="clientID" value="<%=client.getClientID()%>">
         <input type="submit" name="action" value="Delete Client">
         <input type="submit" name="action" value="Cancel">
      </form>
   </center>
</body>
</html>
