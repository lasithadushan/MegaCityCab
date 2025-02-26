package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.DashboardDAO;
import model.DashboardStats;
import java.io.IOException;

@WebServlet("/dashboardServlet")
public class dashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
        } else {
            DashboardDAO dashboardDAO = new DashboardDAO();
            DashboardStats stats = dashboardDAO.getDashboardStats();
            
            request.setAttribute("stats", stats);
            request.getRequestDispatcher("views/dashboard.jsp").forward(request, response);
        }
    }
}
