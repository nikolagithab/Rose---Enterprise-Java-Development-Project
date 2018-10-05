/*
 * Client Bean Class
 */
package bean;

/**
 *
 * @author Nikola Petrovski
 */
public class Client {
   private int clientID;
   private String clientName;
   private String creditCard;

   public int getClientID()
   {
      return clientID;
   }

   public void setClientID(int clientID)
   {
      this.clientID = clientID;
   }

   public String getClientName()
   {
      return clientName;
   }

   public void setClientName(String clientName)
   {
      this.clientName = clientName;
   }

   public String getCreditCard()
   {
      return creditCard;
   }

   public void setCreditCard(String creditCard)
   {
      this.creditCard = creditCard;
   }
}
