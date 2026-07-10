<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Management</title>
        <meta charset="UTF-8">
        <style>
            :root {
                --bg-body: #f8fafc;
                --bg-card: #ffffff;
                --text-main: #1e293b;
                --text-muted: #64748b;
                --primary: #3b82f6;
                --primary-hover: #2563eb;
                --warning: #f59e0b;
                --warning-hover: #d97706;
                --danger: #ef4444;
                --danger-hover: #dc2626;
                --border-color: #e2e8f0;
                --radius: 10px;
                --shadow: 0 4px 6px -1px rgb(0 0 0 / 0.05), 0 2px 4px -2px rgb(0 0 0 / 0.05);
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Inter', system-ui, -apple-system, sans-serif;
            }

            body {
                background-color: var(--bg-body);
                color: var(--text-main);
                padding: 40px 20px;
                min-height: 100vh;
            }

            /* ==========================================================================
            2. LAYOUT CONTROL (Hệ thống chia cột)
            ========================================================================== */
            .main-container {
                display: flex;
                gap: 32px;
                max-width: 1300px;
                margin: 0 auto;
                align-items: flex-start;
            }

            .left-column {
                flex: 1;
                min-width: 360px;
                position: sticky;
                top: 40px; /* Cuộn trang form vẫn đứng im cố định bên trái */
            }

            .right-column {
                flex: 2;
                display: flex;
                flex-direction: column;
                gap: 32px;
                min-width: 550px;
            }

            /* Typography */
            h1 {
                font-size: 24px;
                font-weight: 700;
                color: #0f172a;
                margin-bottom: 20px;
                letter-spacing: -0.5px;
            }

            /* ==========================================================================
            3. COMPONENTS (Form nhập liệu)
            ========================================================================== */
            form {
                background: var(--bg-card);
                padding: 30px;
                border-radius: var(--radius);
                box-shadow: var(--shadow);
                border: 1px solid var(--border-color);
            }

            .info {
                display: flex;
                flex-direction: column;
                margin-bottom: 18px;
            }

            .info .form-label {
                font-size: 14px;
                font-weight: 600;
                color: var(--text-main);
                margin-bottom: 8px;
            }

            .info input.form-control {
                height: 42px;
                padding: 10px 14px;
                border: 1px solid var(--border-color);
                border-radius: 6px;
                font-size: 14px;
                color: var(--text-main);
                background-color: #f8fafc;
                outline: none;
                transition: all 0.2s ease;
            }

            /* Hiệu ứng focus phát sáng nhẹ của ô nhập */
            .info input.form-control:focus {
                background-color: #fff;
                border-color: var(--primary);
                box-shadow: 0 0 0 4px rgb(59 130 246 / 0.15);
            }

            /* Button Group */
            .button_holder {
                display: flex;
                gap: 12px;
                margin-top: 24px;
            }

            .btn {
                flex: 1;
                height: 44px;
                font-size: 14px;
                font-weight: 600;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                transition: all 0.2s ease;
            }

            .btn-info {
                background-color: var(--primary);
                color: white;
            }

            .btn-info:hover {
                background-color: var(--primary-hover);
                transform: translateY(-1px);
            }

            .btn-warning {
                background-color: #f1f5f9;
                color: #475569;
                border: 1px solid var(--border-color);
            }

            .btn-warning:hover {
                background-color: #e2e8f0;
                color: #1e293b;
            }

            /* ==========================================================================
            4. DATA TABLES (Bảng danh sách & Thông tin)
            ========================================================================== */
            .table-box {
                background: var(--bg-card);
                padding: 24px;
                border-radius: var(--radius);
                box-shadow: var(--shadow);
                border: 1px solid var(--border-color);
            }

            .table-box h2 {
                font-size: 18px;
                font-weight: 700;
                color: #0f172a;
                margin-bottom: 20px;
            }

            .table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
            }

            .table th, 
            .table td {
                padding: 14px 16px;
                font-size: 14px;
                text-align: left;
                border-bottom: 1px solid var(--border-color);
            }

            .table th {
                background-color: #f8fafc;
                color: var(--text-muted);
                font-weight: 600;
                text-transform: uppercase;
                font-size: 12px;
                letter-spacing: 0.5px;
            }

            /* Bo tròn góc cho bảng trông mượt mà */
            .table tr:last-child td {
                border-bottom: none;
            }

            .table td.data {
                color: #334155;
            }

            /* Biến liên kết Hành động (Edit/Delete) thành các badge nút bấm mini */
            .table td a {
                text-decoration: none;
                font-size: 13px;
                font-weight: 600;
                padding: 6px 12px;
                border-radius: 4px;
                display: inline-block;
                margin-right: 6px;
                transition: all 0.2s ease;
            }

            .table td a[href*="update"] {
                background-color: #eff6ff;
                color: var(--primary);
            }

            .table td a[href*="update"]:hover {
                background-color: var(--primary);
                color: white;
            }

            .table td a[href*="delete"] {
                background-color: #fef2f2;
                color: var(--danger);
            }

            .table td a[href*="delete"]:hover {
                background-color: var(--danger);
                color: white;
            }

            /* Định dạng riêng cho bảng tài khoản hệ thống */
            .account-table {
                background-color: #fafafa;
                border-radius: 6px;
                overflow: hidden;
            }

            .account-table td {
                word-break: break-all; /* Ngăn mã hash password làm vỡ layout bảng */
                font-family: 'Courier New', Courier, monospace; /* Mã hóa mật khẩu nhìn như mã code */
            }

            /* Responsive khi co màn hình nhỏ */
            @media (max-width: 992px) {
                .main-container {
                    flex-direction: column;
                }
                .left-column, .right-column {
                    width: 100%;
                    min-width: 100%;
                }
                .left-column {
                    position: static;
                }
}
        </style>
    </head>
