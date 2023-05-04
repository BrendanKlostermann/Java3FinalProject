<%@ page import="java.util.HashMap" %>
<%@ page import="HelpDAO_MySQL.Help" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<Help> questions = (List<Help>)request.getAttribute("questions");
  if(questions == null | questions.size() == 0){
    questions = new ArrayList<>();
  }
  String updateError = (String)request.getAttribute("updateError");
  if(updateError == null){
    updateError = "";
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
    <title>User Issues</title>
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
</header>

<div class=container>
  <div class="row">
    <div class="col-md-3">
    </div>
    <div class="col-md-9">
      <p class="alert-danger"><%=updateError%></p>
      <h2> Current Client Issues </h2>
      <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
          <th>ID</th>
          <th>Question</th>
          <th>Email</th>
          <th>Status</th>
        </tr>
        </thead>
        <tbody>

        <%for (Help item : questions){ %>
        <tr>
          <td><%=item.getId()%></td>
          <td><%=item.getQuestion()%></td>
          <td><%=item.getEmail()%></td>
          <td><%=item.getStatus()%></td>
          <td>
            <form action="viewhelp" method="post">
              <input type="hidden" name="helpID" value="<%= item.getId() %>">
              <button type="submit" name="helpStatus" value="In Progress" class="btn btn-primary">In Progress</button>
              <button type="submit" name="helpStatus" value="Complete" class="btn btn-success">Complete</button>
            </form>
            </td>
          </form>
        </tr>
        <br>
        <% } %>
        </tbody>
      </table>
    </div>
  </div>
</div>


</body>
</html>