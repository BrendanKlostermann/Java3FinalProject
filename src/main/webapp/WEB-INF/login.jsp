<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean loginFailed = (Boolean)request.getAttribute("loginFailed");

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
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="test.css">
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

    </style>

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
<main class="form-signin w-100 mx-auto text-center">

    <form method="POST" action="login">
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

        <div class="form-floating">
            <input type="text" class="form-control" name="email" id="floatingInput" placeholder="name@example.com">
            <label for="floatingInput">Email address</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>

        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>

        <% if(loginFailed) { %>
        <div class="alert alert-warning" role="alert">
            That email and password combination could not be found
        </div>
        <% } %>
    </form>
    <br>
    <a href="register">Register An Account</a>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>