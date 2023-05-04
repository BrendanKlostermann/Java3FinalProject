<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    int randomNumber = (int) (Math.random() * 721) + 1;
    int randomNumberTwo = (int) (Math.random() * 721) + 1;
    int randomNumberThree = (int) (Math.random() * 721) + 1;

    String log;
    String logText;
    if(session.getAttribute("user") == null){
        log = "login";
        logText = "LogIn";
    }
    else{
        log = "logout";
        logText = "LogOut";
    }
%>
<html>

    <head>
        <meta charset="utf-8">
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="test.css">
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
            <a href="<%=log%>"><%=logText%></a>
            <br>
            <a href="makeYourOwnQuestion">Submit A Question</a>
            <br>
            <a href="help">Get Help</a>
        </div>

        <div class="main">
            <div class="leftSide">
                <h3>Our Quiz's</h3>
                <p>There are 2 great quiz's, challenging your knowledge of the Pokemon universe.</p>
                <ul>
                    <li>Picture Quiz</li>
                    <li>Type Quiz</li>
                </ul>
                <img class="card-img-top" src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/<%=String.format("%03d", randomNumber)%>.png" alt="pokemon">
            </div>
            <div class="rightSide">
                <h3>Community Quiz's</h3>
                <p>Looking to be a part of the community? Try: </p>
                <ul>
                    <li>Fan Made Questions</li>
                    <li>Submit Your Own Questions</li>
                </ul>
                <img class="card-img-top" src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/<%=String.format("%03d", randomNumberTwo)%>.png" alt="pokemon">
            </div>
        </div>
    </body>
    <style>
        .leftSide img,
        .rightSide img {
            padding-left: 10%;
            width: 300px;
            height: auto;
            object-fit: cover;
        }

        .leftSide {
            width: 45%;
            float: left;
            margin-right: -1%;
            padding: 5%;
        }

        .rightSide {
            width: 45%;
            float: left;
            margin-left: 2%;
            padding: 5%;
        }
    </style>

</html>



<%--<h2>Pokemon Quiz</h2>--%>
<%--<img class="card-img-top" src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/<%=String.format("%03d", randomNumber)%>.png" alt="pokemon">--%>