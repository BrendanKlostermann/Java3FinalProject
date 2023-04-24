<%@ page import="MyDAO_CSV.Pokemon" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Pokemon> pokemonList = (List<Pokemon>)request.getAttribute("pokemonList");
    if(pokemonList == null){
        pokemonList = new ArrayList<>();
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pokedex</title>
    <link rel="stylesheet" type="text/css" href="test.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<header>

</header>
<body>
<div class="sidenav">
    <a href="index.jsp">Home</a>
    <a href="pokedex">Pokedex</a>
    <br>
    <br>
    <br>
    <br>
    <br>
    <a href="pictureQuiz">Picture Quiz</a>
    <br>
    <a href="typeQuiz">Type Quiz</a>
    <br>
    <a href="fanQuestions">Fan Made Questions</a>
    <br>
    <br>
    <br>
    <br>
    <a href="login">Login</a>
    <br>
    <a href="makeYourOwnQuestion">Submit A Question</a>
</div>


    <main>


        <div class="container my-5">
            <div class="row">
                <% for(Pokemon pokemon: pokemonList) {%>
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="card m-3">
                        <img class="card-img-top" src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/<%=String.format("%03d", pokemon.getPokemonID())%>.png" alt="<%=pokemon.getPokemonName()%>">
                        <div class="card-body">
                            <h5 class="card-title"><%= pokemon.getPokemonID()%> <%= pokemon.getPokemonName()%></h5>
                            <p class="card-text"><%= pokemon.getTypeOne()%> <%= pokemon.getTypeTwo()%></p>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </main>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
