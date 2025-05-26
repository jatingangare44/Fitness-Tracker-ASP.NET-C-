<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignupForm.aspx.cs" Inherits="Fitness_Tracker.SignupForm" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style>
        
        body {
            background-image: url('deadpool.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
        }

        .signup-container {
            max-width: 500px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        
        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: none;
        }

        
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #4e555b;
        }

        
        .text-danger {
            color: #e3342f !important;
            font-size: 0.875rem;
        }

        
        .form-check-label {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="signup-container">
            <h2>Create an Account</h2>
            
            <div class="row">
                
                <div class="col-md-6 form-group">
                    <asp:Label ID="lblName" runat="server" Text="Full Name" AssociatedControlID="txtName" CssClass="font-weight-bold"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Full Name is required" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName" ErrorMessage="Name should not contain numbers or symbols" ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-danger" Display="Dynamic" />
                </div>

                
                <div class="col-md-6 form-group">
                    <asp:Label ID="lblUsername" runat="server" Text="Username" AssociatedControlID="txtUsername" CssClass="font-weight-bold"></asp:Label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username should only contain letters and numbers" ValidationExpression="^[a-zA-Z0-9]+$" CssClass="text-danger" Display="Dynamic" />
                </div>
            </div>

            <div class="row">
                
                <div class="col-md-6 form-group">
                    <asp:Label ID="lblAge" runat="server" Text="Age" AssociatedControlID="txtAge" CssClass="font-weight-bold"></asp:Label>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Enter your age"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge" ErrorMessage="Age is required" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revAge" runat="server" ControlToValidate="txtAge" ErrorMessage="Age should be a whole number" ValidationExpression="^\d+$" CssClass="text-danger" Display="Dynamic" />
                </div>

                
                <div class="col-md-6 form-group">
                    <asp:Label ID="lblGender" runat="server" Text="Gender" AssociatedControlID="ddlGender" CssClass="font-weight-bold"></asp:Label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select Gender" Value="" />
                        <asp:ListItem Text="Male" Value="Male" />
                        <asp:ListItem Text="Female" Value="Female" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" InitialValue="" ErrorMessage="Please select a gender" CssClass="text-danger" Display="Dynamic" />
                </div>
            </div>

            <div class="row">
              
                <div class="col-md-6 form-group">
                    <asp:Label ID="lblWeight" runat="server" Text="Weight (kg)" AssociatedControlID="txtWeight" CssClass="font-weight-bold"></asp:Label>
                    <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control" placeholder="Enter your weight in kg"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvWeight" runat="server" ControlToValidate="txtWeight" ErrorMessage="Weight is required" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revWeight" runat="server" ControlToValidate="txtWeight" ErrorMessage="Weight should be a numeric value" ValidationExpression="^\d+(\.\d+)?$" CssClass="text-danger" Display="Dynamic" />
                </div>

                
                <div class="col-md-6 form-group">
                    <asp:Label ID="lblHeight" runat="server" Text="Height (cm)" AssociatedControlID="txtHeight" CssClass="font-weight-bold"></asp:Label>
                    <asp:TextBox ID="txtHeight" runat="server" CssClass="form-control" placeholder="Enter your height in cm"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHeight" runat="server" ControlToValidate="txtHeight" ErrorMessage="Height is required" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revHeight" runat="server" ControlToValidate="txtHeight" ErrorMessage="Height should be a numeric value" ValidationExpression="^\d+(\.\d+)?$" CssClass="text-danger" Display="Dynamic" />
                </div>
            </div>

            <div class="row">
                
                <div class="col-md-6 form-group">
                    <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword" CssClass="font-weight-bold"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password must be at least 8 characters long" ValidationExpression="^.{8,}$" CssClass="text-danger" Display="Dynamic" />
                </div>

                
                <div class="col-md-6 form-group">
                    <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" AssociatedControlID="txtConfirmPassword" CssClass="font-weight-bold"></asp:Label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Re-enter your password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Please confirm your password" CssClass="text-danger" Display="Dynamic" />
                    <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords do not match" CssClass="text-danger" Display="Dynamic" />
                </div>
            </div>

           
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Sign Up" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary btn-block" OnClick="btnReset_Click" CausesValidation="false" />
            </div>
            <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="LoginForm.aspx" CssClass="sign-up">Have Account Login</asp:HyperLink>
        </div>
    </form>
</body>
</html>
