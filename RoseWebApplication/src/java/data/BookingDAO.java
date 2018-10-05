/*
 * Booking DAO Class
 */
package data;
import bean.Hall;
import bean.Booking;
import bean.Client;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Nikola Petrovski
 */
public class BookingDAO {
   public int createBooking(Booking booking)
   {
      // inserts a new booking
      Connection con = null;
      ResultSet rs = null;
      int bookingID = 0;
      String query = "INSERT INTO dbrose.booking (hall_id,client_id,booking_date)\n" +
         " VALUES (?,?,?)";
      try
       {
         con = DBManager.getConnection();
         // sets the parametes for statement
         PreparedStatement pstmt = con.prepareStatement(query,
            Statement.RETURN_GENERATED_KEYS);
         pstmt.setInt(1, booking.getHallID());
         pstmt.setInt(2, booking.getClientID());
         pstmt.setString(3, booking.getBookingDate());
         // sends the statement to the database server
         int rowAffected = pstmt.executeUpdate();
         if (rowAffected == 1)
          {
            // gets booking id
            rs = pstmt.getGeneratedKeys();
            if (rs.next())
             {
               bookingID = rs.getInt(1);
             }
          }
         else
          {
            bookingID = 0;
          }
       } catch (SQLException e)
       {
         e.printStackTrace();
       }
      return bookingID;
   }

   public Booking retrieveBookingByBookingID(int bookingID)
   {
      Booking booking = new Booking(); //nikako null
      try
       {
         String sql = "SELECT * FROM dbrose.booking " +
            "WHERE booking_id = " + bookingID + ";"; // ime od tabela = ime od klasa
         DBManager dbm = new DBManager();
         ResultSet rs = dbm.executeQuery(sql);  //////////////dbm class
         if (rs.next())
          {
            booking = new Booking();
            booking.setBookingID(rs.getInt("booking_id"));
            booking.setHallID(rs.getInt("hall_id"));
            booking.setClientID(rs.getInt("client_id"));
            booking.setBookingDate(rs.getString("booking_date"));
          }
       } catch (Exception e)
       {
         System.out.println("Error retrieving Booking " + e);
       }
      return booking;
   }

   public ArrayList<Booking> retrieveBookings()
   {
      ArrayList<Booking> bookings = new ArrayList<Booking>();
      try
       {
         String sql = "SELECT * FROM dbrose.booking";
         DBManager dbm = new DBManager();
         ResultSet rs = dbm.executeQuery(sql);  ///////////////dbm class
         while (rs.next())
          {
            Booking booking = new Booking();
            booking.setBookingID(rs.getInt("booking_id"));
            booking.setHallID(rs.getInt("hall_id"));
            booking.setClientID(rs.getInt("client_id"));
            booking.setBookingDate(rs.getString("booking_date"));
            bookings.add(booking);
          }
       } catch (Exception e)
       {
         System.out.println("Error retrieving Bookings " + e);
       }
      return bookings;
   }

   public void updateBooking(Booking booking)
   {
      String sql = "UPDATE dbrose.booking \n" +
         " SET hall_id='" + booking.getHallID() + "',client_id='" + booking.
         getClientID() + "',booking_date='" + booking.getBookingDate() + "'\n" +
         " WHERE booking_id=" + booking.getBookingID() + ";";
      DBManager dbm = new DBManager();
      dbm.executeUpdate(sql);
   }

   public void deleteBooking(int bookingID)
   {
      String sql = "DELETE FROM dbrose.Booking WHERE booking_id = " + bookingID + ";";// ime tabela = ime od klasa
      DBManager dbm = new DBManager();
      dbm.executeUpdate(sql);
   }
}
