package database;

import org.mindrot.jbcrypt.BCrypt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class UserDatabase{
    Connection con;

    public UserDatabase(Connection con){
        this.con = con;
    }


    public User logUser(String name, String password){
        User usr = null;
        try{
            String query = "select * from user where username = ?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();

            if(rs.next()){
                String hash = rs.getString("password");
                //check mật khẩu băm
                if (BCrypt.checkpw(password, hash)) {
                    usr = new User();
                    usr.setName(rs.getString("username"));
                }

            }
        } catch(SQLException e){

        }
        return usr;
    }
}