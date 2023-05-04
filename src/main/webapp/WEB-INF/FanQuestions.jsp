<%@ page import="MyDAO_CSV.Pokemon" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String fanQuestions = (String) request.getAttribute("fanQuestions");
    System.out.println(fanQuestions);

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
    String submitQuestionText;
    String submitQuestion;
    if(session.getAttribute("user") == null){
        submitQuestion = "";
        submitQuestionText = "";
    }else{
        submitQuestion = "makeYourOwnQuestion";
        submitQuestionText = "Submit A Question";
    }
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Fan Questions</title>
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
        <a href="pictureQuiz">Picture Quiz</a>
        <br>
        <a href="typeQuiz">Type Quiz</a>
        <br>
        <a href="fanQuestions">Fan Made Questions</a>
        <br>
        <br>
        <a href="<%=log%>"><%=logText%></a>
        <br>
        <a href="<%=submitQuestion%>"><%=submitQuestionText%></a>
        <br>
        <a href="help">Get Help</a>
    </div>


    <main style="max-width: 800px; margin: 0 auto; padding: 16px;">
        <button class="btn-open centered" onclick="showRandomQuestion()">Begin</button>
        <div class="quiz-container-wrapper">
            <div id="quiz-wrapper" style="display: none;">
                <div id="quiz-container">
                    <form id="quiz-form">
                        <div id="pokemon-info">
                            <h2>Question: <span id="questionNumber"></span></h2>
                            <h3></h3>
                            <img src="" alt="">
                            <p id="typeOne"></p>
                            <p id="typeTwo"></p>
                            <div>
                                <% for (int i = 0; i < 4; i++) { %>
                                <button type="button" onclick="checkAnswer(this.innerHTML)"></button>
                                <% } %>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div id="score-container" style="display: none; width: 50%; vertical-align: top;">
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous">
    </script>
    <script>
        const jsFanQuestions = <%= fanQuestions %>;
        console.log(jsFanQuestions);

        let randomQuestion = Math.floor(Math.random() * jsFanQuestions.length);
        let question = jsFanQuestions[randomQuestion];

        let questionNumber = 1;
        let countCorrect = 0;
        let countWrong = 0;
        let questionNumbers = document.getElementById("questionNumber");
        let questionRight = document.getElementById("countCorrect");
        let questionWrong = document.getElementById("countWrong");

        function updateForm() {
            questionNumbers.textContent = questionNumber;
            questionRight.textContent = countCorrect;
            questionWrong.textContent = countWrong;
            let quizForm = document.getElementById("pokemon-info");
            let quizQuestion = quizForm.querySelector("#pokemon-info h3");
            quizQuestion.textContent = jsFanQuestions[randomQuestion].question;


            let buttons = quizForm.getElementsByTagName("button");

            buttons[0].innerHTML = question.option1;
            buttons[1].innerHTML = question.option2;
            buttons[2].innerHTML = question.option3;
            if (question.option4 === "") {
                buttons[3].style.display = "none";
            } else {
                buttons[3].innerHTML = question.option4;
                buttons[3].style.display = "inline-block";
            }
        }

        function showRandomQuestion() {
            let pokemonInfo = document.getElementById("pokemon-info");
            let scoreContainer = document.getElementById("score-container");
            let quizContainer = document.getElementById("quiz-wrapper");
            let quizForm = document.getElementById("quiz-form");
            if (pokemonInfo && scoreContainer) {
                //pokemonInfo.style.display = "inline-block";
                quizContainer.style.display = "inline-block";
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
        function checkAnswer(selectedOption){
            if(selectedOption === question.answer){
                alert("Correct!");
                countCorrect++;
                questionNumber++;
                randomQuestion = Math.floor(Math.random() * jsFanQuestions.length);
                question = jsFanQuestions[randomQuestion];
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
