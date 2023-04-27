package UserDAO;


import io.github.cdimascio.dotenv.Dotenv;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public interface DAO_MySQL<T> {
    default Connection getConnection() throws SQLException {
        Dotenv dotenv = Dotenv.load();
        String DB_FULL_DRIVER = dotenv.get("DB_FULL_DRIVER");
        String DB_DRIVER = dotenv.get("DB_DRIVER");
        String DB_SERVER_NAME = dotenv.get("DB_SERVER_NAME");
        String DB_HOST = dotenv.get("DB_HOST");
        String DB_PORT = dotenv.get("DB_PORT");
        String DB_SCHEMA = dotenv.get("DB_SCHEMA");
        String DB_PROPERTIES = dotenv.get("DB_PROPERTIES");
        String DB_USER = dotenv.get("DB_USER");
        String DB_PASSWORD = dotenv.get("DB_PASSWORD");
        try {
            Class.forName(DB_FULL_DRIVER);
        } catch(ClassNotFoundException e) {
            // what to do if the driver is not found
        }
        String url = String.format("jdbc:%s://%s.%s:%s/%s?%s",
                DB_DRIVER, DB_SERVER_NAME, DB_HOST, DB_PORT, DB_SCHEMA, DB_PROPERTIES);
        Connection myDbConn = DriverManager.getConnection(url, DB_USER, DB_PASSWORD);
        return myDbConn;
    }
}
