package FanQuestionDAO_CSV;

import FanSubmittedDAO_MySQL.*;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet(name = "MakeYourOwnQuestionServlet", value = "/makeYourOwnQuestion")
public class MakeYourOwnQuestionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.getRequestDispatcher(("WEB-INF/MakeYourOwnQuestions.jsp")).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String email = request.getParameter("email");

        question = question.replaceAll("[\"',]", "");
        answer = answer.replaceAll("[\"',]", "");
        option1 = option1.replaceAll("[\"',]", "");
        option2 = option2.replaceAll("[\"',]", "");
        option3 = option3.replaceAll("[\"',]", "");

        if(option3 == null || option3 == "")
        {
            option3 = "";
        }

        List<String> shuffleOptions = new ArrayList<>();
        shuffleOptions.add(answer);
        shuffleOptions.add(option1);
        shuffleOptions.add(option2);
        shuffleOptions.add(option3);
        FanQuestionDAO_CSV dao = new FanQuestionDAO_CSV();
        Random rand = new Random();
        List<Integer> randomNumbers = new ArrayList<>();
        List<String> shuffledAnswers = new ArrayList<>();
        while(randomNumbers.size() < 4){
            int num = rand.nextInt(4);
            if(!randomNumbers.contains(num)){
                randomNumbers.add((num));
            }
        }
        for(int i = 0; i < shuffleOptions.size(); i++){
            shuffledAnswers.add(shuffleOptions.get(randomNumbers.get(i)));
        }

        // Construct the data to be written to the CSV file
        String[] rowData = {question, shuffledAnswers.get(0), shuffledAnswers.get(1), shuffledAnswers.get(2), shuffledAnswers.get(3), answer, email};


        // Write the data to the CSV file
        try {
            dao.appendToCSV(getServletContext(), "/WEB-INF/PokemonCSV/fanQuestions.csv", rowData);

        } catch (IOException e) {
            e.printStackTrace();
            throw new ServletException("Error writing data to CSV file", e);
        }

        FanQuestions fanquestion = new FanQuestions();
        fanquestion.setEmail(email);
        fanquestion.setFanQuestion(answer);
        fanquestion.setFanAnswer(answer);
        fanquestion.setWrongAnswer1(option1);
        fanquestion.setWrongAnswer2(option2);
        fanquestion.setWrongAnswer3(option3);
        fanquestion.setQuestionStatus(false);
        // Write to the database
        try{
            FanSubmittedDAO_MySQL _fanQuestionMySQL = new FanSubmittedDAO_MySQL();
            _fanQuestionMySQL.addFanQuestion(fanquestion);
        }catch (Exception up){
            throw new IllegalArgumentException("error saving question", up);
        }

        List<FanQuestion> fanQuestions = FanQuestionDAO_CSV.getAllFanQuestion(request, response);


        if(fanQuestions == null){
            fanQuestions = FanQuestionDAO_CSV.getAllFanQuestion(request, response);
        }


        Gson gson = new Gson();
        String pokemonListJson = gson.toJson(fanQuestions);

        request.setAttribute("fanQuestions", pokemonListJson);
        request.getRequestDispatcher("WEB-INF/questionSubmitted.jsp").forward(request, response);
    }
}
