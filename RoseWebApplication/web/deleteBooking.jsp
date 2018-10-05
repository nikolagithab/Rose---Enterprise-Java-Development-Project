<%-- 
    Document   : deleteBooking
    Created on : 12-Sep-2018, 4:45:57 PM
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
      <link rel="stylesheet" type="text/css" href="rose1.css">
      <title>JSP Page delete Booking</title>
   </head>

   <body>
      <%
         int bookingID = Integer.parseInt(request.getParameter("bookingID"));
         BookingDAO bookingDAO = new BookingDAO();
         Booking booking = bookingDAO.retrieveBookingByBookingID(bookingID);
         HallDAO hallDAO = new HallDAO();
         Hall hall = hallDAO.retrieveHallByHallID(booking.getHallID());
         ClientDAO clientDAO = new ClientDAO();
         Client client = clientDAO.retrieveClientByClientID(booking.
            getClientID());
      %>
      <h1 class="w3-container w3-tangerine"><img src="ROSA1.jpg" alt="Rose"/>Rose Banquet Halls </h1>
   <center>
      <strong>Delete Booking</strong>
      <form action="BookingControllerServlet" method="GET">
         <br>
         Are you sure you want to delete booking of 
         <%=hall.getHallName()%> hall for 
         <%=client.getClientName()%> on 
         <%=booking.getBookingDate()%>?
         <br>
         <input type="submit" name="action" value="Delete Booking">
         <input type="submit" name="action" value="Cancel">
         <input type="hidden" name="bookingID" 
                value="<%= booking != null ? booking.getBookingID() : ""%>"/>
      </form>
   </center>
</body>
</html>
