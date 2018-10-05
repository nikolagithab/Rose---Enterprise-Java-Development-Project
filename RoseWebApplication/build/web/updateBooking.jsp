<%-- 
    Document   : updateBooking
    Created on : 12-Sep-2018, 4:45:02 PM
    Author     : Nikola Petrovski
--%>

<%@page import="bean.Client"%>
<%@page import="data.ClientDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Hall"%>
<%@page import="data.HallDAO"%>
<%@page import="bean.Booking"%>
<%@page import="data.BookingDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">
      <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-highway.css">
      <link rel="stylesheet" type="text/css" href="rose2.css">
      <title>JSP Page update Booking</title>
   </head>

   <body>
      <%
         int bookingID = Integer.parseInt(request.getParameter("bookingID"));
         BookingDAO bookingDAO = new BookingDAO();
         Booking booking = bookingDAO.retrieveBookingByBookingID(bookingID);
      %>
   <center>
      <h1 class="w3-container w3-tangerine">Rose Banquet Halls </h1>
      <div class="w3-card-4" style="width:60%">

         <div class="w3-container w3-highway-red">
            <h2>Update Booking</h2>
         </div>
         <form class="w3-container w3-white" action="BookingControllerServlet" method="GET">

            <label class="w3-text-red"><b>Select Hall</b></label>
            <select class="w3-select w3-border w3-theme-l3" name="hallID">
               <% HallDAO hallDAO = new HallDAO();
                  Hall hall = hallDAO.retrieveHallByHallID(booking.getHallID());
                  ArrayList<Hall> halls = hallDAO.retrieveHalls();
                  for (Hall hl : halls)
                   {
               %> 
               <option <%= (hall.getHallID() == hl.getHallID()) ? "selected" : ""%> 
                  value='<%=hl.getHallID()%>'> 
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
                  Client client = clientDAO.retrieveClientByClientID(booking.
                     getClientID());
                  ArrayList<Client> clients = clientDAO.retrieveClients();
                  for (Client c : clients)
                   {
               %> 
               <option  <%= (client.getClientID() == c.getClientID()) ? "selected" : ""%> 
                  value='<%=c.getClientID()%>' > 
                  <%=c.getClientName()%> 
               </option>
               <%
                   }
               %>
            </select>
            <br>
            <label class="w3-text-red"><b>Enter Date</b></label> 
            <input class="w3-input w3-border w3-theme-l3" type="text" name="bookingDate" 
                   value="<%= booking != null ? booking.getBookingDate() : ""%>" placeholder="YYYYMMDD" autocomplete="off">
            <br>
            <input class="w3-btn w3-highway-red" type="submit" name="action" value="Update Booking">
            <input class="w3-btn w3-highway-red" type="submit" name="action" value="Cancel">
            <input type="hidden" name="bookingID" 
                   value="<%= booking != null ? booking.getBookingID() : ""%>"/>
            <br><br>
         </form>
      </div>
   </center>
</body>
</html>