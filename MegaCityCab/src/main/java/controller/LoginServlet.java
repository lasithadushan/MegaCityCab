package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.User;
import java.io.IOException;

import dao.UserDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.validateUser(username, password);

        if (user != null) {
            HttpSession session = request.getSession(true); // Ensure a session is always created or retrieved
            session.setAttribute("user", user);
            System.out.println("User " + user.getUsername() + " stored in session " + session.getId());
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Invalid%20Credentials");
        }
    }
}