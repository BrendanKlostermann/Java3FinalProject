<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String fanQuestions = (String) request.getAttribute("fanQuestions");
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Submit A Question</title>
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
            <a href="typeQuiz">Type Quiz</a>
            <a href="fanQuestions">Fan Made Questions</a>
            <br>
            <br>
            <a href="makeYourOwnQuestion">Submit A Question</a>
        </div>

        <h1>Thank you!</h1>
        <p>Your question will be reviewed before being added!</p>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>
        <script>
            const jsFanQuestions = <%= fanQuestions %>;
            console.log(jsFanQuestions);
        </script>
    </body>
</html> 
