/*
 * Hall DAO Class
 */
package data;
import bean.Hall;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Nikola Petrovski
 */
public class HallDAO {
   public void createHall(Hall hall)
   {
      String sql = "INSERT INTO dbrose.hall (hall_name)\n" +
         " VALUES ('" + hall.getHallName() + "')";
      DBManager dbm = new DBManager();
      dbm.executeUpdate(sql); 
   }

   public Hall retrieveHallByHallID(int hall_id)
   {
      Hall hall = new Hall();
      try
       {
         String sql = "SELECT * FROM dbrose.hall " +
            "WHERE hall_id = " + hall_id + ";";
         DBManager dbm = new DBManager();
         ResultSet rs = dbm.executeQuery(sql); 
         if (rs.next())
          {
            hall = new Hall();
            hall.setHallName(rs.getString("hall_name"));
            hall.setHallID(rs.getInt("hall_id"));
          }
       } catch (Exception e)
       {
         System.out.println("Error retrieving Hall " + e);
       }
      return hall;
   }

   public ArrayList<Hall> retrieveHalls()
   {
      ArrayList<Hall> halls = new ArrayList<Hall>();
      try
       {
         String sql = "SELECT * FROM dbrose.hall;";
         DBManager dbm = new DBManager();
         ResultSet rs = dbm.executeQuery(sql);
         while (rs.next())
          {
            Hall hall = new Hall();
            hall.setHallName(rs.getString("hall_name"));
            hall.setHallID(rs.getInt("hall_ID"));
            halls.add(hall);
          }
       } catch (Exception e)
       {
         System.out.println("Error retrieving Halls " + e);
       }
      return halls;
   }

   public void updateHall(Hall hall)
   {
      String sql = "UPDATE dbrose.hall \n" +
         " SET hall_name='" + hall.getHallName() + "'\n" +
         " WHERE hall_id=" + hall.getHallID() + ";";
      DBManager dbm = new DBManager();
      dbm.executeUpdate(sql);
   }

   public void deleteHall(int hallID)
   {
      String sql = "DELETE FROM dbrose.Hall WHERE hall_id = " + hallID + ";";// ime od tabela = ime od klasa
      DBManager dbm = new DBManager();
      dbm.executeUpdate(sql);
   }
}
