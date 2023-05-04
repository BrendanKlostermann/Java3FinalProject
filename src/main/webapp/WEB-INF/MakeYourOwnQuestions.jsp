<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
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

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Make Your Own Questions</title>
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
        <main style="max-width: 800px; margin: 0 auto; padding: 16px;">
            <h1>Submit Your Own Question</h1>
            <form method="post" action="makeYourOwnQuestion" style="display: flex; flex-direction: column;">
                <br>
                <p>Please provide a question...</p>
                <label for="question">Question: (REQUIRED)</label>
                <input type="text" id="question" name="question" required>
                <br>
                <br>
                <p>Every question needs an answer...</p>
                <label for="answer">Answer: (REQUIRED)</label>
                <input type="text" id="answer" name="answer" required>
                <br>
                <br>
                <p>You need a few wrong answers...</p>
                <label for="option1">Option 1: (REQUIRED)</label>
                <input type="text" id="option1" name="option1" required>

                <label for="option2">Option 2: (REQUIRED)</label>
                <input type="text" id="option2" name="option2" required>

                <label for="option3">Option 3:</label>
                <input type="text" id="option3" name="option3">
                <br>
                <br>
                <p>Please provide a valid email to approve your question...</p>
                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" required>

                <button type="submit">Submit</button>
            </form>


        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous">
        </script>
    </body>
</html> 
