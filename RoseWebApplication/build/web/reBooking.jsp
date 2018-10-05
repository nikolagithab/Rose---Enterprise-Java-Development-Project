<%-- 
    Document   : reBooking
    Created on : 28-Sep-2018, 6:41:30 PM
    Author     : Nikola Petrovski
--%>

<%@page import="data.BookingDAO"%>
<%@page import="bean.Client"%>
<%@page import="data.ClientDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Hall"%>
<%@page import="data.HallDAO"%>
<%@page import="bean.Booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">
      <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-highway.css">
      <link rel="stylesheet" type="text/css" href="rose2.css">
      <title>JSP Page</title>
   </head>

   <body>
      <%
         BookingDAO bookingDAO = new BookingDAO();
         HallDAO hallDAO = new HallDAO();
         int hallID = Integer.parseInt(request.getParameter("hallID"));
         Hall hall = hallDAO.retrieveHallByHallID(hallID);
         String bookingDate = request.getParameter("bookingDate");
      %>
   <center>
      <h1 class="w3-container w3-tangerine">Rose Banquet Halls </h1>
      <div class="w3-card-4" style="width:60%">

         <div class="w3-container w3-highway-red">

            <h4>SORRY but the  <%=hall.getHallName()%>  hall is not available on <%=bookingDate%>  . Please select another hall or another date.</h4>
         </div>
         <form class="w3-container w3-white" action="BookingControllerServlet" method="GET">
            <label class="w3-text-red"><b>Select Hall</b></label>
            <select class="w3-select w3-border w3-theme-l3" name="hallID">
               <%
                  ArrayList<Hall> halls = hallDAO.retrieveHalls();
                  for (Hall hl : halls)
                   {
               %> 
               <option <%= (hall.getHallID() == hl.getHallID()) ? "selected" : ""%> value='<%=hl.getHallID()%>'> 
                  <%=hl.getHallName()%> 
               </option>
               <%
                   }
               %>
            </select>
            <br>
            <label class="w3-text-red"><b>Select Client</b></label>
            <select class="w3-select w3-border w3-theme-l3" name="clientID">
               <% ClientDAO clientDAO = new ClientDAO();
                  int clientID = Integer.parseInt(request.getParameter(
                     "clientID"));
                  Client client = clientDAO.retrieveClientByClientID(clientID);
                  ArrayList<Client> clients = clientDAO.retrieveClients();
                  for (Client c : clients)
                   {
               %> 
               <option  <%= (client.getClientID() == c.getClientID()) ? "selected" : ""%> value='<%=c.getClientID()%>' > 
                  <%=c.getClientName()%> 
               </option>
               <%
                   }
               %>
            </select>
            <br>
            <label class="w3-text-red"><b>Enter Date</b></label> 
            <input class="w3-select w3-border w3-theme-l3" type="text" name="bookingDate" value=<%=bookingDate%>>
            <br><br>
            <input class="w3-btn w3-highway-red" type="submit" name="action" value="Save New Booking">
            <input class="w3-btn w3-highway-red" type="submit" name="action" value="Cancel">
            <br><br>
         </form>
      </div>
   </center>
</body>

</html>
