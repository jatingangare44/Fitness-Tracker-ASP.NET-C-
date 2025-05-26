using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Tracker
{
    public partial class WorkoutForm : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jatin\source\repos\Fitness_Tracker\Fitness_Tracker\App_Data\Database1.mdf;Integrated Security=True");

        
        private int NumberOfExercises
        {
            get
            {
                return ViewState["NumberOfExercises"] != null ? (int)ViewState["NumberOfExercises"] : 0;
            }
            set
            {
                ViewState["NumberOfExercises"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }

            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();

            
            RecreateExerciseControls();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                
                string username = Session["Username"] as string;

                
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Workouts (WorkoutType, Duration, CaloriesBurned, WorkoutDate, Username) OUTPUT INSERTED.Id VALUES (@WorkoutType, @Duration, @CaloriesBurned, @WorkoutDate, @Username)";
                cmd.Parameters.AddWithValue("@WorkoutType", txtWorkoutType.Text);
                cmd.Parameters.AddWithValue("@Duration", int.Parse(txtDuration.Text));
                cmd.Parameters.AddWithValue("@CaloriesBurned", int.Parse(txtCaloriesBurned.Text));
                cmd.Parameters.AddWithValue("@WorkoutDate", DateTime.Parse(txtDate.Text));
                cmd.Parameters.AddWithValue("@Username", username);

                int workoutId = (int)cmd.ExecuteScalar();

                
                for (int i = 0; i < NumberOfExercises; i++)
                {
                    
                    string exerciseName = ((TextBox)exerciseContainer.FindControl($"exerciseName_{i}")).Text;
                    int sets = int.Parse(((TextBox)exerciseContainer.FindControl($"exerciseSets_{i}")).Text);
                    int reps = int.Parse(((TextBox)exerciseContainer.FindControl($"exerciseReps_{i}")).Text);

                    SqlCommand cmdExercise = conn.CreateCommand();
                    cmdExercise.CommandType = CommandType.Text;
                    cmdExercise.CommandText = "INSERT INTO Exercises (WorkoutId, ExerciseName, Sets, Reps) VALUES (@WorkoutId, @ExerciseName, @Sets, @Reps)";
                    cmdExercise.Parameters.AddWithValue("@WorkoutId", workoutId);
                    cmdExercise.Parameters.AddWithValue("@ExerciseName", exerciseName);
                    cmdExercise.Parameters.AddWithValue("@Sets", sets);
                    cmdExercise.Parameters.AddWithValue("@Reps", reps);
                    cmdExercise.ExecuteNonQuery();
                }

                
                Response.Write("<script>alert('Workout and exercises saved successfully!');</script>");
                ClearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
            }
        }

        protected void btnAddExercises_Click(object sender, EventArgs e)
        {
            
            NumberOfExercises = int.Parse(txtNumberOfExercises.Text);

           
            AddExerciseControls(NumberOfExercises);
        }

        private void AddExerciseControls(int count)
        {
            for (int i = 0; i < count; i++)
            {
                
                if (exerciseContainer.FindControl($"exercisePanel_{i}") == null)
                {
                    Panel exercisePanel = new Panel();
                    exercisePanel.ID = $"exercisePanel_{i}";
                    exercisePanel.CssClass = "exercise-item";

                    
                    Label lblExerciseName = new Label();
                    lblExerciseName.Text = "Exercise Name:";
                    lblExerciseName.CssClass = "control-label";
                    exercisePanel.Controls.Add(lblExerciseName);

                    TextBox txtExerciseName = new TextBox();
                    txtExerciseName.ID = $"exerciseName_{i}";
                    txtExerciseName.CssClass = "form-control";
                    exercisePanel.Controls.Add(txtExerciseName);

                    
                    Label lblSets = new Label();
                    lblSets.Text = "Sets:";
                    lblSets.CssClass = "control-label";
                    exercisePanel.Controls.Add(lblSets);

                    TextBox txtSets = new TextBox();
                    txtSets.ID = $"exerciseSets_{i}";
                    txtSets.CssClass = "form-control";
                    exercisePanel.Controls.Add(txtSets);

                    
                    Label lblReps = new Label();
                    lblReps.Text = "Reps:";
                    lblReps.CssClass = "control-label";
                    exercisePanel.Controls.Add(lblReps);

                    TextBox txtReps = new TextBox();
                    txtReps.ID = $"exerciseReps_{i}";
                    txtReps.CssClass = "form-control";
                    exercisePanel.Controls.Add(txtReps);

                    
                    Button btnRemove = new Button();
                    btnRemove.Text = "Remove";
                    btnRemove.CssClass = "btn btn-danger remove-exercise";
                    btnRemove.Click += (s, args) => { exerciseContainer.Controls.Remove(exercisePanel); };
                    exercisePanel.Controls.Add(btnRemove);

                    exerciseContainer.Controls.Add(exercisePanel);
                }
            }
        }

        private void RecreateExerciseControls()
        {
            
            AddExerciseControls(NumberOfExercises);
        }

        private void ClearForm()
        {
            txtWorkoutType.Text = "";
            txtDuration.Text = "";
            txtCaloriesBurned.Text = "";
            txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtNumberOfExercises.Text = "";
            exerciseContainer.Controls.Clear();
            NumberOfExercises = 0; 
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeForm.aspx");
        }
    }
}
