package HelpQuestion;

import HelpDAO_MySQL.Help;
import HelpDAO_MySQL.HelpDAO_MySQL;
import LogIn.User;
import UserDAO.UserDAO_MySQL;
import com.mysql.cj.Session;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "HelpServlet", value = "/help")
public class HelpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if(user != null){
            request.setAttribute("userRole", user.getRole());
        }

        request.getRequestDispatcher("WEB-INF/help.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HelpDAO_MySQL helpDAO = new HelpDAO_MySQL();

        String question = request.getParameter("question");
        String email = request.getParameter("email");

        Map<String,String> results = new HashMap<String, String>();

        if( question == null || question.equals("")){
            request.setAttribute("questionError", "You must enter a an Issue.");
            request.getRequestDispatcher("WEB-INF/help.jsp").forward(request,response);
            return;
        }
        if(email == null || email.equals("")){
            request.setAttribute("question", question);
            request.setAttribute("emailError", "You must enter an email address.");
            request.getRequestDispatcher("WEB-INF/help.jsp").forward(request,response);
            return;
        }
        if(!email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")){
            request.setAttribute("question", question);
            request.setAttribute("emailError", "You must enter a valid Email Address. ");
            request.getRequestDispatcher("WEB-INF/help.jsp").forward(request,response);
            return;
        }

        Help help = new Help();
        help.setQuestion(question);
        help.setEmail(email);
        help.setStatus("New");

        helpDAO.addHelp(help);

        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
