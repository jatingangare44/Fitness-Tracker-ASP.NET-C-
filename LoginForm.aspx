<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Fitness_Tracker.LoginForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background-image: url('FitnessWalpaper.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            max-width: 500px;
            width: 90%;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease;
        }

        .form-input:focus {
            border-color: #007bff;
            box-shadow: none;
            outline: none;
        }

        .login-button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: #fff;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-button:hover {
            background-color: #0056b3;
        }

        .sign-up {
            display: block;
            margin-top: 10px;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
        }

        .sign-up:hover {
            text-decoration: underline;
        }

        .text-danger {
            color: #e3342f !important;
            font-size: 0.875rem;
        }

        .logo {
            display: block;
            margin: 0 auto 20px;
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Log In</h2>
            <div class="login-box">
                <asp:Image ID="LogoImage" runat="server" ImageUrl="loginpage.png" CssClass="logo" />

                <asp:Label ID="Label1" runat="server" AssociatedControlID="uname" CssClass="form-label" Text="Username"></asp:Label>
                <asp:TextBox ID="uname" runat="server" CssClass="form-input" placeholder="Enter your username or email"></asp:TextBox>

                <asp:Label ID="Label2" runat="server" AssociatedControlID="passw" CssClass="form-label" Text="Password"></asp:Label>
                <asp:TextBox ID="passw" runat="server" CssClass="form-input" TextMode="Password" placeholder="Enter your password"></asp:TextBox>

                <asp:Button ID="Button1" runat="server" CssClass="login-button" OnClick="Button1_Click" Text="Login" />

                <asp:HyperLink ID="SignUpLink" runat="server" NavigateUrl="SignupForm.aspx" CssClass="sign-up">Create an Account</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
