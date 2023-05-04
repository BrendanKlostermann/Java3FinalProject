package HelpQuestion;

import HelpDAO_MySQL.HelpDAO_MySQL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import HelpDAO_MySQL.Help;
import LogIn.User;

@WebServlet(name = "ViewHelpServlet", value = "/viewhelp")
public class ViewHelpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HelpDAO_MySQL helpDAO = new HelpDAO_MySQL();
        List<Help> questions = helpDAO.getAllHelp();
        if(questions.size() == 0 | questions == null){
            request.setAttribute("questionsError","No issues are found at this time.");
            request.getRequestDispatcher("WEB-INF/viewhelp.jsp").forward(request,response);
            return;
        }



        request.setAttribute("questions",questions);
        request.getRequestDispatcher("WEB-INF/viewhelp.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("helpID"));
        System.out.println(id);
        String status = request.getParameter("helpStatus");
        System.out.println(status);
        HelpDAO_MySQL helpDAO = new HelpDAO_MySQL();

        try {
            int count = helpDAO.updateHelp(id,status);
        } catch (SQLException e) {
            request.setAttribute("updateError","Could not update the help ticket.");
            request.getRequestDispatcher("WEB-INF/viewhelp.jsp").forward(request,response);
        }

        response.sendRedirect(request.getContextPath() + "/viewhelp");

    }
}
