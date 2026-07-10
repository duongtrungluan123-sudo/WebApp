<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <link href = "style.css" rel="stylesheet">
        <title>Update</title>
        <style>

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            body {
                background-color: #f4f7f6;
                color: #333;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            /* Tiêu đề chính */
            h1 {
                font-size: 26px;
                color: #2c3e50;
                margin-bottom: 20px;
                font-weight: 600;
                text-align: center;
            }

            /* Cấu trúc Row và Col để bọc thành một chiếc Card giữa màn hình */
            .row {
                width: 100%;
                max-width: 480px;
            }

            .col-sm-4 {
                width: 100%;
            }

            /* Thiết kế Form thành giao diện Card trắng cao cấp */
            form {
                background: #ffffff;
                padding: 35px 30px;
                border-radius: 8px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.06);
                border: 1px solid #e2e8f0;
                width: 100%;
                height: auto;
            }

            /* Định dạng từng vùng nhập liệu */
            .info {
                display: flex;
                flex-direction: column;
                margin-bottom: 18px;
            }

            .info .form-label {
                font-size: 14px;
                font-weight: 600;
                color: #4a5568;
                margin-bottom: 8px;
            }

            /* Ô input nhập liệu */
            .info .form-control {
                height: 42px;
                padding: 10px 14px;
                border: 1px solid #cbd5e1;
                border-radius: 6px;
                font-size: 14px;
                color: #333;
                outline: none;
                transition: all 0.2s ease;
                background-color: #fff;
            }

            /* Hiệu ứng phát sáng nhẹ khi click vào ô nhập liệu */
            .info .form-control:focus {
                border-color: #3498db;
                box-shadow: 0 0 0 4px rgba(52, 152, 219, 0.15);
            }

            /* Khu vực chứa các nút bấm */
            .button_holder {
                display: flex;
                gap: 12px;
                margin-top: 25px;
                margin-bottom: 15px;
            }

            .btn {
                flex: 1;
                height: 42px;
                font-size: 14px;
                font-weight: 600;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.2s ease;
            }

            /* Nút Submit màu xanh dương điều hướng */
            .btn-info {
                background-color: #3498db;
                color: white;
            }

            .btn-info:hover {
                background-color: #2980b9;
                transform: translateY(-1px);
            }

            /* Nút Reset màu xám trung tính nhã nhặn */
            .btn-warning {
                background-color: #f1f5f9;
                color: #475569;
                border: 1px solid #cbd5e1;
            }

            .btn-warning:hover {
                background-color: #e2e8f0;
                color: #1e293b;
            }

            /* Định dạng liên kết "Back home" */
            div[align="right"] {
                margin-top: 15px;
                text-align: center;
                border-top: 1px solid #edf2f7;
                padding-top: 15px;
            }

            div[align="right"] a {
                color: #718096;
                text-decoration: none;
                font-size: 14px;
                transition: color 0.2s ease;
            }

            div[align="right"] a:hover {
                color: #3498db;
                text-decoration: underline;
            }
        </style>
    </head>
<%
    if(request.getParameter("submit")!=null)
    {   
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        int fee = Integer.parseInt(request.getParameter("fee"));

        java.sql.Connection con = null;
        java.sql.PreparedStatement pst = null;

        Class.forName("com.mysql.cj.jdbc.Driver");
        con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/school?useUnicode=true&characterEncoding=UTF-8","root","123");
        pst = con.prepareStatement("update records set stname = ?, course = ?, fee = ? where id = ?");
        pst.setString(1,name);
        pst.setString(2,course);
        pst.setInt(3,fee);
        pst.setInt(4,id);
        pst.executeUpdate();
%>
        <script>
            alert("Update Successful!");
            window.location.href = "showStudent.jsp";
        </script>
<%  
    }
%>
    <body>
        <h1>Student Update Form</h1>
        <br>
        <div class = "row">
            <div class = "col-sm-4">
                <form method = "post" action = "#">
                <%
                    Connection con;
                    PreparedStatement pst;
                    java.sql.ResultSet rs;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/school","root","123");
                    pst = con.prepareStatement("insert into records(stname,course,fee) values(?,?,?)");
                    String id = request.getParameter("id");
                    pst = con.prepareStatement("select * from records where id = ?");
                    pst.setString(1,id);
                    rs = pst.executeQuery();

                    while(rs.next())
                    {
                %>
                        <div align = "left" class = "info">
                            <label class = "form-label">Student name</label>
                            <input type = "text" class = "form-control" placeholder="Student name" value = "<%= rs.getString("stname")%>" name = "sname" id ="sname" required>
                        </div>

                        <div align = "left" class = "info">
                            <label class = "form-label">Course</label>
                            <input type = "text" class = "form-control" placeholder="Course" value = "<%=rs.getString("course") %>" name = "course" id = "course" required> 
                        </div>

                        <div align = "left" class = "info">
                            <label class = "form-label">Fee</label>
                            <input type = "number" class = "form-control" placeholder="Fee" value = "<%=rs.getString("fee") %>"  name = "fee" id = "fee" required>
                        </div>
                    <% 
                    } 
                %>
                    <br>

                    <div class = "button_holder">
                        <input type = "submit" id = "submit" value = "submit" name = "submit" class = "btn btn-info">
                        <input type = "reset" id = "reset" value="reset" name = "reset" class = "btn btn-warning">
                    </div>

                    <div align = "right">
                        <p><a href = "showStudent.jsp">Back home</a></p>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>