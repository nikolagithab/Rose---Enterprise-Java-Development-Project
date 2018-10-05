/*
 * Booking Controller Servlet
 */
package controller;
import bean.Booking;
import bean.Client;
import bean.Booking;
import data.BookingDAO;
import data.BookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nikola Petrovski
 */
@WebServlet(name = "BookingControllerServlet",
   urlPatterns =
    {
      "/BookingControllerServlet"
    })
public class BookingControllerServlet extends HttpServlet {
   BookingDAO bookingDAO;

   public BookingControllerServlet()
   {
      super();
      bookingDAO = new BookingDAO();
   }

   /**
    *
    * @param request
    * @param response
    * @throws ServletException
    * @throws IOException
    */
   protected void processRequest(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException
   {
      response.setContentType("text/html;charset=UTF-8");
      try (PrintWriter out = response.getWriter())
       {
         String action = request.getParameter("action");
         BookingDAO BookingDAO = new BookingDAO();
         if (action.equals("Save New Booking"))
          {
            Booking booking = new Booking();
            booking.setHallID(Integer.
               parseInt(request.getParameter("hallID")));
            booking.setClientID(Integer.parseInt(request.
               getParameter("clientID")));
            booking.setBookingDate(request.getParameter("bookingDate"));
            int bookingID = BookingDAO.createBooking(booking);
            String hallID = request.getParameter("hallID");
            System.out.println("hallID is " + hallID);
            String hallName = request.getParameter("hallName");
            System.out.println("hallname is " + hallName);
            String bookingDate = request.getParameter("bookingDate");
            System.out.println("date is: " + bookingDate);
            String clientID = request.getParameter("clientID");
            System.out.println("clientID is: " + clientID);
            if (bookingID == 0)
             {
               System.out.println("history already exist");
               response.sendRedirect(
                  "reBooking.jsp?hallID=" + hallID + "&bookingDate=" + bookingDate + "&clientID=" + clientID + "");
             }
            else if (bookingID != 0)
             {
               response.sendRedirect(
                  "congratsBooking.jsp?bookingID=" + bookingID + "");
             }
          }
         else if (action.equals("Update Booking"))
          {
            Booking Booking = new Booking();
            Booking.setBookingID(Integer.parseInt(request.getParameter(
               "bookingID")));
            Booking.setHallID(Integer.parseInt(request.getParameter("hallID")));
            Booking.setClientID(Integer.parseInt(request.
               getParameter("clientID")));
            Booking.setBookingDate(request.getParameter("bookingDate"));
            BookingDAO.updateBooking(Booking);
            response.sendRedirect("index.html");
          }
         else if (action.equals("Delete Booking"))
          {
            int bookingID = Integer.parseInt(request.getParameter("bookingID"));
            BookingDAO.deleteBooking(bookingID);
            response.sendRedirect("index.html");
          }
         else if (action.equals("Cancel"))
          {
            response.sendRedirect("index.html");
          }
       }
   }

   // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   /**
    * Handles the HTTP <code>GET</code> method.
    *
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException,
      IOException
   {
      processRequest(request,
         response);
   }

   /**
    * Handles the HTTP <code>POST</code> method.
    *
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   @Override
   protected void doPost(HttpServletRequest request,
      HttpServletResponse response)
      throws ServletException,
      IOException
   {
      processRequest(request,
         response);
   }

   /**
    * Returns a short description of the servlet.
    *
    * @return a String containing servlet description
    */
   @Override
   public String getServletInfo()
   {
      return "Short description";
   }// </editor-fold>
}
