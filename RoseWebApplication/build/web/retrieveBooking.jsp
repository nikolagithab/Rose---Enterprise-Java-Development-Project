<%-- 
    Document   : retrieveBooking
    Created on : 12-Sep-2018, 4:43:48 PM
    Author     : Nikola Petrovski
--%>

<%@page import="bean.Client"%>
<%@page import="bean.Hall"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Booking"%>
<%@page import="data.ClientDAO"%>
<%@page import="data.HallDAO"%>
<%@page import="data.BookingDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">
      <link rel="stylesheet" href="rose3.css" type="text/css">
      <title>JSP Page retrieve Booking</title>
   </head>


   <body>
      <h1 class="w3-container w3-tangerine"><img src="ROSA1.jpg" alt="Rose" style="width:18%"/>Rose Banquet Halls </h1>
   <center>
      <strong>Booking Administration</strong>
      
      <br><br>
      <div class="w3-container">
      <label class="box2">Hall</label>
      <label class="box2">Client</label>
      <label class="box2">Date</label>
      <%
         BookingDAO bookingDAO = new BookingDAO();
         HallDAO hallDAO = new HallDAO();
         ClientDAO clientDAO = new ClientDAO();
         ArrayList<Booking> bookings = bookingDAO.retrieveBookings();
         for (Booking b : bookings)
          {
            Hall hall = hallDAO.retrieveHallByHallID(b.getHallID());
            Client client = clientDAO.
               retrieveClientByClientID(b.getClientID());
      %>
      <ul class="w3-ul w3-card w3-hoverable" style="width:90%">
      <li value="<%=b.getBookingID()%>" class="bule">
         <div class="box2"><%=hall.getHallName()%>&emsp;</div>
         <div class="box2"><%=client.getClientName()%>&emsp;</div>
         <div class="box2"><%=b.getBookingDate()%></div>
         <a href="updateBooking.jsp?bookingID=<%=b.getBookingID()%>">
            <img src="edit.png" alt="edit"/>
         </a>
         <a href="deleteBooking.jsp?bookingID=<%=b.getBookingID()%>&hallName=<%=hall.getHallName()%>&clientName=<%=client.getClientName()%>">
            <img src="delete.png" alt="delete"/>
         </a>
      </li>
      </ul>
      <%
          }
      %>
      </div>
      <br>
      <a href="createBooking.jsp" class="button">Book a Hall</a>
      <a href="index.html" class="button">Home Page</a>
   </center>
</body>
</html>
