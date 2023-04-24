<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String pokemonListJson = (String) request.getAttribute("pokemonListJson");
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Type Quiz</title>
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
        <a href="login">Login</a>
        <br>
        <a href="makeYourOwnQuestion">Submit A Question</a>
    </div>



        <main style="max-width: 800px; margin: 0 auto; padding: 16px;">
            <button class="btn-open centered" onclick="showRandomPokemon()">Begin</button>
            <div id="quiz-container-wrapper">
                <div id="quiz-wrapper" style="display: none;">
                    <div id="quiz-container centered">
                        <form id="quiz-form">
                            <div id="pokemon-info">
                                <h2>Question: <span id="questionNumber"></span></h2>
                                <h3></h3>
                                <h2 id="typeOne"></h2><h2 id="typeTwo"></h2>
                                <img src="" alt="">
                                <div>
                                    <% for (int i = 0; i < 4; i++) { %>
                                        <button type="button" onclick="checkAnswer(this.innerHTML)"></button>
                                    <% } %>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="score-container" style="display: none;">
                    <h2>Score</h2>
                    <p>Correct: <span id="countCorrect">0</span></p>
                    <p>Wrong: <span id="countWrong">0</span></p>
                </div>
            </div>
        </main>
        <style>
            #quiz-container-wrapper {
                display: flex;
                justify-content: center;
                align-items: center;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
        </style>
        </script>
        <script>
            const jsPokemonList = <%= pokemonListJson %>;
            console.log(jsPokemonList);
            let randomPokemonIndex = Math.floor(Math.random() * jsPokemonList.length);
            let randomPokemon = jsPokemonList[randomPokemonIndex];
            let options = jsPokemonList.filter(pokemon => pokemon !== randomPokemon);
            let questionNumber = 1;
            let countCorrect = 0;
            let countWrong = 0;

            let questionNumbers = document.getElementById("questionNumber");
            let questionRight = document.getElementById("countCorrect");
            let questionWrong = document.getElementById("countWrong");
            let typeOne = document.getElementById("typeOne");
            let typeTwo = document.getElementById("typeTwo");

            function shuffleArray(arr) {
                return arr.sort(() => Math.random() - 0.5);
            }

            function updateForm() {
                questionNumbers.textContent = questionNumber;
                questionRight.textContent = countCorrect;
                questionWrong.textContent = countWrong;
                let quizForm = document.getElementById("pokemon-info");
                typeOne.textContent = randomPokemon.typeOne;
                typeTwo.textContent = randomPokemon.typeTwo;
                let question = quizForm.getElementsByTagName("h3")[0];
                question.innerHTML = "Which Pokemon is this?";
                let buttons = quizForm.getElementsByTagName("button");
                let shuffledOptions = shuffleArray(options);
                let randomNumber = Math.floor(Math.random()*3);
                for (let i = 0; i < buttons.length; i++) {
                    if(i === randomNumber){
                        buttons[i].innerHTML = randomPokemon.pokemonName;
                    }
                    else{
                        buttons[i].innerHTML = (shuffledOptions[i].pokemonName);
                    }
                }
            }

            function showRandomPokemon() {
                let pokemonInfo = document.getElementById("pokemon-info");
                let pokemonQuizArea = document.getElementById("quiz-wrapper");
                let scoreContainer = document.getElementById("score-container");

                if (pokemonInfo && scoreContainer) {
                    pokemonQuizArea.style.display = "inline-block";
                    pokemonInfo.style.display = "inline-block";
                    scoreContainer.style.display = "inline-block";
                    let quizForm = document.getElementById("quiz-form");
                    quizForm.style.display = "inline-block";
                    updateForm();
                    let beginButton = document.getElementsByClassName("btn-open")[0];
                    if (beginButton) {
                        beginButton.style.display = "none";
                    }
                }
            }


            function checkAnswer(selectedOption) {
                if (selectedOption === randomPokemon.pokemonName) {
                    alert("Correct!");
                    countCorrect++;
                    questionNumber++;
                    randomPokemonIndex = Math.floor(Math.random() * jsPokemonList.length);
                    randomPokemon = jsPokemonList[randomPokemonIndex];
                    options = jsPokemonList.filter(pokemon => pokemon !== randomPokemon);
                    updateForm();
                } else {
                    alert("Incorrect!");
                    countWrong++;
                    questionWrong.textContent = countWrong;
                }
            }
        </script>
    </body>
</html> 
