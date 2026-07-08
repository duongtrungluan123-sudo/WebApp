package servlet;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import database.UserDatabase;

@WebServlet("/login")

public class LoginServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            UserDatabase db = new UserDatabase(DriverManager.getConnection("jdbc:mysql://localhost/school?useUnicode=true&characterEncoding=UTF-8","root","123"));

            User newuser = db.logUser(name, password);

            if (newuser != null) {
                session.setAttribute("logUser", newuser);
                String url = "https://silver-happiness-69x75ppw4xr4277-8080.app.github.dev/showStudent.jsp";
                response.sendRedirect(url);
            } else {
                request.setAttribute("error","Đăng nhập thất bại. Vui lòng kiểm tra lại tên đăng nhập hoặc mật khẩu.");
                request.getRequestDispatcher(request.getContextPath() + "/index.jsp").forward(request,response);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new ServletException("Không tìm thấy MySQL Driver.", e);
        }
    }

}