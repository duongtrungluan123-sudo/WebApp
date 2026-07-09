<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Account</title>
        <meta charset="UTF-8">
        
    </head>
    <body>
        <div class = "container">
            <form method="post" action = "login">
                <h1>Login Account</h1>
                    <% String error = (String) request.getAttribute("error");
                        if(error != null){ %>
                        <p style="color:red"><%= error%> </p> 
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