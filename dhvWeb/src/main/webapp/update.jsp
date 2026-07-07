<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <link href = "style.css" rel="stylesheet">
        <title>Update</title>
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