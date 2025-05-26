<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkoutForm.aspx.cs" Inherits="Fitness_Tracker.WorkoutForm" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log Workout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
            margin-bottom: 20px;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .exercise-container {
            margin-top: 20px;
            margin-bottom: 20px;
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .exercise-item {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #ffffff;
        }

        .exercise-item .form-group {
            margin-bottom: 10px;
        }

        .remove-exercise {
            margin-top: 10px;
            float: right;
        }

        hr {
            border-top: 1px solid #ddd;
        }

        .text-danger {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Log Workout</h2>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />
            
            <div class="form-group">
                <asp:Label ID="lblWorkoutType" runat="server" Text="Workout Type" CssClass="control-label" Font-Bold="True" Font-Italic="False" Font-Overline="False" ForeColor="#3399FF"></asp:Label>
                <asp:TextBox ID="txtWorkoutType" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvWorkoutType" runat="server" ControlToValidate="txtWorkoutType" ErrorMessage="Workout type is required." CssClass="text-danger" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblDuration" runat="server" Text="Duration (minutes)" CssClass="control-label" Font-Bold="True" ForeColor="#3399FF"></asp:Label>
                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDuration" runat="server" ControlToValidate="txtDuration" ErrorMessage="Duration is required." CssClass="text-danger" />
                <asp:RangeValidator ID="rvDuration" runat="server" ControlToValidate="txtDuration" MinimumValue="1" MaximumValue="1440" Type="Integer" ErrorMessage="Please enter a valid duration (1-1440 minutes)." CssClass="text-danger" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblCaloriesBurned" runat="server" Text="Calories Burned" CssClass="control-label" Font-Bold="True" ForeColor="#3399FF"></asp:Label>
                <asp:TextBox ID="txtCaloriesBurned" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCaloriesBurned" runat="server" ControlToValidate="txtCaloriesBurned" ErrorMessage="Calories burned is required." CssClass="text-danger" />
                <asp:RangeValidator ID="rvCaloriesBurned" runat="server" ControlToValidate="txtCaloriesBurned" MinimumValue="1" MaximumValue="10000" Type="Integer" ErrorMessage="Please enter a valid number of calories burned." CssClass="text-danger" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblDate" runat="server" Text="Workout Date" CssClass="control-label" Font-Bold="True" ForeColor="#3399FF"></asp:Label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Date is required." CssClass="text-danger" />
            </div>
            
            
            <div class="form-group">
                <asp:Label ID="lblNumberOfExercises" runat="server" Text="Number of Exercises" CssClass="control-label" Font-Bold="True" ForeColor="#3399FF"></asp:Label>
                <asp:TextBox ID="txtNumberOfExercises" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNumberOfExercises" runat="server" ControlToValidate="txtNumberOfExercises" ErrorMessage="Number of exercises is required." CssClass="text-danger" />
                <asp:RangeValidator ID="rvNumberOfExercises" runat="server" ControlToValidate="txtNumberOfExercises" MinimumValue="1" MaximumValue="50" Type="Integer" ErrorMessage="Please enter a valid number of exercises (1-50)." CssClass="text-danger" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnAddExercises" runat="server" Text="Add Exercises" CssClass="btn btn-secondary" OnClick="btnAddExercises_Click" />
            </div>

            
            <div class="exercise-container" id="exerciseContainer" runat="server">
                
            </div>

            
            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Save Workout" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn btn-primary" OnClick="btnCancel_Click" CausesValidation="False"/>

            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>
