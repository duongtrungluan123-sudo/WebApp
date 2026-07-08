
import org.mindrot.jbcrypt.BCrypt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.DriverManager;

public class addAccount{
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        try{

            Class.forName("com.mysql.cj.jdbc.Driver");
    
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost/school?useUnicode=true&characterEncoding=UTF-8",
                    "root",
                    "123");
    
            String name = "admin";
            String password = "123456";
    
            String hash = BCrypt.hashpw(password, BCrypt.gensalt());
    
            String sql = "INSERT INTO user(username, password) VALUES(?, ?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, hash);
    
            pst.executeUpdate();
    
            System.out.println("Thêm tài khoản thành công!");
    
            pst.close();
            con.close();
        } catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }

    }
}