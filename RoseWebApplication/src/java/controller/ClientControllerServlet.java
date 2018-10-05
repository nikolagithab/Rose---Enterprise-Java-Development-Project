/*
 * Client Controller Servlet
 */
package controller;
import bean.Client;
import data.ClientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nikola Petrovski
 */
@WebServlet(name = "ClientControllerServlet",
   urlPatterns =
    {
      "/ClientControllerServlet"
    })
public class ClientControllerServlet extends HttpServlet {
   ClientDAO clientDAO;

   public ClientControllerServlet()
   {
      super();
      clientDAO = new ClientDAO();
   }

   /**
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
    * methods.
    *
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   protected void processRequest(HttpServletRequest request,
      HttpServletResponse response)
      throws ServletException,
      IOException
   {
      response.setContentType("text/html;charset=UTF-8");
      try (PrintWriter out = response.getWriter())
       {
         String action = request.getParameter("action");
         ClientDAO clientDAO = new ClientDAO();
         if (action.equals("Save New Client"))
          {
            Client client = new Client();
            //client.setClientID(Integer.parseInt(request.getParameter("clientID"))); automatic critical!
            client.setClientName(request.getParameter("clientName"));
            client.setCreditCard(request.getParameter("creditCard"));
            clientDAO.createClient(client); ///////////////////DAO
            response.sendRedirect("index.html");
          }
         else if (action.equals("Update Client"))
          {
            Client client = new Client();
            client.setClientID(Integer.
               parseInt(request.getParameter("clientID")));
            client.setClientName(request.getParameter("clientName"));
            client.setCreditCard(request.getParameter("creditCard"));
            clientDAO.updateClient(client); ///////////////////DAO
            response.sendRedirect("index.html");
          }
         else if (action.equals("Delete Client"))
          {
            int clientID = Integer.parseInt(request.getParameter("clientID"));
            clientDAO.deleteClient(clientID); /////////////////////DAO
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
      String message = null;  // message will be sent back to client
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
