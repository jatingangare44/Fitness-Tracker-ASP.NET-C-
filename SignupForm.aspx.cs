using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Fitness_Tracker
{
    public partial class SignupForm : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jatin\source\repos\Fitness_Tracker\Fitness_Tracker\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand checkUsernameCmd = new SqlCommand("SELECT COUNT(*) FROM users WHERE un = @username", conn);
            checkUsernameCmd.Parameters.AddWithValue("@username", txtUsername.Text);
            int userExists = (int)checkUsernameCmd.ExecuteScalar();

            if (userExists > 0)
            {
                
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Username already exists. Please choose a different username.');", true);
            }
            else
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO users (un, ps, name, age, gender, weight, height) VALUES (@username, @password, @name, @age, @gender, @weight, @height)";
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@age", txtAge.Text);
                cmd.Parameters.AddWithValue("@gender", ddlGender.Text);
                cmd.Parameters.AddWithValue("@weight", txtWeight.Text);
                cmd.Parameters.AddWithValue("@height", txtHeight.Text);

                int count = cmd.ExecuteNonQuery();
                if (count > 0)
                {
                    
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully Signed Up! Ready to Login.'); window.location='LoginForm.aspx';", true);
                    
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Failed to sign up. Please try again!');", true);
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtUsername.Text = "";
            txtAge.Text = "";
            ddlGender.SelectedIndex = 0;
            txtWeight.Text = "";
            txtHeight.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}
