package MyDAO_CSV;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PokemonServlet", value = "/pokedex")
public class PokemonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Pokemon> pokemonList = PokemonDAO_CSV.getAllPokemon(request, response);


        if(pokemonList == null){
            pokemonList = PokemonDAO_CSV.getAllPokemon(request, response);
        }

        request.setAttribute("pokemonList", pokemonList);
        request.getRequestDispatcher(("WEB-INF/pokedex.jsp")).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
