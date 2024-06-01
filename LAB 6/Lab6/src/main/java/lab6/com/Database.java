package lab6.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import lab6.com.Marathon;

/**
 *
 * @author McBois
 */
public class Database {
    
    private static Connection myConnection = null;
    private static String myURL = myURL = "jdbc:mysql://localhost:3306/csm3023";
    private int result = 0;
    
    public static Connection getConnection() throws ClassNotFoundException{
        if(myConnection != null){
            return myConnection;
        }
        else try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            myConnection = DriverManager.getConnection(myURL, "root", "admin@123");
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return myConnection;
    }
    
    public void closeConnection() throws ClassNotFoundException
    {
        try{
            myConnection.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
}