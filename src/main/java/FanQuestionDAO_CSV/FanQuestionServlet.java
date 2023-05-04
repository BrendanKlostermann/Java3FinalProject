package FanQuestionDAO_CSV;

import MyDAO_CSV.Pokemon;
import MyDAO_CSV.PokemonDAO_CSV;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FanQuestionServlet", value = "/fanQuestions")
public class FanQuestionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<FanQuestion> fanQuestions = FanQuestionDAO_CSV.getAllFanQuestion(request, response);
        System.out.println(request.getServletContext().getRealPath("WEB-INF/PokemonCSV/fanQuestions.csv"));


        Gson gson = new Gson();
        String pokemonListJson = gson.toJson(fanQuestions);

        request.setAttribute("fanQuestions", pokemonListJson);
        request.getRequestDispatcher(("WEB-INF/FanQuestions.jsp")).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