<%

    request.setCharacterEncoding("UTF-8");
    if(request.getParameter("submit")!=null)
    {

        String name = request.getParameter("sname");

        System.out.println(name);
        String course = request.getParameter("course");
        int fee = Integer.parseInt(request.getParameter("fee"));
        java.sql.Connection con = null;
        java.sql.PreparedStatement pst = null;

        Class.forName("com.mysql.cj.jdbc.Driver");
        con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/school?useUnicode=true&characterEncoding=UTF-8","root","123");
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

<%java.sql.Connection con = null;
    java.sql.PreparedStatement pst = null;
    java.sql.ResultSet rs, rsUser;
    Class.forName("com.mysql.cj.jdbc.Driver");
    String username = "";
    String password = "";
    String rawPassword = "";
    con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/school?useUnicode=true&characterEncoding=UTF-8","root","123");
    
    String query = "SELECT * from records";
    String queryUser = "SELECT * from user";
    java.sql.Statement st = con.createStatement();
    java.sql.Statement st2 = con.createStatement();
    rs = st.executeQuery(query);
    rsUser = st2.executeQuery(queryUser);
    if (rsUser.next()) {
            username = rsUser.getString("username");
            password = rsUser.getString("password");
            rawPassword = rsUser.getString("rawPassword");
    }

%>
    
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
        <%
                
                
                while(rs.next()){
                    String id = rs.getString("id");
        %>
                <tr>
                    <th class = "data"><%=rs.getString("stname")%></th>
                    <th class = "data"><%=rs.getString("course")%></th>
                    <th class = "data"><%=rs.getString("fee")%></th>
                    <th class = "data"><a href = "update.jsp?id=<%=id%>"> Edit </a></th>
                    <th class = "data"><a href = "delete.jsp?id=<%=id%>"> Delete </a></th>
                </tr>
        <%
                }
        %>
                </thead>
            </table>
        </div>
    </div>
    <body>
        <h1>Student Register Form</h1>
        <div class = "row">
            <div class = "col-sm-4">
                <form method="post" action = "#">
                    <%
                        String defaultName = "";
                        if(request.getParameter("reset") != null){
                            defaultName = "";
                        }
                    %>
                    <div align = "left" class = "info">
                        <label class = "form-label">Student name</label>
                        <input type = "text" class = "form-control" placeholder = "Student name" value= "<%= defaultName %>" name="sname" id = "sname" required>
                    </div>

                    <div align = "left" class = "info">
                        <label class = "form-label">Course</label>
                        <input type = "text" class = "form-control" placeholder = "Course" value = "<%= defaultName %>" name="course" id = "course" required>                    
                    </div>

                    <div align = "left" class = "info">
                        <label class = "form-label">Fee</label>
                        <input type = "number" class = "form-control" placeholder = "Fee" value = "<%= defaultName %>" name="fee" id = "fee" required>                    
                    </div>

                    <div class = "button_holder">
                        <input type = "submit" id = "submit" value = "submit" name = "submit" class = "btn btn-info">
                        <input type = "reset" id = "reset" value="reset" name = "reset" class = "btn btn-warning">
                    </div>
                </form>
            </div>
        </div>
        <div>
            <table id = "tbl" class ="table table-responsive table-bordered" cellpadding = "0" >
                <thead>
                    <tr>
                        <th style = "width:200px">User</th>
                        <th style = "width:250px">Password</th>
                        <th style = "width:250px">Raw Password</th>
                    </tr>
                    <tr>
                        <th class = "data"><%=username%></th>
                        <th class = "data"><%=password%></th>
                        <th class = "data"><%=rawPassword%></th>
                    </tr>
                </thead>
            </table>
        </div>
    </body>
</html>