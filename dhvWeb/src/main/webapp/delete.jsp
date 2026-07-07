<%@page contentType = "text/html" pageEncoding = "UTF-8"%>
<%@page import="java.sql.*"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con;
    PreparedStatement pst;
    Class.forName("com.mysql.cj.jdbc.Driver");
        con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/school?useUnicode=true&characterEncoding=UTF-8","root","123");
        pst = con.prepareStatement("delete from records where id = ?");
        pst.setInt(1,id);
        pst.executeUpdate();
%>
    <script>
        alert("Delete Successful!");
        window.location.href = "showStudent.jsp";
    </script>