package LogIn;

import UserDAO.PasswordAuthentication;
import UserDAO.UserDAO_MySQL;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TO DO if a user is already logged in, redirect them to the home page.
        request.setAttribute("loginFailed", false);
        request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println(password);
        if(email.equals("") || password.equals("") || email == null || password == null) {
            System.out.println("email or password missing");
            request.setAttribute("loginFailed", true);
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            return;
        }

        UserDAO_MySQL userDAO = new UserDAO_MySQL();
        User user = userDAO.getUser(email);
        if(user == null) {
            System.out.println("email not found");
            request.setAttribute("loginFailed", true);
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            return;
        } else {
            System.out.println(user.getPassword());
            if (!password.equals(user.getPassword())) {
                System.out.println("Email found, password incorrect");
                request.setAttribute("loginFailed", true);
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
                return;
            } else {
                // CORRECT MATCH!
                HttpSession session = request.getSession();
                request.changeSessionId();
                System.out.println(session.getId());
                user.unsetPassword();
                session.setAttribute("user", user);
                response.sendRedirect("index.jsp");
            }
        }
    }
}

