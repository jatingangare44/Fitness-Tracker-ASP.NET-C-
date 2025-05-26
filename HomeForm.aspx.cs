using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Fitness_Tracker
{
    public partial class HomeForm : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jatin\source\repos\Fitness_Tracker\Fitness_Tracker\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("LoginForm.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    LoadUserInfo();
                    LoadWorkouts();
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("LoginForm.aspx");
        }

        private void LoadUserInfo()
        {
            string username = Session["Username"] as string;

            using (SqlCommand cmd = new SqlCommand("SELECT name, age, gender, weight, height FROM users WHERE un = @Username", conn))
            {
                cmd.Parameters.AddWithValue("@Username", username);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dtUserInfo = new DataTable();
                da.Fill(dtUserInfo);

                if (dtUserInfo.Rows.Count > 0)
                {
                    DataRow row = dtUserInfo.Rows[0];

                    double weight = Convert.ToDouble(row["weight"]);
                    double height = Convert.ToDouble(row["height"]);
                    int age = Convert.ToInt32(row["age"]);
                    string gender = Convert.ToString(row["gender"]);

                  
                    double bmi = weight / Math.Pow(height / 100, 2);

                    
                    double bmr = 0;
                    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);

                   
                    dtUserInfo.Columns.Add("BMI", typeof(double));
                    dtUserInfo.Columns.Add("BMR", typeof(double));
                    row["BMI"] = Math.Round(bmi, 2);
                    row["BMR"] = Math.Round(bmr, 2);

                    gvUserInfo.DataSource = dtUserInfo;
                    gvUserInfo.DataBind();
                }
            }
        }

        private void LoadWorkouts()
        {
            string username = Session["Username"] as string;

            using (SqlCommand cmd = new SqlCommand("SELECT Id, WorkoutType, Duration, CaloriesBurned, WorkoutDate FROM Workouts WHERE Username = @Username", conn))
            {
                cmd.Parameters.AddWithValue("@Username", username);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dtWorkouts = new DataTable();
                da.Fill(dtWorkouts);

                gvWorkouts.DataSource = dtWorkouts;
                gvWorkouts.DataBind();

                
                foreach (GridViewRow row in gvWorkouts.Rows)
                {
                    int workoutId = Convert.ToInt32(dtWorkouts.Rows[row.RowIndex]["Id"]);

                    GridView gvExercises = (GridView)row.FindControl("gvExercises");

                    using (SqlCommand cmdExercises = new SqlCommand("SELECT ExerciseName, Sets, Reps FROM Exercises WHERE WorkoutId = @WorkoutId", conn))
                    {
                        cmdExercises.Parameters.AddWithValue("@WorkoutId", workoutId);

                        SqlDataAdapter daExercises = new SqlDataAdapter(cmdExercises);
                        DataTable dtExercises = new DataTable();
                        daExercises.Fill(dtExercises);

                        gvExercises.DataSource = dtExercises;
                        gvExercises.DataBind();
                    }
                }
            }
        }
    }
}
