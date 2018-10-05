/*
 * Booking Bean Class
 */
package bean;

/**
 *
 * @author Nikola Petrovski
 */
public class Booking {
   private int bookingID;
   private int clientID;
   private int hallID;
   private String bookingDate;

   public int getBookingID()
   {
      return bookingID;
   }

   public void setBookingID(int bookingID)
   {
      this.bookingID = bookingID;
   }

   public int getClientID()
   {
      return clientID;
   }

   public void setClientID(int clientID)
   {
      this.clientID = clientID;
   }

   public int getHallID()
   {
      return hallID;
   }

   public void setHallID(int hallID)
   {
      this.hallID = hallID;
   }

   public String getBookingDate()
   {
      return bookingDate;
   }

   public void setBookingDate(String bookingDate)
   {
      this.bookingDate = bookingDate;
   }
}
