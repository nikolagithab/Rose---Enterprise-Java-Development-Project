/*
 * Client DAO Class
 */
package data;
import bean.Client;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Nikola Petrovski
 */
public class ClientDAO {
   public void createClient(Client client)
   {
      String sql = "INSERT INTO dbrose.client (client_name, credit_card)\n" +
         " VALUES ('" + client.getClientName() + "' , '" + client.
         getCreditCard() + "')";
      DBManager dbm = new DBManager();
      dbm.executeUpdate(sql);  //////////////dbm class
   }

   public Client retrieveClientByClientID(int clientID)
   {
      Client client = new Client();
      try
       {
         String sql = "SELECT * FROM dbrose.client " +
            "WHERE client_id = " + clientID + ";"; // ime od tabela = ime od klasa
         DBManager dbm = new DBManager();
         ResultSet rs = dbm.executeQuery(sql);  //////////////dbm class
         if (rs.next())
          {
            client = new Client();
            client.setClientName(rs.getString("client_name"));
            client.setCreditCard(rs.getString("credit_card"));
            client.setClientID(rs.getInt("client_id"));
          }
       } catch (Exception e)
       {
         System.out.println("Error retrieving Client " + e);
       }
      return client;
   }

   public ArrayList<Client> retrieveClients()
   {
      ArrayList<Client> clients = new ArrayList<Client>();
      try
       {
         String sql = "SELECT * FROM dbrose.client;";
         DBManager dbm = new DBManager();
         ResultSet rs = dbm.executeQuery(sql);  ///////////////dbm class
         while (rs.next())
          {
            Client client = new Client();
            client.setClientName(rs.getString("client_name"));
            client.setCreditCard(rs.getString("credit_card"));
            client.setClientID(rs.getInt("client_ID"));
            clients.add(client);
          }
       } catch (Exception e)
       {
         System.out.println("Error retrieving Clients " + e);
       }
      return clients;
   }

   public void updateClient(Client client)
   {
      String sql = "UPDATE dbrose.client \n" +
         " SET client_name='" + client.getClientName() + "', credit_card='" + client.
         getCreditCard() + "'\n" +
         " WHERE client_id=" + client.getClientID() + ";";
      DBManager dbm = new DBManager();
      dbm.executeUpdate(sql);
   }

   public void deleteClient(int clientID)
   {
      String sql = "DELETE FROM dbrose.Client WHERE client_id = " + clientID + ";";// ime od tabela = ime od klasa
      DBManager dbm = new DBManager();
      dbm.executeUpdate(sql);
   }
}
