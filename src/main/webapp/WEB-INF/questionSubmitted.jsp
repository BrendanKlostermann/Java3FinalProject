<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String fanQuestions = (String) request.getAttribute("fanQuestions");

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
    <title>Submit A Question</title>
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
    <a href="pictureQuiz">Picture Quiz</a>
    <br>
    <a href="typeQuiz">Type Quiz</a>
    <br>
    <a href="fanQuestions">Fan Made Questions</a>
    <br>
    <br>
    <br>
    <a href="<%=log%>"><%=logText%></a>
    <br>
    <a href="<%=submitQuestion%>"><%=submitQuestionText%></a>
    <br>
    <a href="help">Get Help</a>
</div>
<main style="max-width: 800px; margin: 0 auto; padding: 16px;">
    <h1>Thank you!</h1>
    <p>Your question will be reviewed before being added!</p>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script>
    const jsFanQuestions = <%= fanQuestions %>;
    console.log(jsFanQuestions);
</script>
</body>
</html>