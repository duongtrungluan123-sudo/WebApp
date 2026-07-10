<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Account</title>
        <meta charset="UTF-8">
        <style>
            /* Reset định dạng mặc định */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            /* Căn giữa màn hình và tạo màu nền chuyển sắc */
            body {
                background: linear-gradient(135deg, #4facfe, #00f2fe);
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            /* Khung bọc Form cố định độ rộng */
            .container {
                width: 100%;
                max-width: 400px;
            }

            /* Định dạng Form Login trắng, nổi bật */
            form {
                background: #ffffff;
                padding: 40px 35px;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
                width: 100%;
            }

            /* Tiêu đề Login Account */
            h1 {
                text-align: center;
                margin-bottom: 25px;
                color: #333333;
                font-size: 28px;
                font-weight: 700;
            }

            /* Định dạng thông báo lỗi đăng nhập nhập thất bại */
            .error-msg {
                background-color: #fff0f0;
                color: #e74c3c;
                padding: 10px 12px;
                border-left: 4px solid #e74c3c;
                border-radius: 4px;
                font-size: 14px;
                margin-bottom: 20px;
                font-weight: 500;
                text-align: left;
            }

            /* Khoảng cách giữa các ô nhập liệu */
            .form-group {
                margin-bottom: 20px;
            }

            /* Chữ Username / Password phía trên ô nhập */
            .form-group label {
                display: block;
                margin-bottom: 8px;
                color: #555555;
                font-size: 14px;
                font-weight: 600;
            }

            /* Ô input nhập liệu */
            .form-group input {
                width: 100%;
                padding: 12px 14px;
                border: 1px solid #dcdcdc;
                border-radius: 6px;
                font-size: 15px;
                color: #333;
                outline: none;
                transition: all 0.3s ease;
            }

            /* Hiệu ứng khi click chuột vào ô nhập liệu */
            .form-group input:focus {
                border-color: #4facfe;
                box-shadow: 0 0 8px rgba(79, 172, 254, 0.4);
            }

            /* Khung chứa nút bấm */
            .button_holder {
                margin-top: 25px;
            }

            /* Nút Submit Login */
            .button_holder input[type="submit"] {
                width: 100%;
                padding: 13px;
                border: none;
                border-radius: 6px;
                background: linear-gradient(to right, #4facfe, #00c6ff);
                color: white;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 4px 12px rgba(79, 172, 254, 0.3);
            }

            /* Hiệu ứng hover đổi màu khi rê chuột vào nút */
            .button_holder input[type="submit"]:hover {
                background: linear-gradient(to right, #2196f3, #4facfe);
                box-shadow: 0 6px 15px rgba(33, 150, 243, 0.4);
                transform: translateY(-1px);
            }

        </style>
    </head>
    <body>
        <div class = "container">
            <form method="post" action = "login">
                <h1>Login Account</h1>
                    <% 
                        String error = (String) request.getAttribute("error");
                        if(error != null){ 
                    %>
                        <div class="error-msg"><%= error %></div> 
                    <%
                        }
                    %>
                    <div class = "form-group">
                        
                        <label for = "username">Username</label>
                        <input type = "text" name = "name" placeholder = "Enter Username" required>
                    </div>

                    <div class = "form-group">
                        <label for = "password">Password</label>
                        <input type = "password" name = "password" placeholder = "Enter Password" required>                    
                    </div>

                    <div class = "button_holder">
                        <input type = "submit"  value = "Login" >
                    </div>
                </form>
        </div>
    </body>
</html>