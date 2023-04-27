package HelpDAO_MySQL;

import LogIn.User;
import UserDAO.DAO_MySQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HelpDAO_MySQL implements DAO_MySQL<User> {

    public List<Help> getAllHelp(){
        List<Help> helpQuestions = new ArrayList<Help>();
        try(Connection connection = getConnection()){
            if(connection.isValid(2)){
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM helpquestions");
                ResultSet resultSet = statement.executeQuery();
                if(resultSet.next()){
                    Help help = new Help();
                    help.setId(resultSet.getInt(1));
                    help.setQuestion(resultSet.getString(2));
                    help.setEmail(resultSet.getString(3));
                    help.setStatus(resultSet.getString(4));
                    helpQuestions.add(help);
                }
            }
        }catch(SQLException ex){
            System.out.println("Database error - could not get questions");
            System.out.println(ex.getMessage());
        }

        return helpQuestions;
    };

    public Help getHelpByID(int id){
        Help help = null;

        try(Connection connection = getConnection()){
            if(connection.isValid(2)){
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM helpquestions");
                ResultSet resultSet = statement.executeQuery();
                if(resultSet.next()){
                    help = new Help();
                    help.setId(resultSet.getInt(1));
                    help.setQuestion(resultSet.getString(2));
                    help.setEmail(resultSet.getString(3));
                    help.setStatus(resultSet.getString(4));
                }
            }
        }catch(SQLException ex){
            System.out.println("Database error - could not get questions");
            System.out.println(ex.getMessage());
        }
        return help;
    }

    public int addHelp(Help question){
        int count = 0;

        return count;
    }
}
