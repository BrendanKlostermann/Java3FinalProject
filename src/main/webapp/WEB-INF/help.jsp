<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String questionError = (String)request.getAttribute("questionError");
    String emailError = (String)request.getAttribute("emailError");
    String question = (String)request.getAttribute("question");
    if(questionError == null){
        questionError = "";
    }
    if(emailError == null){
        emailError = "";
    }
    if(question == null){
        question = "";
    }

    String isHidden = "d-none";
    String userRole = (String)request.getAttribute("userRole");
    if(userRole != null){
        if(userRole.equals("Administrator")){
            isHidden = "";
        }
    }

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
    <title>Help</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="test.css">
</head>
<body>

<header>
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
</header>
<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <form action="help" method="post">
                <div class="form-group">
                    <label for="question">Question:</label>
                    <input type="text" class="form-control" id="question" name="question" value="<%=question%>">
                    <p class="text-danger"><%=questionError%></p>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email">
                    <p class="text-danger"><%=emailError%></p>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            <br>
            <form action="viewhelp" method="get">
                <button type="submit" class="btn btn-success <%=isHidden%>">Help Requests</button>
            </form>
        </div>
    </div>

</div>


</body>
</html>