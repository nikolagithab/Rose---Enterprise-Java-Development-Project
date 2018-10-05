<%-- 
    Document   : updateClient
    Created on : 12-Sep-2018, 10:09:55 PM
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
      <link rel="stylesheet" type="text/css" href="rose2.css">
      <title>JSP Page update Client</title>
   </head>

   <body>
      <%
         int clientID = Integer.parseInt(request.getParameter("clientID"));
         ClientDAO clientDAO = new ClientDAO();
         Client client = clientDAO.retrieveClientByClientID(clientID);
      %>
   <center>
      <h1 class="w3-container w3-tangerine">Rose Banquet Halls </h1>

      <div class="w3-card-4" style="width:60%">

         <div class="w3-container w3-highway-red">
            <h2>Update Client</h2>
         </div>

         <form class="w3-container w3-white" action="ClientControllerServlet" method="GET">
            <br>
            <label class="w3-text-red"><b>Client Name</b></label>  
            <input class="w3-input w3-border w3-theme-l3" type="text"   name="clientName"  value="<%=client.getClientName()%>" autocomplete="off">
            <br>
            <label class="w3-text-red"><b>Credit Card</b></label>  
            <input class="w3-input w3-border w3-theme-l3" type="text" name="creditCard" value="<%=client.getCreditCard()%>" autocomplete="off">

            <input class="w3-input w3-border w3-theme-l3" type="hidden" name="clientID" value="<%=client.getClientID()%>">
            <br>             
            <input class="w3-btn w3-highway-red" type="submit" name="action" value="Update Client">
            <input class="w3-btn w3-highway-red" type="submit" name="action" value="Cancel">
            <br><br>
         </form>
      </div>
   </center>
</body>
</html>