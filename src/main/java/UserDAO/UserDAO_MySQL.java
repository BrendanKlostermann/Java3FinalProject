package UserDAO;

import LogIn.User;
import org.mindrot.jbcrypt.BCrypt;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

public class UserDAO_MySQL implements DAO_MySQL<User> {

    public User getUser(String email){
        User user = null;
        try(Connection connection = getConnection()){
            if(connection.isValid(2)){
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE email = ?");
                statement.setString(1, email);
                ResultSet resultSet = statement.executeQuery();
                if(resultSet.next()){
                    user = new User();
                    user.setId(resultSet.getInt(1));
                    user.setFirst_name(resultSet.getString(2));
                    user.setLast_name(resultSet.getString(3));
                    user.setEmail(resultSet.getString(4));
                    user.setPasswordFromDB(resultSet.getString(5));
                    user.setRole(resultSet.getString(6));
                }
            }
        }catch (SQLException e){
            System.out.println("Database error - Get user by email");
            System.out.println(e.getMessage());
        }
        return user;
    }



    public List<User> getAllUsers(){
        List<User> users = new ArrayList<>();
        try(Connection connection = getConnection()){
            if(connection.isValid(2)){
                Statement statement = connection.createStatement();
                ResultSet resultSet= statement.executeQuery("SELECT * FROM users;");
                while(resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String firstName = resultSet.getString("first_name");
                    String lastName = resultSet.getString("last_name");
                    String email = resultSet.getString("email");
                    String status = resultSet.getString("status");
                    String privileges = resultSet.getString("privileges");
                    User user = new User(id, firstName, lastName, email, status, privileges);
                    users.add(user);
                }
            }
        }catch (SQLException e){
            System.out.println("Database error - Get all users");
            System.out.println(e.getMessage());
        }
        return users;
    }


    public int addUser(User user) {
        int numRowsAffected = 0;
        try (Connection connection = getConnection()) {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO users (first_name, last_name, email, password) values (?,?,?,?)");
            statement.setString(1, user.getFirst_name());
            statement.setString(2, user.getLast_name());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword().toString());
            numRowsAffected = statement.executeUpdate();
            statement.close();
        } catch (SQLException e){
            System.out.println("Database error - Add user");
            System.out.println(e.getMessage());
        }
        return numRowsAffected;
    }

    public int getUserId(User user) {
        int userId = 0;
        try (Connection connection = getConnection()) {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE email = ?");
            statement.setString(1, user.getEmail());
//            System.out.println(statement.toString());
            statement.execute();
            ResultSet resultSet = statement.getResultSet();
//            Statement statement = connection.createStatement();
//            String sql = String.format("SELECT * FROM users WHERE email = \"%s\";", user.getEmail());
//            System.out.println(sql);
//            ResultSet resultSet= statement.executeQuery(sql);
            resultSet.next();
            userId = resultSet.getInt("id");
            statement.close();
            resultSet.close();
        } catch (SQLException e){
            System.out.println("Database error - Get user by id");
            System.out.println(e.getMessage());
            System.out.println(e.getSQLState());
            System.out.println(e.getErrorCode());
        }
        return userId;
    }
}
