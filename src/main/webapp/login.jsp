<!DOCTYPE html>
<html lang="vi">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- Google Sign-In -->
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <meta name="google-signin-client_id" content="160944412642-19q2brhebfkldu328eu3kji6il30vk0k.apps.googleusercontent.com">

    <!-- Facebook SDK -->
    <script>
        window.fbAsyncInit = function() {
            FB.init({
                appId      : '1913420479156589',
                cookie     : true,
                xfbml      : true,
                version    : 'v12.0'
            });
        };

        // Load Facebook SDK
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        // Handle Facebook login
        function handleFacebookLogin() {
            FB.getLoginStatus(function(response) {
                if (response.status === 'connected') {
                    statusChangeCallback(response);
                } else {
                    FB.login(function(response) {
                        if (response.authResponse) {
                            statusChangeCallback(response);
                        } else {
                            alert("Đăng nhập thất bại hoặc người dùng từ chối quyền truy cập.");
                        }
                    }, {scope: 'email'});
                }
            });
        }

        // Handle status change
        function statusChangeCallback(response) {
            if (response.status === 'connected') {
                FB.api('/me', {fields: 'name, email'}, function(userInfo) {
                    // Send user data to server
                    fetch('loginWithFacebook', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(userInfo)
                    }).then(res => res.json())
                        .then(data => {
                            if (data.success) {
                                window.location.href = "welcome"; // Redirect on successful login
                            } else {
                                alert("Đăng nhập thất bại");
                            }
                        });
                });
            } else {
                alert("Bạn chưa đăng nhập Facebook!");
            }
        }
    </script>

    <style>
        .login-form-container {
            max-width: 500px;
            margin: auto;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background: gainsboro;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fff;
            width: 60%;
            margin: auto;
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-form label {
            margin-bottom: 5px;
        }

        .login-form input {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            width: 95%;
        }

        .btn {
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #ccc;
            width: 100%;
        }

        .submit-btn {
            background-color: red;
            color: white;
            border: none;
            margin-bottom: 10px;
        }

        .submit-btn:hover {
            background-color: darkred;
        }

        .btn-facebook {
            background-color: white;
            color: black;
            margin: 5px 0;
        }

        .btn-facebook i {
            margin-right: 8px;
            color: #3b5998;
        }

        .social-login {
            text-align: center;
            margin: 20px 0;
        }

        .link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="login-form-container">
    <div class="login-form">
        <h2>Đăng nhập để tiếp tục</h2>
        <form action="login" method="post">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit" class="btn submit-btn">Đăng nhập</button>
        </form>

        <!-- Thông báo lỗi nếu có -->
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
        <p class="error-message" style="color: red;"><%= errorMessage %></p>
        <%
            }
        %>

        <div class="social-login">
            <p>Hoặc đăng nhập bằng:</p>
            <button class="btn btn-facebook" onclick="handleFacebookLogin()">
                <i class="fab fa-facebook-f"></i> Facebook
            </button>
            <div id="g_id_onload"
                 data-client_id="160944412642-19q2brhebfkldu328eu3kji6il30vk0k.apps.googleusercontent.com"
                 data-login_uri="http://localhost:8080/untitled4/loginWithGoogle"
                 data-auto_select="true">
            </div>
            <div class="g_id_signin" data-type="standard"></div>
        </div>

        <div class="link">
            <p>Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a> | <a href="forgot-password.jsp">Quên mật khẩu?</a></p>
        </div>
    </div>
</div>

</body>
</html>
