package FanSubmittedDAO_MySQL;

import LogIn.User;
import UserDAO.DAO_MySQL;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FanSubmittedDAO_MySQL implements DAO_MySQL<User> {

    public List<FanQuestions> getAllQuestions(){
        List<FanQuestions> fanQuestions = new ArrayList<FanQuestions>();
        try(Connection connection = getConnection()){
            if(connection.isValid(2)){
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM submittedfanquestion");
                ResultSet resultSet = statement.executeQuery();
                while(resultSet.next()){
                    FanQuestions question = new FanQuestions();
                    question.setMemberId(resultSet.getInt(1));
                    question.setFanQuestion(resultSet.getString(2));
                    question.setWrongAnswer1(resultSet.getString(3));
                    question.setWrongAnswer2(resultSet.getString(4));
                    question.setWrongAnswer3(resultSet.getString(5));
                    question.setQuestionStatus(resultSet.getBoolean(6));
                    fanQuestions.add(question);
                }
            }
        }catch(SQLException ex){
            System.out.println("Database error - could not get questions");
            System.out.println(ex.getMessage());
        }
        return fanQuestions;
    };

    public FanQuestions getFanQuestion(int id){
        FanQuestions question = null;

        try(Connection connection = getConnection()){
            if(connection.isValid(2)){
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM submittedfanquestion WHERE id = question_id");
                ResultSet resultSet = statement.executeQuery();
                if(resultSet.next()){
                    question = new FanQuestions();
                    question.setMemberId(resultSet.getInt(1));
                    question.setFanQuestion(resultSet.getString(2));
                    question.setWrongAnswer1(resultSet.getString(3));
                    question.setWrongAnswer2(resultSet.getString(4));
                    question.setWrongAnswer3(resultSet.getString(5));
                    question.setQuestionStatus(resultSet.getBoolean(6));
                }
            }
        }catch(SQLException ex){
            System.out.println("Database error - could not get questions");
            System.out.println(ex.getMessage());
        }
        return question;
    }

    public int addFanQuestion(FanQuestions question){
        int count = 0;
        try (Connection connection = getConnection()) {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO submittedfanquestion (id, question, answer, wrong_answer1, wrong_answer2, wrong_answer3) values (?,?,?,?,?,?)");
            statement.setInt(1, question.getMemberId());
            statement.setString(2, question.getFanQuestion());
            statement.setString(3, question.getFanAnswer());
            statement.setString(4, question.getWrongAnswer1());
            statement.setString(5, question.getWrongAnswer2());
            statement.setString(6, question.getWrongAnswer3());

            count = statement.executeUpdate();
            statement.close();
        } catch (SQLException e){
            System.out.println("Database error - FanQuestionSubmitted");
            System.out.println(e.getMessage());
        }
        return count;
    }

    public int updateFanQuestionStatus(int id, boolean status) throws SQLException {
        int count = 0;
        try(Connection connection = getConnection()){
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE submittedfanquestion SET status = ? WHERE id = ?");
            statement.setBoolean(1, status);
            statement.setInt(2, id);
            count = statement.executeUpdate();

        }catch (SQLException e){
            System.out.println("Database error - Update Help");
            System.out.println(e.getMessage());
        }
        System.out.println(count);
        return count;
    }
}
