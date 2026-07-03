<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("submit")!=null)
    {
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        int fee = Integer.parseInt(request.getParameter("fee"));

        java.sql.Connection con = null;
        java.sql.PreparedStatement pst = null;

        Class.forName("com.mysql.cj.jdbc.Driver");
        con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/school","root","123");
        pst = con.prepareStatement("INSERT INTO records(stname, course, fee) values(?, ?, ?)");
        pst.setString(1,name);
        pst.setString(2,course);
        pst.setInt(3,fee);
        int insertedRow = pst.executeUpdate();
%>
        <script>
            alert("Record Successful!");
        </script>
<%  
    }
%>
<%
        java.sql.Connection con = null;
        java.sql.PreparedStatement pst = null;
        java.sql.ResultSet rs;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/school","root","123");
        String query = "SELECT * from records";
        Statment st = con.createStatement();
        rs = st.executeQuery(query);
        while(rs.next()){
            String id = rs.getString("id");
%>

<%
        }


%>
<html>
    <head>
        <title>JSP Page</title>
        <style>
            .col-sm-4{
                display: flex;
            }

            .info{
                display: flex;
                flex-direction: column;
            }

            h1{
                font-size:50px;
            }

            form{
                width:300px;
                height:200px;
            }
            label{
                font-size:42px;
            }

            input{
                height:30px;
            }

            .button_holder{
                display: flex;
                flex-direction:row;
                margin-top:10px;
                margin-left: 160px;
                gap:5px;
            }

            .btn{
                font-size:15px;
                width:70px;
                height:45px;
                border:none;
                border-radius: 5px;
            }
            
            .btn-info{
                background-color: #99e6ff;
                transition: background-color 0.5s ease;
            }

            .btn-info:hover{
                background-color: lightblue;
            }

            .btn-warning{
                transition: background-color 0.5s ease;
            }

            .btn-warning:hover{
                background-color: gainsboro;
            }

            .col-sm-8{
                display:flex;
                position:absolute;
                margin-top:60px;
                margin-left:400px;
                width:100vh;
            }

            .col-sm-8 th{
                font-size:20px;
            }

            .table{
                border:1px black solid;
                border-bottom: 0px;
                border-collapse: collapse;
            }

            .table th{
                border:1px black solid;
                border-bottom: 0px;
            }
        </style>
    </head>
    <div class = "col-sm-8">
        <div class = "pnale-body">
            <table id = "tbl-student" class ="table table-responsive table-bordered" cellpadding = "0" >
                <thead>
                    <tr>
                        <th style = "width:200px">Student name</th>
                        <th style = "width:250px">Course</th>
                        <th style = "width:200px">Fee</th>                        
                        <th style = "width:50px">Edit</th>
                        <th style = "width:100px">Delete</th>
                    </tr>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <body>
        <h1>Student Register Form</h1>
        <div class = "row">
            <div class = "col-sm-4">
                <form method="post" action = "#">
                    <div align = "left" class = "info">
                        <label class = "form-label">Student name</label>
                        <input type = "text" class = "form-control" placeholder = "Student name" name="sname" id = "sname" required>
                    </div>

                    <div align = "left" class = "info">
                        <label class = "form-label">Course</label>
                        <input type = "text" class = "form-control" placeholder = "Course" name="course" id = "course" required>                    
                    </div>

                    <div align = "left" class = "info">
                        <label class = "form-label">Fee</label>
                        <input type = "text" class = "form-control" placeholder = "Fee" name="fee" id = "fee" required>                    
                    </div>

                    <div class = "button_holder">
                        <input type = "submit" id = "submit" value = "submit" name = "submit" class = "btn btn-info">
                        <input type = "reset" id = "reset" value="reset" class = "btn btn-warning">
                    </div>
                </form>
            </div>
        </div>

    </body>


</html>