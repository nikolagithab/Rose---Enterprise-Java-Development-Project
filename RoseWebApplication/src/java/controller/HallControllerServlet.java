/*
 * Hall Controller Servlet
 */
package controller;
import bean.Hall;
import data.HallDAO;
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
@WebServlet(name = "HallControllerServlet",
   urlPatterns =
    {
      "/HallControllerServlet"
    })
public class HallControllerServlet extends HttpServlet {
   HallDAO hallDAO;

   public HallControllerServlet()
   {
      super();
      hallDAO = new HallDAO();
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
         HallDAO hallDAO = new HallDAO();
         if (action.equals("Save New Hall"))
          {
            Hall hall = new Hall();
            //hall.setHallID(Integer.parseInt(request.getParameter("hallID")));
            hall.setHallName(request.getParameter("hallName"));
            hallDAO.createHall(hall);
            response.sendRedirect("index.html");
          }
         else if (action.equals("Update Hall"))
          {
            Hall hall = new Hall();
            hall.setHallID(Integer.parseInt(request.getParameter("hallID")));
            hall.setHallName(request.getParameter("hallName"));
            hallDAO.updateHall(hall);
            response.sendRedirect("index.html");
          }
         else if (action.equals("Delete Hall"))
          {
            int hallID = Integer.parseInt(request.getParameter("hallID"));
            hallDAO.deleteHall(hallID);
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
