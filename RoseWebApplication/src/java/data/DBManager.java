/*
 * Database Manager Class
 */
package data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Nikola Petrovski
 */
public class DBManager {
   public static Connection getConnection()
   {
      Connection con = null;
      String url = "jdbc:mysql://localhost:3306/dbrose?useSSL=false";
      String user = "root";
      String pass = "pass";
      try
       {
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection(url, user, pass);
         System.out.println("CONNECT");
       } catch (Exception e)
       {
         System.out.println("Error getting connection " + e);
       }
      return con;
   }

   public ResultSet executeQuery(String sql)
   {
      ResultSet rs = null;
      try
       {
         Connection con = getConnection();
         Statement st = con.createStatement();
         rs = st.executeQuery(sql);
       } catch (Exception e)
       {
         System.out.println("Error executing query " + e);
       }
      return rs;
   }

   public int executeUpdate(String sql)
   {
      int i = 0;
      try
       {
         Connection con = getConnection();
         Statement st = con.createStatement();
         st.executeUpdate(sql);
       } catch (SQLException e)
       {
         System.out.println("Error executing update " + e);
       }
      return i;
   }
}
