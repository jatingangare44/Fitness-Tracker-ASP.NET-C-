<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeForm.aspx.cs" Inherits="Fitness_Tracker.HomeForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #007bff;
            color: white;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .navbar-content {
            display: flex;
            align-items: center;
            flex-grow: 1;
        }

        .navbar-left {
            flex: 1;
        }

        .navbar-right {
            margin-left: auto;
        }

        .navbar span {
            color: white;
            text-decoration: none;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            background-color: #0056b3;
            border-radius: 5px;
        }

        .navbar a {
            color: black;
            text-decoration: none;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
        }

        .navbar a:hover {
            background-color: #0056b3;
            border-radius: 5px;
        }

        .navbar-link {
            color: white;
            text-decoration: none;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
        }

        .navbar-link:hover {
            background-color: transparent;
            text-decoration-color: red; 
        }

        .logout-button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .logout-button:hover {
            background-color: #c82333;
        }

        .workout-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .workout-table th, .workout-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .workout-table th {
            background-color: #f4f4f4;
        }

        .user-info-table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }

        .user-info-table th, .user-info-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .user-info-table th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <div class="navbar-left">
                <span>Fitness Tracker</span>
            </div>
            <div class="navbar-content">
                <asp:HyperLink ID="addWorkout" runat="server" NavigateUrl="WorkoutForm.aspx" CssClass="navbar-link" Font-Bold="True">Add Workout</asp:HyperLink>
            </div>
            <div class="navbar-right">
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout-button" OnClick="btnLogout_Click" />
            </div>
        </div>

        
        <asp:GridView ID="gvUserInfo" runat="server" AutoGenerateColumns="False" CssClass="user-info-table">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="age" HeaderText="Age" />
                <asp:BoundField DataField="gender" HeaderText="Gender" />
                <asp:BoundField DataField="weight" HeaderText="Weight (kg)" />
                <asp:BoundField DataField="height" HeaderText="Height (cm)" />
                <asp:BoundField DataField="BMI" HeaderText="BMI" />
                <asp:BoundField DataField="BMR" HeaderText="BMR" />
            </Columns>
        </asp:GridView>

        
        <asp:GridView ID="gvWorkouts" runat="server" AutoGenerateColumns="False" CssClass="workout-table">
            <Columns>
                <asp:BoundField DataField="WorkoutType" HeaderText="Workout Type" />
                <asp:BoundField DataField="Duration" HeaderText="Duration (minutes)" />
                <asp:BoundField DataField="CaloriesBurned" HeaderText="Calories Burned" />
                <asp:BoundField DataField="WorkoutDate" HeaderText="Workout Date" />
                <asp:TemplateField HeaderText="Exercises">
                    <ItemTemplate>
                        <asp:GridView ID="gvExercises" runat="server" AutoGenerateColumns="False" CssClass="workout-table">
                            <Columns>
                                <asp:BoundField DataField="ExerciseName" HeaderText="Exercise Name" />
                                <asp:BoundField DataField="Sets" HeaderText="Sets" />
                                <asp:BoundField DataField="Reps" HeaderText="Reps" />
                            </Columns>
                        </asp:GridView>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
