import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class userDatabase{
    Connection con;

    public userDatabase(Connection con){
        this.con = con;
    }

    public User logUser(String name, String password){
        User usr = null;
        try{
            String query = "select * from user where name = ? and password = ?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, password);
        } catch(SQLException e){

        }
    }
}