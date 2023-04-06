package TypeQuiz;

import MyDAO_CSV.Pokemon;
import MyDAO_CSV.PokemonDAO_CSV;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TypeQuizServlet", value = "/typeQuiz")
public class TypeQuizServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Pokemon> pokemonList = PokemonDAO_CSV.getAllPokemon(request, response);
        if (pokemonList == null) {
            pokemonList = PokemonDAO_CSV.getAllPokemon(request, response);
        }

        Gson gson = new Gson();
        String pokemonListJson = gson.toJson(pokemonList);

        request.setAttribute("pokemonListJson", pokemonListJson);
        request.getRequestDispatcher("WEB-INF/TypeQuiz.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
