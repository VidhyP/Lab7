package ca.sait.lab7.servlets;

import ca.sait.lab7.services.UserService;
import ca.sait.lab7.services.RoleService;
import ca.sait.lab7.models.Role;
import ca.sait.lab7.models.User;
import java.io.IOException;
import java.util.*;
import java.util.logging.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

/**
 *
 * @author Vidhy Patel
 */
public class UserServlet extends HttpServlet {

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
            throws ServletException, IOException {
        UserService us = new UserService();
        try {
            List<User> users = us.getAll();
            request.setAttribute("users", users);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService us = new UserService();
        RoleService rs = new RoleService();
        try {
            List<Role> roles = rs.getAll();
            String action = request.getParameter("action");
            String email = request.getParameter("email");
            String firstName = request.getParameter("fname");
            String lastName = request.getParameter("lname");
            String password = request.getParameter("passwd");
            String roleName = request.getParameter("role");
            int roleId = 0;
            for (Role role : roles) {
                if (roleName.equals(role.getName())) {
                    roleId = role.getId();
                }
            }
            Role role = new Role(roleId, roleName);

            String query = request.getQueryString();
            if (query != null && query.contains("edit")) {
                if (action != null && action.equals("add")) {
                    us.insert(email, true, firstName, lastName, password, role);
                } else if (action != null & action.equals("edit")) {
                    User user = us.get(email);
                    request.setAttribute("user", user);
                    us.update(email, true, firstName, lastName, password, role);
                } else if (action != null & action.equals("delete")) {
                    us.delete(email);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }
}
